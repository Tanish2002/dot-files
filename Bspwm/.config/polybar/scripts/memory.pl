#!/usr/bin/env perl

use strict;
use warnings;
use Capture::Tiny qw(capture);

sub memory() {
    my $free = capture{system q{cat /proc/meminfo | grep MemFree | awk '{printf $2}'}};
    my $total = capture{system q{cat /proc/meminfo | grep MemTotal | awk '{printf $2}'}};
    
    my $percent = $free / $total * 100;
    print(" ".int($percent) . "%\n");
}

memory();