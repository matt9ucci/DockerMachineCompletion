# DockerMachineCompletion for PowerShell

![demo](demo.gif)

## Requirements
* PowerShell >= 5.0
* docker-machine cli in `$env:PATH`

## Quick Start

```powershell
# Install from PowerShell Gallery
Install-Module DockerMachineCompletion -Scope CurrentUser
# Import
Import-Module DockerMachineCompletion
```

## Less Quick Start (without `Install-Module`)

DockerMachineCompletion is a "well-formed" module.
You can install and import it in the usual manner as follows.

### Install
Download and place the [DockerMachineCompletion directory and files](./DockerMachineCompletion) in `$env:PSModulePath`.

You can see the paths listed in `$env:PSModulePath` as follows:
```powershell
PS C:\> $env:PSModulePath -split ';'
C:\Users\matt9ucci\Documents\WindowsPowerShell\Modules
C:\Program Files\WindowsPowerShell\Modules
C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
```

If your target path is `C:\Users\matt9ucci\Documents\WindowsPowerShell\Modules`, execute the following commands:
```powershell
# Uninstall previous version
Remove-Item $HOME\Documents\WindowsPowerShell\Modules\DockerMachineCompletion -Recurse -Force
# Download
Invoke-WebRequest https://github.com/matt9ucci/DockerMachineCompletion/archive/master.zip -OutFile master.zip
# Unzip the downloaded archive
Expand-Archive master.zip
# Place the unzipped files and directory in $env:PSModulePath
Move-Item master\DockerMachineCompletion-master\DockerMachineCompletion "$HOME\Documents\WindowsPowerShell\Modules"
# Clean up
Remove-Item master.zip
Remove-Item master -Recurse -Force
```

`$HOME` is a PowerShell's automatic variable containing the full path of the user's home directory (in this case `C:\Users\matt9ucci`). 

### Import
Execute the following command to check if you can import DockerMachineCompletion:
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

You can add your own completers and modify default completers with your custom script.

For information about how to write custom scripts, see [completers.ps1](DockerMachineCompletion/completers.ps1) and [completers4arguments.ps1](DockerMachineCompletion/completers4arguments.ps1)

To apply your custom script, pass the path as `Import-Module`'s ArgumentList parameter:
```powershell
Import-Module DockerMachineCompletion -ArgumentList pathto\custom1.ps1, pathto\custom2.ps1
```

## Known Issues
In PowerShell 5.0/5.1, with one dash (`-`) and double dash (`--`), completers are not invoked because of [a PowerShell's bug](https://github.com/PowerShell/PowerShell/issues/2912).
It will be [fixed in PowerShell 6.0](https://github.com/PowerShell/PowerShell/pull/3633).

A workaround for this issue is to type a character following `-` and `--`.
For example, type `--a` and press tab.

## Misc

This github repository will be often rebased.

## Links

* [PowerShell Gallery | DockerMachineCompletion](https://www.powershellgallery.com/packages/DockerMachineCompletion)
