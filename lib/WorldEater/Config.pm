package WorldEater::Config;

use strict;
use warnings;

sub get_all {
    return {
        directories => {
            adminweb => [
                qw{
                    /home/apinotification /home/batchupload /home/boarding /home/discoverportal /home/emailadmin /home/internalklmadmin /home/lantrans /home/mcf
                    /home/monitor /home/pad /home/peoplestrust /home/reports /home/translookup /home/watcher /home/zuul /usr/lib/cgi-bin
                }
            ],
            api         => [qw{/home/boardingapi /home/paymentapi}],
            authproxy   => [qw{/home/authproxy}],
            batchmaster => [qw{/home/bluefin /home/ccs /home/hsm /home/lansweeper /home/mcrd /home/mip /home/monitor /home/postgres /home/visa /home/zuul}],
            ccs1        => [
                qw{
                    /home/abbas /home/backup /home/checkvpn /home/codereview /home/htmlstats /home/lansweeper /home/mip /home/reports /home/rsnapp
                    /home/tsys /home/watcher /home/wiki/
                }
            ],
            clortho   => [qw{/home/clortho /home/lansweeper}],
            dashboard => [qw{/home/cardinfo /home/ccs /home/kanchan /home/lansweeper /home/ruchi /home/webdash /home/webdashadmin /home/www-data}],
            deposit   => [
                qw{
                    /home/acquiring /home/billing /home/cardinfo /home/CCS /home/ccs /home/deposit /home/lansweeper /home/mip /home/monitor /home/nightrun
                    /home/pad /home/report /home/support /home/tsys /home/visa /home/watcher /home/zuul
                }
            ],
            dfsadmin                  => [qw{/home/discadmin /home/lansweeper /home/zuul}],
            'Discover-portal'         => [qw{/home/lansweeper /home/web_portal}],
            '192.168.168.22'          => [qw{/home/lansweeper /home/web_portal /home/wwwfiles}], # discover-portal-staging
            'discover-prod'           => [qw{/home/billing/ /home/ccs/ /home/discover/ /home/lansweeper/ /home/support/ /home/zuul/}],
            glxair                    => [qw{/home/ccs /home/klm_blacklist /home/lansweeper /home/webglx /home/www-data /var/www}],
            hsm                       => [qw{/home/hsm /home/lansweeper}],
            lt3                       => [qw{ /home/cardinfo /home/lantrans }],
            lt3shared                 => [qw{ /home/lantrans }],
            pad                       => [qw{ /home/padapi }],
            portal                    => [qw{ /home/cardinfo /home/www-data /home/webcvf /home/webdoc }],
            q                         => [qw{ /home/cardinfo /home/dbsync /home/htmlstats /home/maidrept }],
            '10.10.1.82'              => [qw{ /home/dbsync }], # q2
            'repay-12'                => [qw{ /home/repay /home/trans-risk }],
            step1                     => [qw{ /home/hpp /home/hppv3 }],
            tokenator                 => [qw{ /home/report /home/tokenator }],
        },
        grep => {
            command => 'grep',
            options => [
                qw/
                    -irs
                    -E
                    --exclude-dir=.cpan*
                    --exclude-dir=.svn
                    --exclude-dir=jquery*
                    --exclude-dir=local
                    --exclude-dir=log*
                    --exclude-dir=mcf
                    --exclude-dir=perl5
                    --exclude-dir=perlbrew
                    --exclude-dir=session*
                    --exclude-dir=user_files
                    --exclude-dir=logs
                    --exclude-dir=report
                    --exclude-dir=report_out
                    --exclude-dir=reports
                    --exclude-dir=temp
                    --exclude-dir=test
                    --exclude-dir=tmp
                    --exclude-dir=lansweeper
                    --exclude-dir=files
                    --exclude-dir=archive
                    --exclude-dir=archive.bak
                    --exclude-dir=outbox
                    --exclude-dir=tem0805
                    --exclude=.*
                    --exclude=*.[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
                    --exclude=*.dump
                    --exclude=*.gpg
                    --exclude=*.gz
                    --exclude=*.jpg
                    --exclude=*.log
                    --exclude=*.pdf
                    --exclude=*.png
                    --exclude=*.tgz
                    --exclude=*jquery*.css
                    --exclude=*jquery*.js
                    --exclude=log*.txt
                    --exclude=*.list
                    --exclude=nohup.out
                    --exclude=*.csv
                    --exclude=*.xml
                    --exclude=*.response
                    /
            ],
        },
        greps => [
            {   filter => 'dbi->connect',
                type   => 'dbi',
            },
            {   filter => 'DBI:',
                type   => 'dbi',
            },
            {   filter => 'psql',
                type   => 'psql',
            },
            {   filter => 'host',
                type   => 'host',
            },
            {   filter => 'ssh',
                type   => 'ssh',
            },
            {   filter => 'scp',
                type   => 'scp',
            },
            {   filter => 'sftp',
                type   => 'sftp',
            },
            {   filter => 'rsync',
                type   => 'rsync',
            },
            {   filter => 'http',
                type   => 'http',
            },
            {   filter => '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b',
                type   => 'ip',
            },
        ],
        wkhtmltopdf_grep => {
            command => 'grep $options wkhtmltopdf /home 2>/dev/null',
            options => [
                qw/
                    -lr
                    --include=*.cgi
                    --include=*.fcgi
                    --include=*.pl
                    --include=*.pm
                    --include=*.sh
                    --include=*.bash
                    /
            ]
        },
        trycatch_grep => {
            command => 'grep $options \'TryCatch\' /home 2>/dev/null',
            options => [
                qw/
                    -lr
                    --include=*.cgi
                    --include=*.fcgi
                    --include=*.pl
                    --include=*.pm
                    /
            ]
        },
        applications => [
            #{   name               => 'apiweb',
            #    repo_url           => 'git@github.com:payroc/Caledon-ApiNotification.git',
            #    repo_sub_directory => '/anpweb',
            #    repo_branch        => 'master',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/apinotification/apiweb',
            #    ignore_list        => [qw{ log html }]
            #},
            #{   name               => 'batch_upload_admin',
            #    repo_url           => 'git@github.com:payroc/caledon-ui-glxairadmin.git',
            #    repo_sub_directory => '',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/batchupload/batch_upload_admin',
            #    ignore_list        => [qw{ log session storage }]
            #},
            #{   name               => 'boarding',
            #    repo_url           => 'git@github.com:payroc/caledon-ui-boarding.git',
            #    repo_sub_directory => '',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/boarding',
            #    ignore_list        => [
            #        qw{ archive_cleanup.sh backup_boarding.sh Boarding_api_auto_approval Boarding_backup Boarding_files Boarding_key Boarding_keys Boarding_log cron_move_logv2.sh eng_3702 }
            #    ]
            #},
            #{   name               => 'boarding_api_auto_approval',
            #    repo_url           => 'git@github.com:payroc/caledon-service-boarding-autoapproval.git',
            #    repo_sub_directory => '/Boarding_api_auto_approval',
            #    repo_branch        => 'release',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/boarding/Boarding_api_auto_approval',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'discover_portal_admin',
            #    repo_url           => 'git@github.com:payroc/cal-app-dss.git',
            #    repo_sub_directory => '/src/caledon-ui-discover_portal_admin',
            #    repo_branch        => 'main',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/discoverportal',
            #    ignore_list        => [qw{ logs html/discadmin }]
            #},
            #{   name               => 'mcf',
            #    repo_url           => 'git@github.com:payroc/caledon-ui-mcf.git',
            #    repo_sub_directory => '',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/mcf/mcflive',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'monitors',
            #    repo_url           => 'git@github.com:payroc/Caledon-Monitors-Redundant.git',
            #    repo_sub_directory => '/monitors',
            #    repo_branch        => 'master',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/monitor/monitors',
            #    ignore_list        => [qw{ logs }]
            #},
            #{   name               => 'pad_adminweb',
            #    repo_url           => 'git@github.com:payroc/caledon-ui-padadmin.git',
            #    repo_sub_directory => '/pad',
            #    repo_branch        => 'release',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/pad',
            #    ignore_list        => [qw{ keys log }]
            #},
            #{   name               => 'translookup',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/transaction_lookup',
            #    repo_branch        => 'main',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/translookup/prod',
            #    ignore_list        => [qw{ keys logs sessions tmp user bin/backup }]
            #},
            #{   name               => 'zuul_adminweb',
            #    repo_url           => 'git@github.com:payroc/Caledon-Egon-Zuul.git',
            #    repo_sub_directory => '',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/home/zuul/zuul',
            #    ignore_list        => [qw{ bin/nohup.out log log-old var }]
            #},
            #{   name               => 'pad_batch_file_alerts',
            #    repo_url           => 'git@github.com:payroc/Caledon-Monitors-PAD.git',
            #    repo_sub_directory => '',
            #    server_name        => 'adminweb',
            #    path_on_server     => '/root',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'merch_on-boarding',
            #    repo_url           => 'git@github.com:payroc/caledon-api-boarding.git',
            #    repo_sub_directory => '/MerchOnBoarding',
            #    repo_branch        => 'release',
            #    server_name        => 'api',
            #    path_on_server     => '/home/boardingapi/MerchOnBoarding',
            #    ignore_list        => [qw{ ApiIncomingAlert ApiUserSync MerchNotifier MerchOnBoarding_keys MerchOnBoarding_log }]
            #},
            #{   name               => 'api_incoming_alert',
            #    repo_url           => 'git@github.com:payroc/Caledon-Boarding-ApiIncomingAlert.git',
            #    repo_sub_directory => '/ApiIncomingAlert',
            #    repo_branch        => 'master',
            #    server_name        => 'api',
            #    path_on_server     => '/home/boardingapi/ApiIncomingAlert',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'api_user_sync',
            #    repo_url           => 'git@github.com:payroc/Caledon-Boarding-ApiUserSync.git',
            #    repo_sub_directory => '/ApiUserSync',
            #    repo_branch        => 'master',
            #    server_name        => 'api',
            #    path_on_server     => '/home/boardingapi/ApiUserSync',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'merch_notifier',
            #    repo_url           => 'git@github.com:payroc/Caledon-Boarding-Notifier.git',
            #    repo_sub_directory => '/MerchNotifier',
            #    repo_branch        => 'master',
            #    server_name        => 'api',
            #    path_on_server     => '/home/boardingapi/MerchNotifier',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'payment_api',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/payment_api',
            #    repo_branch        => 'main',
            #    server_name        => 'api',
            #    path_on_server     => '/home/paymentapi/paymentapi',
            #    ignore_list        => [qw{ log log-old test user_files var }]
            #},
            #{   name               => 'payment_api_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-PaymentApiMonitor.git',
            #    repo_sub_directory => '',
            #    server_name        => 'api',
            #    path_on_server     => '/home/paymentapi/paymentapi-monitor',
            #    ignore_list        => [qw{ log log-old }]
            #},
            #{   name               => 'pad_notifications',
            #    repo_url           => 'git@github.com:payroc/Caledon-Pad-Notification.git',
            #    repo_sub_directory => '',
            #    server_name        => 'api',
            #    path_on_server     => '/home/paymentapi/Notification',
            #    ignore_list        => [qw{ log log-old }]
            #},
            #{   name               => 'amex_authproxy',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-Amex.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/amex-auth-proxy',
            #    ignore_list        => [qw{ log log-verbose var }]
            #},
            #{   name               => 'discover_authproxy',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-Discover.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/discover-auth-proxy',
            #    ignore_list        => [qw{ log log-verbose var }]
            #},
            #{   name               => 'first_data_authproxy',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-FirstDataGMA.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/firstdatagma-auth-proxy',
            #    ignore_list        => [qw{ log log-verbose var }]
            #},
            #{   name               => 'mastercard_authproxy',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-MasterCard.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/mastercard-auth-proxy',
            #    ignore_list        => [qw{ log log-verbose var }]
            #},
            #{   name               => 'visa_authproxy',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-Visa.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/visa-auth-proxy',
            #    ignore_list        => [qw{ log log-verbose var }]
            #},
            #{   name               => 'encrypt_logs',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-encrypt_logs.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/encrypt_logs',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'authproxy_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-AuthProxy-Monitor.git',
            #    repo_sub_directory => '',
            #    server_name        => 'authproxy',
            #    path_on_server     => '/home/authproxy/Monitors',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'decryptx_client',
            #    repo_url           => 'git@github.com:payroc/Caledon-Bluefin-DecryptxClient.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/bluefin/DecryptxClient',
            #    ignore_list        => [qw{ key log log-old var/*.bluefin_stats.yaml }]
            #},
            #{   name               => 'airbatch',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-AirBatch.git',
            #    repo_sub_directory => '/airbatch',
            #    repo_branch        => 'master',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/airbatch',
            #    ignore_list        => [qw{ archive inbox logs outbox reject var }]
            #},
            #{   name               => 'cardinfo',
            #    repo_url           => 'git@github.com:payroc/caledon-service-cardinfo.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/card_info',
            #    ignore_list        => [qw{ ardef_inbox ardef_inbox_old db log }]
            #},
            #{   name               => 'conv_fee',
            #    repo_url           => 'git@github.com:payroc/caledon-service-conveniencefees.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/conv_fee',
            #    ignore_list        => [qw{ log }]
            #},
            #{   name               => 'l1batch_batchmaster',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-L1Batch.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/l1batch',
            #    ignore_list        => [qw{ archive inbox logs outbox reject var }]
            #},
            #{   name               => 'l23batch_batchmaster',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-L23Batch.git',
            #    repo_sub_directory => '/l23batch',
            #    repo_branch        => 'master',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/l23batch',
            #    ignore_list        => [qw{ archive inbox logs outbox reject var }]
            #},
            #{   name               => 'logwatcher',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-LogWatcher.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/logwatcher',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'reject_archiver',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-RejectArchiver.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/rejectArchiver',
            #    ignore_list        => [qw{ logs }]
            #},
            #{   name               => 'token_batch',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-TokenBatch.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/token_batch',
            #    ignore_list        => [qw{ archive inbox logs logs-old outbox reject var }]
            #},
            #{   name               => 'inbox_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-InboxMonitor.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/inbox_monitor',
            #    ignore_list        => [qw{ log *.log }]
            #},
            #{   name               => 'inflight_batch',
            #    repo_url           => 'git@github.com:payroc/Caledon-Batch-InFlightBatch.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/ccs/inflight_batch',
            #    ignore_list        => [qw{ archive inbox keys logs quarantine reject var }]
            #},
            #{   name               => 'hsm_client',
            #    repo_url           => 'git@github.com:payroc/Caledon-HSM-HSMClient.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/hsm/hsm',
            #    ignore_list        => [qw{ log log-old var }]
            #},
            #{   name               => 'acquiring_mastercard',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-TSysDisputesMCRDBatchmaster.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/mcrd/parseIPMandTsys',
            #    ignore_list        => [
            #        qw{ mCard/perl/archive mCard/perl/in_files mCard/perl/in_files_prod mCard/perl/in_tsys mCard/perl/logs mCard/perl/logs-old mCard/perl/rej mCard/perl/TEST mCard/perl/test_files Tsys/archives Tsys/logs Tsys/send_to_tsys Tsys/send_to_tsys_BKP Tsys/crontab.txt PROD keys }
            #    ]
            #},
            #{   name               => 'mipproxy',
            #    repo_url           => 'git@github.com:payroc/caledon-service-mastercardmipproxy.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/mip/mipproxy',
            #    ignore_list        => [qw{ archive archive.sym log log-old qualify_params_* tmp trouble work }]
            #},
            #{   name               => 'zuul_batchmaster',
            #    repo_url           => 'git@github.com:payroc/Caledon-Egon-Zuul.git',
            #    repo_sub_directory => '',
            #    server_name        => 'batchmaster',
            #    path_on_server     => '/home/zuul/zuul',
            #    ignore_list        => [qw{ bin/nohup.out log log-old var }]
            #},
            #{   name               => 'clortho',
            #    repo_url           => 'git@github.com:payroc/Caledon-Egon-Clortho.git',
            #    repo_sub_directory => '',
            #    server_name        => 'clortho',
            #    path_on_server     => '/home/clortho/clortho',
            #    ignore_list        => [qw{ keys keys-available keys-enabled logs var }]
            #},
            #{   name               => 'dashboard',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/dashboard',
            #    repo_branch        => 'main',
            #    server_name        => 'dashboard',
            #    path_on_server     => '/home/www-data/web_portal',
            #    ignore_list        => [qw{ files log log_old session session_pwd_retrieving }]
            #},
            #{   name               => 'dashboard_admin',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/dashboard_admin',
            #    repo_branch        => 'main',
            #    server_name        => 'dashboard',
            #    path_on_server     => '/home/www-data/web_dashboard_admin',
            #    ignore_list        => [qw{ log log_old session session_pwd_retrieving }]
            #},
            #{   name               => 'amex_psp_merchant_file',
            #    repo_url           => 'git@github.com:payroc/caledon-service-amex-gsmf.git',
            #    repo_sub_directory => '/amex_psp_merchant_file',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/amex/amex_psp_merchant_file',
            #    ignore_list        => [qw{ archive inbox log outbox }]
            #},
            #{   name               => 'amex_reconciliation',
            #    repo_url           => 'git@github.com:payroc/caledon-service-amex-reconciliation.git',
            #    repo_sub_directory => '/amex_reconciliation',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/amex/amex_reconciliation',
            #    ignore_list        => [qw{ archive inbox logs reports }]
            #},
            #{   name               => 'amex_chargebacks',
            #    repo_url           => 'git@github.com:payroc/caledon-service-acquiringamexchargebacks.git',
            #    repo_sub_directory => '',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/amex/chargebacks',
            #    ignore_list        => [qw{ archive inbox logs outbox var }]
            #},
            #{   name               => 'annual_merchant_review_report',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-AnnualMerchantReviewReport.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/annual_merchant_review_report',
            #    ignore_list        => [qw{ files logs }]
            #},
            #{   name               => 'billing_fee_calculation',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/acquiring_billing_fee_calc',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/billing_fee_calc',
            #    ignore_list        => [qw{ logs }]
            #},
            #{   name               => 'bluepay_extract',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-BluePayExtract.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/bluepay_extract',
            #    ignore_list        => [qw{ archives logs outbox var }]
            #},
            #{   name               => 'caledon_acquired_merchant_report',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-Reporting-CaledonAcquiredMerchant.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/caledon_acquired_merchant_report',
            #    ignore_list        => [qw{ logs reports }]
            #},
            #{   name               => 'discover_acquiring',
            #    repo_url           => 'git@github.com:payroc/caledon-service-discoveracquiring.git',
            #    repo_sub_directory => '/merchant_registration',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/discover',
            #    ignore_list        => [qw{ ack inbox logs logs-old }]
            #},
            #{   name               => 'financial_reports',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/acquiring_financial_reports',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/financial_reports',
            #    ignore_list        => [qw{ files_in logs reports temp_in }]
            #},
            #{   name               => 'mastercard_chargebacks',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-MasterCard-Chargebacks.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/mastercard/chargebacks',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'mastercard_early_reconcilliation',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-MasterCard-EarlyReconciliation.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/mastercard/early_reconcilliation',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'mastercard_incoming_fee_notifications',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-MasterCard-IncomingFeeNotification.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/mastercard/incoming_fee_notification',
            #    ignore_list        => [qw{ log reports }]
            #},
            #{   name               => 'peoples_trust_reports',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-PeoplesTrustReports.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/peoples_trust_reports',
            #    ignore_list        => [qw{ files log logs reports }]
            #},
            #{   name               => 'reconciliation_reports',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/acquiring_reconciliation_reports/reconciliation_reports',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/reconciliation_reports',
            #    ignore_list        => [qw{ ext files files_custom logs outbox }]
            #},
            #{   name               => 'visa_ammf',
            #    repo_url           => 'git@github.com:payroc/caledon-service-visa-ammf.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/acquiring/visa/ammf',
            #    ignore_list        => [qw{ archive inbox logs outbox test_inbox test_outbox var }]
            #},
            #{   name               => 'kpi',
            #    repo_url           => 'git@github.com:andrewclark-payroc/KPI.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/andrew/KPI/kpi',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'monthend_reports',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/billing-monthend',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/billing/monthend',
            #    ignore_list        =>
            #        [qw{ bin_backup_20110819 bin_backup_20130102 files_in Guestlogix_billing_corrections_20140401 logs reports saved_for_rerun var *.backup* }]
            #},
            #{   name               => 'auth_reversal_daemon',
            #    repo_url           => 'git@github.com:payroc/caledon-service-authreversaldaemon.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/ccs/auth-reversal-daemon',
            #    ignore_list        => [qw{ logs }]
            #},
            #{   name               => 'business_intelligence',
            #    repo_url           => 'git@github.com:andrewclark-payroc/BI.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/ccs/business_intelligence',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'dashboard_queue_processor',
            #    repo_url           => 'git@github.com:payroc/Caledon-Dashboard-QueueProcessor.git',
            #    repo_sub_directory => '/dashboard_queue_processor',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/ccs/dashboard_queue_processor',
            #    ignore_list        => [qw{ log pri_bl_keys pri_keys pub_bl_keys pub_keys }]
            #},
            {   name               => 'postgres_deposit_system',
                repo_url           => 'git@github.com:payroc/caledon-service-deposit.git',
                repo_sub_directory => '',
                repo_branch        => 'sync-production-to-git',
                server_name        => 'deposit',
                path_on_server     => '/home/ccs/postgres_deposit_system',
                ignore_list        => [
                    qw{
                        archive
                        backup_20111027
                        DB.old_deposit_server
                        etc
                        new_root
                        proc
                        var
                        *.[0-9]
                        *.[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]
                        *.[0-9][0-9][0-9][0-9][0-9][0-9]
                        *.back[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
                        *.backup_*
                        *.backup[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
                        *.lck
                        *.log
                        *.out
                        *.out[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
                        bin/deposits/backup_*
                        bin/deposits/campbell_*
                        bin/deposits/donotrun_*
                        bin/deposits/norun_*
                        bin/deposits/old_*
                        bin/deposits/test_*
                        bin/visa_clearing_sender/archive
                        bin/visa_clearing_sender/crontab.txt
                        bin/visa_clearing_sender/etc
                        bin/visa_clearing_sender/logs
                        bin/visa_clearing_sender/out_file
                        etc/certificates
                        etc/keys
                    }
                ]
            },
            #{   name               => 'tsys_incoming',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-TSysDisputesVisaDeposit.git',
            #    repo_sub_directory => '/tsys_incoming',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/ccs/tsys_incoming',
            #    ignore_list        => [qw{ archive inbox logs }]
            #},
            #{   name               => 'ccs_utilities',
            #    repo_url           => 'git@github.com:payroc/caledon-service-depositutilities.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/ccs/utilities',
            #    ignore_list        => [
            #        qw{ batchmaster_reports/reports batchmaster_reports/logs decryptomatic/log level1_decline_retry_daily/logs moneris_switch/logs lantrans_ecard_keygen level1_decline_retry_daily/output transaction_retries_any/logs transaction_retries_declines/logs transaction_retries_declines_easyhome/logs guestlogix_duplicates/logs guestlogix_retries_system_failures/logs *.[0-9] Dashboard_Demo_Merchants_Test_Trx/logs  }
            #    ]
            #},
            #{   name               => 'ccs',
            #    repo_url           => 'git@github.com:payroc/caledon-service-deposit.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/CCS',
            #    ignore_list        => [qw{ 230518.fdms5043.01.gpg *.log_* bin/logs }]
            #},
            #{   name               => 'ssh-forcecommand.pl',
            #    repo_url           => 'git@github.com:payroc/caledon-service-depositutilities.git',
            #    repo_sub_directory => '/decryptomatic',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/monitor',
            #    ignore_list        =>
            #        [qw{ dif_builder_monitor dif_builder_monitor.backup mastercard-monitor rewardpay_merchant_setup_monitor transaction-monitor visa-monitor }]
            #},
            #{   name               => 'dif_builder_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-Monitors-Acquiring.git',
            #    repo_sub_directory => '/dif_builder_monitor',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/monitor/dif_builder_monitor',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'mastercard_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-Monitors-Acquiring.git',
            #    repo_sub_directory => '/mastercard-monitor',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/monitor/mastercard-monitor',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'rewardpay_merchant_setup_monitor',
            #    repo_url           => 'git@github.com:payroc/caledon-service-monitors.git',
            #    repo_sub_directory => '/rewardpay_merchant_setup',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/monitor/rewardpay_merchant_setup_monitor',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'transaction_monitor',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/monitors-transaction',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/monitor/transaction-monitor',
            #    ignore_list        => [qw{  }]
            #},
            #{   name               => 'visa_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-Monitors-Acquiring.git',
            #    repo_sub_directory => '/visa-monitor',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/monitor/visa-monitor',
            #    ignore_list        => [qw{ logs }]
            #},
            #{   name               => 'nightrun',
            #    repo_url           => 'git@github.com:payroc/caledon-service-nightrun.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/nightrun',
            #    ignore_list        => [
            #        qw{ keys logs logs_combined logs_tsysacq mail citation-report-sender consolidated_report_interval guestlogix_interval_report retry_reports rpt temp test test_usairways var }
            #    ]
            #},
            #{   name               => 'pad_deposit',
            #    repo_url           => 'git@github.com:payroc/caledon-service-padbin.git',
            #    repo_sub_directory => '/pad',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/pad',
            #    ignore_list        => [
            #        qw{ files logs keys maintenance/log perl/archive perl/BMO_rejects perl/BMO_reports perl/chq_icl_rejects perl/chq_icl_reports perl/chq_img perl/chq_in perl/chq_rejects perl/chq_reports perl/chq_to_be_sent perl/EFTPayment_rejects perl/EFTPayment_reports perl/EFTPayment_to_be_sent perl/EFT_to_be_sent perl/in perl/in_v2 perl/log perl/rej perl/test_in perl/worldnet_reports report/excel_report report/merch_brief_rpt report/outstanding_trans_report reports temp test tmp *.rnd }
            #    ]
            #},
            #{   name               => 'report_automation',
            #    repo_url           => 'git@github.com:payroc/caledon-utility-reportautomation.git',
            #    repo_sub_directory => 'reporting',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/automation/reporting',
            #    ignore_list        => [
            #        qw{ mcf_setups/archive mcf_setups/log mcf_setups/reports visa_operating_cert_visa_recur_vol/archive visa_operating_cert_visa_recur_vol/log visa_operating_cert_visa_recur_vol/reports }
            #    ]
            #},
            #{   name               => 'dashboard_user_activity',
            #    repo_url           => 'git@github.com:payroc/Caledon-Dashboard-UserActivityReport.git',
            #    repo_sub_directory => '/dashboard_user_activity',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/dashboard_user_activity',
            #    ignore_list        => [qw{ logs outbox }]
            #},
            #{   name               => 'guestlogix',
            #    repo_url           => 'git@github.com:payroc/Caledon-GuestLogix-Reports.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/guestlogix',
            #    ignore_list        =>
            #        [qw{ rockymountaineer/log rockymountaineer/report southwest/log southwest/report swoop/log swoop/report westjet/log westjet/report }]
            #},
            #{   name               => 'hppv1_transaction_activity_report',
            #    repo_url           => 'git@github.com:payroc/Caledon-HPP-HPPv1ActivityReporting.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/HPPv1_transaction_activity_report',
            #    ignore_list        => [qw{ log reports }]
            #},
            #{   name               => 'recurring_payment_-_activity_report',
            #    repo_url           => 'git@github.com:payroc/Caledon-Repay-ActivityReport.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/recurring_payment/activity_report',
            #    ignore_list        => [qw{ logs logs-old reports }]
            #},
            #{   name               => 'recurring_payment_-_cc_expiry_monitors',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/report_recurring_payment/cc_expiry_monitor',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/recurring_payment/cc_expiry_monitor',
            #    ignore_list        => [qw{ archives files logs pdf_reports }]
            #},
            #{   name               => 'recurring_payment_-_cc_2months_expiry_monitors',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/report_recurring_payment/cc_2months_expiry_monitor',
            #    repo_branch        => 'main',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/recurring_payment/cc_2months_expiry_monitor',
            #    ignore_list        => [qw{ archives files logs logs-old reports }]
            #},
            #{   name               => 'recurring_payment_-_company_upcoming_payments',
            #    repo_url           => 'git@github.com:payroc/Caledon-Repay-UpcomingPaymentsReport.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/recurring_payment/company_upcomingpayments',
            #    ignore_list        => [qw{ logs output }]
            #},
            #{   name               => 'recurring_payment_-_l1_decline_retry',
            #    repo_url           => 'git@github.com:payroc/Caledon-Repay-L1DeclRetryDailyReport.git',
            #    repo_sub_directory => '/level1_decline_retry_daily',
            #    repo_branch        => 'master',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/recurring_payment/level1_decline_retry_daily',
            #    ignore_list        => [qw{ logs output }]
            #},
            #{   name               => 'visa_report',
            #    repo_url           => 'git@github.com:payroc/Caledon-Visa-tcn_kfiles.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/report/visa',
            #    ignore_list        => [qw{ activity/logs activity/reports html/logs html/reports logs }]
            #},
            #{   name               => 'tsys_peoples_reports',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-TsysReports.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/tsys/reports',
            #    ignore_list        => [qw{ archive inbox logs logs-old mip_inbox outbox reports_not_send_to_peoples_yet resend_reports }]
            #},
            #{   name               => 'funding-billing_eft',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-Merchant-Funding-EFT.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/tsys/',
            #    ignore_list        => [qw{ backup reports EFT/files EFT/logs }]
            #},
            #{   name               => 'visa_chargebacks',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-Visa-Chargebacks.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/visa/chargebacks',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'visa_clearing_reconciliation',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-Visa-ClearingReconciliation.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/visa/clearing_reconciliation',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'visa_incoming',
            #    repo_url           => 'git@github.com:payroc/caledon-service-visaincoming.git',
            #    repo_sub_directory => '/incoming',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/visa/incoming',
            #    ignore_list        => [qw{ archive EA_server_reports in_files logs rej reports }]
            #},
            #{   name               => 'risk_service',
            #    repo_url           => 'git@github.com:payroc/caledon-service-risk.git',
            #    repo_sub_directory => '/watcher',
            #    repo_branch        => 'release',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/watcher',
            #    ignore_list        => [
            #        qw{ VisaFraudChargebackMonitoring excessive-auth-report/logs excessive-auth-report/reports fraudwatch/keys fraudwatch/old fraudwatch/logs risk-report-real-time-alert/logs }
            #    ]
            #},
            #{   name               => 'visa_fraud_risk_monitor',
            #    repo_url           => 'git@github.com:payroc/Caledon-Acquiring-Reporting-Risk-VisaFraudChargebackMonitoring.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/watcher/VisaFraudChargebackMonitoring',
            #    ignore_list        => [qw{ log reports ChangeControl Docs }]
            #},
            #{   name               => 'zuul_deposit',
            #    repo_url           => 'git@github.com:payroc/Caledon-Egon-Zuul.git',
            #    repo_sub_directory => '',
            #    server_name        => 'deposit',
            #    path_on_server     => '/home/zuul/zuul',
            #    ignore_list        => [qw{ bin/nohup.out log log-old var }]
            #},
            #{   name               => 'discover_admin',
            #    repo_url           => 'git@github.com:payroc/cal-app-dss.git',
            #    repo_sub_directory => '/src/caledon-ui-discover_admin',
            #    repo_branch        => 'main',
            #    server_name        => 'dfsadmin',
            #    path_on_server     => '/home/discadmin',
            #    ignore_list        => [qw{ etc keys logs padagreements/check_images padagreements/pdf_docs cgi/report_obsolete cgi/supplier_obsolete }]
            #},
            #{   name               => 'zuul_dfsadmin',
            #    repo_url           => 'git@github.com:payroc/Caledon-Egon-Zuul.git',
            #    repo_sub_directory => '',
            #    server_name        => 'dfsadmin',
            #    path_on_server     => '/home/zuul/zuul',
            #    ignore_list        => [qw{ bin/nohup.out log log-old var }]
            #},
            #{   name               => 'discover_portal',
            #    repo_url           => 'git@github.com:payroc/cal-app-dss.git',
            #    repo_sub_directory => '/src/caledon-ui-discover_portal',
            #    repo_branch        => 'main',
            #    extra_paths        => [qw{/var/www}],
            #    server_name        => 'discover-portal',
            #    path_on_server     => '/home/web_portal',
            #    ignore_list        =>
            #        [qw{ apache2.info check_images cgi/statement-reports/statements cgi/tmp_pdf csv_reports keys log log-old pdf_docs www/documents }]
            #},
            #{   name               => 'discover_portal-staging',
            #    repo_url           => 'git@github.com:payroc/cal-app-dss.git',
            #    repo_sub_directory => '/src/caledon-ui-discover_portal',
            #    repo_branch        => 'main',
            #    extra_paths        => [qw{/var/www}],
            #    server_name        => '192.168.168.22',
            #    path_on_server     => '/home/web_portal',
            #    ignore_list        =>
            #        [qw{ apache2.info check_images cgi/statement-reports/statements cgi/tmp_pdf csv_reports keys log log-old pdf_docs www/documents }]
            #},
            #{   name               => 'discover_ar_reports',
            #    repo_url           => 'git@github.com:payroc/cal-app-dss.git',
            #    repo_sub_directory => '/src/caledon-service-discover/billing/discover_monthly_reports_AR',
            #    repo_branch        => 'main',
            #    server_name        => 'discover-prod',
            #    path_on_server     => '/home/billing/discover_monthly_reports_AR',
            #    ignore_list        => [qw{ log reports reports_billing reports_quarterly }]
            #},
            #{   name               => 'discover_service',
            #    repo_url           => 'git@github.com:payroc/cal-app-dss.git',
            #    repo_sub_directory => '/src/caledon-service-discover',
            #    repo_branch        => 'main',
            #    server_name        => 'discover-prod',
            #    path_on_server     => '/home/discover',
            #    ignore_list        => [
            #        qw{ apato3/ archive/ archive.bak/ archives/ call_report/archive call_report/reports call_report/source_csv call_report/zip_file cpa_fif/backups cpa_fif/data cpa_fif/downloads cpa_fif/logs disputes/logs disputes/reports files firstdata_tmp ftphand/gpg_keys ftphand/logs ftphand/temp keys log note_log_export problems.20160427 rbc_receiver_backlogfiles_tmp storage t/ var/ web_portal/check_images web_portal/log web_portal/pdf_docs web_portal/statements }
            #    ]
            #},
            #{   name               => 'zuul_discover-prod',
            #    repo_url           => 'git@github.com:payroc/Caledon-Egon-Zuul.git',
            #    repo_sub_directory => '',
            #    server_name        => 'discover-prod',
            #    path_on_server     => '/home/zuul/zuul',
            #    ignore_list        => [qw{ bin/nohup.out log log-old var }]
            #},
            #{   name               => 'lantrans',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/lantrans',
            #    repo_branch        => 'main',
            #    server_name        => 'lt3',
            #    path_on_server     => '/home/lantrans',
            #    ignore_list => [qw{ archive certs conf log mcf old-support-stuff output *.cfg *.gpg *.log *.out *.err *.explain *.sqlpglog *.lt3-production }]
            #},
            #{   name               => 'lantrans_support',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/lantrans/lantrans-support',
            #    repo_branch        => 'main',
            #    server_name        => 'lt3',
            #    path_on_server     => '/home/lantrans/lantrans-support',
            #    ignore_list        => [qw{ old-support-stuff *.cfg *.log *.lt3-production }]
            #},
            #{   name               => 'lantrans_preauth_purge',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/lantrans/preauth-purge',
            #    repo_branch        => 'main',
            #    server_name        => 'lt3',
            #    path_on_server     => '/home/lantrans/preauth-purge',
            #    ignore_list        => [qw{ conf log }]
            #},
            #{   name               => 'lantrans_unsettled_batch_report',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/lantrans/unsettled-batch-report',
            #    repo_branch        => 'main',
            #    server_name        => 'lt3',
            #    path_on_server     => '/home/lantrans/unsettled-batch-report',
            #    ignore_list        => [qw{ conf log output }]
            #},
            #{   name               => 'padapi',
            #    repo_url           => 'git@github.com:payroc/caledon-api-pad.git',
            #    repo_sub_directory => '',
            #    server_name        => 'pad',
            #    path_on_server     => '/home/padapi/padapi',
            #    ignore_list        => [qw{ conf keys log }]
            #},
            #{   name               => 'convfee',
            #    repo_url           => 'git@github.com:payroc/caledon-api-conveniencefees.git',
            #    repo_sub_directory => '',
            #    server_name        => 'portal',
            #    path_on_server     => '/home/www-data/convfee',
            #    ignore_list        => [qw{ conf log }]
            #},
            #{   name               => 'dbsync_boarding2api',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/dbsync/boarding2api',
            #    repo_branch        => 'main',
            #    server_name        => 'q',
            #    path_on_server     => '/home/dbsync/boarding2api_sync',
            #    ignore_list        => [qw{ cfg log }]
            #},
            #{   name               => 'dbsync_transaction',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/dbsync/transaction',
            #    repo_branch        => 'main',
            #    server_name        => 'q',
            #    path_on_server     => '/home/dbsync/dbsync',
            #    ignore_list        => [qw{ conf logs sync_files  }]
            #},
            #{   name               => 'dbsync_portaldb',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/dbsync/portaldb',
            #    repo_branch        => 'main',
            #    server_name        => 'q',
            #    path_on_server     => '/home/dbsync/portaldbsync',
            #    ignore_list        => [qw{ conf data log }]
            #},
            #{   name               => 'dbsync_boarding_schema',
            #    repo_url           => 'git@github.com:payroc/cal-app-core.git',
            #    repo_sub_directory => '/src/dbsync/boarding_schema',
            #    repo_branch        => 'main',
            #    server_name        => '10.10.1.82',                               # q2
            #    path_on_server     => '/home/dbsync/boarding_sync',
            #    ignore_list        => [qw{ *.dump *.log }]
            #},
            #{   name               => 'repay_rps_client_interface',
            #    repo_url           => 'git@github.com:payroc/Caledon-Repay-rps_client_interface.git',
            #    repo_sub_directory => '',
            #    server_name        => 'repay-12',
            #    path_on_server     => '/home/repay/rps_client_interface',
            #    ignore_list        => [qw{ conf logs var }]
            #},
            #{   name               => 'repay_rps_scheduler',
            #    repo_url           => 'git@github.com:payroc/Caledon-Repay-rps_scheduler.git',
            #    repo_sub_directory => '',
            #    server_name        => 'repay-12',
            #    path_on_server     => '/home/repay/rps_scheduler',
            #    ignore_list        => [qw{ conf log var }]
            #},
            #{   name               => 'trans-risk',
            #    repo_url           => 'git@github.com:payroc/Caledon-CardPaymentRisk.git',
            #    repo_sub_directory => '',
            #    server_name        => 'repay-12',
            #    path_on_server     => '/home/trans-risk/trans-risk',
            #    ignore_list        => [qw{ conf logs* var }]
            #},
            #{   name               => 'hpp',
            #    repo_url           => 'git@github.com:payroc/Caledon-HPP-HPPv1.git',
            #    repo_sub_directory => 'CCSWebPP',
            #    server_name        => 'step1',
            #    path_on_server     => '/home/hpp/CCSWebPP',
            #    ignore_list        => [qw{ conf }]
            #},
            #{   name               => 'hppv3',
            #    repo_url           => 'git@github.com:payroc/Caledon-HPP-HPPv3.git',
            #    repo_sub_directory => 'CCSHPP',
            #    server_name        => 'step1',
            #    path_on_server     => '/home/hppv3/CCSHPP',
            #    ignore_list        => [qw{ logs var }]
            #},
            #{   name               => 'tokenator_report',
            #    repo_url           => 'git@github.com:payroc/Caledon-Tokenator-Report.git',
            #    repo_sub_directory => '',
            #    server_name        => 'tokenator',
            #    path_on_server     => '/home/report',
            #    ignore_list        => [qw{ files logs outbox }]
            #},
            #{   name               => 'tokenator_bin',
            #    repo_url           => 'git@github.com:payroc/Caledon-Tokenator-Bin.git',
            #    repo_sub_directory => '',
            #    server_name        => 'tokenator',
            #    path_on_server     => '/home/tokenator/bin',
            #    ignore_list        => [qw{ *.log }]
            #},
            #{   name               => 'tokenator',
            #    repo_url           => 'git@github.com:payroc/Caledon-Tokenator-Tokenator.git',
            #    repo_sub_directory => '',
            #    server_name        => 'tokenator',
            #    path_on_server     => '/home/tokenator/tokenator',
            #    ignore_list        => [qw{ conf var logs* keys* }]
            #},
        ],
        applications_ignore_list => [
            qw{ *~ *.swp *.tar.gz *.tgz *.gz *.old .bash_history .bash_logout .bashrc .cache .mysql_history .profile .selected_editor .ssh .vim .viminfo *.[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]
                *.[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]* *.bk *.bk* crontab.txt *.new t crontab .joe_state .lesshst .pgpass .psql_history .subversion *.*~ *.svn bin/nohup.out
                .gnupg .nano_history .netrc .pinerc .mc/history DEADJOE .dir *.log .aptitude/ }
        ]
    };
}

1;
