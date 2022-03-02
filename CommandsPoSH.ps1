#Estes comandos adicionam ou removem entradas no Registro
REG ADD "HKEY_LOCAL_MACHINE\Software\nome_pasta" /v EntradaAqui /t REG_DWORD /d 0 /f
REG DELETE HKEY_LOCAL_MACHINE\Software\nome_pasta /v /f

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

#Este comando adiciona e remove máquinas no AD
Add-Computer -Domainname bei.local -Credential BEI\leandro.santos -Restart -Force
Remove-Computer -UnjoinDomaincredential Domain01\Admin01 -PassThru -Verbose -Restart

#Este comando exibe o espaço em disco disponível
(Get-WmiObject win32_logicaldisk -filter "DeviceID='C:'" | Select-Object Freespace).FreeSpace/1GB

#Este comando exibe o Sistema Operacional
Get-WmiObject win32_operatingsystem | ForEach-Object caption

#Este comando obtém os grupos e membros do AD
Get-ADGroup -filter * | sort name | select name
Get-ADGroupMember -identity "VPN" | select name

#Este comando certifica que está usando TLS 1.2 para poder usar os pacotes do PowerShell Galery
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
#fonte: https://docs.microsoft.com/pt-br/powershell/module/packagemanagement/?view=powershell-7.1

#Este comando obtém, através do Registro o nome antigo da máquina
Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\SchedulingAgent' 'OldName'
#Visão mais completa:
Get-ItemProperty Registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SchedulingAgent
#Fonte: https://stackoverflow.com/questions/15511809/how-do-i-get-the-value-of-a-registry-key-and-only-the-value-using-powershell

#SMB1 
#Get 
Get-SmbServerConfiguration | Format-List EnableSMB1Protocol
Get-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
#Enable
Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol
#Disable
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

#Obter ID Teamviewer
Get-ItemPropertyValue 'HKLM:\SOFTWARE\Wow6432Node\TeamViewer\' 'ClientID'

#Obter Versão do Windows via Registro
Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\' 'ProductName'

#Enable SafeBoot with Network ATERA
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Network" /v Splashtop Inc. /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Network" /v AteraAgent /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SafeBoot\Network" /v SplashtopRemoteService /t REG_DWORD /d 0 /f

#Ping with timestamp LOG
Ping.exe -t 192.168.100.11 | ForEach {"{0} - {1}" -f (Get-Date),$_} > C:\Temp\Ping.txt

#Transfer Area Clean or Clipboard Clean
C:\Windows\System32\cmd.exe /c "echo off | clip"

#Obter senha Wi-Fi
netsh wlan show profiles
netsh wlan show profile name=profilename key=clear

#Corrige Nomes pastas longos
Get-ItemPropertyValue 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' 'LongPathsEnabled'
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -name 'LongPathsEnabled' -Value 1

#Adicionar dados de proprietário e organização Windows
Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' -name 'RegisteredOwner' -Value TecnologiaBEI
Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' 'RegisteredOwner'
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\" -Name RegisteredOrganization -PropertyType String -Value EditoraMAS
Get-ItemPropertyValue 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion' 'RegisteredOrganization'

#Tamanho pastas 
$targetfolder='C:\Users\'
$dataColl = @()
gci -force $targetfolder -ErrorAction SilentlyContinue | ? { $_ -is [io.directoryinfo] } | % {
$len = 0
gci -recurse -force $_.fullname -ErrorAction SilentlyContinue | % { $len += $_.length }
$foldername = $_.fullname
$foldersize= '{0:N2}' -f ($len / 1Gb)
$dataObject = New-Object PSObject
Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldername” -value $foldername
Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldersizeGb” -value $foldersize
$dataColl += $dataObject
}
$dataColl | Out-GridView -Title “Size of subdirectories”

#Obter Hostnama através do IP
$ipAddress= "0.0.0.0"
[System.Net.Dns]::GetHostByAddress($ipAddress).Hostname