$UsersDisableAD=Get-Content C:\Temp\UsersDisableAD.txt

ForEach ($user in $UsersDisableAD)

{

Disable-ADAccount -Identity $user

write-host "user $($user) has been disabled"

}