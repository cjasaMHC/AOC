$numbers = Get-Content -Path '.\input.txt'

function test-row {
  param (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]$row
  )

  $nums = $row -split ' '
  $direction = $null

  for ($count = 0; $count -lt $nums.Length - 1; $count++) {
    $diff = [int]$nums[$count + 1] - [int]$nums[$count]
    $safeDist = [Math]::Abs($diff)
    
    if ($safeDist -lt 1 -or $safeDist -gt 3) {
      return $false
    }

    if ($null -eq $direction) {
      $direction = $diff -gt 0
    } elseif (($diff -gt 0) -ne $direction) {
      return $false
    }
  }
  return $true
}

$safeReports = 0
foreach ($row in $numbers) {
  if (test-row $row) {
    $safeReports ++
  }
}
Write-Host $safeReports
