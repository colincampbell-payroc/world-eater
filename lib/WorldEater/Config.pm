package WorldEater::Config;

use strict;
use warnings;

sub get_all {
    return {
        directories  => [ 
            '/home/user', 
            '/home/user2', 
        ],
        grep_command =>
            'grep -irs --exclude="*jquery*" --exclude="*\.20*" --exclude-dir="*jquery*" --exclude-dir="log*" --exclude-dir="logs" --exclude-dir=session* --exclude-dir=perl5 --exclude-dir=perlbrew --exclude-dir=.cpan* --exclude-dir=user_files --exclude=*.gz --exclude=.* --exclude=*.dump --exclude=*.gpg --exclude=*.log  --exclude=*.pdf  --exclude=*.jpg  --exclude=*.png --exclude=log*.txt -E',
        greps => [
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
