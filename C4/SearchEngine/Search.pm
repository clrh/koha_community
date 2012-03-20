package C4::SearchEngine::Search;


# This file is part of Koha.
#
# Koha is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 2 of the License, or (at your option) any later
# version.
#
# Koha is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# Koha; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
# Suite 330, Boston, MA  02111-1307 USA

use Modern::Perl;
require Exporter;

use C4::SearchEngine;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $DEBUG);

use Moose::Role;

# set the version for version checking
BEGIN {
    $VERSION = 1.00;
    $DEBUG = ($ENV{DEBUG}) ? 1 : 0;
}

=head1 NAME

C4::Searching - Functions for searching the Koha catalog.

=head1 SYNOPSIS

See opac/opac-search.pl or catalogue/search.pl for example of usage

=head1 DESCRIPTION

This module provides searching functions for Koha's bibliographic databases

=head1 FUNCTIONS

=cut

@ISA    = qw(Exporter);
@EXPORT = qw(
  &SimpleSearch
);

sub SimpleSearch {
    my ( $q, $filters, $params, $caller ) = @_;
    say "SimpleSearch $q";
    my $search = C4::SearchEngine->new();
    $search->_find_searchengine;
    return $search->_search(@_);
}

END { }

1;

__END__

=head1 AUTHOR

Koha Development Team <http://koha-community.org/>

=cut
