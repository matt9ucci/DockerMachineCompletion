# DockerMachineCompletion
Docker Machine command completion for PowerShell.

![demo](demo.gif)

## Requirements
* PowerShell 5.0 or newer
* docker-machine cli in `$env:PATH`

## Quick Start

### Install
```powershell
Install-Module DockerMachineCompletion -Scope CurrentUser
```

### Import
```powershell
Import-Module DockerMachineCompletion
```

## Install and Import from GitHub
DockerMachineCompletion is a "well-formed" module.
You can install and import it in the usual manner as follows.

### Install
Download and place this repository's `DockerMachineCompletion` directory and files in a path that is listed in `$env:PSModulePath`.
You can see the paths listed in `$env:PSModulePath` as follows:
```powershell
PS C:\> $env:PSModulePath -split ';'
C:\Users\matt9ucci\Documents\WindowsPowerShell\Modules
C:\Program Files\WindowsPowerShell\Modules
C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
```

If your target path is `C:\Users\matt9ucci\Documents\WindowsPowerShell\Modules`, execute the following commands:
```powershell
# Uninstall
Remove-Item $HOME\Documents\WindowsPowerShell\Modules\DockerMachineCompletion -Recurse -Force
# Download and Install
Invoke-WebRequest https://github.com/matt9ucci/DockerMachineCompletion/archive/master.zip -OutFile master.zip
Expand-Archive master.zip
Move-Item master\DockerMachineCompletion-master\DockerMachineCompletion "$HOME\Documents\WindowsPowerShell\Modules"
# Clean up
Remove-Item master.zip
Remove-Item master -Recurse -Force
```
`$HOME` is a PowerShell's automatic variable containing the full path of the user's home directory (in this case `C:\Users\matt9ucci`). 

### Import
To check if you can import DockerMachineCompletion, execute the following command:
```powershell
PS> Get-Module -ListAvailable DockerMachineCompletion

    Directory: C:\Users\matt9ucci\Documents\WindowsPowerShell\Modules

ModuleType Version    Name                                ExportedCommands
---------- -------    ----                                ----------------
Manifest   0.12.2.... DockerMachineCompletion
```

After the check, execute the following command to import the installed module:
```powershell
Import-Module DockerMachineCompletion
```

## Customization
You can add your own completers and modify default completers with your custom scripts.
To apply your custom scripts, set their path as follows:
```powershell
Import-Module DockerMachineCompletion -ArgumentList pathto\custom.ps1, pathto\custom.ps2
```

For information about how to write custom scripts, see [completers.ps1](DockerMachineCompletion/completers.ps1) and [completers4arguments.ps1](DockerMachineCompletion/completers4arguments.ps1)

## Known Issues
In PowerShell 5.0/5.1, one dash (`-`) and double dash (`--`) would not work well because of [a PowerShell's bug](https://github.com/PowerShell/PowerShell/issues/2912).
It will be [fixed in PowerShell 6.0](https://github.com/PowerShell/PowerShell/pull/3633).

A workaround for this issue is to type a character following `-` and `--`.
For example, type `-a`, `--b`, `--cd`, etc.

## Misc
This github repository will be often rebased.

## Links
* [PowerShell Gallery | DockerMachineCompletion](https://www.powershellgallery.com/packages/DockerMachineCompletion)
