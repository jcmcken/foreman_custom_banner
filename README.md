# foreman_custom_banner

A Foreman plugin which provides a configurable, custom banner for the Foreman UI.

The purpose of this plugin is to provide a simple way to distinguish multiple
installations of Foreman, e.g. a production vs. a development installation.

This looks something like:

![foreman_custom_banner_preview](foreman_custom_banner.png)

Customize the banner by altering the plugin settings within Foreman.

## Installation

* Build and install the rubygem.
* Add ``install/foreman_custom_banner.rb`` into Foreman's ``bundler.d`` directory.
  E.g. in the packaged Foreman installation, ``/usr/share/foreman/bundler.d``.
* Restart the webserver hosting the Foreman application.
