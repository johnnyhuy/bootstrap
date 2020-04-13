# Bootstrap

Welcome to my kick-start scripts.

Some of these repos are private 🤫.

## Getting Started

Run the following commands to get get started.

### Linux

Bootstrap with Linux! Tested on Debian so far.

```bash
curl -s https://raw.githubusercontent.com/johnnyhuy/bootstrap/master/linux.ps1 | /bin/bash
```

### Windows

Make sure you run remote signed policies first.

```powershell
# Run remote signed policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine -Force

# Run bootstrap
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/johnnyhuy/bootstrap/master/windows.ps1'))
```
