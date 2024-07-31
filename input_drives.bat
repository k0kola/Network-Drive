echo Enter the network drive paths to check (separated by spaces):
set /p target_drive_paths= 

:: Export the drive_paths variable to the environment
setx target_drive_paths "%target_drive_paths%"
pause