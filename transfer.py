#!/usr/bin/env python3
"""
File Transfer Helper
Upload a file via curl and get the download command.
Works on Windows (curl.exe), Linux, and macOS.
"""

import os
import sys
import platform

IS_WIN = platform.system() == "Windows"
CURL   = "curl.exe" if IS_WIN else "curl"

PROVIDERS = [
    ("catbox.moe",  "permanent   200 MB"),
    ("transfer.sh", "14 days     10 GB"),
    ("0x0.st",      "long-term   512 MB"),
    ("file.io",     "1 download  100 MB"),
]

DIV = " ------------------------------"

def ask(prompt, valid):
    while True:
        val = input(prompt).strip()
        if val in valid:
            return val
        print(f"  Enter one of: {', '.join(valid)}")

def main():
    print()
    print(" ==============================")
    print("      File Transfer Helper")
    print(" ==============================")
    print()
    print("File Providers:")
    for i, (name, info) in enumerate(PROVIDERS, 1):
        print(f"  {i}) {name:<14} {info}")
    print()

    prov = ask("Choose provider (1-4): ", ["1", "2", "3", "4"])
    print()
    fp       = input("File path: ").strip()
    basename = os.path.basename(fp)

    note = ""
    if prov == "1":
        upload = f'{CURL} -F "reqtype=fileupload" -F "fileToUpload=@{fp}" https://catbox.moe/user/api.php'
    elif prov == "2":
        upload = f'{CURL} --upload-file "{fp}" https://transfer.sh/{basename}'
    elif prov == "3":
        upload = f'{CURL} -F "file=@{fp}" https://0x0.st'
    elif prov == "4":
        upload = f'{CURL} -F "file=@{fp}" https://file.io'
        note   = "file.io returns JSON - copy the value of the link key as the URL."

    print()
    print(DIV)
    print("Upload command:")
    print()
    print(f"  {upload}")
    print()
    if note:
        print(f"  NOTE: {note}")
        print()
    print(DIV)

    print()
    print("Run the command above, then paste the returned URL here.")
    print("(Press Enter to skip and get a generic command)")
    print()
    result_url = input("Paste URL: ").strip()

    print()
    print(DIV)
    if not result_url:
        print("Download command (replace <URL>):")
        print()
        print(f"  {CURL} -O <URL>")
    else:
        print("Download command:")
        print()
        print(f"  {CURL} -O {result_url}")
    print(DIV)
    print()

if __name__ == "__main__":
    try:
        main()
    except KeyboardInterrupt:
        print("\n\nCancelled.")
        sys.exit(0)
