$storagePath = {
	if ($env:MACHINE_STORAGE_PATH) {
		COMPGEN $env:MACHINE_STORAGE_PATH
	} else {
		COMPGEN (Join-Path -Path $HOME -ChildPath '.docker' | Join-Path -ChildPath 'machine')
	}
}

Register-Completer 'docker-machine_--storage-path' $storagePath
Register-Completer 'docker-machine_-s' $storagePath

$machineName = {
	docker-machine ls --quiet | ForEach-Object {
		COMPGEN $_
	}
}

Register-Completer 'docker-machine_config' $machineName
Register-Completer 'docker-machine_create' $machineName
Register-Completer 'docker-machine_create_--engine-env' {
	"HTTP_PROXY=$env:HTTP_PROXY"
	"HTTPS_PROXY=$env:HTTPS_PROXY"
	"NO_PROXY=$env:NO_PROXY"
	"http_proxy=$env:http_proxy"
	"https_proxy=$env:https_proxy"
	"no_proxy=$env:no_proxy"
}
Register-Completer 'docker-machine_create_--virtualbox-ui-type' { 'gui', 'sdl', 'headless', 'separate' }
Register-Completer 'docker-machine_env' $machineName
Register-Completer 'docker-machine_env_--shell' {
	'cmd'
	'emacs'
	'fish'
	'powershell'
	'tcsh'
}
Register-Completer 'docker-machine_help' (Get-Completer 'docker-machine')
Register-Completer 'docker-machine_inspect' $machineName
Register-Completer 'docker-machine_ip' $machineName
Register-Completer 'docker-machine_kill' $machineName
Register-Completer 'docker-machine_provision' $machineName
Register-Completer 'docker-machine_regenerate-certs' $machineName
Register-Completer 'docker-machine_restart' $machineName
Register-Completer 'docker-machine_rm' $machineName
Register-Completer 'docker-machine_scp' $machineName
Register-Completer 'docker-machine_ssh' $machineName
Register-Completer 'docker-machine_start' $machineName
Register-Completer 'docker-machine_status' $machineName
Register-Completer 'docker-machine_stop' $machineName
Register-Completer 'docker-machine_upgrade' $machineName
Register-Completer 'docker-machine_url' $machineName
Register-Completer 'docker-machine_version' $machineName

$driverName =  {
	COMPGEN 'amazonec2'
	COMPGEN 'azure'
	COMPGEN 'digitalocean'
	COMPGEN 'exoscale'
	COMPGEN 'generic'
	COMPGEN 'google'
	COMPGEN 'hyperv'
	COMPGEN 'none'
	COMPGEN 'openstack'
	COMPGEN 'rackspace'
	COMPGEN 'softlayer'
	COMPGEN 'virtualbox'
	COMPGEN 'vmwarefusion'
	COMPGEN 'vmwarevcloudair'
	COMPGEN 'vmwarevsphere'
}

Register-Completer 'docker-machine_create_--driver' $driverName
Register-Completer 'docker-machine_create_-d' $driverName
