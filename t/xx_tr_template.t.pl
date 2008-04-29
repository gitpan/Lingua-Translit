## $Id: xx_tr_template.t.pl 273 2008-04-29 07:27:01Z alinke $ ##

use strict;
use Test::More tests => 3;  # number of tests

my $name	=   "";	    # transliterations name
my $reversible	=   0;	    # is the transliteration reversible?

my $input	=   "";	    # short corpus...
my $output_ok	=   "";	    # ...its correct transliteration

my $context	=   "";	    # context-sensitive example
my $context_ok	=   "";	    # ...its correct transliteration

use Lingua::Translit;

my $tr = new Lingua::Translit($name);


my $output = $tr->translit($input);

# 1
is($tr->can_reverse(), $reversible, "$name: reversibility");

# 2
is($output, $output_ok, "$name: transliteration");

$output = $tr->translit($context);

# 3
is($output, $context_ok, "$name: transliteration (context-sensitive)");

# vim: sts=4 enc=utf-8
