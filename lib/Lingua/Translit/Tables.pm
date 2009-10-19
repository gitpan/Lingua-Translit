package Lingua::Translit::Tables;


#
# Copyright (C) 2007-2008 ...
#   Alex Linke <alinke@lingua-systems.com>
#   Rona Linke <rlinke@lingua-systems.com>
# Copyright (C) 2009 Lingua-Systems Software GmbH
#


use strict;
use warnings;

require 5.008;


our $VERSION = '0.08';


use Carp;


=pod

=head1 NAME

Lingua::Translit::Tables - provides transliteration tables

=head1 SYNOPSIS

  use Lingua::Translit::Tables qw/:checks/;

  my $truth;

  $truth = translit_supported("ISO 9");
  $truth = translit_reverse_supported("ISO 9");

  use Lingua::Translit::Tables qw/:list/;

  translit_list_supported();

=head1 DESCRIPTION

This module is primary used to provide transliteration tables for
L<Lingua::Translit> and therefore allows to separate data and algorithm.

Beyond that, it provides routines to check if a given transliteration is
supported and allows to print a simple list of supported transliterations
along with some meta information.

=head1 EXPORTS

No symbols are exported by default.

Use either the routine's name or one of the following I<tags> to import
symbols to your namespace.

=over 4

=item B<all>

Import all routines.

=item B<checks>

Import all routines that allow to check if a given transliteration is
supported: translit_supported() and translit_reverse_supported().

=item B<list>

Import translit_list_supported(). (Convenience tag)

=back

=cut


require Exporter;

our @ISA        =   qw/Exporter/;
our @EXPORT     =   qw//;           # Export nothing by default
our @EXPORT_OK  =   qw/translit_supported translit_reverse_supported
                       translit_list_supported/;

our %EXPORT_TAGS = (
    checks  => [qw/translit_supported translit_reverse_supported/],
    list    => [qw/translit_list_supported/],
    all     => [@EXPORT_OK]
);


# For convenience, the tables are initialized at the bottom of this file
our %tables;


# used internally to retrieve a reference to a single transliteration table
sub _get_table_reference
{
    my $name = shift();

    return unless $name;

    $name = _get_table_id($name);

    foreach my $table (keys %tables)
    {
        return $tables{$table} if ($table =~ /^$name$/i);
    }

    return;
}


=head1 ROUTINES

=head2 translit_supported(I<translit_name>)

Returns true (1), iff I<translit_name> is supported. False (0) otherwise.

=cut

sub translit_supported
{
    return (_get_table_reference(_get_table_id($_[0])) ? 1 : 0);
}


=head2 translit_reverse_supported(I<translit_name>)

Returns true (1), iff I<translit_name> is supported and allows reverse
transliteration. False (0) otherwise.

=cut

sub translit_reverse_supported
{
    my $table = _get_table_reference(_get_table_id($_[0]));

    croak("Failed to retrieve table for $_[0].") unless ($table);

    return (($table->{reverse} =~ /^true$/) ? 1 : 0);
}


=head2 B<translit_list_supported()>

Prints a list of all supported transliterations to STDOUT, providing the
following information:

  * Name
  * Reversibility
  * Description

The same information is provided in this document as well:

=cut

sub translit_list_supported
{
    foreach my $table (keys %tables)
    {
        my $t = $tables{$table};
        print "$t->{name}, reversible=$t->{reverse}, $t->{desc}\n";
    }
}


=head1 SUPPORTED TRANSLITERATIONS

=over 4

=item Cyrillic

I<ISO 9>, reversible, ISO 9:1995, Cyrillic to Latin

I<Streamlined System BUL>, not reversible, The Streamlined System: 2006,
Cyrillic to Latin, Bulgarian

I<DIN 1460 BUL>, reversible, DIN 1460:1982, Cyrillic to Latin, Bulgarian

=item Greek

I<ISO 843>, not reversible, ISO 843:1997, Greek to Latin

I<DIN 31634>, not reversible, DIN 31634:1982, Greek to Latin

I<Greeklish>, not reversible, Greeklish (Phonetic), Greek to Latin

=item Latin

I<Common CES>, not reversible, Czech without diacritics

I<Common DEU>, not reversible, German without umlauts

I<Common POL>, not reversible, Unaccented Polish

I<Common RON>, not reversible, Romanian without diacritics as commonly used

I<Common SLK>, not reversible, Slovak without diacritics

I<Common SLV>, not reversible, Slovenian without diacritics

=item Mongolian

I<Common Classical MON>, reversible, Classical Mongolian to Latin

=back

=head1 ADDING NEW TRANSLITERATIONS

In case you want to add your own transliteration tables to L<Lingua::Translit>,
a developer manual (F<xml/manual/>) is available in HTML and plain text format.
An online version is available at
L<http://www.lingua-systems.com/transliteration/Lingua-Translit-Perl-module/developer-manual/>.

All necessary tools and templates to start with are provided as well.

=head1 BUGS

None known.

Please report bugs to perl@lingua-systems.com.

=head1 SEE ALSO

L<Lingua::Translit>

=head1 CREDITS

Thanks to Dr. Daniel Eiwen, Romanisches Seminar, Universitaet Koeln for his
help on Romanian transliteration.

Thanks to Bayanzul Lodoysamba <baynaa@users.sourceforge.net> for contributing
the "Common Classical Mongolian" transliteration table.

=head1 AUTHORS

Alex Linke <alinke@lingua-systems.com>

Rona Linke <rlinke@lingua-systems.com>

=head1 LICENSE AND COPYRIGHT

Copyright (C) 2008 Alex Linke and Rona Linke

Copyright (C) 2009 Lingua-Systems Software GmbH

This module is free software. It may be used, redistributed
and/or modified under the terms of either the GPL v2 or the
Artistic license.

=cut


# Get a table's identifier (based on the table's name)
#   i.e "Common DEU" -> "common_deu"
sub _get_table_id
{
    my $name = shift();

    return "" unless $name;

    $name =~ s/\s/_/g;

    return lc($name);
}


# For convenience, the next line is automatically substituted with the set
# of transliteration tables at compile time.
%tables; # PLACEHOLDER


1;


# vim: sts=4 sw=4 enc=utf-8 ai et
