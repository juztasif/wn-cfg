# Install-Apps.ps1
# PowerShell script to install specified applications using winget

# Set execution policy to RemoteSigned for the current user to allow running local scripts
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Set execution policy to RemoteSigned for the entire system (requires admin privileges)
#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine

# Ensure winget is available
Write-Host "Checking for winget..."
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget not found. Please ensure winget is installed."
    exit 1
}

# List of applications to install with their winget IDs
$apps = @(
    @{ Name = "Bitwarden"; ID = "Bitwarden.Bitwarden" },
    @{ Name = "Brave Browser"; ID = "Brave.Brave" },
    @{ Name = "Espanso"; ID = "Espanso.Espanso" },
    @{ Name = "Everything"; ID = "voidtools.Everything" },
    @{ Name = "Flow Launcher"; ID = "Flow-Launcher.Flow-Launcher" },
    @{ Name = "Git"; ID = "Git.Git" },
    @{ Name = "Google Chrome"; ID = "Google.Chrome" },
    @{ Name = "KeePassXC"; ID = "KeePassXC.KeePassXC" },
    @{ Name = "MarkText"; ID = "marktext.marktext" },
    @{ Name = "Neovim"; ID = "Neovim.Neovim" },
    @{ Name = "Notion"; ID = "Notion.Notion" },
    @{ Name = "Python 3.12"; ID = "Python.Python.3.12" },
    @{ Name = "Revo Uninstaller"; ID = "RevoUninstaller.RevoUninstaller" },
    @{ Name = "Telegram"; ID = "Telegram.TelegramDesktop" },
    @{ Name = "Todoist"; ID = "Doist.Todoist" },
    @{ Name = "Transmission"; ID = "Transmission.Transmission" },
    @{ Name = "VLC"; ID = "VideoLAN.VLC" },
    @{ Name = "Visual Studio Code"; ID = "Microsoft.VisualStudioCode" },
    @{ Name = "Waterfox"; ID = "Waterfox.Waterfox" },
    @{ Name = "WhatsApp"; ID = "9NKSQGP7F2NH" },
    @{ Name = "Zoxide"; ID = "ajeetdsouza.zoxide" }
)

# Applications that may not be available in winget or have unclear IDs
$unavailableApps = @(
    "Arc Browser",       # Not commonly available in winget
    "QuickShare",        # May require specific vendor ID or not available
    "TranslucentTB"      # Often not available in winget
)

# Inform user about potentially unavailable apps
Write-Host "Note: The following applications may not be available via winget or may require manual installation:"
$unavailableApps | ForEach-Object { Write-Host " - $_" }
Write-Host "Please check the winget repository or install these manually if needed.`n"

# Install each application
foreach ($app in $apps) {
    Write-Host "Installing $($app.Name)..."
    try {
        winget install --id $app.ID --exact --silent --accept-package-agreements --accept-source-agreements
        if ($?) {
            Write-Host "$($app.Name) installed successfully." -ForegroundColor Green
        } else {
            Write-Host "Failed to install $($app.Name)." -ForegroundColor Red
        }
    } catch {
        Write-Host "Error installing $($app.Name): $_" -ForegroundColor Red
    }
    Write-Host ""
}

mkdir ~\AppData\Local\nvim\
Write-Host "Installation process completed."
Write-Host "Please verify installations and manually install any unavailable apps listed above."
