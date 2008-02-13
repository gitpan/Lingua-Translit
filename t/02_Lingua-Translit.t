## $Id: 02_Lingua-Translit.t 83 2008-02-12 14:34:38Z alinke $

use strict;
use Test::More tests => (7 + (3*4));

my $truth;
my @check_support = ("ISO 843", "DIN 5008", "ISO 9");

my $num_str = "1234567890";

BEGIN
{
    # 1
    use_ok("Lingua::Translit");
}

use Lingua::Translit;

# create new object
my $tr = new Lingua::Translit($check_support[0]);

# 2
can_ok($tr, "translit");

# 3
can_ok($tr, "translit_reverse");

# 4
can_ok($tr, "can_reverse");

# 5
can_ok($tr, "name");

# 6
can_ok($tr, "desc");

undef($tr);

eval { $tr = new Lingua::Translit(""); };

# 7
isnt($@, '', "create object from empty transliteration");

undef($tr);

foreach my $name (@check_support)
{
    eval { $tr = new Lingua::Translit($name); };

    is($@, '', "$name: create object");

    is($tr->name(), $name, "$name: compare names");

    isnt($tr->desc(), '', "$name: has a description");

    # transliterating a number string should lead to an exact copy
    my $num_str_tr = $tr->translit($num_str);

    is($num_str, $num_str_tr, "$name: number transliteration");
}
