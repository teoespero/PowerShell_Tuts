# ---------------------------------------------------------
# OPERATION 3:
# Write matching elements to text file
# ---------------------------------------------------------

<#
Out-File writes data to a file.

The file path:
C:\Temp\task_courses.txt

If C:\Temp does not exist,
we create it using New-Item.
#>

clear

$outputFolder = "C:\Temp"
$outputFile = "$outputFolder\task_courses.txt"

# Create folder if missing
if (!(Test-Path $outputFolder)) {

    New-Item `
        -ItemType Directory `
        -Path $outputFolder | Out-Null
}

# Export matching courses
$taskCourses | Out-File $outputFile

Write-Host "`n3. File Created:"
Write-Host $outputFile