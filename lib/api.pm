package api;
use strict;
use warnings;
use List::Util qw/ first /;
use Dancer2;
use Dancer2::Plugin::Swagger2;
use File::Share qw/ dist_file /;
use List::Util qw/ first /;

our $VERSION = '0.1';

set serializer => 'JSON';

swagger2( url => dist_file('api', 'openapi.yaml') );

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

sub get_menu {
    my ($dsl) = @_;
    my $cat = $dsl->request->param('category');
    return [grep {
        not $cat or $_->{category} eq $cat
    } @menu];
}

sub get_menu_item {
    my ($dsl) = @_;
    my $id = $dsl->request->param('id');
    my $item = first {
        $_->{id} == $id
    } @menu;
    return $item;
}

true;
