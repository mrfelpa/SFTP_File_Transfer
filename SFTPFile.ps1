# Define your server information and file paths
$remoteHost = "sftp.example.com"
$remotePort = 22
$remoteUser = "your_username"
$remoteFilePath = "/remote/path/to/files/"
$localFilePath = "C:\local\path\to\save\files\"
$logFilePath = "C:\path\to\log\file.log"
$copyFiles = $true # Set to $true to copy files, $false to move files


Import-Module WinSCP


Start-Transcript -Path $logFilePath -Append

try {
    # Prompt for password securely
    $securePassword = Read-Host "Enter your password" -AsSecureString

    # Create an SFTP session
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp
        HostName = $remoteHost
        PortNumber = $remotePort
        UserName = $remoteUser
        SecurePassword = $securePassword
    }

    $session = New-Object WinSCP.Session
    $session.Open($sessionOptions)

    # List remote files
    $remoteFiles = $session.ListDirectory($remoteFilePath)

    foreach ($file in $remoteFiles) {
        # Customize this condition to filter specific file types if needed
        if ($file.Name -match "\.txt$|\.csv$") {
            $localFile = Join-Path $localFilePath $file.Name
            if ($copyFiles) {
                $session.GetFiles($file.FullName, $localFile).Check()
                Write-Output "Copied $($file.FullName) to $($localFile)"
            }
            else {
                $session.MoveFile($file.FullName, $localFile)
                Write-Output "Moved $($file.FullName) to $($localFile)"
            }
        }
    }

    Write-Output "Script completed successfully"
}
catch {
    Write-Error "An error occurred: $($_.Exception.Message)"
}
finally {
    # Close the session
    if ($session -ne $null) {
        $session.Dispose()
    }

    # Stop the transcript
    Stop-Transcript
}
