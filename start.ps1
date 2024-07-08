# Set the path to your current directory
$serverPath = $PSScriptRoot

# Set the name of your start batch file
$startScript = "run.bat"

# Full path to the start script
$fullPath = Join-Path -Path $serverPath -ChildPath $startScript

while ($true) {
    # Check if the start script exists
    if (Test-Path $fullPath) {
        # Start the server
        Write-Host "Starting Minecraft server..."
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c", $fullPath -NoNewWindow -Wait
    } else {
        Write-Host "Error: Cannot find $startScript in $serverPath"
        break
    }

    # If the server process ends, wait for 10 seconds before restarting
    Write-Host "Server stopped or crashed. Restarting in 10 seconds..."
    Start-Sleep -Seconds 10
}

Write-Host "Script ended. Press any key to exit."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
