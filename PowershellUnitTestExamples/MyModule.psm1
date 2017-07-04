<#
	Module: PowershellUnitTestExamples
#>

function Get-FirstName {
	return "Dude"
}

function Get-LastName {
	return "McDude"
}

Export-ModuleMember Get-FirstName
Export-ModuleMember Get-LastName