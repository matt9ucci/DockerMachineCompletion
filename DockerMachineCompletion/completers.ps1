# Docker Machine v0.15.0
Register-Completer docker-machine @(
	COMPGEN active Command 'Print which machine is active'
	COMPGEN config Command 'Print the connection config for machine'
	COMPGEN create Command 'Create a machine'
	COMPGEN env Command 'Display the commands to set up the environment for the Docker client'
	COMPGEN inspect Command 'Inspect information about a machine'
	COMPGEN ip Command 'Get the IP address of a machine'
	COMPGEN kill Command 'Kill a machine'
	COMPGEN ls Command 'List machines'
	COMPGEN mount Command 'Mount or unmount a directory from a machine with SSHFS.'
	COMPGEN provision Command 'Re-provision existing machines'
	COMPGEN regenerate-certs Command 'Regenerate TLS Certificates for a machine'
	COMPGEN restart Command 'Restart a machine'
	COMPGEN rm Command 'Remove a machine'
	COMPGEN scp Command 'Copy files between machines'
	COMPGEN ssh Command 'Log into or run a command on a machine with SSH.'
	COMPGEN start Command 'Start a machine'
	COMPGEN status Command 'Get the status of a machine'
	COMPGEN stop Command 'Stop a machine'
	COMPGEN upgrade Command 'Upgrade a machine to the latest version of Docker'
	COMPGEN url Command 'Get the URL of a machine'
	COMPGEN version Command 'Show the Docker Machine version or a machine docker version'
	COMPGEN help Command 'Shows a list of commands or help for one command'
)

Register-Completer docker-machine -Option {
	COMPGEN --bugsnag-api-token StringFlag 'BugSnag API token for crash reporting'
	COMPGEN --debug Switch 'Enable debug mode'
	COMPGEN '-D' Switch 'Enable debug mode'
	COMPGEN --github-api-token StringFlag 'Token to use for requests to the Github API'
	COMPGEN --native-ssh Switch 'Use the native (Go-based) SSH implementation.'
	COMPGEN --storage-path StringFlag 'Configures storage path'
	COMPGEN '-s' StringFlag 'Configures storage path'
	COMPGEN --tls-ca-cert StringFlag 'CA to verify remotes against'
	COMPGEN --tls-ca-key StringFlag 'Private key to generate certificates'
	COMPGEN --tls-client-cert StringFlag 'Client cert to use for TLS'
	COMPGEN --tls-client-key StringFlag 'Private key used in client TLS auth'
	COMPGEN --version Switch 'print the version'
	COMPGEN '-v' Switch 'print the version'
	COMPGEN --help Switch 'show help'
	COMPGEN '-h' Switch 'show help'
}

Register-Completer docker-machine_active -Option {
	COMPGEN --timeout IntFlag 'Timeout in seconds, default to 10s'
	COMPGEN '-t' IntFlag 'Timeout in seconds, default to 10s'
}

Register-Completer docker-machine_config -Option {
	COMPGEN --swarm Switch 'Display the Swarm config instead of the Docker daemon'
}

