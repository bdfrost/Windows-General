$files = Get-ChildItem -Filter BirdDog.config -Path "E:\Hosted Websites" -Recurse 

foreach ($file in $files){
  Write-Host $file.FullName
  $bak = Join-Path $file.directory "birddog.config.bak"
  copy-item $file.FullName $bak
  $find = "office7"
  $replace = "enttestdb.birddogsw.local"
  $content = Get-Content $($file.FullName)
  $content.Replace($find, $replace) | Out-File $($file.FullName)  -Encoding UTF8

  Write-Host $file.FullName
  $bak = Join-Path $file.directory "birddog.config.bak2"
  copy-item $file.FullName $bak
  $find = "Office7"
  $replace = "enttestdb.birddogsw.local"
  $content = Get-Content $($file.FullName)
  $content.Replace($find, $replace) | Out-File $($file.FullName)  -Encoding UTF8
}
