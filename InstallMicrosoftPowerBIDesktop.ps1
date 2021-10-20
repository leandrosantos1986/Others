Write-Progress -Activity 'Installing Microsoft PowerBI (64-bit)' -PercentComplete (100/10 * 9)
New-Item -Type directory -path "C:\Temp\Core\Programs\Microsoft PowerBI Desktop\" -Force
wget 'https://download.microsoft.com/download/8/8/0/880BCA75-79DD-466A-927D-1ABF1F5454B0/PBIDesktopSetup_x64.exe' -OutFile 'C:\Temp\Core\Programs\Microsoft PowerBI Desktop\PBIDesktopSetup_x64.exe'
& 'C:\Temp\Core\Programs\Microsoft PowerBI Desktop\PBIDesktopSetup_x64.exe' -q -passive ACCEPT_EULA=1

#Link https://www.microsoft.com/pt-BR/download/details.aspx?id=58494

