#!/usr/bin/perl

use strict;
use warnings;

use FindBin;

use lib "$FindBin::Bin/../lib";
use WorldEater::Config;

my $remote_user = $ARGV[0] || die "You must specify a remote user eg `./search_for_wkhtmltopdf.pl ccampbell`";

mkdir "$FindBin::Bin/../wkhtmltopdf_results" unless -d "$FindBin::Bin/../wkhtmltopdf_results";

my %config = %{ WorldEater::Config::get_all() };

my @servers = keys %{ $config{directories} };

#my $index = 0;
#$index++ until $servers[$index] eq 'discover-portal-staging';
#splice( @servers, $index, 1 );
#$index = 0;
#$index++ until $servers[$index] eq 'q2';
#splice( @servers, $index, 1 );

foreach my $server (@servers) {
    print "sshb $server\n";
}

my $grep_command = $config{wkhtmltopdf_grep}->{command};
my $options      = join( ' ', @{ $config{wkhtmltopdf_grep}->{options} } );

$grep_command =~ s/\$options/$options/g;

print "\n";
foreach my $server (@servers) {
    print "\r" . (" " x 30) . "\r";
    print "Checking: $server";

    my $results = `ssh -oLogLevel=QUIET -oBatchMode=yes -t $remote_user\@bounce.caledoncard.com ssh -oLogLevel=QUIET -oBatchMode=yes -t $server '$grep_command'`;

    # my $results = `/home/caledon/bin/sshb $server '$grep_command'`;

    if ($results) {
        my $outfile_path = "$FindBin::Bin/../wkhtmltopdf_results/$server";
        open my $file_handle, '>', $outfile_path or die "Could not open file '$outfile_path' for writing: $!";

        print $file_handle $results;

        close $file_handle;
    }
}

print "\r" . (" " x 30) . "\r";
print "Done\n";
