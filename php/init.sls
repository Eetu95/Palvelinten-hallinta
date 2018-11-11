php7.2:
  pkg.installed

libapache2-mod-php7.2:
  pkg.installed

/etc/apache2/mods-available/php7.2.conf:
  file.managed:
    - source: salt://php/php7.2.conf

/etc/apache2/mods-enabled/php7.2.conf:
  file.symlink:
    - target: ../mods-available/php7.2.conf

/etc/apache2/mods-enabled/php7.2.load:
  file.symlink:
    - target: ../mods-available/php7.2.load
