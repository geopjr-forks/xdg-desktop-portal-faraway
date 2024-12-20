project('xdg-desktop-portal-faraway', 'c', 'vala', version: '8.0.0', meson_version: '>=0.58')

gnome = import('gnome')
i18n = import('i18n')

prefix = get_option('prefix')
datadir = prefix / get_option('datadir')
libexecdir = prefix / get_option('libexecdir')
localedir = prefix / get_option('localedir')

systemd_dep = dependency('systemd', required: false)

glib_dep = dependency('glib-2.0')
gobject_dep = dependency('gobject-2.0')
gio_dep = dependency('gio-2.0')

conf_data = configuration_data()
conf_data.set('LIBEXECDIR', libexecdir)
conf_data.set_quoted('VERSION', meson.project_version())

subdir('data')
subdir('src')
