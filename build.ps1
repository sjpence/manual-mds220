if(!(Test-Path .\build\)) {
  New-Item build -ItemType Directory
}

if(Test-Path .\build\manual.pdf){
  Remove-Item .\build\manual.pdf
}

pandoc .\01_Introduction.md .\02_FacilityConnections.md .\03_Installation.md .\04_InitialStartUp.md .\05_Operation.md .\06_Maintenance.md .\07_ServiceProcedures.md `
--toc --template=default.latex --toc-depth=2 --chapters `
-V geometry:margin=1in `
-s -o manual.pdf

Move-Item .\manual.pdf -Destination .\build\