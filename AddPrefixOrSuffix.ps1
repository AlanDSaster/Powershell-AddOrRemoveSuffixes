<#
Author: AlanDSaster
Github: https://github.com/AlanDSaster/
Date:   2021-03-15
Summary:
  Rename files in $directory with given $prefix and $suffix
#>

$directory = "C:\Users\setup\Desktop\workspace"
$prefix = "pre_"
$suffix = "_suf"

echo ""
echo "Script Starting: AddPrefixOrSuffix.ps1"
echo "  directory:  $directory"
echo "  prefix:     $prefix"
echo "  suffix:     $suffix"
echo ""

Get-ChildItem "$directory" |
Foreach-Object {
  $oldpath = $_.FullName
  $oldname = [System.IO.Path]::GetFileNameWithoutExtension($oldpath)
  $newname = $prefix + $oldname + $suffix
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

}
echo "Script Finished: AddPrefixOrSuffix.ps1"
