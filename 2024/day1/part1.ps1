$example = Get-Content '.\input.txt'
$sortedLeft = @()
$sortedRight = @()

$example | ForEach-Object {
  $splitExample = ($_ -split '   ').ForEach({$_.Trim()})
  $splitLeft = $splitExample[0]
  $sortedLeft += $splitLeft
  $splitRight = $splitExample[1]
  $sortedRight += $splitRight

}
$sortedLeft = $sortedLeft | Sort-Object {[int]$_}
$sortedRight = $sortedRight | Sort-Object {[int]$_}
$counter = 0
$distanceTotal = 0

$sortedLeft | ForEach-Object {
  $distance = [Math]::Abs($_ - $sortedRight[$counter])
  $distanceTotal += $distance
  $counter ++
}

Write-Host $distanceTotal
