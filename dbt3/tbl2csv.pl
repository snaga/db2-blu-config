#!/usr/bin/perl

# Copyright(c) 2013 Uptime Technologies, LLC.

use strict vars;

while(<>)
{
    chomp;
    my @v = split(/\|/, $_);
    my $col = 0;

    foreach my $vv (@v)
    {
	if ( $col > 0 )
	{
	    print ",";
	}

	if ( $vv =~ /,/ )
	{
	    print "\"$vv\"";
	}
	else
	{
	    print "$vv";
	}
	$col++;
    }
    print "\n";
}

