package Lingua::Translit::Tables;


#
# Copyright 2007-2008 by ...
#   Alex Linke, <alinke@lingua-systems.com>
#   Rona Linke, <rlinke@lingua-systems.com>
#
# $Id: Tables.pm 187 2008-03-31 09:43:23Z rlinke $
#


use strict;
use warnings;

require 5.008;


our $VERSION = '0.05';


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

=item B<ISO 843>, not reversible, C<ISO 843:1997, Greek to Latin>

=item B<ISO 9>, reversible, C<ISO 9:1995, Cyrillic to Latin>

=item B<Greeklish>, not reversible, C<Greeklish (Phonetic), Greek to Latin>

=item B<DIN 31634>, not reversible, C<DIN 31634:1982, Greek to Latin>

=item B<Common RON>, not reversible, C<Romanian without diacritics as commonly used>

=item B<Common DEU>, not reversible, C<German without umlauts>

=item B<Common CES>, not reversible, C<Czech without diacritics>
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


# For convenience, the next line is automatically substituted with the set
# of transliteration tables at compile time.
%tables; # PLACEHOLDER


1;


# vim: sts=4 enc=utf-8
