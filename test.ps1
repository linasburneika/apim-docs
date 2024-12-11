$environments = Get-Content environments.json -Raw | ConvertFrom-Json 

function Get-EnvironmentForPath {
    param (
        [string]$path
    )
    foreach ($env in $environments.PSObject.Properties) {
        foreach ($envPath in $env.Value) {
            if ($path -like "$envPath*") {
                return $env.Name
            }
        }
    }
    return "Production"
}

$files = @("content/apis/access-control/overview.md")
$envs = @()

foreach ($path in $files) {
    $environment = Get-EnvironmentForPath -path $path
    If ($envs -notContains $environment ) {
        $envs += $environment
    }
}

if ($envs.Count -gt 1) {
    Write-Host "Multiple environments detected: $envs"
    exit 1
}

Write-Host "Resolved environment: $($envs[0])"
"RESOLVED_ENVIRONMENT=$($envs[0])" >> $env:GITHUB_OUTPUT