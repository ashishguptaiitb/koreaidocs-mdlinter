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

`npx markdownlint "**/*.md" --config "C:\Users\Ashish.Gupta\Documents\GitHub\koreaidocs-markdownlinter\.markdownlint.jsonc"`

---

Check all MD files in a folder and save the results as a local .json file.

`pwsh .\mdlint-via-cli.ps1 -config "C:\Users\Ashish.Gupta\Documents\GitHub\koreaidocs-markdownlinter\.markdownlint.jsonc"`

Convert the resulting .json file to a .csv file.

`pwsh ./json2csv.ps1 -jsonFile report.json`
