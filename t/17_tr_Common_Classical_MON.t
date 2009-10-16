use strict;
use Test::More tests => 13;

my $name	=   "Common Classical MON";

# "My Native Land" by D.Natsagdorj from http://www.linguamongolia.co.uk/.

my $input	=   "ᠬᠡᠨᠲᠡᠢ ᠂ ᠬᠠᠩᠭᠠᠢ ᠂ ᠰᠣᠶᠣᠨ᠎ᠤ ᠥᠨᠳᠦᠷ ᠰᠠᠶᠢᠬᠠᠨ ᠨᠢᠷᠤᠭᠤᠨ᠎ᠤᠳ " .
		    "ᠬᠣᠶᠢᠲᠤ ᠵᠦᠭ᠎ᠦᠨ ᠴᠢᠮᠡᠭ ᠪᠣᠯᠤᠭᠰᠠᠨ ᠣᠢ ᠬᠥᠪᠴᠢ᠎ᠶᠢᠨ ᠠᠭᠤᠯᠠᠨ᠎ᠤᠳ " .
		    "ᠮᠡᠨᠡᠨ ᠂ ᠱᠠᠷᠭ᠎ᠠ ᠂ ᠨᠣᠮᠢᠨ᠎ᠤ ᠥᠷᠭᠡᠨ ᠶᠡᠬᠡ ᠭᠣᠪᠢ᠎ᠤᠳ " .
		    "ᠡᠮᠦᠨ᠎ᠡ ᠵᠦᠭ᠎ᠦᠨ ᠮᠠᠩᠯᠠᠢ ᠪᠣᠯᠤᠭᠰᠠᠨ ᠡᠯᠡᠰᠦᠨ ᠮᠠᠩᠬᠠᠨ ᠳᠠᠯᠠᠢ᠎ᠤᠳ " .
		    "ᠡᠨᠡ ᠪᠣᠯ ᠮᠢᠨᠤ ᠲᠥᠷᠦᠭᠰᠡᠨ ᠨᠤᠲᠤᠭ ᠮᠣᠩᠭᠣᠯ᠎ᠤᠨ ᠰᠠᠶᠢᠬᠠᠨ ᠣᠷᠣᠨ ᠃";
my $output_ok	=   "kentei , qangɣai , soyon-u öndür sayiqan niruɣun-ud " .
                    "qoyitu jüg-ün čimeg boluɣsan oi köbči-yin aɣulan-ud " .
                    "menen , šarɣ-a , nomin-u örgen yeke ɣobi-ud " .
                    "emün-e jüg-ün manglai boluɣsan elesün mangqan dalai-ud " .
                    "ene bol minu törügsen nutuɣ mongɣol-un sayiqan oron .";

# A phrase from "Secret History of Mongols" by transcription of B.Sumyaabaatar.

my $txt_1	=   "ᠬᠠᠷᠴᠤ᠎ᠶᠢᠨ ᠬᠥᠪᠡᠭᠦᠨ ᠪᠣᠷᠵᠢᠭᠢᠳᠠᠢ᠎ᠮᠡᠷᠭᠡᠨ᠂ ᠮᠣᠩᠭᠣᠯᠵᠢᠨ᠎ᠭᠣᠣ᠎ᠠ ᠭᠡᠷᠭᠡᠢᠲᠦ ᠠᠵᠤᠭᠤ᠃ ᠪᠣᠷᠵᠢᠭᠢᠳᠠᠢ᠎ᠮᠡᠷᠭᠡᠨ᠎ᠤ ᠬᠥᠪᠡᠭᠦᠨ ᠲᠣᠷᠣᠭᠣᠯᠵᠢᠨ᠎ᠪᠠᠶᠠᠨ᠂ ᠪᠣᠷᠣᠭᠴᠢᠨ᠎ᠭᠣᠣ᠎ᠠ ᠭᠡᠷᠭᠡᠢᠲᠦ᠂ ᠪᠣᠷᠣᠯᠳᠠᠢ ᠰᠤᠶᠠᠯᠪᠢ ᠵᠠᠯᠠᠭᠤᠲᠤ᠂ ᠳᠠᠶᠢᠷ ᠪᠣᠷᠣ ᠬᠣᠶᠠᠷ ᠬᠦᠯᠦᠭᠦᠳ ᠠᠭᠲᠠᠰᠲᠤ ᠪᠦᠯᠡᠭᠡ᠃ ᠲᠣᠷᠣᠭᠣᠯᠵᠢᠨ᠎ᠤ ᠬᠥᠪᠡᠭᠦᠨ ᠳᠤᠸᠠ᠎ᠰᠣᠬᠣᠷ ᠳᠣᠪᠤᠨ᠎ᠮᠡᠷᠭᠡᠨ ᠬᠣᠶᠠᠷ ᠪᠦᠯᠡᠭᠡ᠃";

