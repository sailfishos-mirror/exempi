project(
  'exempi', 'cpp',
  default_options: [
    'warning_level=3'
  ],
  version: '2.7.0'
)

pkg = import('pkgconfig')

expat = dependency('expat')
zlib = dependency('zlib')
boost_test = dependency('boost', modules: [ 'unit_test_framework' ], required: false)

# ---------------------------------------------------------------------------
# Advanced information about versioning:
#   * "Writing shared libraries" by Mike Hearn
#         http://plan99.net/~mike/writing-shared-libraries.html
#   * libtool.info chapter "Versioning"
#   * libtool.info chapter "Updating library version information"
# ---------------------------------------------------------------------------
# Versioning:
#  - CURRENT (Major):  Increment if the interface has changes. AGE is always
#                      *changed* at the same time.
#  - AGE (Micro):      Increment if any interfaces have been added; set to 0
#                      if any interfaces have been removed. Removal has
#                      precedence over adding, so set to 0 if both happened.
#                      It denotes upward compatibility.
#  - REVISION (Minor): Increment any time the source changes; set to
#                      0 if you incremented CURRENT.
#
#  To summarize. Any interface *change* increment CURRENT. If that interface
#  change does not break upward compatibility (ie it is an addition),
#  increment AGE, Otherwise AGE is reset to 0. If CURRENT has changed,
#  REVISION is set to 0, otherwise REVISION is incremented.
# ---------------------------------------------------------------------------
# This is the history from the automake build system
# 1.99.0 is the revision 2 0 0
# 1.99.1 is the revision 3 1 0
# 1.99.2 is the revision 4 2 0
# 1.99.3 is the revision 5 3 0
# 1.99.4 is the revision 6 4 0
# ABI breakage reset major to 3
# 1.99.5 is the revision 3.0.0
# 1.99.6 is the revision 3.1.0 WHICH IS WRONG!!!
# 1.99.7 is the revision 4.1.0
# 1.99.8 is the revision 4.1.1
# 1.99.9 is the revision 4.1.1 (no library change have been made)
# 2.0.0 is the revision 4.1.2
# 2.0.1 is the revision 4.1.3
# 2.0.2 is the revision 4.1.4
# 2.1.0 is the revision 5.2.0
# 2.1.1 is the revision 5.2.1
# 2.2.0 is the revision 5.2.2 -- no public API change
# 2.2.1 is the revision 5.2.3 -- no public API change
# 2.2.2 is the revision 5.2.4 -- no public API change
# 2.2.3 is the revision 5.2.5 -- no public API change
# 2.3.0 is the revision 6.3.0
# 2.4.0 is the revision 7.4.0
# 2.4.1 is the revision 7.4.1
# 2.4.2 is the revision 7.4.2
# 2.4.3 is the revision 7.4.3
# 2.4.4 is the revision 7.4.4
# 2.4.5 is the revision 7.4.5
# 2.4.6 is the revision 7.4.6
# 2.5.0 is the revision 8.0.0 -- Removed XMP SDK symbols.
# 2.5.1 is the revision 8.0.1
# 2.5.2 is the revision 8.0.2
# 2.6.0 is the revision 9.1.0
# 2.6.1 is the revision 9.1.1
# 2.6.2 is the revision 9.1.2
# 2.6.3 is the revision 9.1.3
# 2.6.4 is the revision 9.1.4
# 2.6.5 is the revision 9.1.5
# This is only a build system change.
# 2.7.0 is the revision 9.1.6
exempi_revision = 6
exempi_age = 1
exempi_current = 9
# This compute the so "major".
exempi_current_min = exempi_current - exempi_age
# This is the soversion passed to `library()`
exempi_soversion = '.'.join([
  exempi_current_min.to_string(),
  exempi_age.to_string(),
  exempi_revision.to_string()
])

# the major version. used for package names, etc
exempi_major_version='2.0'

# the path where includes are installed
exempi_include_base='exempi-@0@'.format(exempi_major_version)

if host_machine.system() == 'darwin'
  add_project_arguments('-DMAC_ENV=1', language: 'cpp')
elif host_machine.system() == 'windows'
  add_project_arguments('-DWIN_ENV=1', language: 'cpp')
else
  add_project_arguments('-DUNIX_ENV=1', language: 'cpp')
endif

compiler = meson.get_compiler('cpp')
if compiler.check_header('stdint.h')
  add_project_arguments('-DHAVE_STDINT_H=1', language: 'cpp')
endif

add_project_arguments('-fvisibility=hidden', language: 'cpp')
add_project_arguments('-DVERSION="@0@"'.format(meson.project_version()), language: 'cpp')

error_checks = compiler.get_supported_arguments(
  '-Wchar-subscripts',
  '-Wcast-align',
  '-Wexceptions',
  '-Wheader-guard',
  '-Wformat',
  '-Werror=bitwise-instead-of-logical',
  '-Werror=class-memaccess',
  '-Wformat-security',
  '-Wlogical-not-parentheses',
  '-Werror=misleading-indentation',
  '-Wmissing-noreturn',
  '-Werror=missing-field-initializers',
  '-Woverloaded-virtual',
  '-Wpointer-arith',
  '-Wgnu-array-member-paren-init',
  '-Wpointer-bool-conversion',
  '-Wshadow',
  '-Wsign-compare',
  '-Wno-suggest-attribute=noreturn',
  '-Wnull-conversion',
  '-Wunreachable-code',
  '-Wunused',
  '-Wwrite-strings',
)
add_project_arguments(error_checks, language: 'cpp')

subdir('third-party/zuid/interfaces')
subdir('source')
subdir('XMPCore/source')
subdir('XMPFiles/source')
subdir('exempi')
