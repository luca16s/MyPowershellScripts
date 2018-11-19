function Get-Repository {
    <#
     .SYNOPSIS
       Script to clone repository.
     .DESCRIPTION
       Script to clone a repository.
     .PARAMETER RepositoryUrl
         Parameter that has the repository url to be cloned.
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
        $RepositoryUrl
    )
    try {
        git.exe clone $RepositoryUrl
    }
    catch {
        $ErrorMessage = $_.Exception.Message
        Write-Log "$ErrorMessage"
    }
    finally {
        if ($null -eq $ErrorMessage) {
            Write-Log $null "Successfully cloned repository $RepositoryUrl at"   
        }
    }
}
Export-ModuleMember -Function Get-Repository