Add-Type -AssemblyName 'System.Windows.Forms'
Add-Type -AssemblyName 'System.Drawing'
$picture = ".\assets\First_picture.jpg"

$file = (get-item $picture)
$img = [System.Drawing.Image]::Fromfile($file);

#Menu buttons

$Menu = new-object System.Windows.Forms.MenuStrip
$fileToolTip = new-object System.Windows.Forms.ToolStripMenuItem
$openToolTipMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
$help = new-object System.Windows.Forms.ToolStripMenuItem
$genhelp = new-object System.Windows.Forms.ToolStripMenuItem
$about = new-object System.Windows.Forms.ToolStripMenuItem
$options = new-object System.Windows.Forms.ToolStripMenuItem
$option = new-object System.Windows.Forms.ToolStripMenuItem
$print = new-object System.Windows.Forms.ToolStripMenuItem
$printto = new-object System.Windows.Forms.ToolStripMenuItem

#Menu

$Menu.Items.AddRange(@(
$fileToolTip, $options, $print, $help))
$Menu.Location = new-object System.Drawing.Point(0, 0)
$Menu.Name = "MS_Main"
$Menu.Size = new-object System.Drawing.Size(300, 20)
$Menu.TabIndex = 0
$Menu.Text = "menuStrip1"

#Tooltip file

$fileToolTip.DropDownItems.AddRange(@(
$openToolTipMenuItem))
$fileToolTip.Name = "fileToolStripMenuItem"
$fileToolTip.Size = new-object System.Drawing.Size(35, 20)
$fileToolTip.Text = "&File"

#Tooltip options

$options.DropDownItems.AddRange(@(
$option))
$options.Name = "options"
$options.Size = new-object System.Drawing.Size(35, 20)
$options.Text = "&Options"

#tooltip help

$help.DropDownItems.AddRange(@(
$genhelp, $about))
$help.Name = "help"
$help.Size = new-object System.Drawing.Size(35, 20)
$help.Text = "&Help"

# open tooltip help

$genhelp.Name = "genhelp"
$genhelp.Size = new-object System.Drawing.Size(152, 22)
$genhelp.Text = "&Help"
$button_click = {[System.Windows.Forms.Application]::EnableVisualStyles();
                   $form3 = new-object Windows.Forms.Form
                   $form3.Text = "Help window"
                   $form3.Width = 650;
                   $form3.Height =  350;

                   #label part

                   $label = New-Object System.Windows.Forms.Label
                   $label.Location = New-Object System.Drawing.Point(250,20)
                   $label.Size = New-Object System.Drawing.Size(150,40)
                   $label.Font = New-Object System.Drawing.Font("Times new Roman",20,[System.Drawing.FontStyle]::Regular)
                   $label.Text = 'Help'

                   #text part

                   $text = New-Object System.Windows.Forms.Label
                   $text.Location = New-Object System.Drawing.Point(100,100)
                   $text.Size = New-Object System.Drawing.Size(500,500)
                   $text.Text = 'If you want to open an image you click on the open than open and than choose your file you want to see and that is all'

                   #ok button

                   $okButton = New-Object System.Windows.Forms.Button
                   $okButton.Location = New-Object System.Drawing.Point(500,250)
                   $okButton.Size = New-Object System.Drawing.Size(75,23)
                   $okButton.Text = 'Cancel'
                   $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                   $form3.AcceptButton = $okButton
                   $form3.Controls.Add($okButton)

                   $form3.Controls.Add($label)
                   $form3.Controls.Add($text)
                   $form3.Add_Shown( { $form3.Activate() } )
                   $form3.ShowDialog()}
$Genhelp.Add_Click($Button_Click)

#option tooltip open

$option.Name = "option"
$option.Size = new-object System.Drawing.Size(152, 22)
$option.Text = "&Options"

# open tooltip about

$about.Name = "about"
$about.Size = new-object System.Drawing.Size(152, 22)
$about.Text = "&About"
$button_click = {[System.Windows.Forms.Application]::EnableVisualStyles();
                   $form4 = new-object Windows.Forms.Form
                   $form4.Text = "Image Viewer"
                   $form4.Width = 650;
                   $form4.Height =  350;

                   #label part

                   $label2 = New-Object System.Windows.Forms.Label
                   $label2.Location = New-Object System.Drawing.Point(250,20)
                   $label2.Size = New-Object System.Drawing.Size(150,40)
                   $label2.Font = New-Object System.Drawing.Font("Times new Roman",20,[System.Drawing.FontStyle]::Regular)
                   $label2.Text = 'About'

                   #text part

                   $text2 = New-Object System.Windows.Forms.Label
                   $text2.Location = New-Object System.Drawing.Point(100,100)
                   $text2.Size = New-Object System.Drawing.Size(500,500)
                   $text2.Text = 'Simple image viewer by Spidergo2006(me)'

                   #ok button

                   $okButton2 = New-Object System.Windows.Forms.Button
                   $okButton2.Location = New-Object System.Drawing.Point(500,250)
                   $okButton2.Size = New-Object System.Drawing.Size(75,23)
                   $okButton2.Text = 'Cancel'
                   $okButton2.DialogResult = [System.Windows.Forms.DialogResult]::OK
                   $form4.AcceptButton = $okButton2
                   $form4.Controls.Add($okButton2)

                   $form4.Controls.Add($label2)
                   $form4.Controls.Add($text2)
                   $form4.Add_Shown( { $form4.Activate() } )
                   $form4.ShowDialog()}

