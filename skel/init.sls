/etc/skel/public_html:
  file.directory

/etc/skel/public_html/index.html:
  file.managed:
    - source: salt://skel/index.html
