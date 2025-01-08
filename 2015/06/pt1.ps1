$in = Get-Content -Path '.\ex.txt'

function Create-Grid {
  $lightGrid = New-Object System.Collections.ArrayList
    
  for ($x = 0; $x -le 999; $x++) {
    for ($y = 0; $y -le 999; $y++) {
      [void]$lightGrid.Add([PSCustomObject]@{
          x = $x
          y = $y
          state = $false
        })
    }
  }
    
  return $lightGrid
}

function do-instruction {
  param(
    [string]$method,
    [int]$xStart,
    [int]$yStart,
    [int]$xEnd,
    [int]$yEnd,
    [System.Collections.ArrayList]$grid
  )

}

function process-line {
  param(
    [string]$in
  )
  $insList = New-Object System.Collections.ArrayList

  $in | ForEach-Object {
    $line = $_
    $instruction = $_.Substring(0,7)

    switch ($instruction) {
      'toggle ' {
        $coords = $line.Substring(7).Trim()
      }
      'turn on' {
        $coords = $line.Substring(7).Trim()
      }
      'turn of' {
        $coords = $line.Substring(8).Trim()
      }
    }
    $xycoords = $coords -split ' through ',2
    $beginning = $xycoords[0] -split ',',2
    $end = $xycoords[1] -split ',',2
    $xBeg = $beginning[0]
    $yBeg = $beginning[1]
    $xEnd = $end[0]
    $yEnd = $end[1]
    $ins = [PSCustomObject]@{
      method = $instruction
      xBeg = $xBeg
      xEnd = $xEnd
      yBeg = $yBeg
      yEnd = $yEnd
    }
    $insList.Add($ins) | Out-Null
  }

  return $insList
}


$test = $in | ForEach-Object { process-line -in $_ }
Write-Host $test
