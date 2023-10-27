package WorldEater::Config;

use strict;
use warnings;

sub get_all {
    return {
        directories  => [ 
            '/home/user', 
            '/home/user2', 
        ],
        grep_command => 'grep -irs --exclude="*jquery*" --exclude="*\.20*" --exclude-dir="*jquery*" --exclude-dir="log" --exclude-dir="logs" -E',
        greps        => [
            {   filter => 'DBI:',
                type   => 'dbi',
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
        ]
    };
}

1;
