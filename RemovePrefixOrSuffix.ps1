<#
Author: AlanDSaster
Github: https://github.com/AlanDSaster/
Date:   2021-03-15
Summary:
  Rename files in $directory without given $prefix and $suffix
#>
$directory = ""
$prefix = "pre_"
$suffix = "_suf"

echo ""
echo "Script Starting: RemovePrefixOrSuffix.ps1"
echo "  directory:  $directory"
echo "  prefix:     $prefix"
echo "  suffix:     $suffix"
echo ""

Get-ChildItem "$directory" |
Foreach-Object {
  $oldpath = $_.FullName
  $oldname = [System.IO.Path]::GetFileNameWithoutExtension($oldpath)
  $s = $oldname
  if($prefix.length -gt 0) {
    if($s.length -gt $prefix.length) {
      if($s.substring(0, $prefix.length) -Match $prefix) {
        $s = $s.substring($prefix.length, $s.length - $prefix.length)
      }
    }
  }
  if($suffix.length -gt 0) {
    if($s.length -gt $suffix.length) {
      if ($s.substring($s.length - $suffix.length) -Match $suffix) {
        $s = $s.substring(0, $s.length - $suffix.length)
      }
    }
  }
  $newname = $s
  $extension = [System.IO.Path]::GetExtension($oldpath)
  $newpath = $directory + "\" + $newname + $extension
  if($oldpath -ne $newpath) {
    echo "  Renaming from:  oldpath: $oldpath"
    echo "  Renaming to:    newpath: $newpath"
    Rename-Item -Path $oldpath -NewName $newpath
    echo ""
  } else {
    echo "  Paths are identical, Skipping rename."
    echo "    oldpath:  $oldpath"
    echo "    newpath:  $newpath"
    echo ""
  }
  echo ""
}
echo "Script Finished: RemovePrefixOrSuffix.ps1"
