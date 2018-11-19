Import-Module Write-Log.psm1
function Restore-Virtualbox {
    <#
     .SYNOPSIS
       Script to restore virtualbox.
     .DESCRIPTION
       Script to restore virtualbox from scratch automatically.
     .PARAMETER CleanNotSuceeded
         Parameter to indicate if Flyway Clean was successfull applied.
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
    param (
        $CleanNotSuceeded
    )
    try {
        if ($CleanNotSuceeded -eq $true) {
            $DestinyPath = "C:\Sandbox"
            Set-Location -Path $DestinyPath
            vagrant.exe destroy -f
            vagrant.exe up
        }        
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log "$ErrorMessage"
    }
    finally {
        if ($null -eq $ErrorMessage) {
            Write-Log $null "Virtualbox succesfully restored at"   
        }
    }
}

Export-ModuleMember -Function 'Restore-Virtualbox'