@echo off
setlocal enabledelayedexpansion
title File Transfer Helper

echo.
echo  ==============================
echo       File Transfer Helper
echo  ==============================
echo.
echo  File Providers:
echo    1^) catbox.moe    permanent   200 MB
echo    2^) transfer.sh   14 days     10 GB
echo    3^) 0x0.st        long-term   512 MB
echo    4^) file.io       1 download  100 MB
echo.
set /p "PROV=Choose provider (1-4): "
echo.
set /p "FILEPATH=File path: "

set "UPLOAD="
set "NOTE="

if "!PROV!"=="1" set "UPLOAD=curl.exe -F "reqtype=fileupload" -F "fileToUpload=@!FILEPATH!" https://catbox.moe/user/api.php"
if "!PROV!"=="2" set "UPLOAD=curl.exe --upload-file "!FILEPATH!" https://transfer.sh/!FILEPATH!"
if "!PROV!"=="3" set "UPLOAD=curl.exe -F "file=@!FILEPATH!" https://0x0.st"
if "!PROV!"=="4" set "UPLOAD=curl.exe -F "file=@!FILEPATH!" https://file.io"
if "!PROV!"=="4" set "NOTE=file.io returns JSON - copy the value of the link key as the URL."

if "!UPLOAD!"=="" (
    echo  Invalid choice.
    goto END
)

echo.
echo  ------------------------------
echo  Upload command:
echo.
echo    !UPLOAD!
echo.
if not "!NOTE!"=="" echo    NOTE: !NOTE! && echo.
echo  ------------------------------

echo.
echo  Run the command above, then paste the returned URL here.
echo  (Press Enter to skip and get a generic command)
echo.
set /p "RESULT_URL=Paste URL: "

echo.
echo  ------------------------------
if "!RESULT_URL!"=="" (
    echo  Download command ^(replace ^<URL^>^):
    echo.
    echo    curl.exe -O ^<URL^>
) else (
    echo  Download command:
    echo.
    echo    curl.exe -O !RESULT_URL!
)
echo  ------------------------------
echo.

:END
endlocal
pause
