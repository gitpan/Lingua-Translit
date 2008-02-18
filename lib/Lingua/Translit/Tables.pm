package Lingua::Translit::Tables;


#
# Copyright 2007-2008 by ...
#   Alex Linke, <alinke@lingua-systems.com>
#   Rona Linke, <rlinke@lingua-systems.com>
#
# $Id: Tables.pm 109 2008-02-14 12:06:28Z alinke $
#


use strict;
use warnings;

require 5.008;


our $VERSION = '0.03';


use utf8;
no bytes;

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

our @ISA	=   qw/Exporter/;
our @EXPORT	=   qw//;	    # Export nothing by default
our @EXPORT_OK	=   qw/translit_supported translit_reverse_supported
		    translit_list_supported/;

our %EXPORT_TAGS = (
    checks  => [qw/translit_supported translit_reverse_supported/],
    list    => [qw/translit_list_supported/],
    all	    => [@EXPORT_OK]
);


# For convenience, the tables are initialized at the bottom of this file
our %tables;


# used internally to retrieve a reference to a single transliteration table
sub _get_table_reference
{
    my $name = shift();

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
    return (_get_table_reference($_[0]) ? 1 : 0);
}


=head2 translit_reverse_supported(I<translit_name>)

Returns true (1), iff I<translit_name> is supported and allows reverse
transliteration. False (0) otherwise.

=cut

sub translit_reverse_supported
{
    my $table = _get_table_reference($_[0]);

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
    print "Transliterations supported by " . __PACKAGE__ . " v$VERSION:\n";

    foreach my $table (keys %tables)
    {
	my $t = $tables{$table};
	print "$t->{name}, reversible=$t->{reverse}, $t->{desc}\n";
    }
}


=head1 SUPPORTED TRANSLITERATIONS

=over 4

=item B<DIN 5008>, not reversible, C<DIN 5008:2005, German umlauts>

=item B<ISO 843>, not reversible, C<ISO 843:1997, Greek to Latin>

=item B<ISO 9>, reversible, C<ISO 9:1995, Cyrillic to Latin>

=item B<Greeklish>, not reversible, C<Greeklish (Phonetic), Greek to Latin>

=back

=head1 EXTENDING

If you want to extend the list of supported transliterations, have a look at
the F<xml/> directory within the distribution tarball.  It contains XML
definitions of transliteration tables and a template file F<template> you may
want to use and B<xml2dump>, a tool to convert these into the proper format as
used by L<Lingua::Translit::Tables>.

Contact the authors at perl@lingua-systems.com if you feel the desire to
contribute your table to the official distribution.

=head1 BUGS

None known.

Please report bugs to perl@lingua-systems.com.

=head1 SEE ALSO

L<Lingua::Translit>

=head1 AUTHORS

Alex Linke <alinke@lingua-systems.com>

Rona Linke <rlinke@lingua-systems.com>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2008, Alex Linke and Rona Linke. All rights reserved.

This module is free software. It may be used, redistributed
and/or modified under the terms of either the GPL v2 or the
Artistic license.

=cut



