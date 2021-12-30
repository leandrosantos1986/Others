invoke-expression 'cmd /c start powershell -NoExit -Command {                           `
    Get-ChildItem;                  `
    $host.UI.RawUI.WindowTitle = "A Silly Little Title";                                `
    $host.UI.RawUI.BackgroundColor = "Green"
;                                                            `
}';