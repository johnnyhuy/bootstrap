#requires -RunAsAdministrator

param (
    [Parameter()]
    [switch]
    $ProfileUpdate = $false,

    [Parameter()]
    [string]
    $Device = ''
)

Write-Host "😎 Welcome to John's startup script!" -ForegroundColor Green

# Install Chocolatey
if ((Test-Path 'C:\ProgramData\chocolatey\bin\choco.exe') -eq $false) {
    Write-Host '🍫 Installing Chocolatety' -ForegroundColor Green

    if ((Get-ExecutionPolicy -Scope LocalMachine) -ne 'RemoteSigned') {
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
    }

    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host 'Done 😎' -ForegroundColor Blue
}

# Install git
if ((Test-Path 'C:\Program Files\Git\cmd\git.exe') -eq $false) {
    Write-Host "🌞 Installing git" -ForegroundColor Green
    . 'C:\ProgramData\chocolatey\bin\choco.exe' install git -y
    Write-Host 'Done 😎' -ForegroundColor Blue
}

# Clone my repo
$setupFolder = "$($env:HOME)/.johnnyhuy-setup"
Write-Host "🌞 Installing setup repo to $setupFolder" -ForegroundColor Green
if (-not (Test-Path $setupFolder)){
    . 'C:\Program Files\Git\cmd\git.exe' clone 'https://github.com/johnnyhuy/setup.git' $setupFolder
} else {
    Write-Host "Repo already exists, doing a Git pull 😘" -ForegroundColor Yellow
    cd $setupFolder
    . 'C:\Program Files\Git\cmd\git.exe' pull
    cd -
}
Write-Host 'Done 😎' -ForegroundColor Blue

Write-Host 'Kicking off Windows setup script!' -ForegroundColor Green
. "$setupFolder/windows.ps1" -ProfileUpdate:$ProfileUpdate -Device $Device
