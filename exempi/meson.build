
# -version-info @EXEMPI_VERSION_INFO@

libexempi = library(
  'exempi',

  'exempi.cpp',

  version: exempi_soversion,
  include_directories: [
    '..',
    '../public/include',
    '../XMPCore/source'
  ],
  dependencies: [
    expat,
    zlib
  ],
  link_with: [
    md5,
    xmpcommon,
    xmpcore,
    xmpfiles
  ],
  install: true,
)

pkg.generate(
  libexempi,

  description: 'Library for easy parsing of XMP metadata.',
  filebase: exempi_include_base,
  extra_cflags: '-I${includedir}/@0@'.format(exempi_include_base)
)

install_headers(
  'xmpconsts.h',
  'xmperrors.h',
  'xmp.h',
  'xmp++.hpp',

  subdir: '@0@/exempi'.format(exempi_include_base),
)

install_man(
  'exempi.1',
)

executable(
  'exempi',

  'main.cpp',
  link_with: [
    libexempi
  ],
  include_directories: [
    '..'
  ],
  install: true,
)

## Tests

test_env = environment()
test_env.append('srcdir', meson.current_source_dir())
test_env.append('TEST_DIR', meson.current_source_dir() / 'tests')
test_env.append('BOOST_TEST_CATCH_SYSTEM_ERRORS', 'no')

test(
  'testinit',

  executable(
    'testinit_exe',

    'tests/testinit.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testexempicore',

  executable(
    'testexempicore_exe',

    'tests/test-exempi-core.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testwritenewprop',

  executable(
    'testwritenewprop_exe',

    'tests/test-write-new-prop.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testtiffleak',

  executable(
    'testtiffleak_exe',

    'tests/test-tiff-leak.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testxmpfiles',

  executable(
    'testxmpfiles_exe',

    'tests/test-xmpfiles.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testxmpfileswrite',

  executable(
    'testxmpfileswrite_exe',

    'tests/test-xmpfiles-write.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testparse',

  executable(
    'testparse_exe',

    'tests/testparse.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testiterator',

  executable(
    'testiterator_exe',

    'tests/test-iterator.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testfdo18635',

  executable(
    'testfdo18635_exe',

    'tests/test-bgo.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testfdo83313',

  executable(
    'testfdo83313_exe',

    'tests/test-fdo83313.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testcpp',

  executable(
    'testcpp_exe',

    'tests/testcpp.cpp',
    'tests/utils.cpp',

    install: false,
    include_directories: [
      '..'
    ],
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testwebp',

  executable(
    'testwebp_exe',

    'tests/test-fdo83313.cpp',
    'tests/utils.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)

test(
  'testadobesdk',

  executable(
    'testadobesdk_exe',

    'tests/test-adobesdk.cpp',

    install: false,
    dependencies: [
      expat,
      boost_test
    ],
    include_directories: [
      '..',
      '../public/include'
    ],
    link_with: [
      md5,
      xmpcommon,
      xmpcore,
      xmpfiles
    ]
  )
)

test(
  'testxmpformat',

  executable(
    'testxmpformat_exe',

    'tests/test-xmpformat.cpp',

    install: false,
    link_with: [
      libexempi
    ]
  ),
  env: test_env,
)
