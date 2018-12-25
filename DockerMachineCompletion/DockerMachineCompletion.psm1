Param(
	[string[]]$CustomScriptPath
)

function Select-CompletionResult {
	Param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[NativeCommandCompletionResult[]]$CompletionResult,
		[switch]$OptionWithArg
	)

	Process {
		if ($OptionWithArg) {
			$CompletionResult = $CompletionResult |
				Where-Object { $_.CompletionText -Like '-*' -and $_.TextType -NE 'Switch' }
		}
		$CompletionResult
	}
}

function Invoke-CompletionCustomScript {
	Param(
		[Parameter(Mandatory = $true, ValueFromPipeline = $true)]
		[string[]]$Path
	)

	Process {
		foreach ($p in $Path) {
			. $p
		}
	}
}

Invoke-CompletionCustomScript $PSScriptRoot\completers.ps1, $PSScriptRoot\completers4arguments.ps1
if ($CustomScriptPath) {
	Invoke-CompletionCustomScript $CustomScriptPath
}

$argumentCompleter = {
	Param([string]$wordToComplete, $commandAst, $cursorPosition)

	$completerName = 'docker-machine'
	$optionWithArg = $null
	$command = $null
	$counter = 1

	for (; $counter -lt $commandAst.CommandElements.Count; $counter++) {
		$ce = $commandAst.CommandElements[$counter]
		if ($cursorPosition -lt $ce.Extent.EndColumnNumber) {
			break
		}

		if ($optionWithArg) {
			# The argument of $optionWithArg is completed by this $ce
			$optionWithArg = $null
			continue
		}

		$text = $ce.Extent.Text
		if ($text.StartsWith('-')) {
			if ($text -in (Invoke-Completer $completerName -Option -ArgumentList $wordToComplete, $commandAst, $cursorPosition |
						Select-CompletionResult -OptionWithArg).CompletionText) {
				$optionWithArg = $text
			}
		} elseif (!$command) {
			$command = $text
			$completerName += "_$command"
		}
	}

	if ($optionWithArg) {
		$completerName += "_$optionWithArg"
	}

	# At this point, $completerName is any of the following:
	# 'docker-machine'
	# 'docker-machine_optionWithArg'
	# 'docker-machine_command'
	# 'docker-machine_command_optionWithArg'

	if ($wordToComplete) {
		$wordToCompleteSubstring = $wordToComplete.Substring(0, $cursorPosition - $commandAst.CommandElements[$counter].Extent.StartOffset)
	}

	if ($wordToComplete.StartsWith('-')) {
		$completionResult = Invoke-Completer $completerName -Option -ArgumentList $wordToComplete, $commandAst, $cursorPosition
	} else {
		$completionResult = Invoke-Completer $completerName -Completer -ArgumentList $wordToComplete, $commandAst, $cursorPosition
	}

	$completionResult | Where-Object CompletionText -Like "$wordToCompleteSubstring*" | ForEach-Object {
		if ($_.CompletionText -match ' ') {
			# for `--hyperv-virtual-switch` option
			New-CompletionResult -CompletionText ("'{0}'" -f $_.CompletionText) -TextType $_.TextType -ToolTip $_.ToolTip -ListItemText $_.ListItemText -ResultType $_.ResultType
		} else {
			$_
		}
	}
}

Register-NativeCommandArgumentCompleter docker-machine $argumentCompleter
