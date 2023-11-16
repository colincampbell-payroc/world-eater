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

my %config = %{ WorldEater::Config::get_all() };

foreach my $application ( @{ $config{applications} } ) {
    `git clone $application->{repo_url} $FindBin::Bin/../code/github/$application->{name}`;

    my @ignore_list = ( @{ $application->{ignore_list} }, @{ $config{applications_ignore_list} } );

    foreach my $ignore (@ignore_list) {
        `rm -r $FindBin::Bin/../code/github/$application->{name}/$ignore`;
    }

    my $exclude_flags = join( ' ', map {"--exclude '$_'"} @ignore_list );

    `rsync -r $exclude_flags -e "ssh -t ccampbell\@bounce.caledoncard.com ssh -t" $application->{server}:$application->{path}/ $FindBin::Bin/../code/production/$application->{name}`;
}
