Add-Type -AssemblyName 'System.Windows.Forms'
Add-Type -AssemblyName 'System.Drawing'
$picture = Read-Host "Please enter path"

$file = (get-item $picture)
$img = [System.Drawing.Image]::Fromfile($file);

#Form part

[System.Windows.Forms.Application]::EnableVisualStyles();
$form = new-object Windows.Forms.Form
$form.Text = "Image Viewer"
$form.Width = $img.Size.Width;
$form.Height =  $img.Size.Height;
$pictureBox = new-object Windows.Forms.PictureBox
$pictureBox.Width =  $img.Size.Width;
$pictureBox.Height =  $img.Size.Height;
$form.Controls.Add($Menu)

#Menu import

$Menu = new-object System.Windows.Forms.MenuStrip
$fileToolTip = new-object System.Windows.Forms.ToolStripMenuItem
$openToolTipMenuItem = new-object System.Windows.Forms.ToolStripMenuItem

#Menu

$Menu.Items.AddRange(@(
$fileToolTip))
$Menu.Location = new-object System.Drawing.Point(0, 0)
$Menu.Name = "MS_Main"
$Menu.Size = new-object System.Drawing.Size(300, 20)
$Menu.TabIndex = 0
$Menu.Text = "menuStrip1"

#Tooltip 1

$fileToolTip.DropDownItems.AddRange(@(
$openToolTipMenuItem))
$fileToolTip.Name = "fileToolStripMenuItem"
$fileToolTip.Size = new-object System.Drawing.Size(35, 20)
$fileToolTip.Text = "&File"

#open in Tooltip 1

$openToolTipMenuItem.Name = "openToolStripMenuItem"
$openToolTipMenuItem.Size = new-object System.Drawing.Size(152, 22)
$openToolTipMenuItem.Text = "&Open"

#open from file

function OnClick_openToolStripMenuItem($Sender,$e){

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = 'JPG (*.jpg)|*.jpg|PNG (*.png)|*.png' 
    $OpenFileDialog.ShowDialog() |  Out-Null


}
$openToolTipMenuItem.Add_Click( { OnClick_openToolStripMenuItem $openToolTipMenuItem $EventArgs} )

#Image part

$pictureBox.Image = $img;
$form.controls.add($pictureBox)
$form.Add_Shown( { $form.Activate() } )
$form.ShowDialog()
#$form.Show1();