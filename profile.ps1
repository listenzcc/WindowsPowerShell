# File: profile.ps1
# Author: Chuncheng Zhang
# Date: 2025-09-28
# Description: Powershell profile.

# ----------------------------------------
# ---- Defines ----
function Measure-CodeExecution {
    param(
        [scriptblock]$CodeBlock
    )
    
    $result = Measure-Command -Expression $CodeBlock
    $cost = [int]$result.TotalMilliseconds
    $end = " | "

    if ($cost -lt 100) {
        Write-Host -ForegroundColor green $cost -NoNewLine
    }
    elseif ($cost -lt 500) {
        Write-Host -ForegroundColor yellow $cost -NoNewLine
    }
    else {
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

function Kaishi-Fanqiang {
    Set-Location "$env:OneDriveCommercial\ChromeGo"
    Get-ChildItem
}


# ----------------------------------------
# ---- Startups ----

Measure-CodeExecution { Load-Conda }
Measure-CodeExecution { Import-Module DirColors }
Measure-CodeExecution { Import-Module cd-extras }
Measure-CodeExecution {
    $env:Path += ";C:\Users\liste\AppData\Local\Programs\oh-my-posh\bin"
    oh-my-posh init pwsh --config "$env:OneDriveConsumer\Scripts\Powershell\oh-my-posh.config\c1.omp.json" | Invoke-Expression
}


# ----------------------------------------
# ---- Set alias ----

Set-Alias ll ls
