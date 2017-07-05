<#
	Module: MyModule.psm1
#>

function Get-FirstName {
	return "Dude"
}

function Get-LastName {
	return "McDude"
}

function Add-Days() {
	##[cmdletbinding()]
  	Param (
  		[parameter(ValueFromPipeline)] 
			[datetime]$Value,
  		[parameter()]
			[int]$DaysToAdd
  	)
	Process {
		return $Value.AddDays($DaysToAdd)
	}
}

Export-ModuleMember Get-FirstName
Export-ModuleMember Get-LastName
Export-ModuleMember Add-Days