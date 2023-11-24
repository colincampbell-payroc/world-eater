package WorldEater::RepoUrl;

use strict;
use warnings;

sub extract_parts {
    my $raw_url = shift;

    my $repo_url;
    my $branch;
    my $sub_directory;
    if ( $raw_url =~ /(github.com\/.*)/ ) {
        $repo_url = $1;

        $repo_url = 'git@' . $repo_url;

        $repo_url =~ s/github.com\/([\w-]+)\//github.com:$1\//;

        ( $repo_url, $branch ) = split( /tree/, $repo_url );

        $repo_url =~ s/\/$//;
        $repo_url .= '.git';

        if ( defined($branch) ) {
            $branch =~ s/^\///;

            my @parts = split( /\//, $branch );

            $branch = shift @parts;

            if (@parts) {
                $sub_directory = '/' . join( '/', @parts );
            }
        }
    }
    else {
        return (undef);
    }

    return ( $repo_url, $branch, $sub_directory );
}

1;