my $txt_1_ok	=   "qarču-yin köbegün borjiɣidai-mergen, mongɣoljin-ɣoo-a gergeitü ajuɣu. borjiɣidai-mergen-u köbegün toroɣoljin-bayan, boroɣčin-ɣoo-a gergeitü, boroldai suyalbi jalaɣutu, dayir boro qoyar külügüd aɣtastu bülege. toroɣoljin-u köbegün duva-soqor dobun-mergen qoyar bülege.";

my $txt_2	=   "ᠤᠭᠤᠷᠬᠠᠢ ᠪᠠᠶᠠᠯᠢᠭ᠎ᠤᠨ ᠣᠬᠢ ᠣᠯᠠᠨ ᠠᠭᠤᠯᠠ ᠳᠠᠪᠠᠭᠠᠨ᠎ᠤᠳ";
my $txt_2_ok	=   "uɣurqai bayaliɣ-un oki olan aɣula dabaɣan-ud";

my $txt_3	=   "ᠬᠦᠮᠦᠨ ᠪᠦᠭᠦᠳᠡ ᠴᠢᠮᠠᠶᠢᠭᠢ ᠬᠦᠯᠢᠶᠡᠵᠦ᠂ ᠪᠣᠳᠠᠰ ᠪᠦᠭᠦᠳᠡ ᠴᠢᠮᠠᠶᠢᠭᠢ ᠮᠥᠷᠦᠭᠡᠳᠡᠮᠦᠢ";
my $txt_3_ok	=   "kümün bügüde čimayigi küliyejü, bodas bügüde čimayigi mörügedemüi";

my $txt_4	=   "ᠪᠠᠢᠭᠰᠠᠭᠠᠷ᠂ ᠲᠣᠭᠲᠠᠨᠢᠭᠰᠠᠨ᠂ ᠵᠢᠭᠰᠠᠭᠠᠯ᠎ᠤᠨ";
my $txt_4_ok	=   "baiɣsaɣar, toɣtaniɣsan, jiɣsaɣal-un";

my $txt_5       =   "᠐᠑᠒᠓᠔᠕᠖᠗᠘᠙ᠧᠫᠱᠸᠹᠺᠻᠼᠽᠿᡀᡁᡂᠾ᠀᠁᠄᠅";
my $txt_5_ok    =   "0123456789ēpšvfḳǩczžlhzhchh§…:¶";




use Lingua::Translit;

my $tr = new Lingua::Translit($name);


my $output = $tr->translit($input);

# 1
is($tr->can_reverse(), 1, "$name: is reversible");

# 2
is($output, $output_ok, "$name: transliteration");

# 3
$output = $tr->translit_reverse($output);
is($output,$input, "$name: transliteration (reverse)");

# 4
my $o = $tr->translit($txt_1);
is($o, $txt_1_ok, "$name: Short text #1");

# 5
$o = $tr->translit_reverse($o);
is($o, $txt_1, "$name: Short text #1 (reverse)");

# 6
$o = $tr->translit($txt_2);
is($o, $txt_2_ok, "$name: Short text #2");

# 7
$o = $tr->translit_reverse($o);
is($o, $txt_2, "$name: Short text #2 (reverse)");

# 8
$o = $tr->translit($txt_3);
is($o, $txt_3_ok, "$name: Short text #3");

# 9
$o = $tr->translit_reverse($o);
is($o, $txt_3, "$name: Short text #3 (reverse)");

# 10
$o = $tr->translit($txt_4);
is($o, $txt_4_ok, "$name: Short text #4");

# 11
$o = $tr->translit_reverse($o);
is($o, $txt_4, "$name: Short text #4 (reverse)");

# 12
$o = $tr->translit($txt_5);
is($o, $txt_5_ok, "$name: Short text #5");

# 13
$o = $tr->translit_reverse($o);
is($o, $txt_5, "$name: Short text #5 (reverse)");

