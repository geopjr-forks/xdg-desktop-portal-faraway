install_data(
    'faraway.portal',
    install_dir: datadir / 'xdg-desktop-portal' / 'portals'
)

configure_file(
    input: 'org.freedesktop.impl.portal.desktop.faraway.service.in',
    output: '@BASENAME@',
    configuration: conf_data,
    install: true,
    install_dir: datadir / 'dbus-1' / 'services'
)

systemduserunitdir = get_option('systemduserunitdir')
if systemduserunitdir == ''
    systemduserunitdir = systemd_dep.get_variable('systemduserunitdir', pkgconfig_define: [ 'prefix', prefix ])
endif

configure_file(
    input: meson.project_name() + '.service.in',
    output: '@BASENAME@',
    configuration: conf_data,
    install: true,
    install_dir: systemduserunitdir
)

configure_file(
    input: 'faraway.metainfo.xml.in',
    output: 'dev.geopjr.faraway.metainfo.xml',
    configuration: conf_data,
    install: true,
    install_dir: datadir / 'metainfo'
)
