Write-Progress -Activity 'Installing Driver Pack Solution' -PercentComplete (100/10 * 9)
New-Item -Type directory -path "C:\Temp\Core\Drivers\DriverPackSolution\" -Force
wget 'http://dl.drp.su/17-online/DriverPack-17-Online.exe' -OutFile 'C:\Temp\Core\Drivers\DriverPackSolution\DriverPack-17-Online.exe'
#Start-Sleep 60
#& 'C:\Temp\Core\Drivers\DriverPackSolution\DriverPack-17-Online.exe' 
