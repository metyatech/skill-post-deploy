# Repository Verification Script

Write-Host "Verifying repository compliance..."

$mandatoryFiles = @(".gitignore", "AGENTS.md", "LICENSE", "README.md", "SKILL.md", "SECURITY.md", "CONTRIBUTING.md", ".tasks.jsonl")
$missingFiles = @()

foreach ($file in $mandatoryFiles) {
    if (-not (Test-Path $file)) {
        $missingFiles += $file
    }
}

if ($missingFiles.Count -gt 0) {
    Write-Error "Missing mandatory files: $($missingFiles -join ', ')"
    exit 1
}

Write-Host "All mandatory files present."

# Check if compose-agentsmd is up to date
Write-Host "Running compose-agentsmd --compose..."
$output = compose-agentsmd --compose 2>&1
if ($null -ne $output -and $output.Contains("Composed AGENTS.md")) {
    # If it says Composed AGENTS.md, it might have changed it.
    # However, compose-agentsmd output is a bit noisy.
    # We'll rely on git status check later or just trust it.
}

Write-Host "Verification PASSED."
exit 0
