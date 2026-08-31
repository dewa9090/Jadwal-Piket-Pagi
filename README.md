# Jadwal Masuk Pagi & Piket

Halaman jadwal piket dalam satu berkas HTML mandiri. Tidak perlu server, tidak perlu
pemasangan apa pun — cukup buka `index.html` di browser.

## Cara pakai

**Melihat jadwal.** Buka halaman. Semua orang masuk dalam mode lihat saja: jadwal bisa
dibaca, difilter per tahun, diekspor ke Excel/CSV, dan dicetak.

**Mengubah jadwal.** Klik **Masuk Admin** lalu isi kata sandi. Setelah itu muncul palet
tanda, tombol Tambah Bulan, pengaturan petugas, dan tombol Isi Otomatis di tiap bulan.
Status admin hilang saat tab ditutup.

Tanda yang tersedia: **Masuk Pagi**, **Piket OD**, **Masuk Siang**, **Cuti/Izin**.
Klik sel untuk memberi tanda, klik kanan untuk menghapus.

**Yang hanya terlihat oleh admin.** Kolom **Total** (jumlah tugas per petugas) dan baris
**Jumlah** (jumlah petugas per hari) disembunyikan dalam mode lihat saja, termasuk pada
hasil ekspor Excel dan CSV. Rekan hanya melihat siapa bertugas kapan, tanpa rekapitulasi.

## Hari libur otomatis

Saat menambah bulan pada tahun yang belum punya daftar libur, daftarnya disusun sendiri
lebih dulu. Akhir pekan dan hari libur kemudian dilewati oleh pengisian otomatis.

| Jenis                                                     | Ketelitian                |
| --------------------------------------------------------- | ------------------------- |
| 1 Jan, 1 Mei, 1 Juni, 17 Agustus, 25 Desember               | pasti                     |
| Wafat & Kenaikan Isa Almasih (dihitung dari tanggal Paskah) | pasti                     |
| Idul Fitri, Idul Adha, 1 Muharram, Maulid, Isra Miraj       | perkiraan, ±1 hari        |
| Tahun Baru Imlek                                            | perkiraan, ±1 hari        |

Tanggal perkiraan diberi label oranye **perkiraan**. Cocokkan dengan SKB 3 Menteri, lalu
perbaiki bila meleset — labelnya akan hilang sendiri.

**Nyepi, Waisak, dan cuti bersama tidak ikut terhitung.** Perhitungannya terlalu rumit
untuk ditebak dengan aman, jadi tambahkan sendiri lewat menu Libur Nasional.

## Menerbitkan perubahan ke tim

Perubahan yang Anda buat tersimpan di browser Anda sendiri, bukan di dalam berkas.
Agar tim melihat jadwal terbaru:

1. Masuk sebagai admin, lakukan perubahan.
2. **Ekspor → Berkas HTML mandiri.** Hasilnya berisi seluruh jadwal yang sudah menyatu
   di dalamnya, plus cap waktu terbit.
3. Ganti `index.html` di repo ini dengan berkas hasil unduhan tadi.
4. Commit dan push.

```bash
git add index.html
git commit -m "Perbarui jadwal <bulan>"
git push
```

Berkas yang lebih baru selalu menang atas salinan yang tersimpan di browser pembaca,
jadi tim otomatis melihat versi terbaru begitu halaman dimuat ulang. Tanggal terbit
tampil di bawah judul halaman.

> Karena berkas terbitan yang menang, perubahan yang belum Anda ekspor akan hilang bila
> ada terbitan baru yang lebih mutakhir. Biasakan mengekspor setiap selesai menyunting.

## Alamat halaman

Repo ini terbit lewat GitHub Pages di:

```
https://<akun>.github.io/jadwal-piket/
```

Halaman memasang `<meta name="robots" content="noindex, nofollow">`, jadi tautannya bisa
dibagikan bebas ke tim tetapi tidak ikut muncul di hasil pencarian Google.

## Batas kunci admin

Repo ini **publik**, jadi isi `index.html` bisa dibaca siapa saja — termasuk sandi admin
yang tertanam di dalamnya. Kunci admin di sini murni **pencegah kekeliruan**: ia
menghalangi rekan mengubah jadwal secara tidak sengaja, bukan menghalangi orang yang
memang berniat menembusnya.

> **Jangan pakai sandi yang Anda gunakan di layanan lain.** Perlakukan sandi ini sebagai
> kode buka pintu biasa, bukan kredensial.

Pengamanan yang sebenarnya ada di izin tulis repo ini: **hanya orang yang bisa melakukan
push yang dapat mengubah jadwal yang dilihat tim.** Perubahan siapa pun di browsernya
sendiri tidak pernah sampai ke orang lain.

Mengganti sandi lewat **Ubah Sandi** hanya berlaku di browser Anda sampai berkasnya
diekspor ulang dan di-push.

## Struktur

```
index.html   seluruh aplikasi: tampilan, data jadwal, dan daftar libur
.gitignore
README.md
```

Data jadwal tertanam di dalam `index.html` sebagai satu baris `const SEED = {...};`.
