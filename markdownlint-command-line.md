# Markdown linting via CLI

Keep the Markdown clean using a linter!

## Install

On Windows command line, use `npm install --save-dev markdownlint-cli2`.

## Configure

Create [this configuration file](.markdownlint.jsonc) locally or clone this repo.

To use this config file, pass the absolute path of the file to the command.

## Use

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

