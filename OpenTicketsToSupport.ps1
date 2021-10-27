$ErrorActionPreference = "SilentlyContinue"
 
Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing
 
$font = New-Object System.Drawing.Font("Arial", 9)
 
$form = New-Object System.Windows.Forms.Form
$form.Text = 'Computer-Info'
$form.Size = New-Object System.Drawing.Size(325,225)
$form.StartPosition = 'CenterScreen'
$form.Icon = 'C:\users\patri\OneDrive\Bilder\favicon.ico'
 
$OKButton = New-Object System.Windows.Forms.Button
$OKButton.Location = New-Object System.Drawing.Point(120,150)
$OKButton.Size = New-Object System.Drawing.Size(75,23)
$OKButton.Text = 'OK'
$OKButton.TextAlign = 'MiddleCenter'
$OKButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
$form.AcceptButton = $OKButton
$form.Controls.Add($OKButton)
 
$LinkLabel = New-Object System.Windows.Forms.LinkLabel
$LinkLabel.Location = New-Object System.Drawing.Point(81,110)
$LinkLabel.Size = New-Object System.Drawing.Size(280,20)
$LinkLabel.Font = $font
$LinkLabel.LinkColor = "BLUE"
$LinkLabel.ActiveLinkColor = "RED"
$LinkLabel.Text = "Ticketsystem"
$LinkLabel.add_Click({[system.Diagnostics.Process]::start("https://estabilis.atlassian.net/servicedesk/customer/portal/10")})
$Form.Controls.Add($LinkLabel)
 
$hostn = New-Object System.Windows.Forms.Label
$hostn.Location = New-Object System.Drawing.Point(10,10)
$hostn.Size = New-Object System.Drawing.Size(280,20)
$hostn.Font = $font
$hostn.Text = "Computer: $(hostname)"
$form.Controls.Add($hostn)
 
$os = New-Object System.Windows.Forms.Label
$os.Location = New-Object System.Drawing.Point(10,90)
$os.Size = New-Object System.Drawing.Size(280,20)
$os.Font = $font
$os.Text = "OS: $((Get-CimInstance win32_operatingsystem).Caption.Trimstart('Microsoft '))"
$form.Controls.Add($os)
 
$mac = New-Object System.Windows.Forms.Label
$mac.Location = New-Object System.Drawing.Point(10,50)
$mac.Size = New-Object System.Drawing.Size(280,20)
$mac.Font = $font
$mac.Text = "MAC: $((Get-NetAdapter | Where-Object Status -EQ 'up').MacAddress)"
$form.Controls.Add($mac)
 
$user = New-Object System.Windows.Forms.Label
$user.Location = New-Object System.Drawing.Point(10,30)
$user.Size = New-Object System.Drawing.Size(280,20)
$user.Font = $font
$user.Text = "User: $env:username"
$form.Controls.Add($user)
 
$ip = New-Object System.Windows.Forms.Label
$ip.Location = New-Object System.Drawing.Point(10,70)
$ip.Size = New-Object System.Drawing.Size(280,20)
$ip.Font = $font
$ip.Text = "IP: $((Get-NetAdapter | Where-Object Status -EQ 'up' | Get-NetIPAddress -AddressFamily IPv4).IPAddress)"
$form.Controls.Add($ip)
 
$help = New-Object System.Windows.Forms.Label
$help.Location = New-Object System.Drawing.Point(10,110)
$help.Font = $font
$help.Size = New-Object System.Drawing.Size(280,20)
$help.Text = "Help:"
$form.Controls.Add($help)
 
$form.Topmost = $true
 
$form.ShowDialog()