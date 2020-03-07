#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(say);
use Capture::Tiny qw(capture);


my $load = capture { system q{uptime | awk '{print $(NF-2)}'} };
$load =~ s/\,\s*$//g;

say " $load";