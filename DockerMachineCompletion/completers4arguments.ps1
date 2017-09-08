$driverName = {
	'amazonec2'
	'azure'
	'digitalocean'
	'exoscale'
	'generic'
	'google'
	'hyperv'
	'none'
	'openstack'
	'rackspace'
	'softlayer'
	'virtualbox'
	'vmwarefusion'
	'vmwarevcloudair'
	'vmwarevsphere'
}

$machineName = { docker-machine ls --quiet }

$storagePath = {
	if ($env:MACHINE_STORAGE_PATH) {
		$env:MACHINE_STORAGE_PATH
	} else {
		Join-Path -Path $HOME -ChildPath '.docker' | Join-Path -ChildPath 'machine'
	}
}

Register-Completer 'docker-machine_--storage-path' $storagePath
Register-Completer 'docker-machine_-s' (Get-Completer 'docker-machine_--storage-path')

Register-Completer 'docker-machine_config' $machineName

Register-Completer 'docker-machine_create' $machineName
Register-Completer 'docker-machine_create_--driver' $driverName
Register-Completer 'docker-machine_create_-d' (Get-Completer 'docker-machine_create_--driver')
Register-Completer 'docker-machine_create_--engine-env' {
	"HTTP_PROXY=$env:HTTP_PROXY"
	"HTTPS_PROXY=$env:HTTPS_PROXY"
	"NO_PROXY=$env:NO_PROXY"
	"http_proxy=$env:http_proxy"
	"https_proxy=$env:https_proxy"
	"no_proxy=$env:no_proxy"
}
Register-Completer 'docker-machine_create_--swarm-strategy' { 'binpack', 'random', 'spread' }
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
Register-Completer 'docker-machine_inspect_--format' { "'{{json .}}'", "'{{prettyjson .}}'" }
Register-Completer 'docker-machine_inspect_-f' (Get-Completer 'docker-machine_inspect_--format')
Register-Completer 'docker-machine_ip' $machineName
Register-Completer 'docker-machine_kill' $machineName
Register-Completer 'docker-machine_ls_--filter' {
	Param([string]$wordToComplete)
	
	if ($wordToComplete -notlike '*=*') {
		COMPGEN 'driver' 'string' 'Driver name'
		COMPGEN 'label' 'string' '<key> or <key>=<value>'
		COMPGEN 'name' 'string' 'Machine''s name'
		COMPGEN 'state' 'string' 'Machine''s state'
		COMPGEN 'swarm' 'string' 'Swarm master''s name'
		return
	}

	$key = ($wordToComplete -split '=')[0]
	$values = switch ($key) {
		'driver' {
			'amazonec2'
			'azure'
			'digitalocean'
			'exoscale'
			'generic'
			'google'
			'hyperv'
			'none'
			'openstack'
			'rackspace'
			'softlayer'
			'virtualbox'
			'vmwarefusion'
			'vmwarevcloudair'
			'vmwarevsphere'
		}
		'name' { docker-machine ls --quiet }
		'state' {
			'Error'
			'Paused'
			'Running'
			'Saved'
			'Starting'
			'Stopped'
			'Stopping'
			'Timeout'
		}
	}

	foreach ($v in $values) {
		COMPGEN "$key=$v" 'string' $v $v ([System.Management.Automation.CompletionResultType]::ParameterValue)
	}
}
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
