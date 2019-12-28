$files = Get-ChildItem -Filter BirdDog.config -Path "E:\Hosted Websites" -Recurse 

foreach ($file in $files){
 # Get-Item $file.FullName | Replace-FileString -Pattern 'office5' -Replacement 'replaceme' -Overwrite
  Write-Host $file.FullName
  $bak = Join-Path $file.directory "birddog.config.bak"
  Write-Host $bak
  copy-item $file.FullName $bak
#  $find = "office5"
  $replace = "enttestdb.birddogsw.local"
  $content = Get-Content $($file.FullName)
#  Write-Host $content
  $content.Replace('office5', 'replaceme') | Out-File $file.FullName -Encoding UTF8

  $content.Replace("office5", $replace) | Out-File $($file.FullName) -Encoding UTF8
  $content.Replace("Office5", $replace) | Out-File $($file.FullName) -Encoding UTF8
}
