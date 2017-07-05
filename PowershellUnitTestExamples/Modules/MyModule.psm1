## PS Module Name: MyModule.psm1

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

function Get-CurrentDate() {
    return Get-Date
}

function Get-TimeStamp() {
    return "[$((Get-Date -Date (Get-CurrentDate) -Format s).ToString().Replace("T"," "))]"
}
Get-Date -Format 
# Exports
Export-ModuleMember Get-CurrentDate
Export-ModuleMember Get-TimeStamp
Export-ModuleMember Sub-Numbers
Export-ModuleMember Add-Numbers
Export-ModuleMember Add-Days
Export-ModuleMember Get-LastName
Export-ModuleMember Get-FirstName



