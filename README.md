# Windows-Terminal-Settings

## Prerequisites

### `gsudo`

Github [link](https://github.com/gerardog/gsudo).

#### Installation

* Using [Scoop](https://scoop.sh): `scoop install gsudo`
* Or using [Chocolatey](https://chocolatey.org/install):  `choco install gsudo`
* Or using [WinGet](https://github.com/microsoft/winget-cli/releases) `winget install gerardog.gsudo`
* Or manually: Unzip the latest release, and add to the path. Or let the following script do it for you:
``` batch
PowerShell -Command "Set-ExecutionPolicy RemoteSigned -scope Process; iwr -useb https://raw.githubusercontent.com/gerardog/gsudo/master/installgsudo.ps1 | iex"
```


### Set up synchronized settings

- Open PowerShell as Administrator.
- Delete existing settings directory:

``` powershell
Remove-Item -Path $Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json -Force –Recurse
```

- Create symlink to synchronized directory:

``` powershell
New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "C:\Projects\WindowsTerminalSetup"
```

Guide taken from [here](https://blog.novacare.no/advanced-setup-for-windows-terminal/).
