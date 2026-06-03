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

---

## Requirements

- curl - built into Windows 10/11, macOS, and most Linux distributions
- Python version - Python 3.6 or later, no third-party packages
- Bash version - any POSIX-compatible shell

---

---

## Disclaimer

This tool is a convenience wrapper that constructs `curl` commands pointing to third-party file hosting services. The authors of this project have no affiliation with, control over, or responsibility for any of these services.

**By using this tool, you acknowledge and agree that:**

- You are solely responsible for any data you choose to upload.
- Uploaded data is transmitted to and stored on servers operated by third parties. The authors of this project have no knowledge of, access to, or control over how those servers handle your data.
- No guarantees are made regarding the availability, reliability, retention, security, or privacy practices of any listed provider. Provider behavior may change at any time without notice.
- This tool is **not intended for sensitive, confidential, personal, or proprietary data** of any kind.
- The authors of this project shall not be held liable for any loss, exposure, misuse, or damage arising from the use of this tool or any third-party service it references.

Providers and their terms of service are subject to change. Always review a provider's terms before uploading anything.

**This software is provided "as is", without warranty of any kind, express or implied.**

---

## License

MIT
