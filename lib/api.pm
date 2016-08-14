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

swagger2(
    url => dist_file('api', 'openapi.yaml'),
    controller_factory => sub {
        my ( $method_spec, $http_method, $path, $dsl, $conf, $args, ) = @_;
        my $op = $method_spec->{operationId};
        return sub {
            # validation of input happens before

            # do some error handling, logging, ...
            my $result = api->$op(@_);
            $dsl->response->status(200);
            return $result;

            # validation of output happens after
        };
    },
);

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
    my ($self, $dsl) = @_;
    my $cat = $dsl->request->param('category');
    return [grep {
        not $cat or $_->{category} eq $cat
    } map {
        my %short;
        my @keys = qw/ id category name /;
        @short{ @keys } = @{ $_ }{ @keys };
        \%short;
    } @menu];
}

sub get_menu_item {
    my ($self, $dsl) = @_;
    my $id = $dsl->request->param('id');
    my $item = first {
        $_->{id} == $id
    } @menu;
    return $item;
}

true;
