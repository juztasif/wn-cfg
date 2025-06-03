# Initialize Oh My Posh and Zoxide
#(@(& '~/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='~\AppData\Local\Programs\oh-my-posh\themes\amro.omp.json' --print) -join "`n") | Invoke-Expression
Invoke-Expression (& { (zoxide init powershell | Out-String) })

# Aliases
Set-Alias eth get-netadapter
Set-Alias rr powershell
Set-Alias c clear
Set-Alias cr cursor
Set-Alias e nvim
Set-Alias k code
Set-Alias nm nvim
Set-Alias np notepad
Set-Alias sd stop-computer
Set-Alias rb restart-computer
Set-Alias lnx wsl
Set-Alias lD get-volume

function doit { adb shell settings put global hide_gesture_line 1 }

function q { exit }
function cl { clear; ls }

# Edit Config Files
function ec {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("esp", "nv", "al")]
        [string]$config
    )

    switch ($config) {
        "esp" { nvim "$HOME\AppData\Roaming\espanso\match\base.yml" }
        "nv"  { nvim "$HOME\AppData\Local\nvim\init.vim" }
        "al"  { nvim "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" }
        default {
            Write-Host "Usage: ec [esp|nv|al]" -ForegroundColor Yellow
            Write-Host "esp → Edit Espanso config"
            Write-Host "nv  → Edit Neovim config"
            Write-Host "al  → Edit PowerShell profile"
        }
    }
}


# Main Folder Navigation
function dk { cd ~/Desktop }
function dn { cd ~/Downloads }
function dc { cd ~/Documents }
function pc { cd ~/Pictures }
function vd { cd ~/Videos }

# Workspace Navigation
function ws { 
    param ([string]$loc)
    switch ($loc) {
        ""{ cd $HOME\Workspace }
    }
}

# Git Commands
# function git {
#     param (
#         [Parameter(Mandatory=$true)]
#         [string]$Command,
#         [Parameter(ValueFromRemainingArguments=$true)]
#         [string[]]$Args
#     )
#     switch ($Command) {
#         "s" { git status }
#         "a" { git add . }
#         "c" { git commit -m $Args }
#         "p" { git push }
#         "b" { git branch }
#         "l" { git log --oneline --graph --all }
#         default { git $Command @Args }
#     }
# }

# Workspace Navigation
function ws { 
    param ([string]$loc)
    switch ($loc) {
        "" { Set-Location "D:\Coding Workspaces\" }
        "py" { Set-Location "D:\Coding Workspaces\Python" }
        "wd" { Set-Location "D:\Coding Workspaces\WebDev" }
    }
}

# Winget Commands
function w {
    param (
        [string]$cmd,
        [string]$name
    )
    switch ($cmd) {
        "s"  { winget search $name }
        "i"  { winget install $name }
        "i2" { winget install "$name.$name" }
        "u"  { winget upgrade $name }
        "lu" { winget list --upgrade-available }
        "uu" { winget upgrade "$name.$name" }
        "l"  { winget list $name }
        "r"  { winget remove $name }
        "r2"  { winget remove $name.$name }
        "ua" { winget upgrade --all }
        default {
            Write-Host "`nUsage: w <command> [app_name]"
            Write-Host "Commands:"
            Write-Host "  s   - Search for an app"
            Write-Host "  i   - Install an app"
            Write-Host "  i2  - Install an app with format 'name.name'"
            Write-Host "  u   - Upgrade a specific app"
            Write-Host "  lu  - List apps with upgrades available"
            Write-Host "  uu  - Upgrade an app with format 'name.name'"
            Write-Host "  l   - List installed apps"
            Write-Host "  r   - Remove an app"
            Write-Host "  r2  - Remove an app with format 'name.name'"
            Write-Host "  ua  - Upgrade all apps"
            Write-Host "`nExample: w i vscode"
        }
    }
}

# Editing Modules
function em {
    param(
        [string]$name
    )

    switch ($name) {
        "nw"  { nvim "$HOME\Documents\Tools\Scripts\nw.psm1" }
        "man" { nvim "$HOME\Documents\Tools\Scripts\man.psm1" }
        "adb" { nvim "$HOME\Documents\Tools\Scripts\adb.psm1" }
        "py"  { nvim "$HOME\Documents\Tools\Scripts\py.psm1" }
        default {
            Write-Host "Usage: im [ nw | man | adb | py ]" -ForegroundColor Yellow
        }
    }
}

# Importing Modules
function im {
    param(
        [string]$name
    )

    switch ($name) {
        "nw"  { Import-Module -DisableNameChecking "$HOME\Documents\Tools\Scripts\nw.psm1" }
        "man" { Import-Module -DisableNameChecking "$HOME\Documents\Tools\Scripts\man.psm1" }
        "adb" { Import-Module -DisableNameChecking "$HOME\Documents\Tools\Scripts\adb.psm1" }
        "py"  { Import-Module -DisableNameChecking "$HOME\Documents\Tools\Scripts\py.psm1" }
        default {
            Write-Host "Usage: im [ nw | man | adb | py ]" -ForegroundColor Yellow
        }
    }
}


# File Handling Functions
function touch { param($f) "" | Out-File $f -Encoding ASCII }
function df { Get-Volume }
function ll { Get-ChildItem -Path $pwd -File }
function la { Get-ChildItem -Attributes Hidden }

# File Extraction
function unzip {
    param($file = "*.zip", $dest = $pwd)
    Write-Host "Extracting $file to $dest" -ForegroundColor Cyan
    Expand-Archive -Path (Get-Item $file).FullName -DestinationPath $dest -Force
}

# File Compression
function zip {
    param(
        [string]$source = $pwd,
        [string]$destination = "$(Split-Path -Leaf $source).zip"
    )
    Write-Host "Creating zip archive $destination from $source" -ForegroundColor Green
    Compress-Archive -Path (Join-Path $source '*') -DestinationPath $destination -Force
}

# Text Search Functions
function grep($regex, $dir) {
    if ($dir) {
        Get-ChildItem $dir | Select-String $regex
    }
    else {
        $input | Select-String $regex
    }
}

function ff {
    param($name)
    Get-ChildItem -Recurse -Filter "*${name}*" -ErrorAction SilentlyContinue | ForEach-Object {
        Write-Output "$($_.Directory)\$($_.Name)"
    }
}

# Utility Functions
function which { param($name) (Get-Command $name).Source }

# Remove All Aliases
function unalias {
    Get-Alias | ForEach-Object { Remove-Item -Path Alias:\$_ -ErrorAction SilentlyContinue }
    Write-Host "All aliases have been removed for this session." -ForegroundColor Green
}

# Custom Prompt
function ps2 {
    function global:Prompt {
        $cwd = Split-Path -Leaf (Get-Location)
        "$cwd> "
    }
}

Clear-Host
