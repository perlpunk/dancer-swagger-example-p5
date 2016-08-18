# What's this repository?

It's supposed to be an example of how to turn a minimalistic
Perl5 Dancer2 REST API into one that uses OpenAPI (Swagger) for
documenting and validating input and output.

It uses Dancer2::Plugin::Swagger2 currently. That plugin is still
experimental and might also be renamed to OpenAPI.
So the history of this repository might be changed.

If you are using Mojolicious, you can use Mojolicious::Plugin::OpenAPI.
It's from Jan Henning Thorsen who also wrote JSON::Validator and
Swagger2, which our port to Dancer2 is using.

# Example for a Perl Dancer2 REST API

# Requirements

* Plack
* Dancer2
* Swagger2
* File::Share
* YAML::XS (or YAML::Syck)
* git clone git@github.com:swagger-api/swagger-ui.git public/swagger-ui
* https://github.com/dboehmer/Dancer2-Plugin-Swagger2
  * or, if you have issues with that, use my fork at
    https://github.com/perlpunk/Dancer2-Plugin-Swagger2 branch patches-2015-08-18

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
