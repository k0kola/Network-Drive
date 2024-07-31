# Network-Drive
监测连接的网络驱动器是否断开

- input_drives.bat
手动输入需要监测的盘符，如“T: S: V:”，不区分大小写，盘符之间用空格分隔。

- check_drives.bat
自动检测 input_drives.bat 中输入的盘符是否断开，并将结果保存至 disconnected_drives.txt。输出格式如下：
第一行：年月日分钟
第二行：断开的盘符。如果没有盘符断开，则输出“none”。

*注意：若网络驱动器断开，需要手动输入 IP 地址以重新连接。

*如需更改监测的盘符，请打开 input_drives.bat 重新输入盘符。如果无需更改盘符，则无需打开该文件。
