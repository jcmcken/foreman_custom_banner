Deface::Override.new(:virtual_path => 'home/_topbar',
                     :name => 'add_custom_banner',
                     :insert_before => 'div.navbar.navbar-default.navbar-outer',
                     :template => 'home/_foreman_custom_header')
