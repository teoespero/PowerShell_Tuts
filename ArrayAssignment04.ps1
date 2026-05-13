# ---------------------------------------------------------
# OPERATION 4:
# Process array and create statements
# ---------------------------------------------------------

<#
We use a foreach loop to process each course.

The split("#") method separates the string
into pieces.

Example:

course1 # Learning Task Automations # Vijay

Becomes:

[0] course1
[1] Learning Task Automations
[2] Vijay

Trim() removes extra spaces.

ToUpper() converts text to uppercase.
#>
clear

Write-Host "`n4. Invitation Statements:"
Write-Host "-----------------------------------"

foreach ($course in $my_courses) {

    # Split text using #
    $parts = $course -split "#"

    # Clean spaces
    $courseName = $parts[1].Trim().ToUpper()
    $author = $parts[2].Trim()

    # Print statement
    Write-Host "Hi. you are invited to join me in $courseName whose author is $author"
}
