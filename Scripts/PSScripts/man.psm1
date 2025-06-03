# Alias Group Management Functions

function lsm {
    Write-Host @"

    Available Alias Groups:
        General    - Core aliases for everyday tasks
        File       - Commands for file and directory operations
        Navigation - Shortcuts for folder navigation
        Config     - Tools for editing configuration files
        Module     - Commands for managing PowerShell modules
        Winget     - Package management with Winget
        ADB        - Android Debug Bridge utilities
        Conda      - Conda environment and package management
        Pip        - Python package management with Pip
        Python     - Python-related commands
        Jupyter    - Jupyter Notebook and Lab shortcuts
        Network    - Network configuration and diagnostics
        Utility    - Miscellaneous utility functions
    

"@ -ForegroundColor Cyan
}

function sm {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("general", "file", "navigation", "config", "module", "winget", "adb", "conda", "pip", "python", "jupyter", "network", "utility")]
        [string]$group
    )

    switch ($group.ToLower()) {
        "general" {
            Write-Host @"

    General Aliases:
        c     - Clears the terminal screen
        cl    - Clears screen and lists directory contents
        cr    - Launches the cursor application
        e     - Opens Neovim text editor
        eth   - Displays network adapter details
        k     - Launches Visual Studio Code
        lD    - Shows disk volume information
        nm    - Alternative alias for Neovim
        np    - Opens Windows Notepad
        q     - Exits the current PowerShell session
        rb    - Restarts the computer
        rr    - Starts a new PowerShell instance
        sd    - Shuts down the computer
        lnx   - Opens Windows Subsystem for Linux
    

"@ -ForegroundColor Cyan
        }
        "file" {
            Write-Host @"

    File Handling:
        touch - Creates a new empty file
        df    - Lists disk volume details
        ll    - Lists only files in the current directory
        la    - Shows hidden files in the directory
        unzip - Extracts a zip archive to a specified path
        grep  - Searches files or input for a regex pattern
        ff    - Finds files recursively by name pattern
        which - Displays the full path of a command
    

"@ -ForegroundColor Cyan
        }
        "navigation" {
            Write-Host @"

    Navigation:
        dk - Navigates to the Desktop directory
        dn - Navigates to the Downloads directory
        dc - Navigates to the Documents directory
        pc - Navigates to the Pictures directory
        vd - Navigates to the Videos directory
    

"@ -ForegroundColor Cyan
        }
        "config" {
            Write-Host @"

    Configuration:
        ec esp - Edits [Espanso] configuration
        ec nv  - Edits [Neovim] configuration
        ec al  - Edits [PowerShell] profile configuration
    

"@ -ForegroundColor Cyan
        }
        "module" {
            Write-Host @"

    Modules:
        em nw  - Edits [nw] module
        em man - Edits [man] module
        em adb - Edits [adb] module
        em py  - Edits [py] module
        im nw  - Imports [nw] module
        im man - Imports [man] module
        im adb - Imports [adb] module
        im py  - Imports [py] module
    

"@ -ForegroundColor Cyan
        }
        "winget" {
            Write-Host @"

    Winget:
        w s   - Searches for an application in Winget
        w i   - Installs an application via Winget
        w i2  - Installs an app using name.name format
        w u   - Upgrades a specific application
        w lu  - Lists applications with available upgrades
        w uu  - Upgrades an app using name.name format
        w l   - Lists installed applications
        w r   - Removes an application
        w r2  - Removes an app using name.name format
        w ua  - Upgrades all installed applications
    

"@ -ForegroundColor Cyan
        }
        "adb" {
            Write-Host @"

    ADB:
        adb         - Runs Android Debug Bridge commands
        gdb         - Launches ADB GUI tool
        adb-r       - Uninstalls an Android app for user 0
        doit        - Hides the gesture navigation line
        rm-mi-bloat - Removes Xiaomi bloatware packages
    

"@ -ForegroundColor Cyan
        }
        "conda" {
            Write-Host @"

    Conda:
        ca  - Activates a Conda environment
        cd  - Deactivates the current Conda environment
        cl  - Lists packages in the active environment
        cel - Lists all Conda environments
        ci  - Installs a package in the environment
        cu  - Updates a specific package
        cua - Updates all packages in the environment
        cr  - Removes a package from the environment
        cs  - Searches for a package in Conda
        cc  - Cleans unused packages and caches
    

"@ -ForegroundColor Cyan
        }
        "pip" {
            Write-Host @"

    Pip:
        pi  - Installs a Python package via Pip
        pu  - Uninstalls a Python package
        pl  - Lists all installed Python packages
        ps  - Searches for a Python package
        pfr - Saves installed packages to requirements.txt
        pir - Installs packages from requirements.txt
    

"@ -ForegroundColor Cyan
        }
        "python" {
            Write-Host @"

    Python:
        py-v     - Displays Python version (detailed)
        py-V     - Displays Python version (brief)
        py-c-env - Creates a Python virtual environment
    

"@ -ForegroundColor Cyan
        }
        "jupyter" {
            Write-Host @"

    Jupyter:
        nb - Starts a Jupyter Notebook server
        lb - Starts a Jupyter Lab server
    

"@ -ForegroundColor Cyan
        }
        "network" {
            Write-Host @"

    Network:
        nw-l        - Lists saved Wi-Fi profiles
        nw-pw       - Shows Wi-Fi profile name and password
        ipv4-s      - Displays IPv4 configuration
        flush-dns   - Clears the DNS resolver cache
        nw-connect  - Connects to a specified Wi-Fi network
        nw-forget   - Removes a saved Wi-Fi profile
        ipv6-s      - Shows IPv6 configuration
        mac-s       - Displays network adapter MAC addresses
        ping-test   - Tests connectivity to a host
        traceroute  - Traces the route to a host
        netstat-a   - Lists all active network connections
    

"@ -ForegroundColor Cyan
        }
        "utility" {
            Write-Host @"

    Utility:
        unalias - Removes all aliases in the session
        ps2     - Sets a custom PowerShell prompt
    

"@ -ForegroundColor Cyan
        }
    }
}
