Import-Module Write-Log.psm1
function Update-SandboxDatabase {
    <#
     .SYNOPSIS
       Script para atualizar a sandbox.
     .DESCRIPTION
       Após a realização bem suceddida do script de limpeza da sandbox o script de update é executado.
     .PARAMETER FlywayCleanSuceed
         Parametro que indica se a limpeza da base foi bem sucedida.
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
		$FlywayCleanSuceed = $true
	)
	if ($FlywayCleanSuceed -eq $true) {
        try {
            flyway.cmd migrate
        }
        catch {
          $ErrorMessage = $_.Exception.Message
          Write-Log "$ErrorMessage"
        }
        finally {
          if ($null -eq $ErrorMessage) {
            Write-Log $null "Succesfully Migrate to Sandbox Database at"   
          }
        }
    }
}
Export-ModuleMember -Function Update-SandboxDatabase