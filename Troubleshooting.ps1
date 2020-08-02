# Analyze services
Test-ServiceHealth –Server LON-EX1

# Verify the status of the mailbox database
Get-MailboxDatabase –Status | fl Name, Mount*
Get-MailboxDatabase | Test-MAPIConnectivity

# Troubleshooting database replication
Test-ReplicationHealth -Identity LON-EX1
Get-DatabaseAvailabilityGroup DAG1 | % Servers | % { Test-ReplicationHealth -Identity $_ }
Get-MailboxDatabaseCopyStatus -Identity ExecutivesDB
Get-MailboxDatabaseCopyStatus

.\CollectOverMetrics.ps1 –DatabaseAvailabilityGroup DAG1 –Database:”ExecutivesDB” –GenerateHtmlReport -ShowHtmlReport
.\CollectReplicationMetrics.ps1 –DagName DAG1 –Duration “02:00:00” –Frequency “00:00:30” -ReportPath

# Troubleshooting transport components
[xml]$bp = Get-ExchangeDiagnosticInfo -Server LON-EX1 -Process EdgeTransport -Component ResourceThrottling;
$bp.Diagnostics.Components.ResourceThrottling.ResourceTracker.ResourceMeter
Test-EdgeSynchronization