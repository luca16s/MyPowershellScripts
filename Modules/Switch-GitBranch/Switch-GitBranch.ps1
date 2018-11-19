Import-Module Write-Log.psm1
function Switch-GitBranch {
    <#
     .SYNOPSIS
       Script to switch between git branchs.
     .DESCRIPTION
       Script to switch between git branchs.
     .PARAMETER RemoteBranch
         Parameter to indicate remote branch.
     .PARAMETER LocalBranch
         Parameter to indicate local branch.
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
        $RemoteBranch,
        $LocalBranch
    )
    
    try {
        git.exe checkout -b $LocalBranch $RemoteBranch   
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log "$ErrorMessage"
    }
    finally {
        if ($null -eq $ErrorMessage) {
            Write-Log $null "Checkout succesfully realized on branch: $LocalBranch at"   
        }
    }
}
Export-ModuleMember -Function Switch-GitBranch