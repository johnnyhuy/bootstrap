Write-Host "😎 Welcome to John's startup script!" -ForegroundColor Green

if ($(Test-Path 'C:\ProgramData\chocolatey\bin\choco.exe') -eq $false) {
    Write-Host '🍫 Installing Chocolatety' -ForegroundColor Green

    # Install Chocolatey
    if ($(Get-ExecutionPolicy -Scope LocalMachine) -ne 'RemoteSigned') {
        Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force
    }

    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    Write-Host 'Done 😎' -ForegroundColor Blue
}

# Install git
Write-Host "🌞 Installing git" -ForegroundColor Green
. 'C:\ProgramData\chocolatey\bin\choco.exe' install git -y
Write-Host 'Done 😎' -ForegroundColor Blue

# Clone my repo
$setupFolder = "$($env:HOME)/.johnnyhuy-setup"
Write-Host "🌞 Installing setup repo to $setupFolder" -ForegroundColor Green
if (-not (Test-Path $setupFolder)){
    . 'C:\Program Files\Git\cmd\git.exe' clone 'https://github.com/johnnyhuy/setup.git' $setupFolder
} else {
    Write-Host "Repo already exists, doing a Git pull 😘" -ForegroundColor Yellow
    . 'C:\Program Files\Git\cmd\git.exe' pull
}
Write-Host 'Done 😎' -ForegroundColor Blue

Write-Host 'Kicking off Windows setup script!' -ForegroundColor Green
. "$setupFolder/windows.ps1"
