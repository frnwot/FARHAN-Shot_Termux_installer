import os
import time

# Define colors
RED = '\033[1;31m'
GREEN = '\033[1;32m'
YELLOW = '\033[1;33m'
BLUE = '\033[1;34m'
MAGENTA = '\033[1;35m'
CYAN = '\033[1;36m'
BOLD = '\033[1m'
RESET = '\033[0m'

def print_banner():
    print(f"""{CYAN}{BOLD}
╔════════════════════════════════════════════════╗
║       🚀 FARHAN Shot Installer By frn           ║
╚════════════════════════════════════════════════╝
{RESET}""")

def run_command(command, description):
    print(f"{YELLOW}[➜] {description}...{RESET}")
    time.sleep(0.8)
    exit_code = os.system(command)
    if exit_code == 0:
        print(f"{GREEN}[✔] Success: {description}{RESET}\n")
        return True
    else:
        print(f"{RED}[✘] Failed: {description}{RESET}\n")
        return False

def main():
    print_banner()
    print(f"{MAGENTA}⚠️  Your device must be rooted to run this installer properly!{RESET}\n")
    
    steps = [
        ("Updating and upgrading packages", "pkg update && pkg upgrade -y"),
        ("Installing root-repo", "pkg install root-repo -y"),
        ("Installing required packages (git, tsu, python, wpa-supplicant, pixiewps, iw, openssl)", 
         "pkg install git tsu python wpa-supplicant pixiewps iw openssl -y"),
        ("Setting up Termux storage permissions", "termux-setup-storage"),
        ("Cloning FARHAN-Shot repository", "git clone --depth 1 https://github.com/frnwot/FARHAN-Shot.git"),
    ]

    success = True
    for desc, cmd in steps:
        if not run_command(cmd, desc):
            success = False
            print(f"{RED}{BOLD}Aborting installation due to error in step: {desc}{RESET}")
            break
    
    if success:
        print(f"""{CYAN}{BOLD}
🎉 Installation Completed Successfully!

To run FARHAN Shot, execute this command from your HOME directory:

{YELLOW}sudo python FARHAN-Shot/FARHAN-Shot.py -i wlan0 -K

{CYAN}Make sure to replace 'wlan0' with your wireless interface if different.

For any help or support, contact: {GREEN}@FARHAN_MUH_TASIM{RESET}
""")
    else:
        print(f"{RED}{BOLD}Installation did not complete successfully. Please fix errors and try again.{RESET}")

if __name__ == "__main__":
    main()
