#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests. 
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
Import-Module "$here\MyModule.psm1"

Describe "Get-FirstName" {
	It "Returns 'Dude'" {
		Get-FirstName | Should Be "Dude"
	}
	It "Does Not Return 'Duder'" {
		Get-FirstName | Should Not Be "Duder"
	}
}

Describe "Get-LastName" {
	It "Returns 'McDude'" {
		Get-LastName | Should Be "McDude"
	}
	It "Does Not Return 'McDudeypants'" {
		Get-LastName | Should Not Be "McDudeypants"
	}
}

Describe "Add-Days" {
	It "Adds 1 Day" {
		Add-Days "2017-07-04 00:00:00" 1 | Should Be ([datetime]("2017-07-05 00:00:00"))
	}
	It "Removes 1 Day" {
		Add-Days "2017-07-04 00:00:00" -1 | Should Be ([datetime]("2017-07-03 00:00:00"))
	}
	It "Adds 2  Days - Pipeline" {
		([datetime]("2017-07-04 00:00:00")) | Add-Days 2 | Should Be ([datetime]("2017-07-06 00:00:00"))
	}
}