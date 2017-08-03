class tmpreaper::config (
  $enabled,
  $tmptime,
  $protect_extra
) {
  $_showwarning = ! $enabled
  $_protect_extra = join($protect_extra, ' ')

  if $::osfamily == debian {
    augeas { 'tmpreaper.conf':
      lens    => 'Shellvars.lns',
      incl    => '/etc/tmpreaper.conf',
      context => '/files/etc/tmpreaper.conf',
      changes => [
        "set SHOWWARNING ${_showwarning}",
        "set TMPREAPER_PROTECT_EXTRA \"'${_protect_extra}'\""
      ]
    }

    augeas { 'default-rcS':
      lens    => 'Shellvars.lns',
      incl    => '/etc/default/rcS',
      context => '/files/etc/default/rcS',
      changes => [
        "set TMPTIME ${tmptime}",
      ]
    }
  }
}
