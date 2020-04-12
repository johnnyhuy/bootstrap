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
iex ((New-Object System.Net.WebClient).DownloadString('https://gist.githubusercontent.com/johnnyhuy/e7550c64e7ee1810eecb3f4f7b56a9e0/raw/f95c2366f67a905d2f22395444ef8a78aaf80728/windows_bootstrap.ps1'))
```