# The following data should never be edited directly. It was generated using
# the xml2dump utility included in Lingua::Translit's distribution.
%tables = (
  "Greeklish" => {
    "desc" => "Greeklish (Phonetic), Greek to Latin",
    "name" => "Greeklish",
    "rules" => [
      {
        "to" => "i",
        "from" => "\x{3b5}\x{3b9}"
      },
      {
        "to" => "i",
        "from" => "\x{3ad}\x{3b9}"
      },
      {
        "to" => "i",
        "from" => "\x{3b5}\x{3af}"
      },
      {
        "to" => "ef",
        "from" => "\x{3b5}\x{3c5}"
      },
      {
        "to" => "ef",
        "from" => "\x{3ad}\x{3c5}"
      },
      {
        "to" => "ef",
        "from" => "\x{3b5}\x{3cd}"
      },
      {
        "to" => "u",
        "from" => "\x{3bf}\x{3c5}"
      },
      {
        "to" => "u",
        "from" => "\x{3bf}\x{3cd}"
      },
      {
        "to" => "u",
        "from" => "\x{3cc}\x{3c5}"
      },
      {
        "to" => "A",
        "from" => "\x{391}"
      },
      {
        "to" => "a",
        "from" => "\x{3b1}"
      },
      {
        "to" => "A",
        "from" => "\x{386}"
      },
      {
        "to" => "a",
        "from" => "\x{3ac}"
      },
      {
        "to" => "V",
        "from" => "\x{392}"
      },
      {
        "to" => "v",
        "from" => "\x{3b2}"
      },
      {
        "to" => "Y",
        "from" => "\x{393}"
      },
      {
        "to" => "y",
        "from" => "\x{3b3}"
      },
      {
        "to" => "D",
        "from" => "\x{394}"
      },
      {
        "to" => "d",
        "from" => "\x{3b4}"
      },
      {
        "to" => "E",
        "from" => "\x{395}"
      },
      {
        "to" => "e",
        "from" => "\x{3b5}"
      },
      {
        "to" => "E",
        "from" => "\x{388}"
      },
      {
        "to" => "e",
        "from" => "\x{3ad}"
      },
      {
        "to" => "Z",
        "from" => "\x{396}"
      },
      {
        "to" => "z",
        "from" => "\x{3b6}"
      },
      {
        "to" => "I",
        "from" => "\x{397}"
      },
      {
        "to" => "i",
        "from" => "\x{3b7}"
      },
      {
        "to" => "I",
        "from" => "\x{389}"
      },
      {
        "to" => "i",
        "from" => "\x{3ae}"
      },
      {
        "to" => "Th",
        "from" => "\x{398}"
      },
      {
        "to" => "th",
        "from" => "\x{3b8}"
      },
      {
        "to" => "I",
        "from" => "\x{399}"
      },
      {
        "to" => "i",
        "from" => "\x{3b9}"
      },
      {
        "to" => "I",
        "from" => "\x{38a}"
      },
      {
        "to" => "i",
        "from" => "\x{3af}"
      },
      {
        "to" => "I",
        "from" => "\x{3aa}"
      },
      {
        "to" => "i",
        "from" => "\x{3ca}"
      },
      {
        "to" => "i",
        "from" => "\x{390}"
      },
      {
        "to" => "K",
        "from" => "\x{39a}"
      },
      {
        "to" => "k",
        "from" => "\x{3ba}"
      },
      {
        "to" => "L",
        "from" => "\x{39b}"
      },
      {
        "to" => "l",
        "from" => "\x{3bb}"
      },
      {
        "to" => "M",
        "from" => "\x{39c}"
      },
      {
        "to" => "m",
        "from" => "\x{3bc}"
      },
      {
        "to" => "N",
        "from" => "\x{39d}"
      },
      {
        "to" => "n",
        "from" => "\x{3bd}"
      },
      {
        "to" => "X",
        "from" => "\x{39e}"
      },
      {
        "to" => "x",
        "from" => "\x{3be}"
      },
      {
        "to" => "O",
        "from" => "\x{39f}"
      },
      {
        "to" => "o",
        "from" => "\x{3bf}"
      },
      {
        "to" => "O",
        "from" => "\x{38c}"
      },
      {
        "to" => "o",
        "from" => "\x{3cc}"
      },
      {
        "to" => "P",
        "from" => "\x{3a0}"
      },
      {
        "to" => "p",
        "from" => "\x{3c0}"
      },
      {
        "to" => "R",
        "from" => "\x{3a1}"
      },
      {
        "to" => "r",
        "from" => "\x{3c1}"
      },
      {
        "to" => "S",
        "from" => "\x{3a3}"
      },
      {
        "to" => "s",
        "from" => "\x{3c3}"
      },
      {
        "to" => "T",
        "from" => "\x{3a4}"
      },
      {
        "to" => "t",
        "from" => "\x{3c4}"
      },
      {
        "to" => "I",
        "from" => "\x{3a5}"
      },
      {
        "to" => "i",
        "from" => "\x{3c5}"
      },
      {
        "to" => "I",
        "from" => "\x{38e}"
      },
      {
        "to" => "i",
        "from" => "\x{3cd}"
      },
      {
        "to" => "I",
        "from" => "\x{ab}"
      },
      {
        "to" => "i",
        "from" => "\x{3cb}"
      },
      {
        "to" => "i",
        "from" => "\x{3b0}"
      },
      {
        "to" => "F",
        "from" => "\x{3a6}"
      },
      {
        "to" => "f",
        "from" => "\x{3c6}"
      },
      {
        "to" => "H",
        "from" => "\x{3a7}"
      },
      {
        "to" => "h",
        "from" => "\x{3c7}"
      },
      {
        "to" => "Ps",
        "from" => "\x{3a8}"
      },
      {
        "to" => "ps",
        "from" => "\x{3c8}"
      },
      {
        "to" => "O",
        "from" => "\x{3a9}"
      },
      {
        "to" => "o",
        "from" => "\x{3c9}"
      },
      {
        "to" => "O",
        "from" => "\x{38f}"
      },
      {
        "to" => "o",
        "from" => "\x{3ce}"
      },
      {
        "to" => "s",
        "from" => "\x{3c2}"
      },
      {
        "to" => "?",
        "from" => "\x{37e}",
        "context" => {
          "after" => "\\b"
        }
      },
      {
        "to" => "?",
        "from" => ";",
        "context" => {
          "after" => "\\b"
        }
      },
      {
        "to" => ";",
        "from" => "\x{b7}"
      },
      {
        "to" => "-",
        "from" => "\x{203f}"
      },
      {
        "to" => {},
        "from" => "\x{384}"
      },
      {
        "to" => {},
        "from" => "\x{385}"
      },
      {
        "to" => {},
        "from" => "\x{342}"
      },
      {
        "to" => {},
        "from" => "\x{343}"
      },
      {
        "to" => {},
        "from" => "\x{313}"
      },
      {
        "to" => {},
        "from" => "\x{314}"
      },
      {
        "to" => {},
        "from" => "\x{345}"
      },
      {
        "to" => {},
        "from" => "\x{345}"
      }
    ],
    "reverse" => "false"
  },
  "ISO 843" => {
    "desc" => "ISO 843:1997 TL (Type 1), Greek to Latin",
    "name" => "ISO 843",
    "rules" => [
      {
        "to" => "A",
        "from" => "\x{391}"
      },
      {
        "to" => "a",
        "from" => "\x{3b1}"
      },
      {
        "to" => "V",
        "from" => "\x{392}"
      },
      {
        "to" => "v",
        "from" => "\x{3b2}"
      },
      {
        "to" => "G",
        "from" => "\x{393}"
      },
      {
        "to" => "g",
        "from" => "\x{3b3}"
      },
      {
        "to" => "D",
        "from" => "\x{394}"
      },
      {
        "to" => "d",
        "from" => "\x{3b4}"
      },
      {
        "to" => "E",
        "from" => "\x{395}"
      },
      {
        "to" => "e",
        "from" => "\x{3b5}"
      },
      {
        "to" => "Z",
        "from" => "\x{396}"
      },
      {
        "to" => "z",
        "from" => "\x{3b6}"
      },
      {
        "to" => "\x{12a}",
        "from" => "\x{397}"
      },
      {
        "to" => "\x{12b}",
        "from" => "\x{3b7}"
      },
      {
        "to" => "Th",
        "from" => "\x{398}"
      },
      {
        "to" => "th",
        "from" => "\x{3b8}"
      },
      {
        "to" => "I",
        "from" => "\x{399}"
      },
      {
        "to" => "i",
        "from" => "\x{3b9}"
      },
      {
        "to" => "K",
        "from" => "\x{39a}"
      },
      {
        "to" => "k",
        "from" => "\x{3ba}"
      },
      {
        "to" => "L",
        "from" => "\x{39b}"
      },
      {
        "to" => "l",
        "from" => "\x{3bb}"
      },
      {
        "to" => "M",
        "from" => "\x{39c}"
      },
      {
        "to" => "m",
        "from" => "\x{3bc}"
      },
      {
        "to" => "N",
        "from" => "\x{39d}"
      },
      {
        "to" => "n",
        "from" => "\x{3bd}"
      },
      {
        "to" => "X",
        "from" => "\x{39e}"
      },
      {
        "to" => "x",
        "from" => "\x{3be}"
      },
      {
        "to" => "O",
        "from" => "\x{39f}"
      },
      {
        "to" => "o",
        "from" => "\x{3bf}"
      },
      {
        "to" => "P",
        "from" => "\x{3a0}"
      },
      {
        "to" => "p",
        "from" => "\x{3c0}"
      },
      {
        "to" => "R",
        "from" => "\x{3a1}"
      },
      {
        "to" => "r",
        "from" => "\x{3c1}"
      },
      {
        "to" => "S",
        "from" => "\x{3a3}"
      },
      {
        "to" => "s",
        "from" => "\x{3c2}"
      },
      {
        "to" => "s",
        "from" => "\x{3c3}"
      },
      {
        "to" => "T",
        "from" => "\x{3a4}"
      },
      {
        "to" => "t",
        "from" => "\x{3c4}"
      },
      {
        "to" => "Y",
        "from" => "\x{3a5}"
      },
      {
        "to" => "y",
        "from" => "\x{3c5}"
      },
      {
        "to" => "F",
        "from" => "\x{3a6}"
      },
      {
        "to" => "f",
        "from" => "\x{3c6}"
      },
      {
        "to" => "Ch",
        "from" => "\x{3a7}"
      },
      {
        "to" => "ch",
        "from" => "\x{3c7}"
      },
      {
        "to" => "Ps",
        "from" => "\x{3a8}"
      },
      {
        "to" => "ps",
        "from" => "\x{3c8}"
      },
      {
        "to" => "\x{14c}",
        "from" => "\x{3a9}"
      },
      {
        "to" => "\x{14d}",
        "from" => "\x{3c9}"
      },
      {
        "to" => "S",
        "from" => "\x{3da}"
      },
      {
        "to" => "s",
        "from" => "\x{3db}"
      },
      {
        "to" => "W",
        "from" => "\x{3dc}"
      },
      {
        "to" => "f",
        "from" => "\x{3dd}"
      },
      {
        "to" => "j",
        "from" => "\x{3f3}"
      },
      {
        "to" => "\x{b4}",
        "from" => "\x{384}"
      },
      {
        "to" => "\x{a8}\x{301}",
        "from" => "\x{385}"
      },
      {
        "to" => "\x{302}",
        "from" => "\x{342}"
      },
      {
        "to" => "\x{2bc}",
        "from" => "\x{343}"
      },
      {
        "to" => "\x{2bc}",
        "from" => "\x{313}"
      },
      {
        "to" => "h",
        "from" => "\x{314}"
      },
      {
        "to" => "\x{327}",
        "from" => "\x{345}"
      },
      {
        "to" => "\x{327}",
        "from" => "\x{345}"
      },
      {
        "to" => "\x{c1}",
        "from" => "\x{386}"
      },
      {
        "to" => "\x{e1}",
        "from" => "\x{3ac}"
      },
      {
        "to" => "\x{c9}",
        "from" => "\x{388}"
      },
      {
        "to" => "\x{e9}",
        "from" => "\x{3ad}"
      },
      {
        "to" => "\x{12a}\x{301}",
        "from" => "\x{389}"
      },
      {
        "to" => "\x{12b}\x{301}",
        "from" => "\x{3ae}"
      },
      {
        "to" => "\x{cd}",
        "from" => "\x{38a}"
      },
      {
        "to" => "\x{ed}",
        "from" => "\x{3af}"
      },
      {
        "to" => "\x{d3}",
        "from" => "\x{38c}"
      },
      {
        "to" => "\x{f3}",
        "from" => "\x{3cc}"
      },
      {
        "to" => "\x{dd}",
        "from" => "\x{38e}"
      },
      {
        "to" => "\x{fd}",
        "from" => "\x{3cd}"
      },
      {
        "to" => "\x{1e52}",
        "from" => "\x{38f}"
      },
      {
        "to" => "\x{1e53}",
        "from" => "\x{3ce}"
      },
      {
        "to" => "\x{cf}",
        "from" => "\x{3aa}"
      },
      {
        "to" => "\x{ef}",
        "from" => "\x{3ca}"
      },
      {
        "to" => "\x{178}",
        "from" => "\x{ab}"
      },
      {
        "to" => "\x{ff}",
        "from" => "\x{3cb}"
      },
      {
        "to" => "\x{1e2f}",
        "from" => "\x{390}"
      },
      {
        "to" => "\x{ff}\x{301}",
        "from" => "\x{3b0}"
      },
      {
        "to" => "?",
        "from" => "\x{37e}",
        "context" => {
          "before" => "\\s"
        }
      },
      {
        "to" => "?",
        "from" => ";",
        "context" => {
          "before" => "\\s"
        }
      },
      {
        "to" => ";",
        "from" => "\x{b7}"
      },
      {
        "to" => "-",
        "from" => "\x{203f}"
      }
    ],
    "reverse" => "false"
  },
  "DIN 5008" => {
    "desc" => "DIN 5008:2005, German umlauts",
    "name" => "DIN 5008",
    "rules" => [
      {
        "to" => "Ae",
        "from" => "\x{c4}"
      },
      {
        "to" => "ae",
        "from" => "\x{e4}"
      },
      {
        "to" => "Oe",
        "from" => "\x{d6}"
      },
      {
        "to" => "oe",
        "from" => "\x{f6}"
      },
      {
        "to" => "Ue",
        "from" => "\x{dc}"
      },
      {
        "to" => "ue",
        "from" => "\x{fc}"
      },
      {
        "to" => "SS",
        "from" => "\x{df}",
        "context" => {
          "after" => "\\p{IsUpper}"
        }
      },
      {
        "to" => "ss",
        "from" => "\x{df}"
      }
    ],
    "reverse" => "false"
  },
  "ISO 9" => {
    "desc" => "ISO 9:1995, Cyrillic to Latin",
    "name" => "ISO 9",
    "rules" => [
      {
        "to" => "A",
        "from" => "\x{410}"
      },
      {
        "to" => "a",
        "from" => "\x{430}"
      },
      {
        "to" => "\x{102}",
        "from" => "\x{4d0}"
      },
      {
        "to" => "\x{103}",
        "from" => "\x{4d1}"
      },
      {
        "to" => "\x{c4}",
        "from" => "\x{4d2}"
      },
      {
        "to" => "\x{e4}",
        "from" => "\x{4d3}"
      },
      {
        "to" => "A\x{30b}",
        "from" => "\x{4d8}"
      },
      {
        "to" => "a\x{30b}",
        "from" => "\x{4d9}"
      },
      {
        "to" => "B",
        "from" => "\x{411}"
      },
      {
        "to" => "b",
        "from" => "\x{431}"
      },
      {
        "to" => "V",
        "from" => "\x{412}"
      },
      {
        "to" => "v",
        "from" => "\x{432}"
      },
      {
        "to" => "G",
        "from" => "\x{413}"
      },
      {
        "to" => "g",
        "from" => "\x{433}"
      },
      {
        "to" => "G\x{300}",
        "from" => "\x{490}"
      },
      {
        "to" => "g\x{300}",
        "from" => "\x{491}"
      },
      {
        "to" => "\x{11e}",
        "from" => "\x{494}"
      },
      {
        "to" => "\x{11f}",
        "from" => "\x{495}"
      },
      {
        "to" => "\x{120}",
        "from" => "\x{492}"
      },
      {
        "to" => "\x{121}",
        "from" => "\x{493}"
      },
      {
        "to" => "D",
        "from" => "\x{414}"
      },
      {
        "to" => "d",
        "from" => "\x{434}"
      },
      {
        "to" => "\x{110}",
        "from" => "\x{402}"
      },
      {
        "to" => "\x{111}",
        "from" => "\x{452}"
      },
      {
        "to" => "\x{1f4}",
        "from" => "\x{403}"
      },
      {
        "to" => "\x{1f5}",
        "from" => "\x{453}"
      },
      {
        "to" => "E",
        "from" => "\x{415}"
      },
      {
        "to" => "e",
        "from" => "\x{435}"
      },
      {
        "to" => "\x{cb}",
        "from" => "\x{401}"
      },
      {
        "to" => "\x{eb}",
        "from" => "\x{451}"
      },
      {
        "to" => "\x{114}",
        "from" => "\x{4d6}"
      },
      {
        "to" => "\x{115}",
        "from" => "\x{4d7}"
      },
      {
        "to" => "\x{ca}",
        "from" => "\x{404}"
      },
      {
        "to" => "\x{ea}",
        "from" => "\x{454}"
      },
      {
        "to" => "C\x{306}",
        "from" => "\x{4bc}"
      },
      {
        "to" => "c\x{306}",
        "from" => "\x{4bd}"
      },
      {
        "to" => "\x{c7}\x{306}",
        "from" => "\x{4be}"
      },
      {
        "to" => "\x{e7}\x{306}",
        "from" => "\x{4bf}"
      },
      {
        "to" => "\x{17d}",
        "from" => "\x{416}"
      },
      {
        "to" => "\x{17e}",
        "from" => "\x{436}"
      },
      {
        "to" => "Z\x{306}",
        "from" => "\x{4c1}"
      },
      {
        "to" => "z\x{306}",
        "from" => "\x{4c2}"
      },
      {
        "to" => "Z\x{304}",
        "from" => "\x{4dc}"
      },
      {
        "to" => "z\x{304}",
        "from" => "\x{4dd}"
      },
      {
        "to" => "\x{17d}\x{326}",
        "from" => "\x{496}"
      },
      {
        "to" => "\x{17e}\x{327}",
        "from" => "\x{497}"
      },
      {
        "to" => "Z",
        "from" => "\x{417}"
      },
      {
        "to" => "z",
        "from" => "\x{437}"
      },
      {
        "to" => "Z\x{308}",
        "from" => "\x{4de}"
      },
      {
        "to" => "z\x{308}",
        "from" => "\x{4df}"
      },
      {
        "to" => "\x{1e90}",
        "from" => "\x{405}"
      },
      {
        "to" => "\x{1e91}",
        "from" => "\x{455}"
      },
      {
        "to" => "\x{179}",
        "from" => "\x{4e0}"
      },
      {
        "to" => "\x{17a}",
        "from" => "\x{4e1}"
      },
      {
        "to" => "I",
        "from" => "\x{418}"
      },
      {
        "to" => "i",
        "from" => "\x{438}"
      },
      {
        "to" => "\x{ce}",
        "from" => "\x{4e4}"
      },
      {
        "to" => "\x{ee}",
        "from" => "\x{4e5}"
      },
      {
        "to" => "\x{cc}",
        "from" => "\x{406}"
      },
      {
        "to" => "\x{ec}",
        "from" => "\x{456}"
      },
      {
        "to" => "\x{cf}",
        "from" => "\x{407}"
      },
      {
        "to" => "\x{ef}",
        "from" => "\x{457}"
      },
      {
        "to" => "J",
        "from" => "\x{419}"
      },
      {
        "to" => "j",
        "from" => "\x{439}"
      },
      {
        "to" => "J\x{30c}",
        "from" => "\x{408}"
      },
      {
        "to" => "\x{1f0}",
        "from" => "\x{458}"
      },
      {
        "to" => "K",
        "from" => "\x{41a}"
      },
      {
        "to" => "k",
        "from" => "\x{43a}"
      },
      {
        "to" => "\x{136}",
        "from" => "\x{49a}"
      },
      {
        "to" => "\x{137}",
        "from" => "\x{49b}"
      },
      {
        "to" => "K\x{304}",
        "from" => "\x{49e}"
      },
      {
        "to" => "k\x{304}",
        "from" => "\x{49f}"
      },
      {
        "to" => "L",
        "from" => "\x{41b}"
      },
      {
        "to" => "l",
        "from" => "\x{43b}"
      },
      {
        "to" => "L\x{302}",
        "from" => "\x{409}"
      },
      {
        "to" => "l\x{302}",
        "from" => "\x{459}"
      },
      {
        "to" => "M",
        "from" => "\x{41c}"
      },
      {
        "to" => "m",
        "from" => "\x{43c}"
      },
      {
        "to" => "N",
        "from" => "\x{41d}"
      },
      {
        "to" => "n",
        "from" => "\x{43d}"
      },
      {
        "to" => "N\x{302}",
        "from" => "\x{40a}"
      },
      {
        "to" => "n\x{302}",
        "from" => "\x{45a}"
      },
      {
        "to" => "\x{1e44}",
        "from" => "\x{4a4}"
      },
      {
        "to" => "\x{1e45}",
        "from" => "\x{4a5}"
      },
      {
        "to" => "\x{1e46}",
        "from" => "\x{4a2}"
      },
      {
        "to" => "\x{1e47}",
        "from" => "\x{4a3}"
      },
      {
        "to" => "O",
        "from" => "\x{41e}"
      },
      {
        "to" => "o",
        "from" => "\x{43e}"
      },
      {
        "to" => "\x{d6}",
        "from" => "\x{4e6}"
      },
      {
        "to" => "\x{f6}",
        "from" => "\x{4e7}"
      },
      {
        "to" => "\x{d4}",
        "from" => "\x{4e8}"
      },
      {
        "to" => "\x{f4}",
        "from" => "\x{4e9}"
      },
      {
        "to" => "P",
        "from" => "\x{41f}"
      },
      {
        "to" => "p",
        "from" => "\x{43f}"
      },
      {
        "to" => "\x{1e54}",
        "from" => "\x{4a6}"
      },
      {
        "to" => "\x{1e55}",
        "from" => "\x{4a7}"
      },
      {
        "to" => "R",
        "from" => "\x{420}"
      },
      {
        "to" => "r",
        "from" => "\x{440}"
      },
      {
        "to" => "S",
        "from" => "\x{421}"
      },
      {
        "to" => "s",
        "from" => "\x{441}"
      },
      {
        "to" => "\x{c7}",
        "from" => "\x{4aa}"
      },
      {
        "to" => "\x{e7}",
        "from" => "\x{4ab}"
      },
      {
        "to" => "T",
        "from" => "\x{422}"
      },
      {
        "to" => "t",
        "from" => "\x{442}"
      },
      {
        "to" => "\x{162}",
        "from" => "\x{4ac}"
      },
      {
        "to" => "\x{163}",
        "from" => "\x{4ad}"
      },
      {
        "to" => "\x{106}",
        "from" => "\x{40b}"
      },
      {
        "to" => "\x{170}",
        "from" => "\x{45b}"
      },
      {
        "to" => "\x{1e30}",
        "from" => "\x{40c}"
      },
      {
        "to" => "\x{1e31}",
        "from" => "\x{45c}"
      },
      {
        "to" => "U",
        "from" => "\x{423}"
      },
      {
        "to" => "u",
        "from" => "\x{443}"
      },
      {
        "to" => "\x{da}",
        "from" => "\x{423}\x{301}"
      },
      {
        "to" => "\x{fa}",
        "from" => "\x{443}\x{301}"
      },
      {
        "to" => "\x{16c}",
        "from" => "\x{40e}"
      },
      {
        "to" => "\x{16d}",
        "from" => "\x{45e}"
      },
      {
        "to" => "\x{dc}",
        "from" => "\x{4f0}"
      },
      {
        "to" => "\x{fc}",
        "from" => "\x{4f1}"
      },
      {
        "to" => "\x{170}",
        "from" => "\x{4f2}"
      },
      {
        "to" => "\x{171}",
        "from" => "\x{4f3}"
      },
      {
        "to" => "\x{d9}",
        "from" => "\x{4ae}"
      },
      {
        "to" => "\x{f9}",
        "from" => "\x{4af}"
      },
      {
        "to" => "F",
        "from" => "\x{424}"
      },
      {
        "to" => "f",
        "from" => "\x{444}"
      },
      {
        "to" => "H",
        "from" => "\x{425}"
      },
      {
        "to" => "h",
        "from" => "\x{445}"
      },
      {
        "to" => "\x{1e28}",
        "from" => "\x{4b2}"
      },
      {
        "to" => "\x{1e29}",
        "from" => "\x{4b3}"
      },
      {
        "to" => "\x{1e24}",
        "from" => "\x{4ba}"
      },
      {
        "to" => "\x{1e25}",
        "from" => "\x{4bb}"
      },
      {
        "to" => "C",
        "from" => "\x{426}"
      },
      {
        "to" => "c",
        "from" => "\x{446}"
      },
      {
        "to" => "C\x{304}",
        "from" => "\x{4b4}"
      },
      {
        "to" => "c\x{304}",
        "from" => "\x{4b5}"
      },
      {
        "to" => "\x{10c}",
        "from" => "\x{427}"
      },
      {
        "to" => "\x{10d}",
        "from" => "\x{447}"
      },
      {
        "to" => "C\x{308}",
        "from" => "\x{4f4}"
      },
      {
        "to" => "c\x{308}",
        "from" => "\x{4f5}"
      },
      {
        "to" => "\x{c7}",
        "from" => "\x{4cb}"
      },
      {
        "to" => "\x{e7}",
        "from" => "\x{4cc}"
      },
      {
        "to" => "D\x{302}",
        "from" => "\x{40f}"
      },
      {
        "to" => "d\x{302}",
        "from" => "\x{45f}"
      },
      {
        "to" => "\x{160}",
        "from" => "\x{428}"
      },
      {
        "to" => "\x{161}",
        "from" => "\x{448}"
      },
      {
        "to" => "\x{15c}",
        "from" => "\x{429}"
      },
      {
        "to" => "\x{15d}",
        "from" => "\x{449}"
      },
      {
        "to" => "\x{2ba}",
        "from" => "\x{42a}",
        "context" => {
          "after" => "[[:upper:]]"
        }
      },
      {
        "to" => "\x{2ba}",
        "from" => "\x{44a}"
      },
      {
        "to" => "\x{2019}",
        "from" => "\x{2bc}"
      },
      {
        "to" => "Y",
        "from" => "\x{42b}"
      },
      {
        "to" => "y",
        "from" => "\x{44b}"
      },
      {
        "to" => "\x{178}",
        "from" => "\x{4f8}"
      },
      {
        "to" => "\x{ff}",
        "from" => "\x{4f9}"
      },
      {
        "to" => "\x{2b9}",
        "from" => "\x{42c}",
        "context" => {
          "after" => "\\p{IsUpper}"
        }
      },
      {
        "to" => "\x{2b9}",
        "from" => "\x{44c}"
      },
      {
        "to" => "\x{c8}",
        "from" => "\x{42d}"
      },
      {
        "to" => "\x{e8}",
        "from" => "\x{44d}"
      },
      {
        "to" => "\x{db}",
        "from" => "\x{42e}"
      },
      {
        "to" => "\x{fb}",
        "from" => "\x{44e}"
      },
      {
        "to" => "\x{c2}",
        "from" => "\x{42f}"
      },
      {
        "to" => "\x{e2}",
        "from" => "\x{44f}"
      },
      {
        "to" => "\x{11a}",
        "from" => "\x{48c}"
      },
      {
        "to" => "\x{11b}",
        "from" => "\x{48d}"
      },
      {
        "to" => "\x{1cd}",
        "from" => "\x{46a}"
      },
      {
        "to" => "\x{1ce}",
        "from" => "\x{46b}"
      },
      {
        "to" => "F\x{300}",
        "from" => "\x{472}"
      },
      {
        "to" => "f\x{300}",
        "from" => "\x{473}"
      },
      {
        "to" => "\x{1ef2}",
        "from" => "\x{474}"
      },
      {
        "to" => "\x{1ef3}",
        "from" => "\x{475}"
      },
      {
        "to" => "\x{d2}",
        "from" => "\x{4a8}"
      },
      {
        "to" => "\x{f2}",
        "from" => "\x{4a9}"
      },
      {
        "to" => "\x{2021}",
        "from" => "\x{4c0}"
      }
    ],
    "reverse" => "true"
  }
);


1;


# vim: sts=4 enc=utf-8
