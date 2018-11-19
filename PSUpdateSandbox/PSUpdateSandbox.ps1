Import-Module Clear-SandboxDatabase.psm1
Import-Module Get-Repository.psm1
Import-Module Restore-Virtualbox.psm1
Import-Module Stop-SpecifiedProcess.psm1
Import-Module Switch-GitBranch.psm1
Import-Module Update-GitRepository.psm1
Import-Module Update-SandboxDatabase.psm1
Import-Module Write-LineSeparator.psm1
Import-Module Write-Log.psm1


Write-Output("Initializing Sandbox update...")
Write-LineSeparator
$Process = Get-Process sqldeveloper64W
while (($null -ne $Process) -or ($response.Key -eq "N" -or $response.Key -eq "n")) {
	Stop-SpecifiedProcess $Process
	$Process = Get-Process sqldeveloper64W
}

if($null -eq $Process){
	Update-GitRepository
	if ($LASTEXITCODE -ne 0){
		Switch-GitBranch
		if ($LASTEXITCODE -ne 0){
			Exit
		}
    }
	Write-LineSeparator
    Clear-SandboxDatabase
	if ($LASTEXITCODE -ne 0){
		Write-LineSeparator
		Restore-Virtualbox $true
	}
	Write-LineSeparator
	Update-SandboxDatabase
    while($LASTEXITCODE -ne 0) {
		Write-LineSeparator
		Restore-Virtualbox $true
		if ($LASTEXITCODE -eq 0) {
			Write-LineSeparator
			Clear-SandboxDatabase $true
			Write-LineSeparator
			Update-SandboxDatabase $true
			Write-LineSeparator
		}
		Clear-Host
	}
}

Write-LineSeparator
Write-Output("Press 'E' to leave script.")
$Close = [System.Console]::ReadKey()
if ($Close.Key -eq "E" -or $Close.Key -eq "e"){
	Exit
}