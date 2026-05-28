$template = Get-Content -Path "./templates/secondary_template.html" -Raw

# Define the files and their specific content
$files = @(
    @{
        Path = "./work_experience_2.html"
        Title = "Job Title"
        Company = "Company Name"
        Duration = "Month Year - Month Year"
        Responsibilities = @(
            "Responsibility 1",
            "Responsibility 2",
            "Responsibility 3"
        )
        Skills = @("Skill 1", "Skill 2", "Skill 3")
    },
    @{
        Path = "./extracurricular_1.html"
        Title = "Activity/Role"
        Company = "Organization Name"
        Duration = "Month Year - Month Year"
        Responsibilities = @(
            "Responsibility/Contribution 1",
            "Responsibility/Contribution 2"
        )
        Skills = @("Skill 1", "Skill 2")
    },
    @{
        Path = "./extracurricular_2.html"
        Title = "Activity/Role"
        Company = "Organization Name"
        Duration = "Month Year - Month Year"
        Responsibilities = @(
            "Responsibility/Contribution 1",
            "Responsibility/Contribution 2"
        )
        Skills = @("Skill 1", "Skill 2")
    },
    @{
        Path = "./education_1.html"
        Title = "Degree/Program"
        Company = "Institution Name"
        Duration = "Month Year - Month Year"
        Responsibilities = @(
            "Key Achievement/Project 1",
            "Key Achievement/Project 2"
        )
        Skills = @("Skill 1", "Skill 2", "Skill 3")
    },
    @{
        Path = "./certifications_1.html"
        Title = "Certification Name"
        Company = "Issuing Organization"
        Duration = "Month Year"
        Responsibilities = @(
            "Key Learning/Application 1",
            "Key Learning/Application 2"
        )
        Skills = @("Skill 1", "Skill 2")
    },
    @{
        Path = "./goals_1.html"
        Title = "Goal/Objective"
        Company = "Category/Area"
        Duration = "Timeline"
        Responsibilities = @(
            "Action Item 1",
            "Action Item 2"
        )
        Skills = @("Skill 1", "Skill 2")
    }
)

foreach ($file in $files) {
    $content = $template -replace '\{\{PAGE_TITLE\}\}', (Split-Path $file.Path -LeafBase).Replace("_", " ").ToUpper()
    $content = $content -replace '\{\{PAGE_HEADING\}\}', (Split-Path $file.Path -LeafBase).Split("_")[0].ToUpper()
    $content = $content -replace '\{\{TITLE\}\}', $file.Title
    $content = $content -replace '\{\{COMPANY\}\}', $file.Company
    $content = $content -replace '\{\{DURATION\}\}', $file.Duration
    
    # Build responsibilities list
    $responsibilities = ""
    foreach ($item in $file.Responsibilities) {
        $responsibilities += "<li style=`"margin-bottom: 0.75rem; line-height: 1.6;`">$item</li>`n"
    }
    $content = $content -replace '\{\{RESPONSIBILITIES\}\}', $responsibilities
    
    # Build skills list
    $skills = ""
    foreach ($skill in $file.Skills) {
        $skills += "<span class=`"skill-tag`" style=`"background: rgba(94, 214, 255, 0.2); color: #5ed6ff; padding: 0.35rem 0.75rem; border-radius: 15px; font-size: 0.85rem;`">$skill</span>`n"
    }
    $content = $content -replace '\{\{SKILLS\}\}', $skills
    
    # Save the file
    $content | Out-File -FilePath $file.Path -Encoding utf8
    Write-Host "Updated: $($file.Path)"
}

Write-Host "All secondary pages have been updated with the new layout."
