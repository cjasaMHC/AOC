$example = Get-Content '.\input.txt'
$sortedLeft, $sortedRight = @(), @()

$example | ForEach-Object {
  $splitExample = ($_ -split '   ').ForEach({$_.Trim()})
  $splitLeft = $splitExample[0]
  $sortedLeft += $splitLeft
  $splitRight = $splitExample[1]
  $sortedRight += $splitRight
}

$counter, $distanceTotal = 0, 0

foreach ($number in $sortedLeft) {
  $count = ($sortedRight | Where-Object { $_ -eq $number}).Count
  $distanceTotal += ($count * $number)
  $counter ++
}

Write-Host $distanceTotal
