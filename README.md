# Bootstrap

Welcome to my kick-start scripts.

Some of these repos are private 🤫.

## Getting Started

Run the following commands to get get started.

### Windows

Make sure you run remote signed policies first.

```powershell
# Run remote signed policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force

# Run bootstrap
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/johnnyhuy/bootstrap/master/windows.ps1'))
```
