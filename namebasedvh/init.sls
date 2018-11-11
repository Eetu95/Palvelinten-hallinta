apache2:
  pkg.installed

  /var/www/jokusivu.com/public_html/index.html:
    file.managed:
      - source: salt://namebasedvh/index.html

  /etc/apache2/sites-available/jokusivu.com.conf:
    file.managed:
      - source: salt://namebasedvh/jokusivu.com.conf

  /etc/hosts:
    file.managed:
      - source: salt://namebasedvh/hosts

  a2ensite jokusite.com:
    cmd.run:
      - create: /etc/apache2/sites-enabled/jokusivu.com.conf

  apache2restart:
    cmd.run:
      - name: 'systemctl restart apache2'

  apache2service:
    service.running:
      - name: apache2
