#!/bin/bash

# =========================================================
#                 SKYDO UNIVERSAL INSTALLER
# =========================================================
#  Author  : SKYDO
#  Version : 2.0
# =========================================================

clear

# ================= COLORS =================
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# ================= BANNER =================
show_banner() {
clear
echo -e "${CYAN}"
echo " ███████╗██╗  ██╗██╗   ██╗██████╗  ██████╗ "
echo " ██╔════╝██║ ██╔╝╚██╗ ██╔╝██╔══██╗██╔═══██╗"
echo " ███████╗█████╔╝  ╚████╔╝ ██║  ██║██║   ██║"
echo " ╚════██║██╔═██╗   ╚██╔╝  ██║  ██║██║   ██║"
echo " ███████║██║  ██╗   ██║   ██████╔╝╚██████╔╝"
echo " ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚═════╝  ╚═════╝ "
echo -e "${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo -e "${WHITE}              SKYDO UNIVERSAL INSTALLER${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo ""
echo -e "${YELLOW} Developer : SKYDO${NC}"
echo -e "${YELLOW} Version   : 2.0${NC}"
echo -e "${YELLOW} Status    : ONLINE${NC}"
echo ""
}

# ================= ROOT CHECK =================
root_check() {
if [ "$EUID" -ne 0 ]; then
    echo -e "${RED}[ERROR] Please run this script as root!${NC}"
    echo ""
    echo -e "${YELLOW}Run these commands:${NC}"
    echo "sudo su"
    echo "bash installer.sh"
    exit 1
fi
}

# ================= LOADING =================
loading() {
echo ""
echo -e "${CYAN}Please wait...${NC}"
sleep 1
}

# ================= MAIN MENU =================
main_menu() {
show_banner

echo -e "${BLUE}[1]${NC} Install SKYPORTD PANEL"
echo -e "${BLUE}[2]${NC} Install DRACO PANEL"
echo -e "${BLUE}[3]${NC} Install PUFFERPANEL"
echo -e "${BLUE}[4]${NC} About Installer"
echo -e "${BLUE}[5]${NC} Exit Installer"
echo ""
echo -e "${GREEN}=========================================================${NC}"
echo ""

read -p "Select an option [1-5]: " option

case $option in

1)
    install_skyport
    ;;

2)
    install_draco
    ;;

3)
    install_puffer
    ;;

4)
    about_installer
    ;;

5)
    exit_installer
    ;;

*)
    echo ""
    echo -e "${RED}Invalid option selected!${NC}"
    sleep 2
    main_menu
    ;;

esac
}

# ================= SKYPORT INSTALL =================
install_skyport() {
show_banner

echo -e "${CYAN}Starting SKYPORTD PANEL Installation...${NC}"
loading

echo -e "${GREEN}[STEP 1/4] Updating system...${NC}"
apt update -y

echo ""
echo -e "${GREEN}[STEP 2/4] Installing SKYPORT Panel...${NC}"
bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/panel)

echo ""
echo -e "${GREEN}[STEP 3/4] Installing Wings / Node...${NC}"
bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/skyport/refs/heads/main/wings)

echo ""
echo -e "${GREEN}[STEP 4/4] Finalizing installation...${NC}"
sleep 2

echo ""
echo -e "${GREEN}=========================================================${NC}"
echo -e "${WHITE}      SKYPORTD PANEL INSTALLED SUCCESSFULLY${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo ""
echo -e "${YELLOW}NEXT STEPS:${NC}"
echo "1) cd skyportd"
echo "2) Paste your node configuration"
echo "3) pm2 start ."
echo ""
read -p "Press ENTER to return to menu..."
main_menu
}

# ================= DRACO INSTALL =================
install_draco() {
show_banner

echo -e "${CYAN}Starting DRACO PANEL Installation...${NC}"
loading

echo -e "${GREEN}[STEP 1/4] Updating system...${NC}"
apt update -y

echo ""
echo -e "${GREEN}[STEP 2/4] Installing JTG Panel...${NC}"
bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/jishnu)

echo ""
echo -e "${GREEN}[STEP 3/4] Installing Node...${NC}"
bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/Vps/refs/heads/main/node)

echo ""
echo -e "${GREEN}[STEP 4/4] Finalizing installation...${NC}"
sleep 2

echo ""
echo -e "${GREEN}=========================================================${NC}"
echo -e "${WHITE}       DRACO PANEL INSTALLED SUCCESSFULLY${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo ""
echo -e "${YELLOW}NEXT STEPS:${NC}"
echo "1) cd node"
echo "2) Paste your node configuration"
echo "3) node ."
echo ""
read -p "Press ENTER to return to menu..."
main_menu
}

# ================= PUFFER INSTALL =================
install_puffer() {
show_banner

echo -e "${CYAN}Starting PUFFERPANEL Installation...${NC}"
loading

echo -e "${GREEN}[STEP 1/5] Updating system...${NC}"
apt update -y

echo ""
echo -e "${GREEN}[STEP 2/5] Installing PufferPanel...${NC}"
bash <(curl -s https://raw.githubusercontent.com/JishnuTheGamer/puffer-panel/refs/heads/main/install)

echo ""
echo -e "${GREEN}[STEP 3/5] Creating Admin User...${NC}"
sudo pufferpanel user add

echo ""
echo -e "${GREEN}[STEP 4/5] Enabling Service...${NC}"
sudo systemctl enable --now pufferpanel

echo ""
echo -e "${GREEN}[STEP 5/5] Finalizing installation...${NC}"
sleep 2

echo ""
echo -e "${GREEN}=========================================================${NC}"
echo -e "${WHITE}      PUFFERPANEL INSTALLED SUCCESSFULLY${NC}"
echo -e "${GREEN}=========================================================${NC}"
echo ""
echo -e "${YELLOW}PufferPanel service is now running.${NC}"
echo ""
read -p "Press ENTER to return to menu..."
main_menu
}

# ================= ABOUT =================
about_installer() {
show_banner

echo -e "${WHITE}Installer Information${NC}"
echo ""
echo -e "${GREEN}Name      :${NC} SKYDO INSTALLER"
echo -e "${GREEN}Version   :${NC} 2.0"
echo -e "${GREEN}Developer :${NC} SKYDO"
echo -e "${GREEN}Purpose   :${NC} Automatic Panel Installer"
echo ""
echo -e "${CYAN}Supported Panels:${NC}"
echo "• SKYPORTD PANEL"
echo "• DRACO PANEL"
echo "• PUFFERPANEL"
echo ""
echo -e "${YELLOW}Thank you for using SKYDO INSTALLER!${NC}"
echo ""

read -p "Press ENTER to return to menu..."
main_menu
}

# ================= EXIT =================
exit_installer() {
clear
echo ""
echo -e "${GREEN}Thank you for using SKYDO INSTALLER!${NC}"
echo -e "${CYAN}Goodbye :)${NC}"
echo ""
exit 0
}

# ================= START =================
root_check
main_menu
