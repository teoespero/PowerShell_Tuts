
# =========================================================
# PART 2: STRING ARRAY OPERATIONS
# =========================================================

<#
This array contains course information.

Format:

course number # course title # author
#>

Clear

$my_courses = @(
    "course1 # Learning Task Automations # Vijay",
    "course2 # Advanced Scripting & tool making # Vijay",
    "course3 # AD Management using PowerShell /In progress # Vijay"
)

Write-Host "`n===================================="
Write-Host "PART 2: COURSE ARRAY OPERATIONS"
Write-Host "===================================="

Write-Host "`nOriginal Course Array:"
$my_courses


# ---------------------------------------------------------
# OPERATION 1:
# Select elements containing word "task"
# ---------------------------------------------------------

<#
Where-Object filters data.

-match searches for a word or pattern.

PowerShell search is case-insensitive by default.

This means:
"task"
matches:
"Task"
"TASK"

Only courses containing "task" will be returned.
#>

$taskCourses = $my_courses | Where-Object {
    $_ -match "task"
}

Write-Host "`n1. Courses Containing Word 'task':"
$taskCourses


# ---------------------------------------------------------
# OPERATION 2:
# Sort array ascending and descending
# ---------------------------------------------------------

<#
Sort-Object sorts alphabetically.

Ascending:
A → Z

Descending:
Z → A
#>

$ascendingOrder = $my_courses | Sort-Object
$descendingOrder = $my_courses | Sort-Object -Descending

Write-Host "`n2A. Ascending Order:"
$ascendingOrder

Write-Host "`n2B. Descending Order:"
$descendingOrder
