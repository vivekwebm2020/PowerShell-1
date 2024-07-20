Get-ChildItem -Filter *.mkv | Foreach { $_ | Rename-Item -NewName ($_.Name -replace '.English.Esubs.MoviesMod.org', '') }
Get-ChildItem -Filter *.mkv | Foreach { $_ | Rename-Item -NewName ($_.Name -replace '.1080p.x264', '') }
Read-Host
