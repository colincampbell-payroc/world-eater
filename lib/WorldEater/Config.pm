package WorldEater::Config;

use strict;
use warnings;

sub get_all {
    return {
        directories => {
            adminweb => [
                qw{
                    /home/batchupload /home/boarding /home/discoverportal /home/emailadmin /home/internalklmadmin /home/lantrans /home/mcf
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
            'discover-portal-staging' => [qw{/home/lansweeper /home/web_portal /home/wwwfiles}],
            'discover-prod'           => [qw{/home/billing/ /home/ccs/ /home/discover/ /home/lansweeper/ /home/support/ /home/zuul/}],
            lt3                       => [qw{ /home/cardinfo /home/lantrans }],
            lt3shared                 => [qw{ /home/lantrans }],
            pad                       => [qw{ /home/padapi }],
            portal                    => [qw{ /home/cardinfo /home/www-data /home/webcvf /home/webdoc }],
            q                         => [qw{ /home/cardinfo /home/dbsync /home/htmlstats /home/maidrept }],
            q2                        => [qw{ /home/dbsync }],
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
                    /
            ],
        },
        greps => [
            {
                filter => 'dbi->connect',
                type   => 'dbi',
            },
            {
                filter => 'DBI:',
                type   => 'dbi',
            },
            {
                filter => 'psql',
                type   => 'psql',
            },
            {
                filter => 'host',
                type   => 'host',
            },
            {
                filter => 'ssh',
                type   => 'ssh',
            },
            {
                filter => 'scp',
                type   => 'scp',
            },
            {
                filter => 'sftp',
                type   => 'sftp',
            },
            {
                filter => 'rsync',
                type   => 'rsync',
            },
            {
                filter => 'http',
                type   => 'http',
            },
            {
                filter => '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b',
                type   => 'ip',
            },
        ]
    };
}

1;
