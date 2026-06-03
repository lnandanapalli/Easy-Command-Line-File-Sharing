# curl-transfer

Interactive CLI helper to upload files to public curl-friendly hosts and get the download command. No browser, no GUI, no dependencies beyond curl itself.

Available in Bash, Batch, PowerShell, and Python.

---

## Usage

| Script | Command |
|---|---|
| `transfer.sh` | `chmod +x transfer.sh && ./transfer.sh` |
| `transfer.bat` | `transfer.bat` |
| `transfer.ps1` | `.\transfer.ps1` |
| `transfer.py` | `python transfer.py` |

---

## Flow

1. Pick a provider from the list
2. Enter the file path
3. Run the upload command shown in the terminal
4. Paste the returned URL to get the download command
5. Press Enter without pasting to get a generic `curl -O <URL>` template

---

## Providers

| | Provider | Retention | Max Size |
|---|---|---|---|
| 1 | [catbox.moe](https://catbox.moe) | Permanent | 200 MB |
| 2 | [transfer.sh](https://transfer.sh) | 14 days | 10 GB |
| 3 | [0x0.st](https://0x0.st) | Long-term | 512 MB |
| 4 | [file.io](https://file.io) | 1 download | 100 MB |

Note: file.io burns on first download. The upload response is JSON - extract the `link` value as the URL.

---

## Requirements

- curl - built into Windows 10/11, macOS, and most Linux distributions
- Python version - Python 3.6 or later, no third-party packages
- Bash version - any POSIX-compatible shell

---

## License

MIT
