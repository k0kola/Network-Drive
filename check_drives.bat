@echo off
setlocal enabledelayedexpansion

:: Define the log file
set "log_file=disconnected_drives.txt"

:: Retrieve the drive_paths variable from the environment
set "target_drive_paths=%target_drive_paths%"

:: Initialize an empty string to store network drives
set "network_drives="

:: Get all network drives and store them in the network_drives variable
for /f "tokens=2 delims= " %%i in ('net use ^| find ":"') do (
    if "%%i" neq "" (
        set "network_drives=!network_drives! %%i"
    )
)

:: Remove leading spaces from network_drives
set "network_drives=%network_drives:~1%"

:: Get current date and time
for /f "tokens=1-5 delims=/ " %%a in ('echo %date% %time%') do (
    set "current_date=%%a-%%b-%%c %%d"
    set "time=%%e"
    set "current_time=!time:~0,5!"
)

echo Date: %current_date%, Time: %current_time% >> %log_file%

:: Check for disconnected drives
set "disconnected=0"
for %%p in (%target_drive_paths%) do (
    set "drive_path=%%p"
    set "found=0"
    
    :: Check if the drive path exists in network_drives
    for %%n in (!network_drives!) do (
        if /i "%%n"=="!drive_path!" (
            set "found=1"
        )
    )
    :: If the drive path was not found, it's disconnected
    if "!found!"=="0" (
        set /a disconnected+=1
        set "disconnected_drives=!disconnected_drives!!drive_path! "
    )
)

:: Output results to the log file
if "!disconnected!"=="0" (
    echo none >> %log_file%
) else (
    echo Disconnected Drives: !disconnected_drives! >> %log_file%
)

echo. >> %log_file%

endlocal