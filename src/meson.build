executable(
    meson.project_name(),
    'AppChooser/Portal.vala',
    configure_file(input: 'Config.vala.in', output: '@BASENAME@', configuration: conf_data),
    'XdgDesktopPortalFaraway.vala',
    dependencies: [
        glib_dep,
        gobject_dep,
        gio_dep
    ],
    install: true,
    install_dir: libexecdir
)