Register-Completer docker-machine_create -Option {
	Param($wordToComplete, $commandAst, $cursorPosition)

	COMPGEN --driver StringFlag 'Driver to create machine with.'
	COMPGEN '-d' StringFlag 'Driver to create machine with.'
	COMPGEN --engine-env StringSliceFlag 'Specify environment variables to set in the engine'
	COMPGEN --engine-insecure-registry StringSliceFlag 'Specify insecure registries to allow with the created engine'
	COMPGEN --engine-install-url StringFlag 'Custom URL to use for engine installation'
	COMPGEN --engine-label StringSliceFlag 'Specify labels for the created engine'
	COMPGEN --engine-opt StringSliceFlag 'Specify arbitrary flags to include with the created engine in the form flag=value'
	COMPGEN --engine-registry-mirror StringSliceFlag 'Specify registry mirrors to use'
	COMPGEN --engine-storage-driver StringFlag 'Specify a storage driver to use with the engine'
	COMPGEN --swarm Switch 'Configure Machine to join a Swarm cluster'
	COMPGEN --swarm-addr StringFlag 'addr to advertise for Swarm (default: detect and use the machine IP)'
	COMPGEN --swarm-discovery StringFlag 'Discovery service to use with Swarm'
	COMPGEN --swarm-experimental Switch 'Enable Swarm experimental features'
	COMPGEN --swarm-host StringFlag 'ip/socket to listen on for Swarm master'
	COMPGEN --swarm-image StringFlag 'Specify Docker image to use for Swarm'
	COMPGEN --swarm-join-opt StringSliceFlag 'Define arbitrary flags for Swarm join'
	COMPGEN --swarm-master Switch 'Configure Machine to be a Swarm master'
	COMPGEN --swarm-opt StringSliceFlag 'Define arbitrary flags for Swarm master'
	COMPGEN --swarm-strategy StringFlag 'Define a default scheduling strategy for Swarm'
	COMPGEN --tls-san StringSliceFlag 'Support extra SANs for TLS certs'

	$driverName = $env:MACHINE_DRIVER
	if (!$driverName) {
		$driverName = 'virtualbox'
	}
	$ce = $commandAst.CommandElements
	for ($i = 1; $i -lt $ce.Count; $i++) {
		if (@('--driver', '-d') -contains $ce[$i].Extent.Text) {
			$driverName = $ce[$i + 1]
			break
		}
	}
	switch ($driverName) {
		amazonec2 {
			COMPGEN --amazonec2-access-key StringFlag 'AWS Access Key'
			COMPGEN --amazonec2-ami StringFlag 'AWS machine image'
			COMPGEN --amazonec2-block-duration-minutes IntFlag 'AWS spot instance duration in minutes (60, 120, 180, 240, 300, or 360)'
			COMPGEN --amazonec2-device-name StringFlag 'AWS root device name'
			COMPGEN --amazonec2-endpoint StringFlag 'Optional endpoint URL (hostname only or fully qualified URI)'
			COMPGEN --amazonec2-iam-instance-profile StringFlag 'AWS IAM Instance Profile'
			COMPGEN --amazonec2-insecure-transport Switch 'Disable SSL when sending requests'
			COMPGEN --amazonec2-instance-type StringFlag 'AWS instance type'
			COMPGEN --amazonec2-keypair-name StringFlag 'AWS keypair to use; requires --amazonec2-ssh-keypath'
			COMPGEN --amazonec2-monitoring Switch 'Set this flag to enable CloudWatch monitoring'
			COMPGEN --amazonec2-open-port StringSliceFlag 'Make the specified port number accessible from the Internet'
			COMPGEN --amazonec2-private-address-only Switch 'Only use a private IP address'
			COMPGEN --amazonec2-region StringFlag 'AWS region'
			COMPGEN --amazonec2-request-spot-instance Switch 'Set this flag to request spot instance'
			COMPGEN --amazonec2-retries IntFlag 'Set retry count for recoverable failures (use -1 to disable)'
			COMPGEN --amazonec2-root-size IntFlag 'AWS root disk size (in GB)'
			COMPGEN --amazonec2-secret-key StringFlag 'AWS Secret Key'
			COMPGEN --amazonec2-security-group StringSliceFlag 'AWS VPC security group'
			COMPGEN --amazonec2-security-group-readonly Switch 'Skip adding default rules to security groups'
			COMPGEN --amazonec2-session-token StringFlag 'AWS Session Token'
			COMPGEN --amazonec2-spot-price StringFlag 'AWS spot instance bid price (in dollar)'
			COMPGEN --amazonec2-ssh-keypath StringFlag 'SSH Key for Instance'
			COMPGEN --amazonec2-ssh-user StringFlag 'Set the name of the ssh user'
			COMPGEN --amazonec2-subnet-id StringFlag 'AWS VPC subnet id'
			COMPGEN --amazonec2-tags StringFlag 'AWS Tags (e.g. key1,value1,key2,value2)'
			COMPGEN --amazonec2-use-ebs-optimized-instance Switch 'Create an EBS optimized instance'
			COMPGEN --amazonec2-use-private-address Switch 'Force the usage of private IP address'
			COMPGEN --amazonec2-userdata StringFlag 'path to file with cloud-init user data'
			COMPGEN --amazonec2-volume-type StringFlag 'Amazon EBS volume type'
			COMPGEN --amazonec2-vpc-id StringFlag 'AWS VPC id'
			COMPGEN --amazonec2-zone StringFlag 'AWS zone for instance (i.e. a,b,c,d,e)'
		}
		azure {
			COMPGEN --azure-availability-set StringFlag 'Azure Availability Set to place the virtual machine into'
			COMPGEN --azure-client-id StringFlag 'Azure Service Principal Account ID (optional, browser auth is used if not specified)'
			COMPGEN --azure-client-secret StringFlag 'Azure Service Principal Account password (optional, browser auth is used if not specified)'
			COMPGEN --azure-custom-data StringFlag 'Path to file with custom-data'
			COMPGEN --azure-dns StringFlag 'A unique DNS label for the public IP adddress'
			COMPGEN --azure-docker-port IntFlag 'Port number for Docker engine'
			COMPGEN --azure-environment StringFlag 'Azure environment (e.g. AzurePublicCloud, AzureChinaCloud)'
			COMPGEN --azure-image StringFlag 'Azure virtual machine OS image'
			COMPGEN --azure-location StringFlag 'Azure region to create the virtual machine'
			COMPGEN --azure-no-public-ip Switch 'Do not create a public IP address for the machine'
			COMPGEN --azure-open-port StringSliceFlag 'Make the specified port number accessible from the Internet'
			COMPGEN --azure-private-ip-address StringFlag 'Specify a static private IP address for the machine'
			COMPGEN --azure-resource-group StringFlag 'Azure Resource Group name (will be created if missing)'
			COMPGEN --azure-size StringFlag 'Size for Azure Virtual Machine'
			COMPGEN --azure-ssh-user StringFlag 'Username for SSH login'
			COMPGEN --azure-static-public-ip Switch 'Assign a static public IP address to the machine'
			COMPGEN --azure-storage-type StringFlag 'Type of Storage Account to host the OS Disk for the machine'
			COMPGEN --azure-subnet StringFlag 'Azure Subnet Name to be used within the Virtual Network'
			COMPGEN --azure-subnet-prefix StringFlag 'Private CIDR block to be used for the new subnet, should comply RFC 1918'
			COMPGEN --azure-subscription-id StringFlag 'Azure Subscription ID'
			COMPGEN --azure-use-private-ip Switch 'Use private IP address of the machine to connect'
			COMPGEN --azure-vnet StringFlag 'Azure Virtual Network name to connect the virtual machine (in [resourcegroup:]name format)'
		}
		digitalocean {
			COMPGEN --digitalocean-access-token StringFlag 'Digital Ocean access token'
			COMPGEN --digitalocean-backups Switch 'enable backups for droplet'
			COMPGEN --digitalocean-image StringFlag 'Digital Ocean Image'
			COMPGEN --digitalocean-ipv6 Switch 'enable ipv6 for droplet'
			COMPGEN --digitalocean-monitoring Switch 'enable monitoring for droplet'
			COMPGEN --digitalocean-private-networking Switch 'enable private networking for droplet'
			COMPGEN --digitalocean-region StringFlag 'Digital Ocean region'
			COMPGEN --digitalocean-size StringFlag 'Digital Ocean size'
			COMPGEN --digitalocean-ssh-key-fingerprint StringFlag 'SSH key fingerprint'
			COMPGEN --digitalocean-ssh-key-path StringFlag 'SSH private key path '
			COMPGEN --digitalocean-ssh-port IntFlag 'SSH port'
			COMPGEN --digitalocean-ssh-user StringFlag 'SSH username'
			COMPGEN --digitalocean-tags StringFlag 'comma-separated list of tags to apply to the Droplet'
			COMPGEN --digitalocean-userdata StringFlag 'path to file with cloud-init user-data'
		}
		exoscale {
			COMPGEN --exoscale-affinity-group StringSliceFlag 'exoscale affinity group'
			COMPGEN --exoscale-api-key StringFlag 'exoscale API key'
			COMPGEN --exoscale-api-secret-key StringFlag 'exoscale API secret key'
			COMPGEN --exoscale-availability-zone StringFlag 'exoscale availability zone'
			COMPGEN --exoscale-disk-size IntFlag 'exoscale disk size (10, 50, 100, 200, 400)'
			COMPGEN --exoscale-image StringFlag 'exoscale image template'
			COMPGEN --exoscale-instance-profile StringFlag 'exoscale instance profile (Small, Medium, Large, ...)'
			COMPGEN --exoscale-security-group StringSliceFlag 'exoscale security group'
			COMPGEN --exoscale-ssh-key StringFlag 'path to the SSH user private key'
			COMPGEN --exoscale-ssh-user StringFlag 'name of the ssh user'
			COMPGEN --exoscale-url StringFlag 'exoscale API endpoint'
			COMPGEN --exoscale-userdata StringFlag 'path to file with cloud-init user-data'
		}
		generic {
			COMPGEN --generic-engine-port IntFlag 'Docker engine port'
			COMPGEN --generic-ip-address StringFlag 'IP Address of machine'
			COMPGEN --generic-ssh-key StringFlag 'SSH private key path (if not provided, default SSH key will be used)'
			COMPGEN --generic-ssh-port IntFlag 'SSH port'
			COMPGEN --generic-ssh-user StringFlag 'SSH user'
		}
		google {
			COMPGEN --google-address StringFlag 'GCE Instance External IP'
			COMPGEN --google-disk-size IntFlag 'GCE Instance Disk Size (in GB)'
			COMPGEN --google-disk-type StringFlag 'GCE Instance Disk type'
			COMPGEN --google-machine-image StringFlag 'GCE Machine Image Absolute URL'
			COMPGEN --google-machine-type StringFlag 'GCE Machine Type'
			COMPGEN --google-network StringFlag 'Specify network in which to provision vm'
			COMPGEN --google-open-port StringSliceFlag 'Make the specified port number accessible from the Internet, e.g, 8080/tcp'
			COMPGEN --google-preemptible Switch 'GCE Instance Preemptibility'
			COMPGEN --google-project StringFlag 'GCE Project'
			COMPGEN --google-scopes StringFlag 'GCE Scopes (comma-separated if multiple scopes)'
			COMPGEN --google-subnetwork StringFlag 'Specify subnetwork in which to provision vm'
			COMPGEN --google-tags StringFlag 'GCE Instance Tags (comma-separated)'
			COMPGEN --google-use-existing Switch 'Don''t create a new VM, use an existing one'
			COMPGEN --google-use-internal-ip Switch 'Use internal GCE Instance IP rather than public one'
			COMPGEN --google-use-internal-ip-only Switch 'Configure GCE instance to not have an external IP address'
			COMPGEN --google-username StringFlag 'GCE User Name'
			COMPGEN --google-zone StringFlag 'GCE Zone'
		}
		hyperv {
			COMPGEN --hyperv-boot2docker-url StringFlag 'URL of the boot2docker ISO. Defaults to the latest available version.'
			COMPGEN --hyperv-cpu-count IntFlag 'number of CPUs for the machine'
			COMPGEN --hyperv-disable-dynamic-memory Switch 'Disable dynamic memory management setting'
			COMPGEN --hyperv-disk-size IntFlag 'Maximum size of dynamically expanding disk in MB.'
			COMPGEN --hyperv-memory IntFlag 'Memory size for host in MB.'
			COMPGEN --hyperv-static-macaddress StringFlag 'Hyper-V network adapter''s static MAC address.'
			COMPGEN --hyperv-virtual-switch StringFlag 'Virtual switch name. Defaults to first found.'
			COMPGEN --hyperv-vlan-id IntFlag 'Hyper-V network adapter''s VLAN ID if any'
		}
		none {
			COMPGEN --url StringFlag 'URL of host when no driver is selected'
		}
		openstack {
			COMPGEN --openstack-active-timeout IntFlag 'OpenStack active timeout'
			COMPGEN --openstack-auth-url StringFlag 'OpenStack authentication URL'
			COMPGEN --openstack-availability-zone StringFlag 'OpenStack availability zone'
			COMPGEN --openstack-cacert StringFlag 'CA certificate bundle to verify against'
			COMPGEN --openstack-config-drive Switch 'Enables the OpenStack config drive for the instance'
			COMPGEN --openstack-domain-id StringFlag 'OpenStack domain ID (identity v3 only)'
			COMPGEN --openstack-domain-name StringFlag 'OpenStack domain name (identity v3 only)'
			COMPGEN --openstack-endpoint-type StringFlag 'OpenStack endpoint type (adminURL, internalURL or publicURL)'
			COMPGEN --openstack-flavor-id StringFlag 'OpenStack flavor id to use for the instance'
			COMPGEN --openstack-flavor-name StringFlag 'OpenStack flavor name to use for the instance'
			COMPGEN --openstack-floatingip-pool StringFlag 'OpenStack floating IP pool to get an IP from to assign to the instance'
			COMPGEN --openstack-image-id StringFlag 'OpenStack image id to use for the instance'
			COMPGEN --openstack-image-name StringFlag 'OpenStack image name to use for the instance'
			COMPGEN --openstack-insecure Switch 'Disable TLS credential checking.'
			COMPGEN --openstack-ip-version IntFlag 'OpenStack version of IP address assigned for the machine'
			COMPGEN --openstack-keypair-name StringFlag 'OpenStack keypair to use to SSH to the instance'
			COMPGEN --openstack-net-id StringFlag 'OpenStack network id the machine will be connected on'
			COMPGEN --openstack-net-name StringFlag 'OpenStack network name the machine will be connected on'
			COMPGEN --openstack-nova-network Switch 'Use the nova networking services instead of neutron.'
			COMPGEN --openstack-password StringFlag 'OpenStack password'
			COMPGEN --openstack-private-key-file StringFlag 'Private keyfile to use for SSH (absolute path)'
			COMPGEN --openstack-region StringFlag 'OpenStack region name'
			COMPGEN --openstack-sec-groups StringFlag 'OpenStack comma separated security groups for the machine'
			COMPGEN --openstack-ssh-port IntFlag 'OpenStack SSH port'
			COMPGEN --openstack-ssh-user StringFlag 'OpenStack SSH user'
			COMPGEN --openstack-tenant-id StringFlag 'OpenStack tenant id'
			COMPGEN --openstack-tenant-name StringFlag 'OpenStack tenant name'
			COMPGEN --openstack-user-data-file StringFlag 'File containing an openstack userdata script'
			COMPGEN --openstack-username StringFlag 'OpenStack username'
		}
		rackspace {
			COMPGEN --rackspace-active-timeout IntFlag 'Rackspace active timeout'
			COMPGEN --rackspace-api-key StringFlag 'Rackspace API key'
			COMPGEN --rackspace-docker-install StringFlag 'Set if docker have to be installed on the machine'
			COMPGEN --rackspace-endpoint-type StringFlag 'Rackspace endpoint type (adminURL, internalURL or the default publicURL)'
			COMPGEN --rackspace-flavor-id StringFlag 'Rackspace flavor ID. Default: General Purpose 1GB'
			COMPGEN --rackspace-image-id StringFlag 'Rackspace image ID. Default: Ubuntu 16.04 LTS (Xenial Xerus) (PVHVM)'
			COMPGEN --rackspace-region StringFlag 'Rackspace region name'
			COMPGEN --rackspace-ssh-port IntFlag 'SSH port for the newly booted machine. Set to 22 by default'
			COMPGEN --rackspace-ssh-user StringFlag 'SSH user for the newly booted machine. Set to root by default'
			COMPGEN --rackspace-username StringFlag 'Rackspace account username'
		}
		softlayer {
			COMPGEN --softlayer-api-endpoint StringFlag 'softlayer api endpoint to use'
			COMPGEN --softlayer-api-key StringFlag 'softlayer user API key'
			COMPGEN --softlayer-cpu IntFlag 'number of CPU''s for the machine'
			COMPGEN --softlayer-disk-size IntFlag 'Disk size for machine, a value of 0 uses the default size on softlayer'
			COMPGEN --softlayer-domain StringFlag 'domain name for machine'
			COMPGEN --softlayer-hostname StringFlag 'hostname for the machine - defaults to machine name'
			COMPGEN --softlayer-hourly-billing Switch 'set hourly billing for machine - on by default'
			COMPGEN --softlayer-image StringFlag 'OS image for machine'
			COMPGEN --softlayer-local-disk Switch 'use machine local disk instead of softlayer SAN'
			COMPGEN --softlayer-memory IntFlag 'Memory in MB for machine'
			COMPGEN --softlayer-network-max-speed IntFlag 'Max speed of public and private network'
			COMPGEN --softlayer-private-net-only Switch 'Use only private networking'
			COMPGEN --softlayer-private-vlan-id IntFlag ''
			COMPGEN --softlayer-public-vlan-id IntFlag ''
			COMPGEN --softlayer-region StringFlag 'softlayer region for machine'
			COMPGEN --softlayer-user StringFlag 'softlayer user account name'
		}
		virtualbox {
			COMPGEN --virtualbox-boot2docker-url StringFlag 'The URL of the boot2docker image. Defaults to the latest available version'
			COMPGEN --virtualbox-cpu-count IntFlag 'number of CPUs for the machine (-1 to use the number of CPUs available)'
			COMPGEN --virtualbox-disk-size IntFlag 'Size of disk for host in MB'
			COMPGEN --virtualbox-host-dns-resolver Switch 'Use the host DNS resolver'
			COMPGEN --virtualbox-hostonly-cidr StringFlag 'Specify the Host Only CIDR'
			COMPGEN --virtualbox-hostonly-nicpromisc StringFlag 'Specify the Host Only Network Adapter Promiscuous Mode'
			COMPGEN --virtualbox-hostonly-nictype StringFlag 'Specify the Host Only Network Adapter Type'
			COMPGEN --virtualbox-hostonly-no-dhcp Switch 'Disable the Host Only DHCP Server'
			COMPGEN --virtualbox-import-boot2docker-vm StringFlag 'The name of a Boot2Docker VM to import'
			COMPGEN --virtualbox-memory IntFlag 'Size of memory for host in MB'
			COMPGEN --virtualbox-nat-nictype StringFlag 'Specify the Network Adapter Type'
			COMPGEN --virtualbox-no-dns-proxy Switch 'Disable proxying all DNS requests to the host'
			COMPGEN --virtualbox-no-share Switch 'Disable the mount of your home directory'
			COMPGEN --virtualbox-no-vtx-check Switch 'Disable checking for the availability of hardware virtualization before the vm is started'
			COMPGEN --virtualbox-share-folder StringFlag 'Mount the specified directory instead of the default home location. Format: dir:name'
			COMPGEN --virtualbox-ui-type StringFlag 'Specify the UI Type: (gui|sdl|headless|separate)'
		}
		vmwarefusion {
		}
		vmwarevcloudair {
			COMPGEN --vmwarevcloudair-catalog StringFlag 'vCloud Air Catalog (default is Public Catalog)'
			COMPGEN --vmwarevcloudair-catalogitem StringFlag 'vCloud Air Catalog Item (default is Ubuntu Precise)'
			COMPGEN --vmwarevcloudair-computeid StringFlag 'vCloud Air Compute ID (if using Dedicated Cloud)'
			COMPGEN --vmwarevcloudair-cpu-count IntFlag 'vCloud Air VM Cpu Count (default 1)'
			COMPGEN --vmwarevcloudair-docker-port IntFlag 'vCloud Air Docker port'
			COMPGEN --vmwarevcloudair-edgegateway StringFlag 'vCloud Air Org Edge Gateway (Default is <vdcid>)'
			COMPGEN --vmwarevcloudair-memory-size IntFlag 'vCloud Air VM Memory Size in MB (default 2048)'
			COMPGEN --vmwarevcloudair-orgvdcnetwork StringFlag 'vCloud Air Org VDC Network (Default is <vdcid>-default-routed)'
			COMPGEN --vmwarevcloudair-password StringFlag 'vCloud Air password'
			COMPGEN --vmwarevcloudair-publicip StringFlag 'vCloud Air Org Public IP to use'
			COMPGEN --vmwarevcloudair-ssh-port IntFlag 'vCloud Air SSH port'
			COMPGEN --vmwarevcloudair-username StringFlag 'vCloud Air username'
			COMPGEN --vmwarevcloudair-vdcid StringFlag 'vCloud Air VDC ID'
		}
		vmwarevsphere {
			COMPGEN --vmwarevsphere-boot2docker-url StringFlag 'vSphere URL for boot2docker image'
			COMPGEN --vmwarevsphere-cfgparam StringSliceFlag 'vSphere vm configuration parameters (used for guestinfo)'
			COMPGEN --vmwarevsphere-cloudinit StringFlag 'vSphere cloud-init file or url to set in the guestinfo'
			COMPGEN --vmwarevsphere-cpu-count IntFlag 'vSphere CPU number for docker VM'
			COMPGEN --vmwarevsphere-datacenter StringFlag 'vSphere datacenter for docker VM'
			COMPGEN --vmwarevsphere-datastore StringFlag 'vSphere datastore for docker VM'
			COMPGEN --vmwarevsphere-disk-size IntFlag 'vSphere size of disk for docker VM (in MB)'
			COMPGEN --vmwarevsphere-folder StringFlag 'vSphere folder for the docker VM. This folder must already exist in the datacenter.'
			COMPGEN --vmwarevsphere-hostsystem StringFlag 'vSphere compute resource where the docker VM will be instantiated. This can be omitted if using a cluster with DRS.'
			COMPGEN --vmwarevsphere-memory-size IntFlag 'vSphere size of memory for docker VM (in MB)'
			COMPGEN --vmwarevsphere-network StringSliceFlag 'vSphere network where the docker VM will be attached'
			COMPGEN --vmwarevsphere-password StringFlag 'vSphere password'
			COMPGEN --vmwarevsphere-pool StringFlag 'vSphere resource pool for docker VM'
			COMPGEN --vmwarevsphere-username StringFlag 'vSphere username'
			COMPGEN --vmwarevsphere-vcenter StringFlag 'vSphere IP/hostname for vCenter'
			COMPGEN --vmwarevsphere-vcenter-port IntFlag 'vSphere Port for vCenter'
		}
	}
}

