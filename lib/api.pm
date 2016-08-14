package api;
use strict;
use warnings;
use List::Util qw/ first /;
use Dancer2;

our $VERSION = '0.1';

set serializer => 'JSON';

my @menu = (
    {
        id => 1,
        category => 'main',
        name => 'Chili sin carne',
        description => '...',
        price => 314,
    },
    {
        id => 2,
        category => 'drinks',
        name => 'Yogi Tea',
        description => '...',
        price => 123,
    },
);

get '/menu' => sub {
    my ($dsl) = @_;
    my $cat = $dsl->request->param('category');
    return [grep {
        not $cat or $_->{category} eq $cat
    } @menu];
};

get '/menu/items/:id' => sub {
    my ($dsl) = @_;
    my $id = $dsl->request->param('id');
    my $item = first {
        $_->{id} == $id
    } @menu;
    return $item;
};

true;
