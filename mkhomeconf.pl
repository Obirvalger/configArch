#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

my @files = glob "~/configArch/homeConf/.* ~/configArch/homeConf/*";

print "@{[map {basename $_} @files[2..$#files]]}\n";

foreach (@files) {
    my $file = basename $_;
    print "ln -fs $_ ~/$file \n" if $file !~ /\.?\.$/;
    system "ln -fs $_ ~/$file \n" if $file !~ /\.?\.$/;
}

exit 0;
