<#------------------------------------------------------------
    This is a test script that will display a quick message
    and then show the var name and the type of data it holds
--------------------------------------------------------------#>

[string] $My_Message = ""
[int] $char_length = 0

Set-Variable -Name "My_Message" -Value "Hello World"

Clear-Host

Write-Host (Get-Variable My_Message).Name "is of type" $My_Message.GetType()
Write-Host (Get-Variable My_Message).Name "contains" $My_Message
$char_length = $My_Message.Length
Write-Host (Get-Variable My_Message).Name "has" $char_length "characters"

Set-Variable -Name "My_Message" -Value "The quick brown fox jumped over the lazy dog"
Write-Host (Get-Variable My_Message).Name "now contains" $My_Message
$char_length = $My_Message.Length
Write-Host (Get-Variable My_Message).Name "now has" $char_length "characters"