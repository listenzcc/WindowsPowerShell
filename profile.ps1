Import-Module cd-extras
Import-Module DirColors

# --------------------------------------------------------------------------------
# Conda
#region conda initialize
# !! Contents within this block are managed by 'conda init' !!
If (Test-Path "C:\Users\liste\miniconda3\Scripts\conda.exe") {
    (& "C:\Users\liste\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ?{$_} | Invoke-Expression
}
#endregion

# --------------------------------------------------------------------------------
# oh-my-powershell
$env:Path += ";C:\Users\liste\AppData\Local\Programs\oh-my-posh\bin"
# oh-my-posh init pwsh --config 'C:\Users\liste\AppData\Local\Programs\oh-my-posh\themes\smoothie.omp.json' | Invoke-Expression
# oh-my-posh init pwsh --config 'C:\Users\liste\AppData\Local\Programs\oh-my-posh\themes\ys.omp.json' | Invoke-Expression

oh-my-posh init pwsh --config 'C:\Users\liste\Documents\WindowsPowerShell\zcc-ys.omp.json' | Invoke-Expression

# --------------------------------------------------------------------------------
# Customize
function kaishi-fanqiang {
    cd "$env:OneDriveCommercial\ChromeGo"
    ls
}

Set-Alias ll ls