## $Id: 11_tr_Common_DEU.t 159 2008-03-10 09:33:18Z alinke $

use strict;
use Test::More tests => 4;

my $name	=   "Common DEU";

# Taken from http://www.unhchr.ch/udhr/lang/ger.htm
my $input	=   "Alle Menschen sind frei und gleich an Würde und " .
		    "Rechten geboren. Sie sind mit Vernunft und Gewissen " .
		    "begabt und sollen einander im Geist der " .
		    "Brüderlichkeit begegnen.";
my $output_ok	=   "Alle Menschen sind frei und gleich an Wuerde und " .
		    "Rechten geboren. Sie sind mit Vernunft und Gewissen " .
		    "begabt und sollen einander im Geist der " .
		    "Bruederlichkeit begegnen.";

my $ext		=   "ÄÖÜäöüß";
my $ext_out_ok	=   "AeOeUeaeoeuess";

my $all_caps	=   "MAßARBEIT -- Spaß";
my $all_caps_ok	=   "MASSARBEIT -- Spass";

use Lingua::Translit;

my $tr = new Lingua::Translit($name);


my $output = $tr->translit($input);

# 1
is($tr->can_reverse(), 0, "$name: not reversible");

# 2
is($output, $output_ok, "$name: UDOHR transliteration");

my $ext_output = $tr->translit($ext);

# 3
is($ext_output, $ext_out_ok, "$name: umlauts and sz-ligature");

my $o = $tr->translit($all_caps);

# 4
is($o, $all_caps_ok, "$name: all caps");
