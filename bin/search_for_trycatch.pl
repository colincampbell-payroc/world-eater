#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use lib "$FindBin::Bin/../lib";
use WorldEater::Config;

my $remote_user = $ARGV[0] || die "You must specify a remote user eg `./search_for_trycatch.pl ccampbell`";

mkdir "$FindBin::Bin/../trycatch_results" unless -d "$FindBin::Bin/../trycatch_results";

my %config = %{ WorldEater::Config::get_all() };

my @servers = keys %{ $config{directories} };

my $index = 0;
$index++ until $servers[$index] eq 'discover-portal-staging';
splice( @servers, $index, 1 );
$index = 0;
$index++ until $servers[$index] eq 'q2';
splice( @servers, $index, 1 );

foreach my $server (@servers) {
    print "sshb $server\n";
}

my $grep_command = $config{trycatch_grep}->{command};
my $options      = join( ' ', @{ $config{trycatch_grep}->{options} } );

$grep_command =~ s/\$options/$options/g;

foreach my $server (@servers) {

    my $results = `ssh -t $remote_user\@bounce.caledoncard.com ssh -t $server '$grep_command'`;

    if ($results) {
        my $outfile_path = "$FindBin::Bin/../trycatch_results/$server";
        open my $file_handle, '>', $outfile_path or die "Could not open file '$outfile_path' for writing: $!";

        print $file_handle $results;

        close $file_handle;
    }
}

