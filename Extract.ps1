Param($CabFilePath, $Destination)

$Shell = New-Object -Comobject "Shell.Application"
$SourceCab = $Shell.Namespace((Convert-Path $CabFilePath)).items()
$DestinationFolder = $Shell.Namespace((Convert-Path $Destination))
$DestinationFolder.CopyHere($SourceCab)