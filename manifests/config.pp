class tmpreaper::config (
  $enabled
) {
  $_showwarning = ! $enabled

  if $::osfamily == debian {
    augeas { 'tmpreaper.conf':
      lens    => 'Shellvars.lns',
      incl    => '/etc/tmpreaper.conf',
      context => '/files/etc/tmpreaper.conf',
      changes => "set SHOWWARNING ${_showwarning}",
    }
  }
}
