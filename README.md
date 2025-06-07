# 📲 wa-sender-cli

Script Termux untuk kirim pesan WhatsApp via CLI **tanpa API resmi**. Bisa kirim pesan ke satu orang atau banyak sekaligus (broadcast), langsung dari terminal.

---

## 🚀 Fitur
- Kirim pesan ke 1 nomor WhatsApp.
- Kirim pesan massal (dari file `daftar.txt`).
- Otomatis encode pesan agar tidak error.
- Link terbuka otomatis via `termux-open-url`.

---

## 🔧 Cara Install

```bash
git clone https://github.com/dapztzy5912/wa-sender-cli.git
cd wa-sender-cli
pkg install jq -y
chmod +x wa-sender.sh
