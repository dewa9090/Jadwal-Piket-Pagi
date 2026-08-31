# Terbitkan jadwal piket ke GitHub.
#
# Pakai: klik dua kali "Terbitkan Jadwal.bat" di folder ini, setelah menekan
# Ekspor > Berkas HTML mandiri di halaman jadwal.
#
# Skrip mencari berkas hasil ekspor terbaru di folder Downloads, memasangnya
# sebagai index.html, lalu commit dan push. Tidak perlu token: git memakai
# kredensial GitHub yang sudah tersimpan di komputer ini.

$ErrorActionPreference = "Stop"
$repo = $PSScriptRoot

function Selesai($pesan, $warna) {
    Write-Host ""
    Write-Host $pesan -ForegroundColor $warna
    Write-Host ""
}

Write-Host "=== Terbitkan Jadwal Piket ===" -ForegroundColor Cyan
Write-Host ""

# 1. cari berkas hasil ekspor terbaru
$unduhan = Join-Path $env:USERPROFILE "Downloads"
$berkas = Get-ChildItem -Path $unduhan -Filter "Jadwal Piket*.html" -ErrorAction SilentlyContinue |
          Sort-Object LastWriteTime -Descending | Select-Object -First 1

if (-not $berkas) {
    Selesai "Tidak menemukan berkas 'Jadwal Piket*.html' di folder Downloads.`n`nBuka halaman jadwal, masuk sebagai admin, lalu klik Ekspor > Berkas HTML mandiri.`nSetelah itu jalankan skrip ini lagi." "Yellow"
    exit 1
}

$umur = (Get-Date) - $berkas.LastWriteTime
Write-Host ("Berkas   : " + $berkas.Name)
Write-Host ("Disimpan : " + $berkas.LastWriteTime.ToString("dd MMM yyyy HH:mm") +
            "  (" + [math]::Round($umur.TotalMinutes) + " menit lalu)")

if ($umur.TotalHours -gt 12) {
    Write-Host ""
    Write-Host "Berkas ini sudah cukup lama. Pastikan ini memang hasil ekspor terbaru." -ForegroundColor Yellow
    $lanjut = Read-Host "Lanjutkan? (y/n)"
    if ($lanjut -ne "y") { Selesai "Dibatalkan." "Yellow"; exit 0 }
}

# 2. pasang sebagai index.html
Copy-Item -LiteralPath $berkas.FullName -Destination (Join-Path $repo "index.html") -Force
Write-Host "Dipasang : index.html"

# 3. commit dan push
Set-Location $repo
git add index.html

$adaUbah = git diff --cached --name-only
if (-not $adaUbah) {
    Selesai "Tidak ada perubahan. Jadwal di GitHub sudah sama dengan berkas ini." "Yellow"
    exit 0
}

$pesan = "Perbarui jadwal piket " + (Get-Date).ToString("dd MMM yyyy HH:mm")
git commit -q -m $pesan
if (-not $?) { Selesai "Gagal membuat commit." "Red"; exit 1 }

Write-Host "Commit   : $pesan"
Write-Host "Mengirim ke GitHub..."
git push -q origin main
if (-not $?) {
    Selesai "Gagal mengirim ke GitHub.`n`nPeriksa koneksi internet, lalu jalankan lagi.`nBila diminta login, masukkan akun GitHub Anda." "Red"
    exit 1
}

Selesai "Berhasil. Jadwal sudah terkirim ke GitHub.`n`nHalaman untuk tim akan ikut berubah dalam 1-2 menit:`nhttps://dewa9090.github.io/Jadwal-Piket-Pagi/`n`nMinta rekan menekan refresh bila masih terlihat versi lama." "Green"
