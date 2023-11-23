#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use Spreadsheet::ParseXLSX;

use lib "$FindBin::Bin/../lib";

use WorldEater::RepoUrl;

my $excel_file = "$FindBin::Bin/../data/SoftwareDiscovery.xlsx";

my $parser   = Spreadsheet::ParseXLSX->new;
my $workbook = $parser->parse($excel_file);

my $applications_sheet = $workbook->{Worksheet}[5];

my $outfile_path = "$FindBin::Bin/../data/SoftwareDiscovery.txt";

open my $file_handle, '>', $outfile_path or die "Could not open file '$outfile_path' for writing: $!";

my @applications;
foreach my $row ( 1 .. $applications_sheet->{MaxRow} ) {
    my $name = $applications_sheet->{Cells}[$row][3]->{Val};

    next if !defined($name);

    $name = lc($name);
    $name =~ s/ /_/g;

    my $repo_url = $applications_sheet->{Cells}[$row][6]->{Val};

    next if !defined($repo_url);

    my ( $url, $branch, $sub_directory ) = WorldEater::RepoUrl::extract_parts($repo_url);

    my $server_name    = $applications_sheet->{Cells}[$row][0]->{Val};
    my $path_on_server = $applications_sheet->{Cells}[$row][4]->{Val};

    my %application = (
        name               => $name,
        repo_url           => $url,
        repo_sub_directory => defined $sub_directory ? $sub_directory : '',
        server_name        => $server_name,
        path_on_server     => $path_on_server,
    );

    $application{repo_branch} = $branch if defined $branch;

    print $file_handle qq|
    {
        name               => '$application{name}',
        repo_url           => '$application{repo_url}',
        repo_sub_directory => '$application{repo_sub_directory}',
|;

    print $file_handle "        repo_branch        => '$application{repo_branch}'," if exists $application{repo_branch};

    print $file_handle qq|        server_name        => '$application{server_name}',
        path_on_server     => '$application{path_on_server}',
    },
|;

    push( @applications, \%application );
}

close $file_handle;
