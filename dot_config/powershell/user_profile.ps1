# Must be store in 'C:\Users\%USERNAME%\.config\PowerShell\user_profile.ps1'

# Import Prompt
Import-Module posh-git
Import-Module oh-my-posh
Import-Module PSReadline

# Load Prompt Config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$PROMPT_CONFIG = Join-Path (Get-ScriptDirectory) 'swarabRaul_V2.omp.json'
oh-my-posh --init --shell pwsh --config $PROMPT_CONFIG | Invoke-Expression 

# Icons
Import-Module -Name Terminal-Icons

# PSReadline
# Set-PSReadlineOption -EditMode Emacs
Set-PSReadlineOption -BellStyle None
Set-PSReadlineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadlineOption -PredictionSource History
Set-PSReadlineOption -PredictionViewStyle List

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Command Alias
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilites
function which ($command) {
    Get-Command -Name $command -ErrorAction SilentlyContinue |
    Select-Object  -ExpandProperty Path -ErrorAction SilentlyContinue
}
