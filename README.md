exempi is a port of Adobe XMP SDK to work on UNIX and to be build with
meson.

[Adobe readme](README-Adobe.md)

It is licensed under a BSD-style license. See [LICENSE](LICENSE).

It includes XMPCore and XMPFiles, libexempi, a C-based API and exempi
a command line tool.

## Building

It require gcc or clang with support for C++17, and meson.

To build:

```
$ mkdir _build
$ meson _build
$ ninja -C _build
```

To install after building
```
$ ninja -C _build install
```

You can set the prefix to install elsewhere.

## Authors

It is maintained by Hubert Figuière <hub@figuiere.net>

Contributors:
  Frankie Dintino <fdintino@theatlantic.com>


Homepage: http://libopenraw.freedesktop.org/wiki/Exempi
