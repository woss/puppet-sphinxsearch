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
    }
    default: {
      fail("Unsupported platform: ${::operatingsystem}")
    }
  }
}
