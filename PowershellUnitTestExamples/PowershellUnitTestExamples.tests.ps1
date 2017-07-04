#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests. 
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#

Describe "Get-FirstName" {

	It "Returns 'Dude'" {
		Get-FirstName | Should Be "Dude"
	}

	It "Does Not Return 'Duder'" {
		Get-FirstName | Should Not Be "Duder"
	}

}