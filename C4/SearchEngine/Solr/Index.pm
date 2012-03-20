package C4::SearchEngine::Solr::Index;


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

use vars qw($VERSION @ISA @EXPORT @EXPORT_OK %EXPORT_TAGS $DEBUG);

use Moose;
with "C4::SearchEngine::Index";
extends "Data::SearchEngine::Solr";

# set the version for version checking
BEGIN {
    $VERSION = 1.00;
    $DEBUG = ($ENV{DEBUG}) ? 1 : 0;
}


@ISA    = qw(Exporter);
@EXPORT = qw(
  &IndexRecord
);

sub IndexRecord {
    return "index:";
}

END { }

1;

__END__

=head1 AUTHOR

Koha Development Team <http://koha-community.org/>

=cut
