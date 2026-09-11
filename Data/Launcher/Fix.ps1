# Check if the script is running with Admin rights
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "Script is not running as Admin. Restarting with Admin rights..." -ForegroundColor Yellow
    Start-Process powershell -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$($MyInvocation.MyCommand.Path)`"" -Verb RunAs
    exit
}

try {
    # Get the directory of the script
    $currentFilePath = $MyInvocation.MyCommand.Path
    $currentFolder = Split-Path -Parent $currentFilePath

    # Calculate the root folder by going up two levels
    $rootFolder = (Split-Path (Split-Path $currentFolder -Parent) -Parent) 

    Write-Host "Root folder path: $rootFolder" -ForegroundColor Green

    # Check if the folder exists
    if (-not (Test-Path $rootFolder)) {
        Write-Host "The path $rootFolder does not exist or is invalid!" -ForegroundColor Red
        exit 1
    }

    # Add the folder to the Windows Defender exclusion list
    Add-MpPreference -ExclusionPath $rootFolder
    Write-Host "The folder $rootFolder has been added to the Windows Defender exclusion list." -ForegroundColor Green
}
catch {
    # Catch any exceptions and display the error message
    Write-Host "An error occurred: $($_.Exception.Message)" -ForegroundColor Red
    exit 1
}
