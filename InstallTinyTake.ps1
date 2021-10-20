Write-Progress -Activity 'Installing TinyTake (64-bit)' -PercentComplete (100/10 * 9)
New-Item -Type directory -path "C:\Temp\Core\Programs\TinyTake\" -Force
wget 'https://s3.amazonaws.com/downloads.mangoapps.com/prod/windows/tt/TinyTakeSetup_v_5_2_16.msi' -OutFile 'C:\Temp\Core\Programs\TinyTake\TinyTakeSetup_v_5_2_16.msi'
Start-Process "C:\Temp\Core\Programs\TinyTake\TinyTakeSetup_v_5_2_16.msi" /qn -Wait
Start-Sleep -s 60

Write-Progress -Activity 'Configurando TinyTake para todos usuários' -PercentComplete (100/10 * 7)
#Adicionando PermissÃ£o na Pasta TinyTake para todos usuários
$ACL = Get-Acl "C:\Users\admininfra\AppData\Local\MangoApps\TinyTake\"
$ACLRULE = New-Object System.Security.AccessControl.FileSystemAccessRule("Todos","FullControl","ContainerInherit","none","Allow")
$ACL.AddAccessRule($ACLRULE)
$ACLRULE = New-Object System.Security.AccessControl.FileSystemAccessRule("Todos","FullControl","ObjectInherit","none","Allow")
$ACL.AddAccessRule($ACLRULE)
Set-Acl "C:\Users\admininfra\AppData\Local\MangoApps\TinyTake\" $ACL

Write-Progress -Activity 'TinyTake installed successfully...' -Completed

#Copiando atalho para perfil dos usuários
XCOPY /S /E "C:\Users\admininfra\Desktop\TinyTake by MangoApps.lnk" C:\Users\Public\Desktop\

Write-Progress -Activity 'Please validate permissions of folder to Everyone...' -Completed
#Abrindo pasta TinyTake para validar as permissões:
explorer C:\Users\admininfra\AppData\Local\MangoApps


#Deploying TinyTake using an MSI Installer
#
#If you would like to deploy TinyTake to your users via a Group Policy download the MSI installer from the link below.
#
#Please ensure the following prerequisites that are required by TinyTake installer:
#
#Microsoft .NET Framework 4.5.1 or above is installed on the target machines. 
#http://www.microsoft.com/en-in/download/details.aspx?id=40773
#
#Visual C++ Redistributable for Visual Studio 2010 is installed on the target machines. 
#http://www.microsoft.com/en-in/download/details.aspx?id=5555
#
#The installer is required to be run as an administrator since it installs to the users Program Files directory.
#https://s3.amazonaws.com/downloads.mangoapps.com/prod/windows/tt/TinyTakeSetup_v_5_2_16.msi