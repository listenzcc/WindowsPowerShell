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
}

function Use-Conda {
    conda activate $env:CONDA_DEFAULT_ENV
    conda env list
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

$env:Path = "C:\Users\liste\miniconda3;C:\Users\liste\miniconda3\Library\mingw-w64\bin;C:\Users\liste\miniconda3\Library\usr\bin;C:\Users\liste\miniconda3\Library\bin;C:\Users\liste\miniconda3\Scripts;C:\Users\liste\miniconda3\bin;C:\Users\liste\miniconda3\condabin;$env:Path"

#endregion
