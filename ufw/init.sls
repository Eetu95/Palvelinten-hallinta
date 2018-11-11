ufw:
  pkg.installed

/etc/ufw/user.rules:
  file.managed:
    - source: salt://ufw/user.rules

/etc/ufw/user6.rules:
  file.managed:
    - source: salt://ufw/user6.rules 

ufwenable:
  cmd.run:
    - name: 'ufw enable'
