#!/usr/share/env perl

use strict;
use warnings;
use feature qw(say);
use Capture::Tiny qw(capture);


sub check_status {
	if ( -d "/proc/sys/net/ipv4/conf/tun0" ) {
		return 1;
	} elsif ( -d "/proc/sys/net/ipv4/conf/ppp0" ) {
		return 1;
	} else {
		return 0;
	}	
}

sub proc_status {
	if (check_status == 1) {
		say(" On");
	} else {
		say(" Off");
	}	
}

proc_status();