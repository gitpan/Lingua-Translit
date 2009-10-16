# Lingua::Translit heavily relies on Perl's UTF-8 implementation and
# therefore needs at least Perl 5.8.0 to be installed.
require 5.008;

use strict;
use ExtUtils::MakeMaker;


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
    return  "tables:\n\t\$(MAKE) -C xml tables\n\n" .
	    "manual:\n\t\$(MAKE) -C xml/manual\n";
}


# vim: sts=4 enc=utf-8
