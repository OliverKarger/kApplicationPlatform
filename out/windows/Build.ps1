$ImageName = "kap-builder-windows"
$OutputDir = "out\windows"
$Workspace = "C:\workspace"
$ContainerBuildDir = "$Workspace\build"

Write-Host "[+] Building Docker image: $ImageName"
docker build -f docker\Windows.dockerfile -t $ImageName .

# Build command to run inside container
$BuildCommand = @"
"C:\Program Files (x86)\Microsoft Visual Studio\2022\BuildTools\VC\Auxiliary\Build\vcvars64.bat" && `
conan install . --output-folder=build --build=missing && `
cmake -S . -B build -G Ninja && `
cmake --build build
"@

Write-Host "[+] Running build inside container..."
docker run --rm `
  -v "${PWD}":"$Workspace" `
  -w "$Workspace" `
  $ImageName `
  cmd /S /C "$BuildCommand"

Write-Host "[+] Copying build output to $OutputDir"
New-Item -ItemType Directory -Force -Path $OutputDir | Out-Null
Copy-Item -Recurse -Force ".\build\*" $OutputDir

Write-Host "[OK] Build complete."
