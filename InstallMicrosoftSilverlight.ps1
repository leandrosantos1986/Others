Write-Progress -Activity 'Installing Microsoft Silverlight (64-bit)' -PercentComplete (100/10 * 9)
New-Item -Type directory -path "C:\Temp\Core\Programs\Microsoft Silverlight\" -Force
wget 'https://go.microsoft.com/fwlink/?LinkID=229321' -OutFile 'C:\Temp\Core\Programs\Microsoft Silverlight\Silverlight_x64.exe'
& 'C:\Temp\Core\Programs\Microsoft Silverlight\Silverlight_x64.exe' /q /doNotRequireDRMPrompt /update

#Prepare for Silverlight 5 end of support after October 2021.
#http://www.microsoft.com/getsilverlight/get-started/install/default.aspx
#32Bits https://go.microsoft.com/fwlink/?LinkId=229320
#64Bits http://go.microsoft.com/fwlink/?LinkID=229321
#http://go.microsoft.com/fwlink/?linkid=149156
#How to install sillently: https://www.itsupportguides.com/knowledge-base/tech-tips-tricks/how-to-install-silverlight-silently/