#!/usr/bin/perl

use strict;
use warnings;

use Test2::V0;

use lib 'lib';

use WorldEater::RepoUrl;

subtest 'extract_parts' => sub {
    subtest 'for a URL containing a branch and sub directory' => sub {
        my $repo_url = 'https://github.com/payroc/Caledon-ApiNotification/tree/master/anpweb';

        my ( $url, $branch, $sub_directory ) = WorldEater::RepoUrl::extract_parts($repo_url);

        is( $url,           'git@github.com:payroc/Caledon-ApiNotification', 'should return the ssh url for the repo' );
        is( $branch,        'master',                                        'should return branch name from the raw url' );
        is( $sub_directory, '/anpweb',                                       'should return the sub directory from the raw url' );
    };

    subtest 'for a URL containing a branch' => sub {
        my $repo_url = 'https://github.com/payroc/Caledon-ApiNotification/tree/p921_API_Notification_Processes_test';

        my ( $url, $branch, $sub_directory ) = WorldEater::RepoUrl::extract_parts($repo_url);

        is( $url,           'git@github.com:payroc/Caledon-ApiNotification', 'should return the ssh url for the repo' );
        is( $branch,        'p921_API_Notification_Processes_test',          'should return branch name from the raw url' );
        is( $sub_directory, undef,                                           'should return undef for the sub directory' );
    };

    subtest 'for a URL NOT containing a branch' => sub {
        my $repo_url = 'https://github.com/payroc/Caledon-ApiNotification';

        my ( $url, $branch, $sub_directory ) = WorldEater::RepoUrl::extract_parts($repo_url);

        is( $url,           'git@github.com:payroc/Caledon-ApiNotification', 'should return the ssh url for the repo' );
        is( $branch,        undef,                                           'should return undef for the branch name' );
        is( $sub_directory, undef,                                           'should return undef for the sub directory' );
    };
};

done_testing();
