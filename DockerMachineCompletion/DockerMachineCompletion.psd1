@{

RootModule = 'DockerMachineCompletion.psm1'
ModuleVersion = '0.16.2.190903'
GUID = 'ff4897da-fa28-454a-b680-5dabcd605498'
Author = 'Masatoshi Higuchi'
CompanyName = 'N/A'
Copyright = '(c) 2019 Masatoshi Higuchi. All rights reserved.'
Description = 'Docker Machine command completion for PowerShell.'
PowerShellVersion = '5.0'

NestedModules = @('NativeCommandCompletion')

FunctionsToExport = @()
CmdletsToExport = @()
VariablesToExport = @()
AliasesToExport = @()

PrivateData = @{
	PSData = @{
		Tags = 'docker-machine', 'completion'
		LicenseUri = 'https://github.com/matt9ucci/DockerMachineCompletion/blob/master/LICENSE'
		ProjectUri = 'https://github.com/matt9ucci/DockerMachineCompletion'
		ReleaseNotes = 'First release for Docker Machine v0.16.2'
	}
}

DefaultCommandPrefix = 'DockerMachine'

}
