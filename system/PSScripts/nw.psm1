# Network Functions
function nw-l { netsh wlan show profile }

function  nw-pw ($name) {
    netsh wlan show profile $name key=clear | findstr "Name"
    netsh wlan show profile $name key=clear | findstr "Key Content"
}

# Network Utilities
function ipv4-s { ipconfig | findstr "IPv4" }
function flush-dns { ipconfig /flushdns }

# Connect to a specific Wi-Fi network
function nw-connect {
    param (
        [string]$name
    )
    netsh wlan connect name=$name
}

# Remove a saved Wi-Fi network
function nw-rm {
    param (
        [string]$name
    )
    netsh wlan delete profile name=$name
}

# Show IPv6 network configuration
function ipv6-s {
    Get-NetIPAddress -AddressFamily IPv6 | Format-Table -AutoSize
}

# Display the MAC address of your network adapter
function mac-s {
    Get-NetAdapter | Select-Object Name, MacAddress
}

# Test connectivity to a specific host (e.g., google.com)
function ping-test {
    param (
        [string]$host
    )
    Test-Connection -ComputerName $host -Count 4
}

# Trace the route to a specific host
function traceroute {
    param (
        [string]$host
    )
    tracert $host
}

# Display all active network connections
function netstat-a {
    netstat -an
}

im man
