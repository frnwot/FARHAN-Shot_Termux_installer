import os
import time

# Color codes
red = '\033[1;31m'
green = '\033[1;32m'
blue = '\033[1;34m'
cyan = '\033[1;36m'
yellow = '\033[1;33m'
magenta = '\033[1;35m'
bold = '\033[1m'
reset = '\033[0m'

# Fancy banner
print(f"""{cyan}{bold}
╔════════════════════════════════════════════════╗
║      🚀 FARHAN Shot Installer By {yellow}frn{cyan}             ║
╚════════════════════════════════════════════════╝
{reset}""")

print(f"""{blue}{bold}
📢 Your device must be ROOTED to use this tool!

🧠 Author: {green}frn @FARHAN_MUH_TASIM{blue}
📦 Tool   : {yellow}FARHAN Shot
{reset}""")

# Begin installation steps
def run_step(description, command):
    print(f"{magenta}[•] {description}{reset}")
    time.sleep(1)
    exit_code = os.system(command)
    if exit_code == 0:
        print(f"{green}[✓] Done: {description}{reset}\n")
    else:
        print(f"{red}[✗] Failed: {description}{reset}\n")
        time.sleep(1)

# Install packages
run_step("Installing Termux root repository", "pkg install -y root-repo")
run_step("Installing required packages", "pkg install -y git tsu python wpa-supplicant pixiewps iw")

# Clone FARHAN-Shot repo
run_step("Cloning FARHAN-Shot repository", "cd .. && git clone --depth 1 https://github.com/frnwot/FARHAN-Shot.git")

# Set permissions
run_step("Setting script permissions", "chmod +x ../FARHAN-Shot/FARHAN-Shot.py")

# Final message
print(f"""{cyan}{bold}
🎉 Installation Complete!

To launch the tool, run:
{yellow}sudo python FARHAN-Shot/FARHAN-Shot.py -i wlan0 -K{cyan}

🚨 Use responsibly. For help, contact:
{green}Telegram: @FARHAN_MUH_TASIM

{reset}""")
