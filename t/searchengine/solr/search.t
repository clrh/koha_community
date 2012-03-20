#!/bin/perl

use Modern::Perl;
use Test::More;
use C4::SearchEngine::Search;
use C4::Context;

my $se;

sub set_up {
  $se = C4::Context->preference("SearchEngine");
  C4::Context->set_preference("SearchEngine","Solr");
}

sub tear_down {
  C4::Context->set_preference("SearchEngine",$se);
}

BEGIN {
   &set_up;
}

is(C4::SearchEngine::Search::SimpleSearch("harry potter"), "search:harry potter", "search harry potter");

done_testing();

END {
    &tear_down;
}
