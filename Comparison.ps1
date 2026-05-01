<#---------------------------------------------------------------
    Revised UserInput
    Teo Espero, MCWD IT Administrator
    05-01-2026

    Description:
    This script demonstrates basic user input handling in PowerShell,
    including type casting, conditional logic (if/else), and working
    with SecureString values.

    Key Concepts Covered:
    - Read-Host input collection
    - Data type casting (string, int, char)
    - Conditional logic using if/else
    - SecureString handling and conversion to plaintext (for demo only)
---------------------------------------------------------------#>

Clear-Host   # Clears the console screen for a clean run

# Prompt user for name (stored as string)
[string] $MyName = Read-Host "What is your name?"

# Prompt user for birth year (stored as integer)
[int] $Year_born = Read-Host "What year were you born?"

# Calculate age based on current year
[int] $Todays_Age = 2026 - $Year_born

# Prompt user for Y/N response
# ValidateSet restricts input to allowed values
[char] [ValidateSet("y", "Y", "n", "N")] $User_Response = Read-Host "Want to enter a secret word (y/n)?"

# Display basic user information
Write-Host "Hello $MyName."
Write-Host "You are now $Todays_Age year's old."

# Check if user wants to enter a secret message
if ($User_Response.ToString().ToUpper() -eq "Y") {

    # Remove variable if it exists to avoid type conflicts
    Remove-Variable SecretMessage -ErrorAction SilentlyContinue

    # Prompt for secure input (hidden from screen)
    $SecretMessage = Read-Host "Enter secret message" -AsSecureString

    # Initialize pointer for unmanaged memory
    $BSTR = [IntPtr]::Zero

    try {
        # Convert SecureString to unmanaged memory (BSTR)
        $BSTR = [Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecretMessage)

        # Convert unmanaged memory to plaintext string
        $PlainText = [Runtime.InteropServices.Marshal]::PtrToStringBSTR($BSTR)

        # Display values
        # NOTE: SecureString will not display actual content
        Write-Host "Secret (SecureString object): " $SecretMessage
        Write-Host "PlainText (for demo only): $PlainText"
    }
    finally {
        # Clean up unmanaged memory to avoid exposure
        if ($BSTR -ne [IntPtr]::Zero) {
            [Runtime.InteropServices.Marshal]::ZeroFreeBSTR($BSTR)
        }
    }

} else {
    # If user selects "N"
    Write-Host "No secret message entered"
}