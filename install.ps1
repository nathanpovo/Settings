# Update winget to the latest version
# Taken from
# https://github.com/at-wr/blog/discussions/3#discussioncomment-9820754
# https://github.com/microsoft/winget-cli/discussions/4100
Add-AppxPackage -Path "https://github.com/microsoft/winget-cli/releases/latest/download/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -ForceApplicationShutdown

winget install -i --exact --source winget --id Microsoft.PowerShell
winget install -i --exact --source winget --id JanDeDobbeleer.OhMyPosh
winget install -i --exact --source winget --id Git.Git
winget install -i --exact --source winget --id Fork.Fork
winget install -i --exact --source winget --id Schniz.fnm
winget install -i --exact --source winget --id Microsoft.NuGet
winget install -i --exact --source winget --id Microsoft.DotNet.SDK.8
winget install -i --exact --source winget --id Microsoft.DotNet.SDK.3_1
winget install -i --exact --source winget --id JetBrains.Toolbox
winget install -i --exact --source winget --id 7zip.7zip
winget install -i --exact --source winget --id ShareX.ShareX
winget install -i --exact --source winget --id Mozilla.Firefox.DeveloperEdition
winget install -i --exact --source winget --id Nilesoft.Shell
winget install -i --exact --source winget --id Docker.DockerDesktop
winget install -i --exact --source winget --id Microsoft.AzureCLI
winget install -i --exact --source winget --id WinDirStat.WinDirStat
