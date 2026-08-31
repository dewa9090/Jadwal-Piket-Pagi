# Jadwal Masuk Pagi & Piket

Halaman jadwal piket dalam satu berkas HTML mandiri. Tidak perlu server, tidak perlu
pemasangan apa pun — cukup buka `index.html` di browser.

## Cara pakai

**Melihat jadwal.** Buka halaman. Semua orang masuk dalam mode lihat saja: jadwal bisa
dibaca, difilter, diekspor ke Excel/CSV, dan dicetak.

**Filter.** Dua dropdown di bilah atas menyaring per **tahun** dan per **bulan**. Daftar
bulan menyesuaikan tahun yang sedang dipilih, jadi hanya bulan yang benar-benar ada yang
ditawarkan. Ekspor Excel dan CSV mengikuti filter ini — pilih satu bulan lalu ekspor, dan
berkasnya berisi bulan itu saja dengan nama seperti `Jadwal Piket September 2026.xls`.
Cadangan data (.json) selalu memuat seluruh bulan.

**Mengubah jadwal.** Klik **Masuk Admin** lalu isi kata sandi. Setelah itu muncul palet
tanda, tombol Tambah Bulan, pengaturan petugas, dan tombol Isi Otomatis di tiap bulan.
Status admin hilang saat tab ditutup.

Tanda yang tersedia: **Masuk Pagi**, **Piket OD**, **Masuk Siang**, **Cuti/Izin**.
Klik sel untuk memberi tanda, klik kanan untuk menghapus.

**Umpan balik saat menyunting.** Tiap kali sebuah sel diubah, muncul pemberitahuan
sekilas di bawah layar yang menyebut petugas, tanggal, dan tanda apa yang berubah —
misalnya `Herry · 9 September 2026 — Masuk Pagi diganti Piket OD`. Bila perubahan gagal
disimpan, yang muncul justru peringatan itu, bukan pesan berhasil.

**Simpan dan Batal.** Suntingan tidak langsung tersimpan. Begitu ada perubahan, tombol
**Simpan** berubah hijau, tombol **Batal** muncul di sebelahnya, dan penanda oranye
**Belum disimpan** menyala di kop.

- **Simpan** menuliskan perubahan ke penyimpanan browser.
- **Batal** membuang seluruh perubahan sejak simpanan terakhir dan mengembalikan jadwal
  seperti semula — termasuk bulan yang baru ditambahkan.

Menutup tab selagi ada perubahan yang belum disimpan akan memunculkan konfirmasi browser
lebih dulu. Setelah disimpan, penanda berganti menjadi **Belum diterbitkan**, menandakan
perubahan sudah aman di browser Anda tetapi belum masuk ke berkas yang dilihat tim —
itu urusan **Ekspor → Berkas HTML mandiri**.

**Yang hanya terlihat oleh admin.** Kolom **Total** (jumlah tugas per petugas) dan baris
**Jumlah** (jumlah petugas per hari) disembunyikan dalam mode lihat saja, termasuk pada
hasil ekspor Excel dan CSV. Rekan hanya melihat siapa bertugas kapan, tanpa rekapitulasi.

## Asisten jadwal

Tombol **Asisten** (khusus admin) membuka kotak perintah singkat. Perintah diterjemahkan
oleh aturan yang tertanam di halaman — tidak ada layanan luar yang dihubungi, jadi tetap
bekerja saat berkas dibuka tanpa internet.

| Perintah                                        | Yang terjadi                                                  |
| ----------------------------------------------- | ------------------------------------------------------------- |
| `susun Oktober 2026`                            | Buat bulan itu bila belum ada, lalu isi rotasi merata          |
| `susun Oktober 2026, Dewa cuti 5 sampai 9`      | Sama, tapi Dewa ditandai Cuti/Izin dan dilewati rotasi         |
| `rekap`                                         | Hitung tugas per petugas untuk bulan yang sedang tampil        |
| `tukar Fiki dan Adit`                           | Tukar seluruh jadwal dua petugas di bulan yang tampil          |
| `kosongkan`                                     | Hapus semua tanda di bulan yang tampil                         |

Tanggal boleh ditulis `5-9`, `5 sampai 9`, atau `3, 7 dan 12`. Bila bulan tidak disebut,
yang dipakai adalah bulan yang sedang tampil di filter — saring ke satu bulan lebih dulu.
Perintah di luar daftar ini ditolak dengan pesan, bukan ditebak.

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

## Kalau halaman masih menampilkan versi lama

