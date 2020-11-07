<powershell>

#==========================================================================================================================================

# Install Choco
#
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#------------------------------------------------------------------------------------------------------------------------------------------

# Uninstall your Git and OpenSSH


# Install Choco Packages
#
choco install git -y
choco install openssh -y

# Refresh Environment
$env:path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")

# Setup SSH
#
"C:\Program Files\OpenSSH-Win64\install-sshd.ps1"
powershell.exe -ExecutionPolicy Bypass -File install-sshd.ps1
Set-Service -Name sshd -StartupType 'Disabled'
Set-Service -Name ssh-agent -StartupType 'Automatic'

#==========================================================================================================================================

</powershell>