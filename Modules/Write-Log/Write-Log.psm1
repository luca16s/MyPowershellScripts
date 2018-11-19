function Write-Log {
    param (
        $ErrorMessage,
        $DefaultMessage
    )
    $Time = Get-Date -Format g

    if ($null -eq $ErrorMessage) {
        $FinalMessage = "$DefaultMessage $Time"
    } else {
        $FinalMessage = "- Generated at $Time the Error: $ErrorMessage"
    }

    $DesktopPath = [Environment]::GetFolderPath("Desktop")
    "$FinalMessage"  | Out-File $DesktopPath/ScriptLog.log -Append
}
Export-ModuleMember -Function Write-Log 