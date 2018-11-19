Import-Module Write-Log.psm1
function RepositoryUpdate {
    <#
     .SYNOPSIS
       Script to update repository.
     .DESCRIPTION
       Script to update repository.
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

    )
    try {
        Set-Location -Path "D:\repos\CORE\Modelagem\"
        git.exe pull
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log "$ErrorMessage"
    }
    finally {
        if ($null -eq $ErrorMessage) {
            Write-Log $null "Succesfully realized updated repository at"   
        }
    }
}