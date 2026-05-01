<#---------------------------------------------------------------
    Taxi Plate Collection Script
    Teo Espero, MCWD IT Administrator
    05-01-2026

    Description:
    This script collects taxi plate numbers from the user and stores
    them in a dynamic list (ArrayList). It uses a loop to allow
    repeated input and displays the collected data at the end.

    Key Concepts:
    - ArrayList for dynamic storage
    - Read-Host for user input
    - while loop for repeated execution
    - ValidateSet for input validation
    - Case-insensitive comparison using -ieq
---------------------------------------------------------------#>

Clear-Host   # Clears the console for a clean start

# Create ArrayList (dynamic list that supports .Add())
$Taxi_List = New-Object System.Collections.ArrayList

# Initialize user response to "Y" so the loop runs at least once
[char] [ValidateSet("y", "Y", "n", "N")] $User_Response = "Y"

# Loop continues while user enters "Y" or "y"
while ($User_Response -ieq "y") {

    # Prompt user for taxi plate input
    $Taxi = Read-Host "Enter taxi plates"

    # Add input to ArrayList
    # Out-Null suppresses the index output from .Add()
    $Taxi_List.Add($Taxi) | Out-Null

    # Ask user if they want to continue
    # ValidateSet restricts input to allowed values only
    [char] [ValidateSet("y", "Y", "n", "N")] $User_Response = Read-Host "Want to enter more plates (y/n)?"
}

# Display collected results
Write-Host "`nTaxi Plates Entered:"
$Taxi_List