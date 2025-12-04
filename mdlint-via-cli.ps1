param(
    [string]$config
)

# Build command
$cmd = "npx markdownlint"
$pattern = '"**/*.md"'

if ($config) {
    if (!(Test-Path $config)) {
        Write-Error "Config file not found: $config"
        exit 1
    }
    $cmd = "$cmd --config `"$config`""
}

Write-Host "Running markdownlint (CLI1)..."

# Capture stderr (where JSON is written) into report.json
Invoke-Expression "$cmd --json $pattern 2>&1 | Out-File report.json -Encoding utf8"

Write-Host "`nDone:"
Write-Host " - JSON: report.json"
Write-Host " - Log : report.log (if needed)"
