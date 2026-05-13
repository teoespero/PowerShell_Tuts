#---------------------------------------------------------------------------------
# Simple Interest Calculator
# 05-01-2026
# Simple interest calculation on any principle amount involves variables 
# like Principal amount, Interest rate and tenure for which you are calculating SI
# Simple interest can be calculated by using below formula
#
#         SI = P * R * T / 100
#         where,
#         P = Principal amount
#         R = Rate of Interest
#         T = Time(in years)
#---------------------------------------------------------------------------------

clear-host

[float] $nPrincipal = Read-Host "Principal amount"
[float] $nInterestRate = Read-Host "Interest rate (%)" 
[float] $nInterestPercentage = $nInterestRate / 100.00
[float] $nTimeInYears = Read-Host "Loan duration in years"
[float] $nAnnualInterest = 0.0
[float] $nTotalAmountDue = 0.0

$nAnnualInterest = ($nPrincipal * $nInterestRate * $nTimeInYears)
$nTotalAmountDue = $nPrincipal + ($nAnnualInterest * $nTimeInYears)

Write-Host "Annual Interest: $" $nAnnualInterest.ToString("N2")
Write-Host "Total amount due: $" $nTotalAmountDue.ToString("N2")
