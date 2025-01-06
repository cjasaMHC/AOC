$numbers = Get-Content -Path '.\input.txt'
 
function Test-Sequence {
  param (
    [int[]]$sequence
  )
    
  $direction = $null
    
  for ($i = 0; $i -lt $sequence.Length - 1; $i++) {
    $diff = $sequence[$i + 1] - $sequence[$i]
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
 
function Test-Row {
  param (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [string]$row
  )
    
  $nums = $row -split ' ' | ForEach-Object { [int]$_ }
    
  # First check if the sequence is safe without any removals
  if (Test-Sequence $nums) {
    return $true
  }
    
  # If not safe, try removing each number
  for ($i = 0; $i -lt $nums.Length; $i++) {
    $dampened = [System.Collections.ArrayList]@($nums)
    $dampened.RemoveAt($i)
        
    if (Test-Sequence $dampened) {
      return $true
    }
  }
    
  return $false
}
 
$safeReports = 0
foreach ($row in $numbers) {
  if (Test-Row $row) {
    $safeReports++
  }
}
Write-Host $safeReports
