$root = Resolve-Path (Join-Path $PSScriptRoot "..")

$targets = @(
    "admin-web/.env.local",
    "backend-springboot/.env",
    "ai-service/.env"
)

foreach ($target in $targets) {
    $fullPath = Join-Path $root $target
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType File -Path $fullPath | Out-Null
    }
}

Write-Output "Environment placeholder files initialized."