#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use FindBin;

use Data::Dumper;

use lib "$FindBin::Bin/../lib";
use WorldEater::Config;

my %config = %{ WorldEater::Config::get_all() };

my $dirname = dirname(__FILE__);

mkdir "$dirname/../results";

foreach my $directory ( @{ $config{directories} } ) {
    my $last_directory = basename($directory);

    my $results_directory = "$dirname/../results/$last_directory";

    `rm -rf $results_directory`;

    mkdir $results_directory;

    my $grep_command = $config{grep_command};

    foreach my $grep ( @{ $config{greps} } ) {
        my $grep_filter = $grep->{filter};
        my $grep_type   = $grep->{type};
        my $output      = `$grep_command '$grep_filter' $directory`;

        open( my $results_fh, '>', "$results_directory/$grep_type.txt" ) or die $!;

        print $results_fh $output;

        close($results_fh);
    }
}

print "Done!\n";
