
function Show-Banner {
    Clear-Host
    Write-Host @"

    ===============================================================================================
                                      Welcome to SFTP File Transfer Tool
    ===============================================================================================
                                                                        
"@ 

}

function Show-Menu {
    param (
        [string]$Title = 'Menu',
        [string[]]$Options
    )

    Write-Host $Title -ForegroundColor Cyan
    Write-Host "===================="
    for ($i = 0; $i -lt $Options.Length; $i++) {
        Write-Host "$($i + 1). $($Options[$i])"
    }
    Write-Host "0. Exit"
    Write-Host "===================="
}

function Get-Input {
    param (
        [string]$Prompt
    )
    Write-Host $Prompt -NoNewline
    return Read-Host
}

function Transfer-Files {
    $remoteHost = Get-Input "Enter Host:"
    $remoteUser = Get-Input "Enter Username:"
    $securePassword = Get-Input "Enter Password:"
    $remoteFilePath = Get-Input "Enter Remote Path:"
    $localFilePath = Get-Input "Enter Local Path:"
    $logFilePath = Get-Input "Enter Log Path:"

    if (-not (Test-Path $localFilePath)) {
        Write-Host "O caminho local especificado não existe." -ForegroundColor Red
        return
    }

    $command = @"
    Import-Module WinSCP
    Start-Transcript -Path '$logFilePath'
    $sessionOptions = New-Object WinSCP.SessionOptions -Property @{
        Protocol = [WinSCP.Protocol]::Sftp;
        HostName = '$remoteHost';
        UserName = '$remoteUser';
        SecurePassword = (ConvertTo-SecureString '$securePassword' -AsPlainText -Force);
    }
    $session = New-Object WinSCP.Session
    $session.Open($sessionOptions)
    $remoteFiles = $session.ListDirectory('$remoteFilePath')
    Stop-Transcript
"@

    try {
        Invoke-Expression $command
        Write-Host "Transfer completed successfully." -ForegroundColor Green
    } catch {
        Write-Host "An error occurred: $($_.Exception.Message)" -ForegroundColor Red
    }
}

do {
    Show-Banner
    Show-Menu -Title "" -Options @("Transfer Files")
    $choice = Read-Host "Select an option"

    switch ($choice) {
        1 { Transfer-Files }
        0 { Write-Host "Exiting..." -ForegroundColor Yellow }
        default { Write-Host "Invalid option. Please try again." -ForegroundColor Red }
    }

    # Pausar antes de mostrar o menu novamente
    if ($choice -ne 0) {
        Read-Host "Press Enter to continue..."
    }
} while ($choice -ne 0)
