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