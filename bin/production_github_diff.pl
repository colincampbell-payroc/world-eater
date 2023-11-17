#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use lib "$FindBin::Bin/../lib";
use WorldEater::Config;

`rm -rf $FindBin::Bin/../code`;
mkdir "$FindBin::Bin/../code";
mkdir "$FindBin::Bin/../code/production";
mkdir "$FindBin::Bin/../code/github";

mkdir "$FindBin::Bin/../diffs" unless -d "$FindBin::Bin/../diffs";

my %config = %{ WorldEater::Config::get_all() };

foreach my $application ( @{ $config{applications} } ) {
    `git clone $application->{repo_url} $FindBin::Bin/../code/github/$application->{name}`;

    my @ignore_list = ( @{ $application->{ignore_list} }, @{ $config{applications_ignore_list} } );

    foreach my $ignore (@ignore_list) {

        `rm -rf $FindBin::Bin/../code/github/$application->{name}$application->{repo_sub_directory}/$ignore`;
    }

    my $exclude_flags = join( ' ', map {"--exclude '$_'"} @ignore_list );

# warn
#     "rsync -vvv -r $exclude_flags -e \"ssh -t ccampbell\@bounce.caledoncard.com ssh -t\" $application->{server_name}:$application->{path_on_server}/ $FindBin::Bin/../code/production/$application->{name}";

    `rsync -r $exclude_flags -e "ssh -t ccampbell\@bounce.caledoncard.com ssh -t" $application->{server_name}:$application->{path_on_server}/ $FindBin::Bin/../code/production/$application->{name}`;

    if ( exists( $application->{extra_paths} ) ) {
        foreach my $path ( @{ $application->{extra_paths} } ) {

# warn
#     "rsync -vvv -r $exclude_flags -e \"ssh -t ccampbell\@bounce.caledoncard.com ssh -t\" $application->{server_name}:$path $FindBin::Bin/../code/production/$application->{name}";

            `rsync -r $exclude_flags -e "ssh -t ccampbell\@bounce.caledoncard.com ssh -t" $application->{server_name}:$path $FindBin::Bin/../code/production/$application->{name}`;
        }
    }

    `$FindBin::Bin/ddiff $FindBin::Bin/../code/github/$application->{name}$application->{repo_sub_directory} $FindBin::Bin/../code/production/$application->{name} > $FindBin::Bin/../diffs/$application->{name}`;
}
