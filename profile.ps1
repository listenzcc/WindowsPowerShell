function Measure-CodeExecution {
    param(
        [scriptblock]$CodeBlock
    )
    
    $result = Measure-Command -Expression $CodeBlock
    $cost = [int]$result.TotalMilliseconds
    $end = " | "

    if ($cost -lt 100) {
        Write-Host -ForegroundColor green $cost -NoNewLine
    } elseif ($cost -lt 500) {
        Write-Host -ForegroundColor yellow $cost -NoNewLine
    } else {
        Write-Host -ForegroundColor red $cost -NoNewLine
    }
    Write-Host $end -NoNewline
}

function Load-Conda {
    Invoke-Expression $env:HOMEPATH\miniconda3\shell\condabin\conda-hook.ps1

    $c = $env:CONDA_EXE
    $c = Split-Path $c -Parent
    $c = Split-Path $c -Parent

    $env:Path = "$c;$c\Library\bin;$c\Scripts;$c\condabin;$env:Path"
}

function Use-Conda {
    conda activate $env:CONDA_DEFAULT_ENV
    conda env list
    Write-Host "# conda uses $env:CONDA_PROMPT_MODIFIER" -ForegroundColor yellow
}


Measure-CodeExecution {Load-Conda}
Measure-CodeExecution {Import-Module DirColors}
Measure-CodeExecution {Import-Module cd-extras}
Measure-CodeExecution {
    # oh-my-powershell
    $env:Path += ";C:\Users\liste\AppData\Local\Programs\oh-my-posh\bin"
    # oh-my-posh init pwsh --config 'C:\Users\liste\AppData\Local\Programs\oh-my-posh\themes\smoothie.omp.json' | Invoke-Expression
    oh-my-posh init pwsh --config 'C:\Users\liste\Documents\WindowsPowerShell\zcc-ys.omp.json' | Invoke-Expression
}

# --------------------------------------------------------------------------------
# Customize
function Kaishi-Fanqiang {
    cd "$env:OneDriveCommercial\ChromeGo"
    ls
}

Set-Alias ll ls

# --------------------------------------------------------------------------------
# Conda
#region conda initialize
# # !! Contents within this block are managed by 'conda init' !!
# If (Test-Path "C:\Users\liste\miniconda3\Scripts\conda.exe") {
#     (& "C:\Users\liste\miniconda3\Scripts\conda.exe" "shell.powershell" "hook") | Out-String | ? { $_ } | Invoke-Expression
# }


#endregion
