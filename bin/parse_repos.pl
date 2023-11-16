#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use JSON;

# Specify the path to your JSON file
# my $json_file = "$FindBin::Bin/../data/caledon_repos.json";
my $json_file = "$FindBin::Bin/../data/all_repos.json";

# Read the JSON data from the file
open my $fh, '<', $json_file or die "Cannot open file $json_file: $!";
my $json_data;
{
    local $/;
    $json_data = <$fh>;

    chomp $json_data;
}
close $fh;

# Parse JSON data
my $repos = decode_json($json_data);

my @caledon_repos;
foreach my $repo ( @{$repos} ) {
    if ( ( defined( $repo->{name} ) && $repo->{name} =~ /caledon/i ) || ( defined( $repo->{description} ) && $repo->{description} =~ /caledon/i ) ) {
        push( @caledon_repos, $repo );

        print $repo->{name} . "\n";
    }
}

# Encode Perl data structure to JSON
$json_data = encode_json( \@caledon_repos );

# Specify the path to the output JSON file
$json_file = "$FindBin::Bin/../data/filtered_caledon_repos.json";

# Write JSON data to the file
open $fh, '>', $json_file or die "Cannot open file $json_file: $!";
print $fh $json_data;
close $fh;

warn scalar @caledon_repos;
