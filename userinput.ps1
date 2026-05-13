[string] $MyName = Read-Host "What is your name? "
[int] $Year_born = Read-Host "What year were you born? "
[int] $Todays_Age = 2026 - $Year_born
[char] [validateSet("y", "Y", "n", "N")] $User_Reponse = Read-Host "Want to enter a secret word (y/n)? "

Write-Host "Hello" $MyName"."
Write-Host "You are now" $Todays_Age "year's old."

