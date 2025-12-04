# Markdown linting via CLI

Keep the Markdown clean using a linter!

## Install

On Windows command line, use `npm install --save-dev markdownlint-cli2`.

## Configure

Create [this configuration file](.markdownlint.json) locally or clone this repo.

To use this config file, pass the absolute path of the file to the command.

`markdownlint-cli2 --config "<absolute path>" "**/*.md"`

## Use

Check all MD files in a folder and display the results on the `stdout`.

`npx markdownlint-cli2 --config C:\Users\Ashish.Gupta\Documents\GitHub\koreaidocs-markdownlinter\.markdownlint.jsonc "**/*.md"`

---

Check all MD files in a folder and save the results as a local .json file.

`npx markdownlint-cli2 "**/*.md" > report.json`

Convert the resulting .json file to a .csv file.

```powershell
Get-Content report.json | 
  ConvertFrom-Json | 
  ForEach-Object {
    $_.results | ForEach-Object {
      [PSCustomObject]@{
        File      = $_.file
        Line      = $_.lineNumber
        Rule      = $_.ruleNames -join ";"
        Message   = $_.ruleDescription
      }
    }
  } | Export-Csv markdownlint-report.csv -NoTypeInformation
```

