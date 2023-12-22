# PowerShell

### Installation

Installing using Winget

```
winget install -i --exact --source winget --id Microsoft.PowerShell
```

### Set up synchronized settings

According to the [documentation](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.4), the profile settings for the current user can be found at `$HOME\Documents\PowerShell`

- Open PowerShell as Administrator.
- Delete existing profile file (skip this step if there is no existing profile file):

``` powershell
Remove-Item -Path $HOME\Documents\PowerShell -Force -Recurse
```

- Create symlink to synchronized directory:

``` powershell
New-Item -ItemType SymbolicLink -Path "$HOME\Documents\PowerShell" -Target "C:\Projects\Settings\PowerShell"
```

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
New-Item -ItemType SymbolicLink -Path "$Env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "C:\Projects\Settings\Windows-Terminal-Settings\settings.json"
```

Guide taken from [here](https://blog.novacare.no/advanced-setup-for-windows-terminal/).

## Icons

See the following links about icons

https://github.com/microsoft/terminal/issues/1918
https://github.com/TheFern2/windows-terminal-icons
https://github.com/microsoft/terminal/tree/main/src/cascadia/CascadiaPackage/ProfileIcons

# fnm

Source - https://github.com/Schniz/fnm

### Installation

```powershell
winget install -i --exact --source winget --id Schniz.fnm
```

### Interactions

Using `fnm` for `node` and `npm` can cause some issues when the application trying to use `node` or `npm` does not find it in the usual place. The following sections describe workarounds for using various with `fnm`.

#### `husky`

Create a `.huskyrc` file:

- Using `bash`: `touch ~/.huskyrc`
- Using `PowerShell`: `New-Item -ItemType file ~/.huskyrc`

Add the command `eval "$(fnm env --use-on-cd)"` to the file.

Alternatively, create a sumbolic link to the `.husky` file in this repo using:

```powershell
New-Item -ItemType SymbolicLink -Path "~/.huskyrc" -Target "C:\Projects\Settings\fnm\.husky"
```

##### Additional info

https://github.com/Schniz/fnm/issues/668#issuecomment-1483917214

https://github.com/microsoft/vscode/issues/130100#issuecomment-1046181065

https://typicode.github.io/husky/troubleshooting.html#command-not-found

https://github.com/Schniz/fnm/tree/5e075f05d4920b4afe35edec448765d1fa02dc32#bash
