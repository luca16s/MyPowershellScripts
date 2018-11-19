Import-Module Write-Log.psm1
function Stop-Process {
    <#
     .SYNOPSIS
       Script to close process.
     .DESCRIPTION
       Script to close specific process.
     .PARAMETER Process
         Process to be killed.
     .INPUTS
       <Inputs if any, otherwise state None>
     .OUTPUTS
       <Outputs if any, otherwise state None - example: Log file stored in C:\Windows\Temp\<name>.log>
     .NOTES
       Version:        1.0
       Author:         Gian Luca da Silva Figueiredo
       Creation Date:  18/11/2018
       Purpose/Change: Initial script development
     
     .EXAMPLE
       <Example goes here. Repeat this attribute for more than one example>
    #>
    param(
        $Process
	)
    Clear-Host
    
    try {
        Write-Output("Want to close $Process? (If not, be sure what if you are doing the right thing!) `nAnwser: (Y - Yes | N - No | E - Exit)")
        $response = [System.Console]::ReadKey()
	    if ($response.Key -eq "E" -or $response.Key -eq "e") {
	    	exit
	    }
	    if ($response.Key -eq "Y" -or $response.Key -eq "y") {
	    	Stop-Process -InputObject $Process
	    }
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log "$ErrorMessage"
    }
    finally {
        if ($null -eq $ErrorMessage) {
            Write-Log $null "Closed Process: $Process at"   
        }
    }
}
Export-ModuleMember -Function Stop-Process