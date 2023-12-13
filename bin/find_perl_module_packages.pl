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

foreach my $server ( sort { lc($a) cmp lc($b) } @servers ) {
    print "sshb $server\n";
}

print "\n";
foreach my $server ( sort { lc($a) cmp lc($b) } @servers ) {
    print "\r" . ( " " x 30 ) . "\r";
    print "Checking: $server";

    my $results
        = `ssh -oLogLevel=QUIET -oBatchMode=yes -t $remote_user\@bounce.caledoncard.com ssh -oLogLevel=QUIET -oBatchMode=yes -t $server 'apt list --installed lib*-perl'`;

    if ($results) {
        my $outfile_path = "$FindBin::Bin/../apt_perl_packages/$server";
        open my $file_handle, '>', $outfile_path or die "Could not open file '$outfile_path' for writing: $!";

        print $file_handle $results;

        close $file_handle;
    }
}

print "\r" . ( " " x 30 ) . "\r";
print "Done\n";
