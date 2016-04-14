Deface::Override.new(:virtual_path => 'home/_topbar',
                     :name => 'add_custom_banner',
                     :insert_before => 'div.navbar.navbar-default.navbar-outer',
                     :template => 'home/_foreman_custom_header')

if Setting[:custom_banner_on_login_page]
  Deface::Override.new(
    :virtual_path => 'layouts/login',
    :name => 'add_custom_banner',
    :insert_before => 'div.login-page',
    :template => 'home/_foreman_custom_header'
  )
end
