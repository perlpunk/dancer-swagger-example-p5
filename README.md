# Example for a Perl Dancer2 REST API

# Requirements

* Plack
* Dancer2

# Usage

    # Start server
    % plackup bin/app.psgi

    % GET http://localhost:5000/menu
    % GET http://localhost:5000/menu/items/2
    % GET http://localhost:5000/menu?category=main
