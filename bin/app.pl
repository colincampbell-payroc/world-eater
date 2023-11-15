#!/usr/bin/perl

use strict;
use warnings;

use File::Basename;
use FindBin;
use Getopt::Long;
use Sys::Hostname;

use Data::Dumper;

use lib "$FindBin::Bin/../lib";
use WorldEater::Config;

my %config = %{ WorldEater::Config::get_all() };

my $host = hostname;

GetOptions( "host=s" => \$host )
    or die("Error in command line arguments\n");

my $dirname = dirname(__FILE__);

mkdir "$dirname/../results";

my $count = 0;
foreach my $directory ( @{ $config{directories}{$host} } ) {
    my $last_directory = basename($directory);

    my $results_directory = "$dirname/../results/$last_directory";

    `rm -rf $results_directory`;

    mkdir $results_directory;

    my $grep_command = $config{grep}{command};
    my $grep_options = join( ' ', @{ $config{grep}{options} } );

    foreach my $grep ( @{ $config{greps} } ) {
        my $grep_filter = $grep->{filter};
        my $grep_type   = $grep->{type};
        my $output      = `cd $directory && $grep_command $grep_options '$grep_filter' .`;

        open( my $results_fh, '>>', "$results_directory/$grep_type.txt" ) or die $!;

        print $results_fh $output;

        close($results_fh);
    }
    $count++;
}
print "Host: $host\n";
print "Directories checked: $count\n";
print "Done!\n";
