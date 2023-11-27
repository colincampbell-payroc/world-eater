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

print $file_handle "[";

my @applications;
foreach my $row ( 1 .. $applications_sheet->{MaxRow} ) {
    my $name = $applications_sheet->{Cells}[$row][3]->{Val};

    next if !defined($name);

    $name = lc($name);
    $name =~ s/ /_/g;

    my $repo_url = $applications_sheet->{Cells}[$row][6]->{Val};

    next if !$repo_url || $repo_url eq 'not in git';

    my ( $url, $branch, $sub_directory ) = WorldEater::RepoUrl::extract_parts($repo_url);

    my $server_name    = $applications_sheet->{Cells}[$row][0]->{Val};
    my $path_on_server = $applications_sheet->{Cells}[$row][4]->{Val};
    my $ignore_list    = $applications_sheet->{Cells}[$row][7]->{Val};

    my @parts = split( /\n/, $path_on_server );
    $path_on_server = shift @parts;
    my $extra_paths = join( ' ', @parts );

    my %application = (
        name               => $name,
        repo_url           => $url,
        repo_sub_directory => defined $sub_directory ? $sub_directory : '',
        server_name        => $server_name,
        path_on_server     => $path_on_server,
        ignore_list        => $ignore_list,
    );

    $application{repo_branch} = $branch      if defined $branch;
    $application{extra_paths} = $extra_paths if $extra_paths;

    print $file_handle qq|
    {
        name               => '$application{name}',
        repo_url           => '$application{repo_url}',
        repo_sub_directory => '$application{repo_sub_directory}',
|;

    print $file_handle "        repo_branch        => '$application{repo_branch}',\n"     if exists $application{repo_branch};
    print $file_handle "        extra_paths        => [qw{$application{extra_paths}}],\n" if exists $application{extra_paths};

    print $file_handle qq|        server_name        => '$application{server_name}',
        path_on_server     => '$application{path_on_server}',
        ignore_list        => [qw{ $application{ignore_list} }]
    },
|;

    push( @applications, \%application );
}

print $file_handle "]\n";

close $file_handle;
