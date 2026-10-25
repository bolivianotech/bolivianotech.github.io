<#
  Convierte las capturas originales (PNG/JPG) a WebP liviano de máx. 1280 px de ancho.

  Estructura esperada (desde la carpeta capacitacion-upds):
    capturas-originales\sesion-01\paso-01.png   <- aquí guardas tus capturas (NO se sube a GitHub)
    capturas\sesion-01\paso-01.webp             <- resultado (esto SÍ se sube)

  Uso:
    powershell -ExecutionPolicy Bypass -File .\herramientas\optimizar-capturas.ps1
    powershell -ExecutionPolicy Bypass -File .\herramientas\optimizar-capturas.ps1 -Sesion 03

  Requiere ImageMagick (una sola vez):
    winget install ImageMagick.ImageMagick
  Después cierra y vuelve a abrir PowerShell.
#>
param(
    [string]$Sesion = "",          # ejemplo: 03  (vacío = todas)
    [int]$Ancho = 1280,
    [int]$Calidad = 80
)

$raiz      = Split-Path -Parent $PSScriptRoot
$origenes  = Join-Path $raiz "capturas-originales"
$destinos  = Join-Path $raiz "capturas"

if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
    Write-Host "No se encontró ImageMagick. Instálalo con:  winget install ImageMagick.ImageMagick" -ForegroundColor Yellow
    Write-Host "Luego cierra y abre PowerShell otra vez."
    exit 1
}
if (-not (Test-Path $origenes)) {
    Write-Host "No existe la carpeta $origenes. Créala y guarda ahí tus capturas por sesión (sesion-01, sesion-02, ...)." -ForegroundColor Yellow
    exit 1
}

$filtro = if ($Sesion) { "sesion-$Sesion" } else { "sesion-*" }
$total = 0
Get-ChildItem -Path $origenes -Directory -Filter $filtro | ForEach-Object {
    $carpetaSalida = Join-Path $destinos $_.Name
    New-Item -ItemType Directory -Force -Path $carpetaSalida | Out-Null

    Get-ChildItem -Path $_.FullName -File | Where-Object { $_.Extension -match '^\.(png|jpg|jpeg)$' } | ForEach-Object {
        $salida = Join-Path $carpetaSalida ($_.BaseName + ".webp")
        # "1280x>" = reducir solo si es más ancha de 1280 px; -strip quita metadatos
        magick $_.FullName -resize "${Ancho}x>" -strip -quality $Calidad $salida
        if ($LASTEXITCODE -eq 0) {
            $kb = [math]::Round((Get-Item $salida).Length / 1KB)
            Write-Host ("OK  {0}  ({1} KB)" -f $salida.Replace($raiz + "\", ""), $kb)
            $total++
        } else {
            Write-Host "ERROR con $($_.FullName)" -ForegroundColor Red
        }
    }
}
Write-Host "`nListo: $total imagen(es) optimizada(s)." -ForegroundColor Green
