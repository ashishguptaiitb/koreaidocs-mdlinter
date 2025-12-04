param(
    [string]$jsonFile = "report.json",
    [string]$csvFile
)

if (!(Test-Path $jsonFile)) {
    Write-Error "JSON file not found: $jsonFile"
    exit 1
}

if (-not $csvFile) {
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $csvFile = "report-$timestamp.csv"
}

# Load JSON array
try {
    $json = Get-Content $jsonFile -Raw | ConvertFrom-Json
}
catch {
    Write-Error "Invalid JSON. Check file contents."
    exit 1
}

# Convert each error object directly into a CSV row
$rows = foreach ($item in $json) {
    [PSCustomObject]@{
        File    = $item.fileName
        Line    = $item.lineNumber
        Rule    = ($item.ruleNames -join ";")
        Message = $item.ruleDescription
    }
}

# Export CSV
$rows | Export-Csv -Path $csvFile -NoTypeInformation

Write-Host "`nCSV generated:"
Write-Host " - $csvFile"
