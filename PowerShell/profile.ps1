Set-PSReadLineOption -PredictionViewStyle ListView

# https://stackoverflow.com/questions/8264655/how-to-make-powershell-tab-completion-work-like-bash/37715242#37715242
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

oh-my-posh init pwsh --config "$HOME\Documents\PowerShell\theme.omp.json" | Invoke-Expression

fnm env --use-on-cd | Out-String | Invoke-Expression

# https://stackoverflow.com/questions/17794507/reload-the-path-in-powershell
function ReloadPathEnvironmentVariables {
    Write-Output "Refreshing the path environment variable...";
    $env:PATH = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User");
}
New-Alias -Name reload -Value ReloadPathEnvironmentVariables

# https://superuser.com/questions/675837/equivalent-of-cmds-where-in-powershell
function WhereAll {
    Get-Command -All $args
}

Remove-Item alias:\where -Force
Set-Alias where WhereAll

. "$HOME\Documents\PowerShell\Completions\fnm.ps1"
