# Repository Verification Script

Write-Host "Verifying repository compliance..."

# Check if npm is installed
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Error "npm is not installed."
    exit 1
}

# Run verify script from package.json
npm run verify

if ($LASTEXITCODE -ne 0) {
    Write-Error "Verification failed."
    exit 1
}

Write-Host "Verification PASSED."
exit 0
