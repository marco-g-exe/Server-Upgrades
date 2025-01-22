# Ensure the script is run as an Administrator
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Please run this script as an Administrator."
    exit
}

# Define the upgrade path
$sourcePath = "C:\Windows\System32\Setup.exe"
$targetPath = "C:\Windows\System32\Setup.exe"

# Check if the source setup.exe exists
if (-NOT (Test-Path -Path $sourcePath)) {
    Write-Error "Setup.exe not found at the specified path."
    exit
}

# Perform the upgrade
Start-Process -FilePath $targetPath -ArgumentList "/auto upgrade /dynamicupdate disable" -Wait

Write-Output "Upgrade completed successfully!"

