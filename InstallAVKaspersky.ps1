Write-Progress -Activity 'Installing Kaspersky Endpoint Security for Windows' -PercentComplete (100/10 * 9)
XCOPY /S /E "\\10.242.4.10\serverfiles\INFRAESTRUTURA\_SOFTWARES\Kaspersky Endpoint Security for Windows\*.*" /Y "C:\Temp\Core\Tools\AV\"
& 'C:\Temp\Core\Tools\AV\Kaspersky Endpoint Security for Windows (11.4.0) (11.4.0.233).exe'