<#
# .SYNOPSIS
#  Clears the command history, including the saved-to-file history, if applicable.
#>
function Clear-SavedHistory {
  [CmdletBinding(ConfirmImpact='High', SupportsShouldProcess)]
  param(
  )

  # Debugging: For testing you can simulate not having PSReadline loaded with
  #            Remove-Module PSReadline -Force
  $havePSReadline = ($null -ne (Get-Module -EA SilentlyContinue PSReadline))

  Write-Verbose "PSReadline present: $havePSReadline"

  $target = if ($havePSReadline) { "entire command history, including from previous sessions" } else { "command history" }

  if (-not $pscmdlet.ShouldProcess($target))
  {
        return
  }

  if ($havePSReadline) {

    Clear-Host

    # Remove PSReadline's saved-history file.
    if (Test-Path (Get-PSReadlineOption).HistorySavePath) {
      # Abort, if the file for some reason cannot be removed.
      Remove-Item -EA Stop (Get-PSReadlineOption).HistorySavePath
      # To be safe, we recreate the file (empty).
      $null = New-Item -Type File -Path (Get-PSReadlineOption).HistorySavePath
    }

    # Clear PowerShell's own history
    Clear-History

    # Clear PSReadline's *session* history.
    # General caveat (doesn't apply here, because we're removing the saved-history file):
    #   * By default (-HistorySaveStyle SaveIncrementally), if you use
    #    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory(), any sensitive
    #    commands *have already been saved to the history*, so they'll *reappear in the next session*.
    #   * Placing `Set-PSReadlineOption -HistorySaveStyle SaveAtExit` in your profile
    #     SHOULD help that, but as of PSReadline v1.2, this option is BROKEN (saves nothing).
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()

  } else { # Without PSReadline, we only have a *session* history.

    Clear-Host

    # Clear the doskey library's buffer, used pre-PSReadline.
    # !! Unfortunately, this requires sending key combination Alt+F7.
    # Thanks, https://stackoverflow.com/a/13257933/45375
    $null = [system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
    [System.Windows.Forms.SendKeys]::Sendwait('%{F7 2}')

    # Clear PowerShell's own history
    Clear-History

  }

}

function Clear-CmdHistory {
  [CmdletBinding(ConfirmImpact='High', SupportsShouldProcess)]
  param(
  )

  # Debugging: For testing you can simulate not having PSReadline loaded with
  #            Remove-Module PSReadline -Force
  $havePSReadline = ($null -ne (Get-Module -EA SilentlyContinue PSReadline))

  Write-Verbose "PSReadline present: $havePSReadline"

  $target = if ($havePSReadline) { "entire command history, including from previous sessions" } else { "command history" }

  if (-not $pscmdlet.ShouldProcess($target))
  {
        return
  }

  if ($havePSReadline) {

    Clear-Host

    # Remove PSReadline's saved-history file.
    if (Test-Path (Get-PSReadlineOption).HistorySavePath) {
      # Abort, if the file for some reason cannot be removed.
      Remove-Item -EA Stop (Get-PSReadlineOption).HistorySavePath
      # To be safe, we recreate the file (empty).
      $null = New-Item -Type File -Path (Get-PSReadlineOption).HistorySavePath
    }

    # Clear PowerShell's own history
    Clear-History

    # Clear PSReadline's *session* history.
    # General caveat (doesn't apply here, because we're removing the saved-history file):
    #   * By default (-HistorySaveStyle SaveIncrementally), if you use
    #    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory(), any sensitive
    #    commands *have already been saved to the history*, so they'll *reappear in the next session*.
    #   * Placing `Set-PSReadlineOption -HistorySaveStyle SaveAtExit` in your profile
    #     SHOULD help that, but as of PSReadline v1.2, this option is BROKEN (saves nothing).
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()

  } else { # Without PSReadline, we only have a *session* history.

    Clear-Host

    # Clear the doskey library's buffer, used pre-PSReadline.
    # !! Unfortunately, this requires sending key combination Alt+F7.
    # Thanks, https://stackoverflow.com/a/13257933/45375
    $null = [system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
    [System.Windows.Forms.SendKeys]::Sendwait('%{F7 2}')

    # Clear PowerShell's own history
    Clear-History

  }

}

function Clear-CHistory {
  [CmdletBinding(ConfirmImpact='High', SupportsShouldProcess)]
  param(
  )

  # Debugging: For testing you can simulate not having PSReadline loaded with
  #            Remove-Module PSReadline -Force
  $havePSReadline = ($null -ne (Get-Module -EA SilentlyContinue PSReadline))

  Write-Verbose "PSReadline present: $havePSReadline"

  $target = if ($havePSReadline) { "entire command history, including from previous sessions" } else { "command history" }

  if (-not $pscmdlet.ShouldProcess($target))
  {
        return
  }

  if ($havePSReadline) {

    Clear-Host

    # Remove PSReadline's saved-history file.
    if (Test-Path (Get-PSReadlineOption).HistorySavePath) {
      # Abort, if the file for some reason cannot be removed.
      Remove-Item -EA Stop (Get-PSReadlineOption).HistorySavePath
      # To be safe, we recreate the file (empty).
      $null = New-Item -Type File -Path (Get-PSReadlineOption).HistorySavePath
    }

    # Clear PowerShell's own history
    Clear-History

    # Clear PSReadline's *session* history.
    # General caveat (doesn't apply here, because we're removing the saved-history file):
    #   * By default (-HistorySaveStyle SaveIncrementally), if you use
    #    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory(), any sensitive
    #    commands *have already been saved to the history*, so they'll *reappear in the next session*.
    #   * Placing `Set-PSReadlineOption -HistorySaveStyle SaveAtExit` in your profile
    #     SHOULD help that, but as of PSReadline v1.2, this option is BROKEN (saves nothing).
    [Microsoft.PowerShell.PSConsoleReadLine]::ClearHistory()

  } else { # Without PSReadline, we only have a *session* history.

    Clear-Host

    # Clear the doskey library's buffer, used pre-PSReadline.
    # !! Unfortunately, this requires sending key combination Alt+F7.
    # Thanks, https://stackoverflow.com/a/13257933/45375
    $null = [system.reflection.assembly]::loadwithpartialname("System.Windows.Forms")
    [System.Windows.Forms.SendKeys]::Sendwait('%{F7 2}')

    # Clear PowerShell's own history
    Clear-History

  }

}

function Compress-Using7Zip([string]$FilesToZip, [string]$ZipOutputFilePath, [string]$Password, [ValidateSet('7z','zip','gzip','bzip2','tar','iso','udf')][string]$CompressionType = 'zip', [switch]$HideWindow)
{
    # Look for the 7zip executable.
    $pathTo32Bit7Zip = "C:\Program Files (x86)\7-Zip\7z.exe"
    $pathTo64Bit7Zip = "C:\Program Files\7-Zip\7z.exe"
    # $THIS_SCRIPTS_DIRECTORY = Split-Path $script:MyInvocation.MyCommand.Path
    # $pathToStandAloneExe = Join-Path $THIS_SCRIPTS_DIRECTORY "7za.exe"
    if (Test-Path $pathTo64Bit7Zip) { $pathTo7ZipExe = $pathTo64Bit7Zip }
    elseif (Test-Path $pathTo32Bit7Zip) { $pathTo7ZipExe = $pathTo32Bit7Zip }
    # elseif (Test-Path $pathToStandAloneExe) { $pathTo7ZipExe = $pathToStandAloneExe }
    else { throw "Could not find the 7-zip executable." }

    # Delete the destination zip file if it already exists (i.e. overwrite it).
    if (Test-Path $ZipOutputFilePath) { Remove-Item $ZipOutputFilePath -Force }

    $windowStyle = "Normal"
    if ($HideWindow) { $windowStyle = "Hidden" }

    # Create the arguments to use to zip up the files.
    # Command-line argument syntax can be found at: http://www.dotnetperls.com/7-zip-examples
    $arguments = "a -t$CompressionType ""$ZipOutputFilePath"" ""$FilesToZip"" -mx9"
    if (!([string]::IsNullOrEmpty($Password))) { $arguments += " -p$Password" }

    # Zip up the files.
    $p = Start-Process "$pathTo7ZipExe" -ArgumentList $arguments -Wait -PassThru -WindowStyle $windowStyle

    # If the files were not zipped successfully.
    if (!(($p.HasExited -eq $true) -and ($p.ExitCode -eq 0)))
    {
        throw "There was a problem creating the zip file '$ZipFilePath'."
    }
}

function Copy-ProfilePath() { Clear-SavedHistory; $Profile | Set-Clipboard }

function Open-ProfileFile() {
  # Start-Process -FilePath "$env:subl" -ArgumentList "$Profile"
  Clear-SavedHistory; II $Profile
}

function Compress-WithZip-OneFile([string] $FileToZip) {
  $CurrDir = (Get-Location).Path
  $OutputFile = $CurrDir+'\'+($FileToZip -replace "\.*$",".zip")
  Echo $OutputFile
  Compress-Using7Zip $FileToZip $OutputFile
}

function Compress-WithZip-SameFile([string] $FileToZip) {
  $CurrDir = (Get-Location).Path
  $OutputFile = $CurrDir+'\'+($FileToZip -replace "\.*$",".zip")
  Echo $OutputFile
  Compress-Using7Zip $FileToZip $OutputFile
}

function csh() { Clear-SavedHistory }
function clr() { Clear-SavedHistory }
function clrscr() { Clear-SavedHistory }

function git-push-edits(){
  git commit -am "send updates"; git push origin HEAD; clr;
}

function install-redux(){
  npm i --save redux react-redux redux-devtools
}

function delete-admin-api-recr(){
  Get-ChildItem -Include 'admin','api' -Recurse -force | Remove-Item -Force -Recurse
}

function delete-regen-dirs-recr(){
  Get-ChildItem -Include 'node_modules','vendor' -Recurse -force | Remove-Item -Force -Recurse
}

function Format-Color([hashtable] $Colors = @{}, [switch] $SimpleMatch) {
    $lines = ($input | Out-String) -replace "`r", "" -split "`n"
    foreach($line in $lines) {
        $color = ''
        foreach($pattern in $Colors.Keys){
            if(!$SimpleMatch -and $line -match $pattern) { $color = $Colors[$pattern] }
            elseif ($SimpleMatch -and $line -like $pattern) { $color = $Colors[$pattern] }
        }
        if($color) {
            Write-Host -ForegroundColor $color $line
        } else {
            Write-Host $line
        }
    }
}

function Rename-Video-Sequence() {
  $originalFilesDirectory = "$env:UserProfile\Desktop\MyVideos\Movie-Best-Songs\SAATHIYA 2002\CHHALKA CHHALKA RE\Chhalka Re Song - Saathiya"
  $files = Get-ChildItem -Path $originalFilesDirectory | Where-Object { $_.Name -notmatch "Renamed" }
  $renamedFilesDirectory = $originalFilesDirectory + "\Renamed"

  if (!(Test-Path $renamedFilesDirectory)) { New-Item -Path $renamedFilesDirectory -ItemType Directory }

  foreach ($file in $files) {
    Write-Host "You are about to rename $file"
    $newName = Read-Host "What would you like to rename this file to?"
    try {
        Copy-Item -Path $file.FullName -Destination "$renamedFilesDirectory\$newName$($file.Extension)" -ErrorAction Stop
        Rename-Item -Path $file.FullName -NewName "$($file.Name).Renamed"
        Write-Host "Rename Successful" -ForegroundColor Green
    }
    catch { Write-Host "Rename Failed: $($_.Exception.Message)" -ForegroundColor Red }
    Write-Host
  }
}

function install_bun_pnpm(){
  iwr https://get.pnpm.io/install.ps1 -useb | iex;
  powershell -c "irm bun.sh/install.ps1|iex";
}

function reset_npm_install_pkgs() {
  Get-Item 'package-lock.json' | Remove-Item -Force
  Get-ChildItem -Include 'node_modules','vendor' -Recurse -force | Remove-Item -Force -Recurse
  Clear-SavedHistory
}

function git-mygit-origin(){
  git remote add origin git@github.com:vivekwebm2020/JavaScript_And_BrowserScripts.git
  git remote set-url origin git@github.com:vivekwebm2020/JavaScript_And_BrowserScripts.git
}

function purge-all-under($path){
  Get-ChildItem -Path "$path" -Include * -File -Recurse | foreach { $_.Delete()}
  Get-ChildItem -Path "$path" -Include *.* -File -Recurse | foreach { $_.Delete()}
  Get-ChildItem -Path "$path" -Include *,*.* -File -Recurse | foreach { $_.Delete()}
  Remove-Item "$path\*" -Recurse -Force
}

function clean-all-under($path){
  Get-ChildItem -Path "$path" -Include * -File -Recurse | foreach { $_.Delete()}
  Get-ChildItem -Path "$path" -Include *.* -File -Recurse | foreach { $_.Delete()}
  Get-ChildItem -Path "$path" -Include *,*.* -File -Recurse | foreach { $_.Delete()}
  Remove-Item "$path\*" -Recurse -Force
}

function delete-all-under($path){
  Get-ChildItem -Path "$path" -Include * -File -Recurse | foreach { $_.Delete()}
  Get-ChildItem -Path "$path" -Include *.* -File -Recurse | foreach { $_.Delete()}
  Get-ChildItem -Path "$path" -Include *,*.* -File -Recurse | foreach { $_.Delete()}
  Remove-Item "$path\*" -Recurse -Force
}

function purge-code-backups(){
  clr; delete-all-under "C:\Code Backups\Sublime Text Files"; clr;
  clr; delete-all-under "$env:UserProfile\Documents\Sublime Text Backups"; clr;
}

function clean-code-backups(){
  clr; delete-all-under "C:\Code Backups\Sublime Text Files"; clr;
  clr; delete-all-under "$env:UserProfile\Documents\Sublime Text Backups"; clr;
}

function empty-code-backups(){
  clr; delete-all-under "C:\Code Backups\Sublime Text Files"; clr;
  clr; delete-all-under "$env:UserProfile\Documents\Sublime Text Backups"; clr;
}

function delete-code-backups(){
  clr; delete-all-under "C:\Code Backups\Sublime Text Files"; clr;
  clr; delete-all-under "$env:UserProfile\Documents\Sublime Text Backups"; clr;
}
