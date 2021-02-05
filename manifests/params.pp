class tmpreaper::params {
  $enabled = true

  case $::osfamily {
    debian: {
      $packages = ['tmpreaper']
    }

    redhat: {
      $packages = ['tmpwatch']
    }

    default: {
      fail("Unsupported OS family: ${::osfamily}")
    }
  }

  $version = 'present'
}
