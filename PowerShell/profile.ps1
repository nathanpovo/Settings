Set-PSReadLineOption -PredictionViewStyle ListView

oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/capr4n.omp.json" | Invoke-Expression

fnm env --use-on-cd | Out-String | Invoke-Expression

# https://stackoverflow.com/questions/17794507/reload-the-path-in-powershell
function ReloadPathEnvironmentVariables {
    Write-Output "Refreshing the path environment variable...";
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User");
}
New-Alias -Name reload -Value ReloadPathEnvironmentVariables