Register-Completer docker-machine_env -Option {
	COMPGEN --no-proxy Switch 'Add machine IP to NO_PROXY environment variable'
	COMPGEN --shell StringFlag 'Force environment to be configured for a specified shell: [fish, cmd, powershell, tcsh, emacs], default is auto-detect'
	COMPGEN --swarm Switch 'Display the Swarm config instead of the Docker daemon'
	COMPGEN --unset Switch 'Unset variables instead of setting them'
	COMPGEN '-u' Switch 'Unset variables instead of setting them'
}

Register-Completer docker-machine_inspect -Option {
	COMPGEN --format StringFlag 'Format the output using the given go template.'
	COMPGEN '-f' StringFlag 'Format the output using the given go template.'
}

Register-Completer docker-machine_ls -Option {
	COMPGEN --filter StringSliceFlag 'Filter output based on conditions provided'
	COMPGEN --format StringFlag 'Pretty-print machines using a Go template'
	COMPGEN '-f' StringFlag 'Pretty-print machines using a Go template'
	COMPGEN --quiet Switch 'Enable quiet mode'
	COMPGEN '-q' Switch 'Enable quiet mode'
	COMPGEN --timeout IntFlag 'Timeout in seconds, default to 10s'
	COMPGEN '-t' IntFlag 'Timeout in seconds, default to 10s'
}

