package C4::SearchEngine;

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

use utf8;
use Modern::Perl;
use Moose;

use C4::Context;
use C4::SearchEngine::Solr::Search;
use C4::SearchEngine::Solr::Index;

=head1 NAME

C4::Search::Engine - Functions for switching betweend differents search engines.

=head1 DESCRIPTION

The "SearchEngine" syspref provide wich search engine must be used and the good call is done.

=head1 FUNCTIONS

=cut

has 'searchengine' => ( 
    isa => 'Str', 
    is => 'rw'
);

sub _find_searchengine {

    my ($self) = @_; 

    if (C4::Context->preference("SearchEngine") =~ /Solr/) {
        $self->searchengine("Solr");
    } elsif (C4::Context->preference("SearchEngine") eq "Zebra") {
        $self->searchengine("Zebra");
    } else {
        $self->searchengine("undef");
    }
 
}

sub _search {

    my $self = shift(@_);

    if ($self->searchengine eq "Solr") {
        # SimpleSearch( $q, $filters, $page, $max_results, $sort)
        return C4::SearchEngine::Solr::Search::SimpleSearch(@_);
    } elsif ($self->searchengine eq "Zebra") {
        # SimpleSearch( $query, $offset, $max_results, $servers ) 
        say "Zebra is Unsupported yet";
        #return C4::Search::Engine::Zebra->SimpleSearch(@_);
    }
}

sub _index {

    my $self = shift(@_);
    if ($self->searchengine eq "Solr") {
        if (C4::Context->preference("SearchEngine") ne "SolrIndexOff") {
            return C4::SearchEngine::Solr::Index::IndexRecord(@_);
        }
    } elsif ($self->searchengine eq "Zebra") {
        say "Zebra is Unsupported yet";
    } else {
        say "System preference 'SearchEngine' not equal 'Solr' or 'Zebra'.\nWe can not indexing";
    }
}

sub _needs_indexing {
    return (!(C4::Context->preference('SearchEngine')=~/IndexOff/i));
}

sub _add_to_index_queue {
    my $self = shift(@_);

    if ($self->searchengine eq "Solr") {
        return C4::SearchEngine::Solr::Index::AddRecordToIndexRecordQueue(@_);
    } elsif ($self->searchengine eq "Zebra") {
        say "Zebra is Unsupported yet";
    } else {
        say "System preference 'SearchEngine' not equal 'Solr' or 'Zebra'.";
        say "We can not indexing";
    }
}

1;
