package WorldEater::Config;

use strict;
use warnings;

sub get_all {
    return {
        directories => {
            adminweb => [
                qw{/home/batchupload /home/boarding /home/discoverportal /home/emailadmin /home/internalklmadmin /home/lantrans /home/mcf /home/monitor /home/pad /home/peoplestrust /home/reports /home/translookup /home/watcher /home/zuul }
            ],
            api        => [qw {/home/boardingapi /home/paymentapi}],
            lt3        => [qw{ /home/cardinfo /home/lantrans }],
            lt3shared  => [qw{ /home/lantrans }],
            pad        => [qw{ /home/padapi }],
            portal     => [qw{ /home/cardinfo /home/www-data /home/webcvf /home/webdoc }],
            q          => [qw{ /home/cardinfo /home/dbsync /home/htmlstats /home/maidrept }],
            q2         => [qw{ /home/dbsync }],
            'repay-12' => [qw{ /home/repay /home/trans-risk }],
            step1      => [qw{ /home/hpp /home/hppv3 }],
            tokenator  => [qw{ /home/report /home/tokenator }],
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
