$process = Get-Process ProcessNameHere -ErrorAction SilentlyContinue
if ($process) {
  $process.CloseMainWindow()
  if (!$process.HasExited) {
    $process | Stop-Process -Force
  }
}
Remove-Variable process