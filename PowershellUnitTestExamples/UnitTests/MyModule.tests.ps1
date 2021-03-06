#
# This is a PowerShell Unit Test file.
# You need a unit test framework such as Pester to run PowerShell Unit tests. 
# You can download Pester from http://go.microsoft.com/fwlink/?LinkID=534084
#

$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$module_name = "MyModule"
$module_dir = "$($here)\..\Modules"
$module_path = "$($module_dir)\$($module_name).psm1"

# Reload Module
Remove-Module $module_name -ErrorAction SilentlyContinue | Out-Null
Import-Module $module_path -Verbose | Out-Null

# Tests
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

    It "Adds 2 Days - Using Pipeline String" {
		"2017-07-04 00:00:00" | Add-Days -DaysToAdd 2 | Should Be ([datetime]("2017-07-06 00:00:00"))
	}

    It "Adds 5 Days - Using Pipeline DateTime" {
		[datetime]("2017-07-04 00:00:00") | Add-Days -DaysToAdd 5 | Should Be ([datetime]("2017-07-09 00:00:00"))
	}

    It "Adds 5 Days, Validate Incorrect - Using Pipeline DateTime" {
		[datetime]("2017-07-04 00:00:00") | Add-Days -DaysToAdd 5 | Should Not Be ([datetime]("2017-07-08 00:00:00"))
	}
}

Describe "Add-Numbers" {
    It "2 + 2 = 4" {
         Add-Numbers 2 2 | Should Be 4
    }

    It "3 + 2 = 5" {
         Add-Numbers 3 2 | Should Be 5
    }

    It "3 + 7 = 10" {
         Add-Numbers 3 7 | Should Be 10
    }
}

Describe "Remove-Numbers" {
    It "2 - 2 = 0" {
         Remove-Numbers 2 2 | Should Be 0
    }

    It "3 - 2 = 1" {
         Remove-Numbers 3 2 | Should Be 1
    }

    It "3 - 7 = -4" {
         Remove-Numbers 3 7 | Should Be -4
    }
}

Describe "Get-TimeStamp" {
	InModuleScope MyModule {
		$testDate = New-Object DateTime(2017, 07, 01)
	
		Mock -ModuleName MyModule Get-CurrentDate {
			return $testDate
		}

		It "Returns a date in format [yyyy-MM-dd HH:mm:ss]" { 
			Get-TimeStamp | Should Be "[2017-07-01 00:00:00]"
		}

		It "Returns a String" { 
			# TODO "BeOfType" operator is quite new, unrem if using newer version.
			# Get-TimeStamp | Should Be OfType System.String
			(Get-TimeStamp).GetType() | Should Be ([System.String])
		}

		It "Does not return a DateTime" { 
			# TODO "BeOfType" operator is quite new, unrem if using newer version.
			# Get-TimeStamp | Should Not Be OfType System.DateTime
			(Get-TimeStamp).GetType() | Should Not Be ([System.DateTime])
		}
	}
}

Describe "Format-String" {
	It "Replaces {0} with first item in list." { 
		Format-String -Input "{0}" -SubstituteList @("Hello","Goodbye") | Should Be "Hello"
	}

	It "Replaces {0}, {1} with first and second item in list" { 
		Format-String -Input "{0}, {1}" -SubstituteList @("Hello","Goodbye") | Should Be "Hello, Goodbye"
	}
	
	It "Replaces {0}, {1}, {1} with first, second and second item in list" { 
		Format-String -Input "{0}, {1}, {1}" -SubstituteList @("Hello","Goodbye") | Should Be "Hello, Goodbye, Goodbye"
	}

	It "Replaces {0}, {1}, {0} with first, second and first item in list" { 
		Format-String -Input "{0}, {1}, {0}" -SubstituteList @("Hello","Goodbye") | Should Be "Hello, Goodbye, Hello"
	}
}