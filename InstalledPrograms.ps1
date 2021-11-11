function Analyze( $p, $f) {

Get-ItemProperty $p |foreach {

if (($_.DisplayName) -or ($_.version)) {

[PSCustomObject]@{

From = $f;

Name = $_.DisplayName;

Version = $_.DisplayVersion;

Install = $_.InstallDate

}

}

}

}

$s = @()

$s += Analyze 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*' 64

$s += Analyze 'HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' 32

$s | Sort-Object -Property Name |Export-Csv C:\Temp\InstalledPrograms.csv