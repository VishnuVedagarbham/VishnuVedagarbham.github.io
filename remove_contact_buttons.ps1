$excludeFile = "index.html"
$files = Get-ChildItem -Path . -Filter "*.html" -File | Where-Object { $_.Name -ne $excludeFile }

foreach ($file in $files) {
    $content = Get-Content -Path $file.FullName -Raw
    $updatedContent = $content -replace '<a href="contact\.html" class="contact-btn">.*?</a>', ''
    $updatedContent | Set-Content -Path $file.FullName -NoNewline
}

Write-Host "Contact buttons have been removed from all HTML files except $excludeFile"
