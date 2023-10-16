# Installation

The script requires PowerShell 3.0 or later.


Install the ***WinSCP module*** for PowerShell by running the following command:


`Install-Module -Name WinSCP -Scope CurrentUser`


Download the ***SFTP File*** Transfer script to a location on your local machine.


# Configuration

Before using the script, you need to configure the following parameters:


    $remoteHost: The hostname or IP address of the remote SFTP server.

    $remotePort: The port number used by the remote SFTP server (default: 22).

    $remoteUser: Your username for authentication on the remote SFTP server.

    $remoteFilePath: The remote path to the directory containing the files you want to transfer.

    $localFilePath: The local path where the transferred files should be saved.

    $logFilePath: The path to the log file where script execution details will be recorded.

    $copyFiles: Set this to $true if you want to copy files from the remote server or $false to move files.
    

# Usage


Open a PowerShell.


Navigate to the directory where you saved the ***SFTP File Transfer script.***


Run the script by executing the following command:

`.\SFTPFile.ps1`


The script will prompt you to enter your password securely.


The script will establish an SFTP session with the remote server and transfer the files based on your configuration.


Progress and status messages will be displayed during the execution of the script.


Once the script completes, it will display a success message.

![test doc](https://github.com/0x5FE/SFTP_File_Transfer/assets/65371336/6efccb46-3761-484b-8f4a-cda45684c69e)


# Potential Errors and Troubleshooting


***"WinSCP module is not installed" error:*** Ensure that you have installed the WinSCP module by following the installation steps mentioned earlier.


***"The term 'New-WinSCPSession' is not recognized" error:*** This error occurs when the WinSCP module is not imported. Make sure you have imported the module by running the Import-Module WinSCP command before executing the script.


***Authentication errors:*** If you encounter authentication-related errors, double-check the following:


        Ensure that the provided $remoteUser is a valid username on the remote SFTP server.

        Verify that the entered password is correct.




  ***Connection errors:*** If you are unable to connect to the remote server, verify the following:


        Ensure that the provided $remoteHost and $remotePort match the server's configuration.

        Check your network connectivity and firewall settings to ensure that the connection is not blocked.




  ***File operation errors:*** If the script encounters errors while transferring files, consider the following:


        Verify that the remote file path ($remoteFilePath) exists and is accessible.

        Ensure that the local file path ($localFilePath) is valid and has appropriate permissions for file operations.


If you encounter any other errors or issues, please refer to the error message displayed by the script for more details. If necessary, consult the [WinSCP documentation](https://winscp.net/eng/docs/start) or seek assistance from your system administrator or network administrator.
