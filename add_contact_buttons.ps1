# First-tier pages
$firstTier = @(
    "certifications.html",
    "education.html",
    "extracurriculars.html",
    "goals.html",
    "projects.html",
    "work_experience.html"
)

# Get all second-tier pages (files with _ in the name, but not index.html)
$secondTier = Get-ChildItem -Path . -Filter "*_*.html" -File | Where-Object { $_.Name -ne "index.html" } | Select-Object -ExpandProperty Name

# Combine all files that need the button
$allFiles = $firstTier + $secondTier | Select-Object -Unique

foreach ($file in $allFiles) {
    if (Test-Path $file) {
        $content = Get-Content -Path $file -Raw
        
        # Add contact button before the closing body tag
        $contactButton = "    <a href=\"contact.html\" class=\"contact-me-btn\">Contact Me</a>\n</body>"
        $updatedContent = $content -replace "</body>", $contactButton
        
        $updatedContent | Set-Content -Path $file -NoNewline
    }
}

Write-Host "Contact Me buttons have been added to all first and second-tier pages"
