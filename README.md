# xdg-desktop-portal-faraway

AppChooser portal that opens the default app. Based on [Pantheon XDG Desktop Portals](https://github.com/elementary/portals/).

You'll need the following dependencies:
- glib
- systemd (optional)
- meson
- valac

## Install

```shell
$ meson setup builddir --prefix=/usr && meson compile -C builddir && meson install -C builddir
```

## Set as default by appending the following to your portals config

```conf
org.freedesktop.impl.portal.AppChooser=faraway;
```

## Run it

```shell
$ /usr/libexec/xdg-desktop-portal-faraway -r
```
