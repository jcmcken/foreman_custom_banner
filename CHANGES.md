# Version 0.0.3

* Included functionality to set a hyperlink in the custom banner to an external
  page
* Fixed deprecated plugin initialization behavior
* Updated minimum Foreman version requirement to 1.9
* By default, the banner now appears on both the login page and in the Foreman
  application. This can be disabled with a new option, ``custom_banner_on_login_page``,
  in the ``Settings`` page.

# Version 0.0.2

* Simplify plug-in by removing decorator implementation and just calling settings
  within the banner template.
* Add a ``CONTRIBUTORS`` manifest.

# Version 0.0.1a

* Fixed a broken SCL macro in the RPM spec file.

# Version 0.0.1

* Initial release.
