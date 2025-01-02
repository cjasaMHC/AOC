$in = Get-Content -Path '.\input.txt'
$position = 0
$upChar = '('
$downChar = ')'
$upCount = $in.ToCharArray().Where({ $_ -eq $upChar }).Count
$downCount = $in.ToCharArray().Where({ $_ -eq $downChar }).Count

$position = $position + $upCount
$position = $position - $downCount
Write-Host $position
