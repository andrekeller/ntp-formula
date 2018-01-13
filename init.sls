ntp:
  pkg.installed:
    - pkgs:
      - ntp
  service.running:
    - name: ntpd.service
    - enable: True

ntp_conf:
  file.managed:
    - name: /etc/ntp.conf
    - source: salt://ntp/files/ntp.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - watch_in:
      - service: ntp
