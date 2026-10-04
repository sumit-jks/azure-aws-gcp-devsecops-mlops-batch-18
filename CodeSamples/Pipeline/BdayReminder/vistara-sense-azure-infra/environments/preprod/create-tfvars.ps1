$csvFile = ".\resource-groups.csv"
$outputFile = ".\terraform.tfvars"

$resources = Import-Csv $csvFile

$output = @(
    "rgs = {"
)

foreach ($rg in $resources) {
    $output += "  $($rg.name) = {"
    $output += "    name     = `"$($rg.name)`""
    $output += "    location = `"$($rg.location)`""
    $output += "  }"
}

$output += "}"

Set-Content -Path $outputFile -Value $output -Encoding UTF8

Write-Host "Created $outputFile"
