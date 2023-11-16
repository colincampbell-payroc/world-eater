#!/usr/bin/perl

use strict;
use warnings;

my @list = qw{
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-core
    cal-app-dss
    cal-app-dss
    cal-app-dss
    cal-app-dss
    cal-app-dss
    cal-app-dss
    Caledon-Acquiring-Merchant-Funding-EFT
    Caledon-Acquiring-Reporting-Risk-VisaFraudChargebackMonitoring
    Caledon-Acquiring-TSysDisputesMCRDBatchmaster
    Caledon-Acquiring-TsysReports
    Caledon-Acquiring-Visa-Chargebacks
    Caledon-Acquiring-Visa-ClearingReconciliation
    caledon-api-boarding
    caledon-api-conveniencefees
    caledon-api-glxair
    caledon-api-pad
    Caledon-AuthProxy-Amex
    Caledon-AuthProxy-Discover
    Caledon-AuthProxy-encrypt_logs
    Caledon-AuthProxy-FirstDataGMA
    Caledon-AuthProxy-MasterCard
    Caledon-AuthProxy-Monitor
    Caledon-AuthProxy-Visa
    Caledon-Batch-AirBatch
    Caledon-Batch-InboxMonitor
    Caledon-Batch-InFlightBatch
    Caledon-Batch-L1Batch
    Caledon-Batch-L23Batch
    Caledon-Batch-LogWatcher
    Caledon-Batch-PanasonicIFE
    Caledon-Batch-RejectArchiver
    Caledon-Batch-STSBatch
    Caledon-Batch-TokenBatch
    Caledon-Blacklist-KLM
    Caledon-Bluefin-DecryptxClient
    Caledon-Boarding-ApiIncomingAlert
    Caledon-Boarding-ApiUserSync
    Caledon-Boarding-Notifier
    Caledon-CardPaymentRisk
    Caledon-Egon-Clortho
    Caledon-Egon-Zuul
    Caledon-Egon-Zuul
    Caledon-Egon-Zuul
    Caledon-Egon-Zuul
    Caledon-Egon-Zuul
    Caledon-HPP-HPPv1
    Caledon-HPP-HPPv3
    Caledon-HSM-HSMClient
    Caledon-HSM-HSMServer
    Caledon-Monitors-PAD
    Caledon-Monitors-Redundant
    Caledon-Pad-Notification
    Caledon-Pad-Risk"
    Caledon-PaymentApiMonitor
    Caledon-Repay-rps_client_interface
    Caledon-Repay-rps_scheduler
    caledon-service-boarding-autoapproval
    caledon-service-cardinfo
    caledon-service-conveniencefees
    caledon-service-mastercardmipproxy
    caledon-service-padbin
    caledon-service-risk
    caledon-service-visaincoming
    Caledon-Tokenator-Bin
    Caledon-Tokenator-Report
    Caledon-Tokenator-Tokenator
    caledon-ui-boarding
    caledon-ui-glxairadmin
    caledon-ui-mcf
    caledon-ui-padadmin
};

my %hash;
for my $word (@list) {
    $hash{$word} = 1;
}

for my $key ( keys %hash ) {
    print $key . "\n";
}
