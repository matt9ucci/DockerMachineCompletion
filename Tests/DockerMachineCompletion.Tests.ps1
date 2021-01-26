#Requires -Module @{ ModuleName = 'Pester'; ModuleVersion = '5.1.1' }

BeforeAll {
	Import-Module -Name $PSScriptRoot\..\DockerMachineCompletion -Force

	function Get-Result([string]$Text, [int]$CursorPosition = $Text.Length, [hashtable]$Options) {
		[System.Management.Automation.CommandCompletion]::CompleteInput($Text, $CursorPosition, $Options).CompletionMatches
	}
}

Describe 'docker-machine' {
	It 'completes --t' {
		$result = Get-Result 'docker-machine --t'
		$result | Should -HaveCount 4
		$result[0].CompletionText | Should -Be --tls-ca-cert
		$result[1].CompletionText | Should -Be --tls-ca-key
		$result[2].CompletionText | Should -Be --tls-client-cert
		$result[3].CompletionText | Should -Be --tls-client-key
	}

	It 'completes st' {
		$result = Get-Result 'docker-machine st'
		$result | Should -HaveCount 3
		$result[0].CompletionText | Should -Be start
		$result[1].CompletionText | Should -Be status
		$result[2].CompletionText | Should -Be stop
	}
}

Describe 'docker-machine create' {
	It 'completes --e' {
		$result = Get-Result 'docker-machine create --e'
		$result | Should -HaveCount 7
		$result[0].CompletionText | Should -Be --engine-env
		$result[1].CompletionText | Should -Be --engine-insecure-registry
		$result[2].CompletionText | Should -Be --engine-install-url
		$result[3].CompletionText | Should -Be --engine-label
		$result[4].CompletionText | Should -Be --engine-opt
		$result[5].CompletionText | Should -Be --engine-registry-mirror
		$result[6].CompletionText | Should -Be --engine-storage-driver
	}
}

Describe 'docker-machine create -d azure' {
	It 'completes --azure-c' {
		$result = Get-Result 'docker-machine create -d azure --azure-c'
		$result | Should -HaveCount 3
		$result[0].CompletionText | Should -Be --azure-client-id
		$result[1].CompletionText | Should -Be --azure-client-secret
		$result[2].CompletionText | Should -Be --azure-custom-data
	}
}
