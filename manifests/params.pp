class tmpreaper::params {
  $enabled = true
  $tmptime = 7

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
}
