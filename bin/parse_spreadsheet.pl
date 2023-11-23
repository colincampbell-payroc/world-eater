#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use Spreadsheet::ParseXLSX;

my $excel_file = "$FindBin::Bin/../data/SoftwareDiscovery.xlsx";

my $parser   = Spreadsheet::ParseXLSX->new;
my $workbook = $parser->parse($excel_file);

my $applications_sheet = $workbook->{Worksheet}[5];

my $outfile_path = "$FindBin::Bin/../data/SoftwareDiscovery.txt";

open my $file_handle, '>', $outfile_path or die "Could not open file '$outfile_path' for writing: $!";

foreach my $row ( 1 .. $applications_sheet->{MaxRow} ) {
    my $name = $applications_sheet->{Cells}[$row][3]->{Val};

    next if !defined($name);

    $name = lc($name);
    $name =~ s/ /_/g;

    print $file_handle "$name\n";
}

close $file_handle;
