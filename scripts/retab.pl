#!/usr/bin/env perl
#===============================================================================
#
#         FILE: retab.pl
#
#        USAGE: ./retab.pl fname old new 
#
#  DESCRIPTION: Change nuber of spaces in one tab in file fname from old to new
#
#      OPTIONS: ---
# REQUIREMENTS: ---
#         BUGS: ---
#        NOTES: ---
#       AUTHOR: Gordeev Mikhail (), gordmisha@gmail.com
# ORGANIZATION: 
#      VERSION: 1.0
#      CREATED: 06.01.2017 21:14:36
#     REVISION: ---
#===============================================================================

use v5.14;
use warnings;
use File::Temp qw(tempfile);

my ($fname, $old, $new) = @ARGV;

my ($tfh, $tempname) = tempfile(UNLINK => 0, DIR => '.');

open (my $fh, '<', $fname);

while (<$fh>) {
    s!^( *)!' ' x (length($1) / $old * $new)!e;
    print $tfh $_;
}

rename($tempname, $fname);

