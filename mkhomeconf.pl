#!/usr/bin/perl

use strict;
use warnings;
use File::Basename;

my @files = glob "~/.config/homeConf/.* ~/.config/homeConf/*";


foreach (@files) {
    my $file = basename $_;
    print "ln -s $_ ~/$file \n" if $file !~ /\.?\.$/;
    system "ln -s $_ ~/$file \n" if $file !~ /\.?\.$/;    
}

exit 0;
