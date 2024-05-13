#!/bin/bash
# // Recode by AgungVPN
RED='\033[0;91m'
NC='\033[0m'
Black='\e[0;30m'
Blue='\033[0;36m'
Ungu='\033[0;35m'
GREEN='\033[0;92m'
yellow='\033[0;93m'
sian='\e[94m'
Magenta='\033[0;95m'
clear

function del_cron() {
echo "Proses Fix limit xray ip"
sleep 5
rm -rf /etc/cron.d/limit-ip
    systemctl restart cron >/dev/null 2>&1
    service cron restart >/dev/null 2>&1
    echo -e " ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}            ${GREEN}SUCCES HAPUS LIMIT IP XRAY${NC}          ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "  Press any key to back menu"
    menu
}

function add_cron() {
cat >/etc/cron.d/x_lim <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
3 0 * * * root /usr/local/sbin/xraylimit
END
systemctl restart cron >/dev/null 2>&1
service cron restart >/dev/null 2>&1
echo -e " ${sian}┌─────────────────────────────────────────────────────────┐${NC}
 ${sian}│${NC}            ${GREEN}DONE FIX LIMIT IP XRAY${NC}          ${sian}│${NC}
 ${sian}└─────────────────────────────────────────────────────────┘${NC}"
    read -n 1 -s -r -p "  Press any key to back menu"
    menu
}
del_cron
add_cron
echo "Fix Selesai Silahkan enter untuk kembali ke menu"
read -n 1 -s -r -p "Press any key to back on menu"
menu

