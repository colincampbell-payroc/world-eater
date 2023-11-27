#!/usr/bin/perl

use strict;
use warnings;

use Capture::Tiny qw/capture/;
use FindBin;

use lib "$FindBin::Bin/../lib";
use WorldEater::Config;

my $remote_user = $ARGV[0] || die "You must specify a remote user eg `./production_github_diff.pl ccampbell`";

mkdir "$FindBin::Bin/../code"            unless -d "$FindBin::Bin/../code";
mkdir "$FindBin::Bin/../code/production" unless -d "$FindBin::Bin/../code/production";
mkdir "$FindBin::Bin/../code/github"     unless -d "$FindBin::Bin/../code/github";

mkdir "$FindBin::Bin/../diffs" unless -d "$FindBin::Bin/../diffs";

my %config = %{ WorldEater::Config::get_all() };

foreach my $application ( @{ $config{applications} } ) {
    `rm -rf $FindBin::Bin/../code/production/$application->{name}`;
    `rm -rf $FindBin::Bin/../code/github/$application->{name}`;

    my $branch = exists( $application->{repo_branch} ) ? "-b $application->{repo_branch}" : '';

    `git clone $branch $application->{repo_url} $FindBin::Bin/../code/github/$application->{name}`;

    my @ignore_list = ( @{ $application->{ignore_list} }, @{ $config{applications_ignore_list} } );

    foreach my $ignore (@ignore_list) {

        `rm -rf $FindBin::Bin/../code/github/$application->{name}$application->{repo_sub_directory}/$ignore`;
    }

    my $exclude_flags = join( ' ', map {"--exclude '$_'"} @ignore_list );

# warn
#     "rsync -vn --progress -r $exclude_flags -e \"ssh -t $remote_user\@bounce.caledoncard.com ssh -t\" $application->{server_name}:$application->{path_on_server}/ $FindBin::Bin/../code/production/$application->{name}";
# next;

    my ( $stdout, $stderr ) = capture {
        system(
            "rsync -r $exclude_flags -e \"ssh -t $remote_user\@bounce.caledoncard.com ssh -t\" $application->{server_name}:$application->{path_on_server}/ $FindBin::Bin/../code/production/$application->{name}"
        );
    };

    $stderr =~ s/Pseudo-terminal will not be allocated because stdin is not a terminal.\r\n//g;

    if ($stderr) {
        my $outfile_path = "$FindBin::Bin/../diffs/$application->{name}.err";
        open my $file_handle, '>', $outfile_path or die "Could not open file '$outfile_path' for writing: $!";

        print $file_handle $stderr;

        close $file_handle;
    }

    if ( exists( $application->{extra_paths} ) ) {
        foreach my $path ( @{ $application->{extra_paths} } ) {

# warn
#     "rsync --dry-run -r $exclude_flags -e \"ssh -t $remote_user\@bounce.caledoncard.com ssh -t\" $application->{server_name}:$path $FindBin::Bin/../code/production/$application->{name}";

            `rsync -r $exclude_flags -e "ssh -t $remote_user\@bounce.caledoncard.com ssh -t" $application->{server_name}:$path $FindBin::Bin/../code/production/$application->{name}`;
        }
    }

    `$FindBin::Bin/ddiff $FindBin::Bin/../code/github/$application->{name}$application->{repo_sub_directory} $FindBin::Bin/../code/production/$application->{name} > $FindBin::Bin/../diffs/$application->{name}`;
}
