
# Installation

Download the ***SFTP File*** Transfer script to a location on your local machine.


# Configuration

Before using the script, you need to configure the following parameters:

    $remoteHost: The hostname or IP address of the remote SFTP server.

    $remoteUser: Your username for authentication on the remote SFTP server.

    $remoteFilePath: The remote path to the directory containing the files you want to transfer.

    $localFilePath: The local path where the transferred files should be saved.

    $logFilePath: The path to the log file where script execution details will be recorded.

# Usage


Open a PowerShell.

Run the script by executing the following command:

        `.\SFTPFile.ps1`

![img](https://github.com/user-attachments/assets/097c69f9-c978-41bd-8f4d-b40989536234)


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

If you encounter any other errors or issues, please refer to the error message displayed by the script for more details. If necessary, consult the [WinSCP documentation](https://winscp.net/eng/docs/start).
