$in = Get-Content -Path '.\ex.txt'

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
      echo $coords
    }
    'turn on' {
      $coords = $line.Substring(7).Trim()
      echo $coords
    }
    'turn of' {
      $coords = $line.Substring(8).Trim()
      echo $coords
    }
  }
}


