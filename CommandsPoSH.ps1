#Estes comandos adicionam ou removem entradas no Registro
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\nome_pasta" /v EntradaAqui /t REG_DWORD /d 0 /f
REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\nome_pasta" /f
#Este seta um valor ao registro existente
Set-ItemProperty -Path 'HKEY_LOCAL_MACHINE\SOFTWARE\nome_pasta'-name "EntradaAqui" -Value 0

#Este comando desativa e para um serviço
Set-Service -Name "SysMain" -StartupType Disabled
Stop-Service -Force -Name "SysMain"

#Este comando desativa o IpV6 de todas interfaces de rede
Get-NetAdapter | ForEach-Object { Disable-NetAdapterBinding -InterfaceAlias $_.Name -ComponentID ms_tcpip6 }

#Este comando obtém as interfaces de rede e se são públicas ou privadas
Get-NetConnectionProfile

#Este comando seta como Privado todas interfaces de rede
Set-NetConnectionProfile -InterfaceAlias * -NetworkCategory Private

#Este comando faz download da internet
Invoke-WebRequest 'https://download.anydesk.com/AnyDesk.msi' -OutFile 'C:\Temp\Core\Tools\Remote\AnyDesk\AnyDesk.msi'
Invoke-WebRequest -Uri 'https://download.anydesk.com/AnyDesk.msi' -OutFile 'C:\Temp\Core\Tools\Remote\AnyDesk\AnyDesk.msi'

#Este comando cria pasta
New-Item -Type Directory -Path "C:\Temp\" -Force

#Este comando habilita a execução de Scripts no Powershell
powershell.exe -Command "& {Set-ExecutionPolicy -scope Currentuser -executionPolicy Unrestricted}"
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

#Este comando obtém o GUID de instação de um software
get-wmiobject Win32_Product | Sort-Object -Property Name |Format-Table IdentifyingNumber, Name, LocalPackage -AutoSize
get-wmiobject Win32_Product | Format-Table IdentifyingNumber, Name, LocalPackage -AutoSize
get-wmiobject Win32_Product -ComputerName RemoteMachine | Format-Table IdentifyingNumber, Name, LocalPackage -AutoSize

#Este comando deixa o W11 com tema Dark
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name SystemUsesLightTheme -Value 0

#Este comando obtém o usuário logado na máquina remoto ou local
Get-WmiObject –ComputerName localhost –Class Win32_ComputerSystem | Select-Object UserName
ou
Get-CimInstance –ComputerName localhost –ClassName Win32_ComputerSystem | Select-Object UserName

#Este comando chama um POSH desde um CMD
powershell.exe %~dp0%NomeDoPOSHTudoJunto.ps1

#Extrair ZIP
Expand-Archive -LiteralPath 'C:\Temp\arquivo.zip' -DestinationPath C:\Temp\PastaExtraida\

#Este comando insere dados no hosts da máquina
Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\hosts" "#OCS Inventory"
Add-Content -Encoding UTF8  "$($env:windir)\system32\Drivers\etc\hosts" "10.242.6.14		ocsinventory-ng"

