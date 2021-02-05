class tmpreaper::install (
  $enabled,
  $packages,
  $version
) {
  $_ensure = $enabled ? {
    true  => $version,

    false => absent
  }

  package { $packages:
    ensure => $_ensure,
  }
}
