function Clear-SandboxDatabase {
  <#
    .SYNOPSIS
      Script to clean database.
    .DESCRIPTION
      Script that execute Flyway Clean and clear the database.
    .PARAMETER VagrantUpSuceed
        Parameter to indicate if Virtualbox was restored with no erreros.
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
		$VagrantUpSuceed = $true
	)
	if ($VagrantUpSuceed -eq $true) {
		flyway.cmd clean
    }
}
Export-ModuleMember -Function Clear-SandboxDatabase