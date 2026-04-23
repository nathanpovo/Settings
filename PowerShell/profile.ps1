Set-PSReadLineOption -PredictionViewStyle ListView

# https://stackoverflow.com/questions/8264655/how-to-make-powershell-tab-completion-work-like-bash/37715242#37715242
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# initialize oh-my-posh
oh-my-posh init pwsh --config "$HOME\Documents\PowerShell\theme.omp.json" | Invoke-Expression
# then stash away the prompt() that oh-my-posh sets
$Global:__OriginalPrompt = $function:Prompt

fnm env --use-on-cd --version-file-strategy recursive --shell powershell | Out-String | Invoke-Expression

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

# PowerShell parameter completion shim for the dotnet CLI
# https://learn.microsoft.com/en-us/dotnet/core/tools/enable-tab-autocomplete#powershell
Register-ArgumentCompleter -Native -CommandName dotnet -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)
        dotnet complete --position $cursorPosition "$commandAst" | ForEach-Object {
            [System.Management.Automation.CompletionResult]::new($_, $_, 'ParameterValue', $_)
        }
}

#region Shell Integration

# Based on the documentation for windows terminal
# https://learn.microsoft.com/en-gb/windows/terminal/tutorials/shell-integration#oh-my-posh-setup

function Global:__Terminal-Get-LastExitCode {
  if ($? -eq $True) { return 0 }
  $LastHistoryEntry = $(Get-History -Count 1)
  $IsPowerShellError = $Error[0].InvocationInfo.HistoryId -eq $LastHistoryEntry.Id
  if ($IsPowerShellError) { return -1 }
  return $LastExitCode
}

function prompt {
  $gle = $(__Terminal-Get-LastExitCode);
  $LastHistoryEntry = $(Get-History -Count 1)
  if ($Global:__LastHistoryId -ne -1) {
    if ($LastHistoryEntry.Id -eq $Global:__LastHistoryId) {
      $out += "`e]133;D`a"
    } else {
      $out += "`e]133;D;$gle`a"
    }
  }
  $loc = $($executionContext.SessionState.Path.CurrentLocation);
  $out += "`e]133;A$([char]07)";
  $out += "`e]9;9;`"$loc`"$([char]07)";
  
  $out += $Global:__OriginalPrompt.Invoke(); # <-- This line adds the original prompt back

  $out += "`e]133;B$([char]07)";
  $Global:__LastHistoryId = $LastHistoryEntry.Id
  return $out
}

#endregion
