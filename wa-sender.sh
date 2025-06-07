#!/bin/bash

# Warna
green='\e[32m'
red='\e[31m'
nc='\e[0m'

# Fungsi encode URL
urlencode() {
    jq -rn --arg v "$1" '$v|@uri'
}

# Fungsi kirim ke satu nomor
kirim_satu() {
    nomor=$1
    pesan=$(urlencode "$2")
    link="https://wa.me/${nomor}?text=${pesan}"
    echo -e "${green}[✓] Membuka link:$nc $link"
    termux-open-url "$link"
}

# Fungsi kirim banyak
kirim_massal() {
    while IFS="|" read -r nomor pesan
    do
        if [[ -n "$nomor" && -n "$pesan" ]]; then
            echo -e "${green}[✓] Kirim ke $nomor:$nc $pesan"
            kirim_satu "$nomor" "$pesan"
            sleep 2
        fi
    done < daftar.txt
}

# Mode manual
if [[ "$1" == "-f" ]]; then
    kirim_massal
elif [[ "$#" -eq 2 ]]; then
    kirim_satu "$1" "$2"
else
    echo -e "${red}Gunakan: $nc"
    echo "./wa-sender.sh 628xxxx 'Pesan anda'"
    echo "./wa-sender.sh -f (pakai daftar.txt)"
fi
