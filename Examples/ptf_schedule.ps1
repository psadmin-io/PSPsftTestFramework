# Schedule PTF Run

# Vars
$taskName = 'PTF-ADHOC'
$timelimit = "05:00:00"

# Check if currently Running
$task = Get-ScheduledTask -TaskName $taskName
If ($task -ne $null ) {
	if ($task.state -eq "Running") {
		Write-Host "Batch state is Running - EXIT!"
		exit 10 
	} else	{
		Unregister-ScheduledTask -TaskName $taskName -Confirm:$false	
	}		
} 

# Action
$Action = New-ScheduledTaskAction -Execute "Powershell" -Argument "-File $PSScriptRoot\ptf_run.ps1"

# Trigger
$time = (get-date) + (New-TimeSpan -Seconds 5)
$Trigger = New-ScheduledTaskTrigger -Once -At $time

# Settings
$Settings = New-ScheduledTaskSettingsSet -ExecutionTimeLimit $timelimit

# Create
$Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings

# Register
$Task | Register-ScheduledTask -TaskName $taskName
