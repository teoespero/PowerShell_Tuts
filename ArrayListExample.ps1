<#---------------------------------------------------------------
    Taxi Plate Collection with Input Validation
    Teo Espero, MCWD IT Administrator
    05-01-2026

    Description:
    This script collects taxi plate numbers from the user using a loop.
    It validates user input for yes/no responses, prevents duplicates,
    and exits cleanly if invalid input is entered twice.

    Key Concepts:
    - User input handling with Read-Host
    - Input validation without ValidateSet (prevents script crash)
    - while loop for repeated execution
    - HashSet for automatic uniqueness
    - String normalization (Trim + ToUpper)
---------------------------------------------------------------#>

Clear-Host   # Clears the console screen

# Create a HashSet to store unique taxi plates
$Taxi_List = [System.Collections.Generic.HashSet[string]]::new()

<#---------------------------------------------------------------
    Function: Get-YesNo
    Purpose:
    Prompts the user for a Y/N response.
    - If invalid input is entered, user gets one retry.
    - If still invalid, function returns $null.
---------------------------------------------------------------#>
function Get-YesNo {

    # First attempt
    $response = Read-Host "Want to enter taxi plates? (y/n)"

    # Check if input is invalid
    if ($response -notin @("y","Y","n","N")) {
        Write-Host "Invalid input. Please enter Y or N."

        # Second attempt
        $response = Read-Host "Try again (y/n)"

        # If still invalid, return null
        if ($response -notin @("y","Y","n","N")) {
            Write-Host "Invalid again. Exiting."
            return $null
        }
    }

    return $response
}

# Get initial user response
$User_Response = Get-YesNo

# Exit script if user fails validation twice
if (-not $User_Response) {
    return
}

<#---------------------------------------------------------------
    Main Loop:
    Continues collecting taxi plates while user enters "Y"
---------------------------------------------------------------#>
while ($User_Response -ieq "y") {

    # Prompt for taxi plate
    $Taxi = Read-Host "Enter taxi plates"

    # Validate non-empty input
    if ([string]::IsNullOrWhiteSpace($Taxi)) {
        Write-Host "Invalid input. Skipping..."
        continue
    }

    # Normalize input (remove spaces, enforce uppercase)
    $Taxi = $Taxi.Trim().ToUpper()

    # Attempt to add to HashSet (prevents duplicates)
    if (-not $Taxi_List.Add($Taxi)) {
        Write-Host "Duplicate entry. Plate already exists."
    }

    # Ask user if they want to continue
    $User_Response = Get-YesNo

    # Exit loop if validation fails
    if (-not $User_Response) {
        break
    }
}

# Display collected taxi plates
Write-Host "`nTaxi Plates Entered:"
$Taxi_List