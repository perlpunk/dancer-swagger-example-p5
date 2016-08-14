# Example for a Perl Dancer2 REST API

# Requirements

* Plack
* Dancer2
* git clone git@github.com:swagger-api/swagger-ui.git public/swagger-ui

# Usage

    # Start server
    % plackup bin/app.psgi

    % GET http://localhost:5000/menu
    % GET http://localhost:5000/menu/items/2
    % GET http://localhost:5000/menu?category=main

# API Documentation

    % share/openapi.yaml
    % GET http://localhost:5000/openapi.yaml

## Swagger UI

This is a frontend to explore and try out the available API Calls
http://localhost:5000/swagger-ui/dist/index.html?url=http://localhost:5000/openapi.yaml
