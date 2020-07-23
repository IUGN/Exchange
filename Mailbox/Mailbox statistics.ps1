Get-MailboxStatistics –Database Database1 | Select-Object Alias, ItemCount, TotalItemSize |
Export-Csv Stats.Csv -NoTypeInformation