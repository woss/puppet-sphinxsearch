define sphinxsearch::instance(
  $ensure = 'present',
  $source = undef,
  $config_dir = $sphinxsearch::params::config_dir,
  $user = $sphinxsearch::params::user,
  $group = $sphinxsearch::params::group,
  $service = $sphinxsearch::params::service,
  $require = Class['sphinxsearch'] 
) {
  if $name == '0' {
    $instance_config_name = 'sphinx.conf'
  } else {
    $instance_config_name = "sphinx_${name}.conf"
  }

  file { "${config_dir}/${instance_config_name}":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    source  => "${source}/${instance_config_name}",
    require => $require,
    notify  => Service[$service], 
  }
}