Register-Completer docker-machine_mount -Option {
	COMPGEN --unmount Switch 'Unmount instead of mount'
	COMPGEN '-u' Switch 'Unmount instead of mount'
}

Register-Completer docker-machine_regenerate-certs -Option {
	COMPGEN --client-certs Switch 'Also regenerate client certificates and CA.'
	COMPGEN --force Switch 'Force rebuild and do not prompt'
	COMPGEN '-f' Switch 'Force rebuild and do not prompt'
}

Register-Completer docker-machine_rm -Option {
	COMPGEN --force Switch 'Remove local configuration even if machine cannot be removed, also implies an automatic yes (`-y`)'
	COMPGEN '-f' Switch 'Remove local configuration even if machine cannot be removed, also implies an automatic yes (`-y`)'
	COMPGEN '-y' Switch 'Assumes automatic yes to proceed with remove, without prompting further user confirmation'
}

Register-Completer docker-machine_scp -Option {
	COMPGEN --delta Switch 'Reduce amount of data sent over network by sending only the differences (uses rsync)'
	COMPGEN '-d' Switch 'Reduce amount of data sent over network by sending only the differences (uses rsync)'
	COMPGEN --quiet Switch 'Disables the progress meter as well as warning and diagnostic messages from ssh'
	COMPGEN '-q' Switch 'Disables the progress meter as well as warning and diagnostic messages from ssh'
	COMPGEN --recursive Switch 'Copy files recursively (required to copy directories)'
	COMPGEN '-r' Switch 'Copy files recursively (required to copy directories)'
}
