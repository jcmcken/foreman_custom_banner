# foreman_custom_banner

A Foreman plugin which provides a configurable, custom banner for the Foreman UI.

The purpose of this plugin is to provide a simple way to distinguish multiple
installations of Foreman, e.g. a production vs. a development installation.

## Configuration

The ``foreman_custom_banner`` plugin comes with a few settings which can be configured
within the Foreman UI:

* ``custom_banner_enabled``: Whether to enable the custom banner
* ``custom_banner_text``: Text to set on the custom banner
* ``custom_banner_style``: CSS styling for the custom banner.

## Installation

* Build and install the rubygem.
* Add ``install/foreman_custom_banner.rb`` into Foreman's ``bundler.d`` directory.
  E.g. in the packaged Foreman installation, ``/usr/share/foreman/bundler.d``.
* Restart the webserver hosting the Foreman application.
