$manual = "MAN-MDS200-201707.pdf"

# $files = Get-ChildItem *.md | ForEach-Object {$_.Name}
$files = Get-ChildItem *.md | ForEach-Object {$_.FullName}

# $path = $PWD.Path -replace '^|\\+','/' -replace ':'

if(!(Test-Path .\build\)) {
  New-Item build -ItemType Directory
}

if(Test-Path .\build\$manual){
  Remove-Item .\build\$manual
}

&pandoc $files `
--toc --template=default.latex --toc-depth=2 --top-level-division=chapter `
-V geometry:margin=1.25in -V lof:yes `
-s -o $manual

# &docker run -v ${path}:/source jagregory/pandoc $files `
# --toc --template=default.latex --toc-depth=2 --top-level-division=chapter `
# -V geometry:margin=1.25in -V lof:yes `
# -s -o $manual

Move-Item $manual -Destination .\build\