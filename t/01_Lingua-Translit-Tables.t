## $Id: 01_Lingua-Translit-Tables.t 126 2008-02-19 07:28:54Z alinke $

use strict;
use Test::More tests => (12 + 5);

my $truth;

my @check_support = (
    "ISO 843", "DIN 5008", "ISO 9", "Greeklish", "DIN 31634"
);


BEGIN
{
    # 1
    use_ok("Lingua::Translit::Tables");

    # 2
    use_ok("Lingua::Translit::Tables", qw/translit_supported/);

    # 3
    use_ok("Lingua::Translit::Tables", qw/translit_reverse_supported/);

    # 4
    use_ok("Lingua::Translit::Tables", qw/translit_list_supported/);

    # 5
    use_ok("Lingua::Translit::Tables", qw/:checks/);

    # 6
    use_ok("Lingua::Translit::Tables", qw/:list/);

    # 7
    use_ok("Lingua::Translit::Tables", qw/:all/);
}

# 8
can_ok("Lingua::Translit::Tables", qw/translit_supported/);

# 9
can_ok("Lingua::Translit::Tables", qw/translit_reverse_supported/);

# 10
can_ok("Lingua::Translit::Tables", qw/translit_list_supported/);


use Lingua::Translit::Tables qw/:checks/;

$truth = translit_supported("nonexistent");

# 11
is($truth, 0, "support for nonexistent table");


$truth = translit_supported("");

# 12
is($truth, 0, "support for empty table");


foreach my $name (@check_support)
{
    $truth = translit_supported($name);

    is($truth, 1, "support for existing table $name");
}
