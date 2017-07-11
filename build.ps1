$manual = "MAN-MDS200-201707.pdf"

$files = gci *.md | %{$_.FullName}

if(!(Test-Path .\build\)) {
  New-Item build -ItemType Directory
}

if(Test-Path .\build\$manual){
  Remove-Item .\build\$manual
}

&pandoc $files `
--toc --template=default.latex --toc-depth=2 --chapters `
-V geometry:margin=1.25in -V lof:yes `
-s -o $manual

Move-Item $manual -Destination .\build\