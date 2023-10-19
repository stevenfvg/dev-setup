# Development Environment in Windows

Development Environment Setup on Windows **(only for Windows 11)**. 

This repository contains the following explanatory syllabus to prepare and configure the Windows 11 operating system in a development environment with WSL, follow the instructions to configure.

- [Setup Windows Terminal and PowerShell](#setup-windows-terminal-and-powerShell)
    1. [Install winget](#install-winget)
    2. [Install Oh My Posh](#install-oh-my-posh)
    3. [Run script to install development tools](#run-script-to-install-development-tools)

- [Install WSL with Ubuntu](#install-wsl-with-ubuntu)
    1. [Install Windows updates](#install-windows-updates)
    2. [Update the package repository](#update-the-package-repository)
   
- [Install development tools](#install-development-tools)
    1. [Install web browsers for development](#install-web-browsers-for-development)
        - [Install Google Chrome Dev](#install-web-browsers-for-development)
        - [Install Firefox Developer Edition](#install-web-browsers-for-development)
    2. [Install VSCode](#install-vscode)

- [Installing pgAdmin](#installing-pgadmin)
- [Install and configure commitlint](#install-and-configure-commitlint)

## Install development tools

1. ### Setup Windows Terminal and PowerShell

    Install the **Windows Terminal** and **PowerShell** from the **Microsoft Store**. If you have the 2 applications installed, you just have to make sure they are updated.

    ![Windows Terminal](./assets/imgs/153222.png)
    ![PowerShell](./assets/imgs/153223.png)

2. ### Install winget

    Install or update the ***winget*** package from the **Microsoft Store**, this tool is essential to run the script that will install the development tools.

    ![winget](./assets/imgs/153224.png)

3. ### Run script to install development tools

    To install the development tools we must open the PowerShell terminal as an administrator user and execute the following commands:

    ```powershell
    #Command to download the script:
    Invoke-RestMethod -Uri https://raw.githubusercontent.com/stevenfvg/prework-setup-windows/main/scripts/installDevTools.ps1 -OutFile 'C:\Users\$env:USERNAME\Downloads\installDevTools.ps1'

    # Access the Downloads directory:
    cd C:\Users\$env:USERNAME\Downloads\installDevTools.ps1

    # We run the script:
    ./installDevTools.ps1
    ```
    Once the script execution process is complete, you will have the following programs installed on your computer:
    
    - Google Chrome browser development version.
    - Mozilla Firefox developer edition browser.
    - Visual Studio Code.
    - Postman.
    - pgAdmin.

## Install WSL with Ubuntu

 1. ### Install Windows updates

    Verify that your Windows system is updated to install WSL.

    Go to the **Settings** window > **Windows Update** if there are pending updates to install, run the installation and restart your system to continue.

    ![Windows Update](./assets/imgs/153225.png)

 2. ### Install WSL

    To install Linux on Windows we must open the ***PowerShell*** command line and type the following command:

    ```powershell
    wsl --install
    ```
    This command will enable the features necessary to run WSL and install the **Ubuntu** distribution of Linux. [(go to the official Microsoft documentation)](https://learn.microsoft.com/en-us/windows/wsl/install).

    If the WSL installation has problems, it is possible that the **Windows Virtualization Platform** is not enabled, run the following command as an administrator user from the ***PowerShell*** command line:

    ```powershell
    # Enable Virtual Machine Platform feature
    dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
    
    # Enable the Windows Subsystem for Linux
    dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
    ```



<!-- 



2. ### Install Oh My Posh

    Open the **PowerShell** terminal and enter the following command:

    ```powershell
    winget install JanDeDobbeleer.OhMyPosh -s winget
    ```
3. ### Install fonts for terminal

    The following command must be run as administrator for the fonts to be installed system-wide. **In case you do not have administrator rights, you can install the sources by adding the --user flag**.

    ```powershell
    oh-my-posh font install
    ```
    Once you have installed a Nerd Font, you will need to configure the Windows Terminal to use it. This can be easily done by modifying the Windows Terminal settings (default shortcut: **CTRL + SHIFT + ,**). In your settings.json file, add the font.face attribute under the defaults attribute in profiles:

    ```json
    {
        "profiles":
        {
            "defaults":
            {
                "font": 
                {
                    "face": "FiraCode Nerd Font Mono"
                }
            }
        }
    }
    ```
4. ### Start Oh My Posh with default theme

    For initialization of **Oh My Posh** enter the following command. 
    
    ```powershell
    oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"

    # command line output
    (@(& 'C:/Users/st3ve/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\st3ve\AppData\Local\Programs\oh-my-posh\themes\jandedobbeleer.omp.json' --print) -join "`n") | Invoke-Expression
    ```
    Copy the output of the command to the following configuration file: 

    ```powershell
    notepad $PROFILE
    ```
    If Notepad displays a pop-up window displaying the following message *"The system cannot find the path specified"*. Enter the following command to create the configuration file:

    ```powershell
    New-Item -Path $PROFILE -Type File -Force
    ```

    Repeat the `notepad $PROFILE` command to open the configuration file.

    Add the output of the command `oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\jandedobbeleer.omp.json"` to the configuration file `$PROFILE` save the changes and restart the terminal to start Oh My Posh.

5. ### Set Theme in Oh My Posh     

    In this case the default theme "jandedobbeleer.omp.json" is being used. You can choose the one you prefer, consult the [Oh My Posh documentation](https://ohmyposh.dev/docs/themes) to see the list of themes.

    You can also see the list of topics from ***PowerShell*** with the command:

    ```powershell
    Get-PoshThemes
    ```
    To change the theme just change the name of the theme from the `$PROFILE` configuration file.

    ```powershell
    # Open the configuration file
    notepad $PROFILE

    # Change only the name of the theme in the following line:
    (@(& 'C:/Users/st3ve/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\st3ve\AppData\Local\Programs\oh-my-posh\themes\"new theme name".omp.json' --print) -join "`n") | Invoke-Expression

    # Example:
    (@(& 'C:/Users/st3ve/AppData/Local/Programs/oh-my-posh/bin/oh-my-posh.exe' init pwsh --config='C:\Users\st3ve\AppData\Local\Programs\oh-my-posh\themes\pure.omp.json' --print) -join "`n") | Invoke-Expression
    ```
6. ### Install Terminal Icons and enable PSReadLine module

    Install the icon module for the terminal with the following command:

    ```powershell
    Install-Module -Name Terminal-Icons -Repository PSGallery

    # then add option [A] to accept.
    ```
    We add the following lines to the end of the terminal `$PROFILE` file to import the Terminal-Icons module and enable the PSReadLine.

    ```powershell
    Import-Module Terminal-Icons
    Set-PSReadLineOption -PredictionViewStyle ListView
    ```
    To finish, save the changes `Ctrl+S` and restart the terminal.
    
**[⬆ Back to top](#development-environment-in-windows)**


 

## Install development tools.

To install the following tools below run the PowerShell terminal as an Administrator user.

1. ### Install web browsers for development.

    ```
    # install Google Chrome Dev
    winget install Google.Chrome.Dev --accept-source-agreements --disable-interactivity

    # install Firefox Developer Edition
    winget install Mozilla.Firefox.DeveloperEdition --accept-source-agreements --disable-interactivity
    ```
2. ### Install VSCode

    ```
    winget install Microsoft.VisualStudioCode --accept-source-agreements --disable-interactivity
    ```

## Installing pgAdmin

## Install and configure *commitlint*

->
