class tmpreaper (
  $enabled  = $tmpreaper::params::enabled,
  $packages = $tmpreaper::params::packages,
) inherits tmpreaper::params {

  validate_bool($enabled)
  validate_array($packages)

  class { 'tmpreaper::install':
    enabled  => $enabled,
    packages => $packages,
  }

  class { 'tmpreaper::config':
    enabled => $enabled,
  }

  if $enabled {
    anchor { 'tmpreaper::begin': ; }
      -> Class['tmpreaper::install']
      -> Class['tmpreaper::config']
      -> anchor { 'tmpreaper::end': ; }
  } else {
    anchor { 'tmpreaper::begin': ; }
      -> Class['tmpreaper::config']
      -> Class['tmpreaper::install']
      -> anchor { 'tmpreaper::end': ; }
  }
}
