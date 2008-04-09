# $Id: Makefile.PL 201 2008-04-07 10:08:12Z alinke $

# Lingua::Translit heavily relies on Perl's UTF-8 implementation and
# therefore needs at least Perl 5.8.0 to be installed.
require 5.008;

use strict;
use ExtUtils::MakeMaker;


if ($^O eq "MSWin32" && not defined $ENV{FORCE_UNSUPPORTED})
{
    die "Running Linua::Translit on $^O is currently not supported.\n" .
	"Define FORCE_UNSUPPORTED in your shell's environment to avoid " .
	"this check.\n";
}


WriteMakefile(
    NAME	    =>  "Lingua::Translit",
    VERSION_FROM    =>  "lib/Lingua/Translit.pm",
    ABSTRACT_FROM   =>  "lib/Lingua/Translit.pm",
    AUTHOR	    =>  'Alex Linke <alinke@lingua-systems.com>',
    EXE_FILES	    =>  [qw/translit/],
    PL_FILES	    =>	{
	    'tools/substitute_tables.pl' =>
		'blib/lib/Lingua/Translit/Tables.pm'
	},
);


package MY;

sub postamble
{
    # include target to rebuild tables
    return "tables:\n\t\$(MAKE) -C xml tables\n";
}


# vim: sts=4 enc=utf-8
