# Get all mailboxes which are currently hidden from the address list
$Mailboxes = Get-Mailbox | Where-Object { $_.HiddenFromAddressListsEnabled –eq $true }
# Process each Mailbox in the collection and un-hide it from the address list
foreach ($Mailbox in $Mailboxes) {
    $Mailbox | Set-Mailbox –HiddenFromAddressListsEnabled $false
}