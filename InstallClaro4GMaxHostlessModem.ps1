Write-Progress -Activity 'Installing Claro 4GMax Hostless Modem' -PercentComplete (100/10 * 3)
XCOPY /S /E "\\10.242.4.10\serverfiles\INFRAESTRUTURA\_SOFTWARES\DEVICES\Claro 4GMax Hostless Modem\*.*" /Y "C:\Temp\Core\Drivers\Claro 4GMax Hostless Modem\"
Start-Process "C:\Temp\Core\Drivers\Claro 4GMax Hostless Modem\ZTE Modem\Windows\AutoRun.exe" /qn