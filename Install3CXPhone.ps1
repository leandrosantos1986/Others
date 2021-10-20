Write-Progress -Activity 'Installing SoftPhone 3CX' -PercentComplete (100/10 * 9)
New-Item -Type directory -path "C:\Temp\Core\Programs\3CXPhone\" -Force
wget 'https://www.3cx.com/downloads/3CXPhone6.msi' -OutFile 'C:\Temp\Core\Programs\3CXPhone\3CXPhone6.msi'
& 'C:\Temp\Core\Programs\3CXPhone\3CXPhone6.msi' /qn

#Link https://www.3cx.com/downloads/3CXPhone6.msi