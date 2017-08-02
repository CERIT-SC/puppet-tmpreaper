class tmpreaper (
  $enabled       = $tmpreaper::params::enabled,
  $packages      = $tmpreaper::params::packages,
  $tmptime         = $tmpreaper::params::tmptime,
  $protect_extra = [],
) inherits tmpreaper::params {

  validate_bool($enabled)
  validate_array($packages)
  validate_array($protect_extra)
  validate_integer($tmptime, 365, -1)

  class { 'tmpreaper::install':
    enabled  => $enabled,
    packages => $packages,
  }

  class { 'tmpreaper::config':
    enabled       => $enabled,
    tmptime         => $tmptime,
    protect_extra => $protect_extra,
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
