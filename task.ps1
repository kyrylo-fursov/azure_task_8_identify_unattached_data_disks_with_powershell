$resourceGroupName = "mate-azure-task-5"

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $allDisks | Where-Object { 
    $_.DiskState -eq "Unattached" -or [string]::IsNullOrEmpty($_.ManagedBy) 
}

# Use @() to ensure the output is always an array, even with single or zero items
$jsonOutput = @($unattachedDisks) | ConvertTo-Json -Depth 10

$outputFile = "result.json"
$jsonOutput | Out-File -FilePath $outputFile -Encoding UTF8

Write-Host "Script completed successfully!"