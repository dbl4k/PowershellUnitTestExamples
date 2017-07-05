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
	[CmdletBinding()]
    Param(
        [Parameter(ValueFromPipeline, Mandatory)]$Value,
        $DaysToAdd
    )

	return ([datetime]($Value)).AddDays($DaysToAdd)
}

function Add-Numbers($first, $second) {
    return ($first + $second)
}

function Sub-Numbers($first, $second) {
    return ($first - $second)
}



