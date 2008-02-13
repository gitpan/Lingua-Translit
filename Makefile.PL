# $Id: Makefile.PL 27 2008-02-07 08:46:53Z alinke $

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME		=>  "Lingua::Translit",
  VERSION_FROM	=>  "lib/Lingua/Translit.pm",
  ABSTRACT_FROM	=>  "lib/Lingua/Translit.pm",
  AUTHOR	=>  'Alex Linke <alinke@lingua-systems.com>',
  EXE_FILES	=>  [qw/translit/],
);

# vim: sts=2 enc=utf-8