Browser menyimpan salinan halaman ini di cache, jadi setelah jadwal diperbarui pembaca
bisa masih melihat versi lama beberapa menit. Halaman memeriksa sendiri ke sumbernya dan
memunculkan bilah **"Ada jadwal versi lebih baru"** dengan tombol Muat Ulang bila memang
tertinggal. Pemeriksaan diulang tiap kali tab dibuka kembali.

Untuk memaksa segera, tekan **Ctrl+Shift+R** (Windows) di Chrome, Edge, atau Firefox.

Bila sebuah browser terlanjur menyimpan jadwal lama, buka alamat berikut sekali di browser
itu untuk membuang salinannya dan mengambil ulang dari versi terbitan:

```
https://dewa9090.github.io/Jadwal-Piket-Pagi/?bersih=1
```

Alamat berbeda ini sekaligus melewati cache, jadi tidak perlu muat ulang paksa lagi.
Pengaturan GitHub tidak ikut terhapus, sehingga token admin tetap terpasang.

Perlu diingat, penyimpanan browser bersifat per-browser: suntingan yang disimpan di Chrome
tidak terlihat di Firefox, dan sebaliknya. Yang dibagi ke semua orang hanyalah `index.html`
yang sudah terkirim ke repo ini.

## Menerbitkan dengan satu klik

Cara paling sederhana, tanpa token dan tanpa perintah git:

1. Di halaman jadwal, masuk sebagai admin, sunting, lalu klik **Simpan**
2. Klik **Ekspor → Berkas HTML mandiri** (berkas masuk ke folder Downloads)
3. Klik dua kali **Terbitkan Jadwal.bat** di folder repo ini

Skrip mengambil berkas hasil ekspor terbaru dari Downloads, memasangnya sebagai
`index.html`, lalu commit dan push. Git memakai kredensial GitHub yang sudah tersimpan di
komputer, jadi tidak ada token yang perlu diurus. Halaman untuk tim ikut berubah dalam
1–2 menit.

Bila tidak ada yang berubah, skrip mengatakannya dan tidak membuat commit kosong.

## Kirim otomatis ke GitHub (opsional)

Tombol **GitHub** (khusus admin) menyambungkan halaman ke repo ini, sehingga tiap kali
tombol **Simpan** ditekan jadwal langsung dikirim sebagai commit baru — tanpa ekspor,
salin berkas, atau push manual.

Isi nama repo (`dewa9090/Jadwal-Piket-Pagi`), cabang, berkas tujuan, dan sebuah
**fine-grained personal access token** yang dibatasi pada repo ini saja dengan izin
**Contents: Read and write**. Tekan **Uji Sambungan** untuk memastikan token diterima dan
punya izin tulis, lalu **Simpan Pengaturan**.

> **Token disimpan hanya di browser Anda**, pada tempat terpisah dari data jadwal, dan
> tidak pernah ikut ke dalam berkas yang dikirim. Halaman memeriksa hal ini sebelum tiap
> pengiriman dan membatalkannya bila token sampai terbawa. Jangan pernah menaruh token
> langsung di dalam `index.html` — repo ini publik.

Siapa pun yang memakai komputer dan browser yang sama bisa memakai token itu. Pada
komputer bersama, tekan **Lupakan Token** setelah selesai.

Bila pengiriman gagal — token kedaluwarsa, jaringan mati, berkas di GitHub berubah lebih
dulu — jadwal tetap aman tersimpan di browser, pesannya menyebut penyebabnya, dan penanda
tetap menyala sampai berhasil terkirim. Tombol **Kirim Sekarang** mengulanginya.

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

Berkas yang lebih baru menang atas salinan yang tersimpan di browser pembaca, jadi tim
otomatis melihat versi terbaru begitu halaman dimuat ulang.

Pengecualiannya: bila browser Anda masih menyimpan suntingan yang **belum diterbitkan**,
suntingan itulah yang dipertahankan meski berkas yang dibuka lebih baru. Halaman memberi
tahu lewat pesan sekilas saat dibuka. Ini menjaga kerja admin agar tidak hilang hanya
karena membuka berkas versi lain.

## Alamat halaman

Repo ini terbit lewat GitHub Pages di:

```
https://dewa9090.github.io/Jadwal-Piket-Pagi/
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
Pengaturan GitHub **tidak** ikut di sana — letaknya di penyimpanan browser masing-masing.
Logo Jalin juga tertanam sebagai data URI, jadi berkasnya tetap utuh saat dipindah
atau dibuka tanpa internet.
