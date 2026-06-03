# File Transfer Helper
# Usage: pwsh transfer.ps1  or  .\transfer.ps1

function Show-Divider { Write-Host " ------------------------------" -ForegroundColor Cyan }

Write-Host ""
Write-Host " ==============================" -ForegroundColor Cyan
Write-Host "      File Transfer Helper" -ForegroundColor Cyan
Write-Host " ==============================" -ForegroundColor Cyan
Write-Host ""
Write-Host " File Providers:"
Write-Host "   1) catbox.moe    permanent   200 MB"
Write-Host "   2) transfer.sh   14 days     10 GB"
Write-Host "   3) 0x0.st        long-term   512 MB"
Write-Host "   4) file.io       1 download  100 MB"
Write-Host ""
$prov     = Read-Host " Choose provider (1-4)"
Write-Host ""
$filepath = Read-Host " File path"
$basename = [System.IO.Path]::GetFileName($filepath)

$note = ""
$upload = switch ($prov) {
    "1" { "curl.exe -F `"reqtype=fileupload`" -F `"fileToUpload=@$filepath`" https://catbox.moe/user/api.php" }
    "2" { "curl.exe --upload-file `"$filepath`" https://transfer.sh/$basename" }
    "3" { "curl.exe -F `"file=@$filepath`" https://0x0.st" }
    "4" { $note = "file.io returns JSON - copy the value of the link key as the URL."
          "curl.exe -F `"file=@$filepath`" https://file.io" }
    default { Write-Host " Invalid choice." -ForegroundColor Red; exit 1 }
}

Write-Host ""
Show-Divider
Write-Host " Upload command:"
Write-Host ""
Write-Host "   $upload" -ForegroundColor Green
Write-Host ""
if ($note) {
    Write-Host "   NOTE: $note" -ForegroundColor Yellow
    Write-Host ""
}
Show-Divider

Write-Host ""
Write-Host " Run the command above, then paste the returned URL here."
Write-Host " (Press Enter to skip and get a generic command)"
Write-Host ""
$resultUrl = Read-Host " Paste URL"

Write-Host ""
Show-Divider
if ([string]::IsNullOrWhiteSpace($resultUrl)) {
    Write-Host " Download command (replace <URL>):"
    Write-Host ""
    Write-Host "   curl.exe -O <URL>" -ForegroundColor Green
} else {
    Write-Host " Download command:"
    Write-Host ""
    Write-Host "   curl.exe -O $resultUrl" -ForegroundColor Green
}
Show-Divider
Write-Host ""
