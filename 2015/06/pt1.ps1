$in = Get-Content -Path '.\ex.txt'

function Create-Grid {
  $lightGrid = New-Object System.Collections.ArrayList
    
  for ($x = 0; $x -le 999; $x++) {
    for ($y = 0; $y -le 999; $y++) {
      [void]$lightGrid.Add([PSCustomObject]@{
          x = $x
          y = $y
          state = 0
        })
    }
  }
    
  return $lightGrid
}

$in | ForEach-Object {
  #$charArr = $_.ToCharArray()
  # what to do
  $line = $_
  $instruction = $_.Substring(0,7)
  # where to do it
  # toggle and on 7, off 8

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
}

$grid = create-grid
write-host $($grid.Count)
