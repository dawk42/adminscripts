#!/usr/bin/perl


my $InputDir = '/home/dawk/';
my $OutputFile = "$InputDir/Output.txt";
my $listing = `echo "Configuration Complete"`;

open (MYFILE, ">>", "$OutputFile") or die "Couldn't open: $!";
print MYFILE "$listing\n";
close (MYFILE);
