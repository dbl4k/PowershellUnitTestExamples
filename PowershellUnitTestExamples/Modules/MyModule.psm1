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
	# TODO: Would be useful to add pipeline input here.
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

function Add-Numbers($first, $second) {
    return ($first + $second)
}

function Sub-Numbers($first, $second) {
    return ($first - $second)
}



