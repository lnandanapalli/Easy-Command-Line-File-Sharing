#!/bin/bash

# File Transfer Helper
# Upload a file via curl and get the download command.

BOLD="\033[1m"
CYAN="\033[1;36m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
RESET="\033[0m"

echo ""
echo -e "${CYAN} =============================="
echo -e "      File Transfer Helper"
echo -e " ==============================${RESET}"
echo ""
echo -e "${BOLD}File Providers:${RESET}"
echo "  1) catbox.moe    permanent   200 MB"
echo "  2) transfer.sh   14 days     10 GB"
echo "  3) 0x0.st        long-term   512 MB"
echo "  4) file.io       1 download  100 MB"
echo ""
read -rp "Choose provider (1-4): " PROV
echo ""
read -rp "File path: " FILEPATH

NOTE=""
case "$PROV" in
    1) UPLOAD="curl -F 'reqtype=fileupload' -F 'fileToUpload=@${FILEPATH}' https://catbox.moe/user/api.php" ;;
    2) UPLOAD="curl --upload-file '${FILEPATH}' https://transfer.sh/$(basename "${FILEPATH}")" ;;
    3) UPLOAD="curl -F 'file=@${FILEPATH}' https://0x0.st" ;;
    4) UPLOAD="curl -F 'file=@${FILEPATH}' https://file.io"
       NOTE="file.io returns JSON - copy the value of the link key as the URL." ;;
    *) echo "Invalid choice."; exit 1 ;;
esac

echo ""
echo -e "${CYAN} ------------------------------${RESET}"
echo -e "${BOLD}Upload command:${RESET}"
echo ""
echo -e "  ${GREEN}${UPLOAD}${RESET}"
echo ""
if [ -n "$NOTE" ]; then
    echo -e "  ${YELLOW}NOTE: ${NOTE}${RESET}"
    echo ""
fi
echo -e "${CYAN} ------------------------------${RESET}"

echo ""
echo "Run the command above, then paste the returned URL here."
echo "(Press Enter to skip and get a generic command)"
echo ""
read -rp "Paste URL: " RESULT_URL

echo ""
echo -e "${CYAN} ------------------------------${RESET}"
if [ -z "$RESULT_URL" ]; then
    echo -e "${BOLD}Download command (replace <URL>):${RESET}"
    echo ""
    echo -e "  ${GREEN}curl -O <URL>${RESET}"
else
    echo -e "${BOLD}Download command:${RESET}"
    echo ""
    echo -e "  ${GREEN}curl -O ${RESULT_URL}${RESET}"
fi
echo -e "${CYAN} ------------------------------${RESET}"
echo ""