$about.Add_Click($Button_Click)

#print tooltip

$print.DropDownItems.AddRange(@(
$printto))
$print.Name = "print"
$print.Size = new-object System.Drawing.Size(152, 22)
$print.Text = "&Print"

#printto tooltip

$printto.Name = "printto"
$printto.Size = new-object System.Drawing.Size(152, 22)
$printto.Text = "&PrintOut"
$button_click2 = {Get-Content $picture | Out-Printer; write-host "$picture"}

$printto.Add_Click($Button_Click2)

#open in Tooltip file

$openToolTipMenuItem.Name = "openToolStripMenuItem"
$openToolTipMenuItem.Size = new-object System.Drawing.Size(152, 22)
$openToolTipMenuItem.Text = "&Open"

#open from file

function OnClick_openToolStripMenuItem($Sender,$e){

    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms") | Out-Null

    $OpenFileDialog = New-Object System.Windows.Forms.OpenFileDialog
    $OpenFileDialog.initialDirectory = $initialDirectory
    $OpenFileDialog.filter = 'JPG (*.jpg);(*.jpeg);(*.jpe);(*jfif)|*.jpg;*.jpeg;*.jpe;*jfif|PNG (*.png)|*.png|ICO (*.ico)| *.ico|Bitmap File (*.bmp);(*.dib)|*.bmp;*.dib|All image|*.jpg;*.jpeg;*.jpe;*jfif;*.png;*.ico;*.bmp;*.dib' 
    $OpenFileDialog.ShowDialog() |  Out-Null

    $picture = $OpenFileDialog.FileName

    if ( !$picture ){
        Write-warning "File not selected"
    }
    else {
        $Servers = Get-Content -Path $picture
        Write-Warning "File selected."
        write-host "$picture"
        $file2 = (get-item $picture)
        $img2 = [System.Drawing.Image]::Fromfile($file2);

        #if image is too big

        if ($img2.height -ge 1500) {
            $form2.Height =  650;
            $pictureBox2.Height =  650;
        }
        elseif ($img2.Width -ge 3000) {
            $form2.Width = 2000;
            $pictureBox2.Width =  2000;
        }

        else {

        #Menu import

        $Menu = new-object System.Windows.Forms.MenuStrip
        $fileToolTip = new-object System.Windows.Forms.ToolStripMenuItem
        $openToolTipMenuItem = new-object System.Windows.Forms.ToolStripMenuItem
        $help = new-object System.Windows.Forms.ToolStripMenuItem
        $genhelp = new-object System.Windows.Forms.ToolStripMenuItem
        $about = new-object System.Windows.Forms.ToolStripMenuItem
        $options = new-object System.Windows.Forms.ToolStripMenuItem
        $option = new-object System.Windows.Forms.ToolStripMenuItem

        #Menu

        $Menu.Items.AddRange(@(
        $fileToolTip, $options, $help))
        $Menu.Location = new-object System.Drawing.Point(0, 0)
        $Menu.Name = "MS_Main"
        $Menu.Size = new-object System.Drawing.Size(300, 20)
        $Menu.TabIndex = 0
        $Menu.Text = "menuStrip1"

        #Tooltip file

        $fileToolTip.DropDownItems.AddRange(@(
        $openToolTipMenuItem))
        $fileToolTip.Name = "fileToolStripMenuItem"
        $fileToolTip.Size = new-object System.Drawing.Size(35, 20)
        $fileToolTip.Text = "&File"

        #Tooltip options

        $options.DropDownItems.AddRange(@(
        $option))
        $options.Name = "options"
        $options.Size = new-object System.Drawing.Size(35, 20)
        $options.Text = "&Options"

        #tooltip help

        $help.DropDownItems.AddRange(@(
        $genhelp, $about))
        $help.Name = "help"
        $help.Size = new-object System.Drawing.Size(35, 20)
        $help.Text = "&Help"

        # open tooltip help

        $genhelp.Name = "genhelp"
        $genhelp.Size = new-object System.Drawing.Size(152, 22)
        $genhelp.Text = "&Help"
        #$button_click = {[System.Windows.MessageBox]::Show("This is a test help", "Help", "OK", "Info")}
        $Button_Click = {[System.Windows.Forms.Application]::EnableVisualStyles();
                   $form3 = new-object Windows.Forms.Form
                   $form3.Text = "Help window"
                   $form3.Width = 650;
                   $form3.Height =  350;

                   #label part

                   $label = New-Object System.Windows.Forms.Label
                   $label.Location = New-Object System.Drawing.Point(250,20)
                   $label.Size = New-Object System.Drawing.Size(150,40)
                   $label.Font = New-Object System.Drawing.Font("Times new Roman",20,[System.Drawing.FontStyle]::Regular)
                   $label.Text = 'Help'

                   #text part

                   $text = New-Object System.Windows.Forms.Label
                   $text.Location = New-Object System.Drawing.Point(100,100)
                   $text.Size = New-Object System.Drawing.Size(500,500)
                   $text.Text = 'If you want to open an image you click on the open than open and than choose your file you want to see and that is all'

                   #ok button

                   $okButton = New-Object System.Windows.Forms.Button
                   $okButton.Location = New-Object System.Drawing.Point(500,250)
                   $okButton.Size = New-Object System.Drawing.Size(75,23)
                   $okButton.Text = 'Cancel'
                   $okButton.DialogResult = [System.Windows.Forms.DialogResult]::OK
                   $form3.AcceptButton = $okButton
                   $form3.Controls.Add($okButton)

                   $form3.Controls.Add($label)
                   $form3.Controls.Add($text)
                   $form3.Add_Shown( { $form3.Activate() } )
                   $form3.ShowDialog()}
    $Genhelp.Add_Click($Button_Click)

    #option tooltip open

    $option.Name = "option"
    $option.Size = new-object System.Drawing.Size(152, 22)
    $option.Text = "&Options"

    # open tooltip about

    $about.Name = "about"
    $about.Size = new-object System.Drawing.Size(152, 22)
    $about.Text = "&About"
    $button_click = {[System.Windows.Forms.Application]::EnableVisualStyles();
                   $form4 = new-object Windows.Forms.Form
                   $form4.Text = "Image Viewer"
                   $form4.Width = 650;
                   $form4.Height =  350;

                   #label part

                   $label2 = New-Object System.Windows.Forms.Label
                   $label2.Location = New-Object System.Drawing.Point(250,20)
                   $label2.Size = New-Object System.Drawing.Size(150,40)
                   $label2.Font = New-Object System.Drawing.Font("Times new Roman",20,[System.Drawing.FontStyle]::Regular)
                   $label2.Text = 'About'

                   #text part

                   $text2 = New-Object System.Windows.Forms.Label
                   $text2.Location = New-Object System.Drawing.Point(100,100)
                   $text2.Size = New-Object System.Drawing.Size(500,500)
                   $text2.Text = 'Simple image viewer by Spidergo2006(me)'

                   #ok button

                   $okButton2 = New-Object System.Windows.Forms.Button
                   $okButton2.Location = New-Object System.Drawing.Point(500,250)
                   $okButton2.Size = New-Object System.Drawing.Size(75,23)
                   $okButton2.Text = 'Cancel'
                   $okButton2.DialogResult = [System.Windows.Forms.DialogResult]::OK
                   $form4.AcceptButton = $okButton2
                   $form4.Controls.Add($okButton2)

                   $form4.Controls.Add($label2)
                   $form4.Controls.Add($text2)
                   $form4.Add_Shown( { $form4.Activate() } )
                   $form4.ShowDialog()}

$about.Add_Click($Button_Click)

	    #Form part

        [System.Windows.Forms.Application]::EnableVisualStyles();
        $form2 = new-object Windows.Forms.Form
        $form2.Text = "Image Viewer"
        $form2.Width = $img2.Size.Width;
        $form2.Height =  $img2.Size.Height;
        $pictureBox2 = new-object Windows.Forms.PictureBox
        $pictureBox2.Width =  $img2.Size.Width;
        $pictureBox2.Height =  $img2.Size.Height;
        $form2.Controls.Add($Menu)

        #picture

        $pictureBox2.Image = $img2;
        $form2.controls.add($pictureBox2)
        $form2.Add_Shown( { $form2.Activate() } )
        $form2.ShowDialog()
        #$form.Show1();
        }
    }
}

$openToolTipMenuItem.Add_Click( { OnClick_openToolStripMenuItem $openToolTipMenuItem $EventArgs} )



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

#main window

$pictureBox.Image = $img;
$form.controls.add($pictureBox)
$form.Add_Shown( { $form.Activate() } )
$form.ShowDialog()
#$form.Show1();