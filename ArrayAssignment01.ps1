<#
=========================================================
POWERSHELL ARRAY OPERATIONS LAB
Author: Teo Espero
Description:
This script demonstrates how to:

1. Find the second largest element
2. Find the second smallest element
3. Find the middle element (by position)
4. Search array elements containing a specific word
5. Sort arrays in ascending and descending order
6. Export matching data to a text file
7. Process array elements and format output messages

=========================================================
#>


# =========================================================
# PART 1: ARRAY OPERATIONS
# =========================================================

<#
The array below contains integer values.

We will:
- Sort the array
- Find the second smallest number
- Find the second largest number
- Find the middle element by position
#>

clear

$array = @(200,343,4,23,42,3,42,99,100)

Write-Host "===================================="
Write-Host "PART 1: NUMBER ARRAY OPERATIONS"
Write-Host "===================================="

# Display original array
Write-Host "Original Array:"
Write-Host ($array -join ", ")

<#
STEP 1: SORT THE ARRAY

Sort-Object sorts numbers in ascending order.

Original:
200,343,4,23,42,3,42,99,100

Sorted:
3,4,23,42,42,99,100,200,343
#>

$sortedArray = $array | Sort-Object

Write-Host "`nSorted Array:"
Write-Host ($sortedArray -join ", ")


<#
STEP 2: FIND SECOND SMALLEST ELEMENT

Arrays start at index 0.

Example sorted array:
Index 0 = 3
Index 1 = 4

Therefore:
The second smallest value is index 1
#>

$secondSmallest = $sortedArray[1]

Write-Host "`nSecond Smallest Element:"
Write-Host $secondSmallest


<#
STEP 3: FIND SECOND LARGEST ELEMENT

Negative indexing starts from the end.

[-1] = last element = 343
[-2] = second to last = 200

Therefore:
Second largest = 200
#>

$secondLargest = $sortedArray[-2]

Write-Host "`nSecond Largest Element:"
Write-Host $secondLargest


<#
STEP 4: FIND MIDDLE ELEMENT BY POSITION

We calculate the middle index using:

Count / 2

Array Count = 9

9 / 2 = 4.5

[Math]::Floor rounds DOWN to 4

Index 4 = 42

Therefore:
Middle element = 42
#>

$middleIndex = [Math]::Floor($array.Count / 2)
$middleElement = $array[$middleIndex]

Write-Host "`nMiddle Element (by position):"
Write-Host $middleElement