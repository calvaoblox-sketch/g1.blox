# =====================================================================
#  Gera imagens SVG temáticas de Roblox (estilo thumbnails de jogo)
#  Executado uma vez para criar a pasta /img.
#  Pode ser reutilizado/adaptado para criar novas artes.
# =====================================================================
$ErrorActionPreference = "Stop"
$dir = Join-Path $PSScriptRoot "img"
New-Item -ItemType Directory -Force -Path $dir | Out-Null

function New-Art {
    param(
        [string]$Name,
        [string]$C1,
        [string]$C2,
        [string]$Title,
        [string]$Tag = "",
        [string]$Text = "#ffffff",
        [string]$Char = "#111111"
    )

    # Ajusta o tamanho da fonte conforme o comprimento do título
    $fs = if ($Title.Length -gt 20) { 40 } elseif ($Title.Length -gt 13) { 50 } else { 62 }

    # Largura dinâmica da "tag" (badge)
    $tagRect = ""
    if ($Tag -ne "") {
        $tw = 30 + ($Tag.Length * 13)
        $tagRect = @"
  <rect x="46" y="54" rx="18" ry="18" width="$tw" height="36" fill="#a80000"/>
  <text x="$([int](46 + $tw/2))" y="79" font-family="Arial, sans-serif" font-size="17" font-weight="700" fill="#ffffff" text-anchor="middle" letter-spacing="2">$Tag</text>
"@
    }

    $svg = @"
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 450" width="800" height="450" role="img" aria-label="$Title">
  <defs>
    <linearGradient id="g" x1="0" y1="0" x2="1" y2="1">
      <stop offset="0" stop-color="$C1"/>
      <stop offset="1" stop-color="$C2"/>
    </linearGradient>
  </defs>
  <rect width="800" height="450" fill="url(#g)"/>
  <circle cx="700" cy="50" r="150" fill="#ffffff" opacity="0.10"/>
  <circle cx="70" cy="430" r="130" fill="#000000" opacity="0.12"/>
  <polygon points="0,450 800,240 800,450" fill="#000000" opacity="0.16"/>
$tagRect
  <!-- Bloco/avatar estilo Roblox -->
  <g transform="translate(560,105)">
    <rect x="20" y="40" width="130" height="128" rx="16" fill="#ffffff" opacity="0.95"/>
    <rect x="48" y="82" width="22" height="26" rx="7" fill="$Char"/>
    <rect x="100" y="82" width="22" height="26" rx="7" fill="$Char"/>
    <rect x="60" y="124" width="50" height="13" rx="6" fill="$Char"/>
    <rect x="40" y="182" width="90" height="118" rx="16" fill="$Char"/>
    <rect x="8" y="192" width="28" height="86" rx="13" fill="$Char"/>
    <rect x="134" y="192" width="28" height="86" rx="13" fill="$Char"/>
    <rect x="54" y="304" width="24" height="66" rx="9" fill="$Char"/>
    <rect x="92" y="304" width="24" height="66" rx="9" fill="$Char"/>
  </g>
  <!-- Título principal -->
  <text x="48" y="250" font-family="Arial, sans-serif" font-size="$fs" font-weight="900" fill="$Text">$Title</text>
  <!-- Marca -->
  <text x="48" y="410" font-family="Arial, sans-serif" font-size="22" font-weight="700" fill="$Text" opacity="0.75">BloxG1</text>
</svg>
"@
    $path = Join-Path $dir $Name
    Set-Content -Path $path -Value $svg -Encoding utf8
    Write-Host "Criado: $Name"
}

# --------------------------------------------------------------
#  DESTAQUES (HERO)
# --------------------------------------------------------------
New-Art "hero-blox-fruits.svg"  "#ff512f" "#dd2476" "BLOX FRUITS"   "UPDATE 25"
New-Art "hero-adopt-me.svg"     "#f857a6" "#c9376b" "ADOPT ME!"     "EVENTO"
New-Art "hero-promo-codes.svg"  "#7a0000" "#3d0000" "PROMO CODES"   "GRATIS"

# --------------------------------------------------------------
#  NOTÍCIAS (GRADE)
# --------------------------------------------------------------
New-Art "news-brookhaven.svg"     "#1e3c72" "#2a5298" "BROOKHAVEN"
New-Art "news-pet-simulator.svg"  "#f7971e" "#e65c00" "PET SIM"
New-Art "news-doors.svg"          "#232526" "#414345" "DOORS"
New-Art "news-murder-mystery.svg" "#b5121b" "#190a05" "MURDER MYSTERY"
New-Art "news-arsenal.svg"        "#134e5e" "#2e8b57" "ARSENAL"
New-Art "news-grow-garden.svg"    "#3a7d0a" "#a8e063" "GROW A GARDEN"
New-Art "news-dress-impress.svg"  "#ee9ca7" "#c98b98" "DRESS TO IMPRESS" "" "#1a1a1a" "#1a1a1a"
New-Art "news-roblox-event.svg"   "#42275a" "#734b6d" "EVENTO ROBLOX"

# --------------------------------------------------------------
#  VÍDEOS / EM ALTA
# --------------------------------------------------------------
New-Art "video-tutorial.svg"  "#0f2027" "#2c5364" "TUTORIAL BUILD"
New-Art "video-secrets.svg"   "#4b134f" "#c94b4b" "SEGREDOS"
New-Art "video-review.svg"    "#1a2980" "#26d0ce" "REVIEW"

Write-Host ""
Write-Host "Imagens geradas em: $dir"
