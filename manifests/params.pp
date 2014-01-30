class sphinxsearch::params {
  case $::operatingsystem {
    ubuntu, debian: {
      $package = 'sphinxsearch'
      $service = 'searchd'
      $service_hasstatus = false
      $service_hasrestart = true
      $user = 'sphinxsearch'
      $group = 'sphinxsearch'
      $config_dir = '/etc/sphinxsearch'
      $work_dir = '/var/lib/sphinxsearch/index'
      $default_file = '/etc/default/searchd'
      $default_log_dir = '/var/log/sphinxsearch'
      $default_log_name = '/var/log/sphinxsearch/sphinx_searchd.log'
      $default_query_log_name = '/var/log/sphinxsearch/sphinx_query.log'
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
