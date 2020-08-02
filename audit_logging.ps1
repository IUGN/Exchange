# administrator audit logging
# search Set-Mailbox cmdlet usage between 2/16/2016 and 3/16/2016, and send the search results to andreas@adatum.com
New-AdminAuditLogSearch -Cmdlets Set-Mailbox -StartDate 02/16/2016 -EndDate 03/16/2016 -StatusMailRecipients andreas@adatum.com -Name "Mailbox changes report"

# mailbox audit logging
Set-Mailbox -Identity "Andrew Dixon" -AuditEnabled $true
# searches for users who accessed Andrew’s mailbox during 2016, limiting results to 2, 000
Search-MailboxAuditLog -Identity Andrew -LogonTypes Admin, Delegate -StartDate 1/1/2016 -EndDate 12/31/2016 -ResultSize 2000
# searches Terri’s and Jan’s mailboxes for access attempts by administrators and then
# delegates and sends the results to auditors@adatum.com:
New-MailboxAuditLogSearch –Name "Admin and Delegate Access" -Mailboxes "Terri Chudzik", "Jan Dryml " -LogonTypes Admin, Delegate -StartDate 1/1/2016 -EndDate 12/31/2016 -StatusMailRecipients "auditors@adatum.com"
