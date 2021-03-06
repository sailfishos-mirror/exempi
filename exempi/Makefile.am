#
# exempi - Makefile.am
#
# Copyright (C) 2007-2013 Hubert Figuiere
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
# 1 Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
# 
# 2 Redistributions in binary form must reproduce the above copyright
# notice, this list of conditions and the following disclaimer in the
# documentation and/or other materials provided with the
# distribution.
#
# 3 Neither the name of the Authors, nor the names of its
# contributors may be used to endorse or promote products derived
# from this software wit hout specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
# FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
# COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
# HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED
# OF THE POSSIBILITY OF SUCH DAMAGE.
#

SUBDIRS = tests
DIST_SUBDIRS = tests doc

exempidir = $(includedir)/@EXEMPI_INCLUDE_BASE@/exempi
exempi_HEADERS = xmp.h xmpconsts.h xmperrors.h xmp++.hpp

bin_PROGRAMS = exempi

exempi_SOURCES = main.cpp
exempi_CPPFLAGS = -I$(srcdir)/..
exempi_LDADD = libexempi.la

AM_CPPFLAGS = -I$(top_srcdir)/public/include -I$(top_srcdir)/XMPCore/source \
	-I$(top_srcdir)/build/ -I$(top_srcdir) \
	-I$(top_srcdir)/source/common/ \
	-Wall -D@EXEMPI_PLATFORM_DEF@=1

lib_LTLIBRARIES = libexempi.la

pkgconfig_DATA = exempi-@EXEMPI_MAJOR_VERSION@.pc

libexempi_la_SOURCES = exempi.cpp

libexempi_la_LIBADD = $(top_builddir)/source/libxmpcommon.la \
	$(top_builddir)/XMPCore/source/libXMPCore.la \
	$(top_builddir)/XMPFiles/source/libXMPFiles.la \
	$(top_builddir)/third-party/zuid/interfaces/libmd5.la \
	-lexpat -lz -ldl

if UNIX_ENV
libexempi_la_LIBADD += -lrt
endif

libexempi_la_LDFLAGS = -version-info @EXEMPI_VERSION_INFO@

if HAVE_SYMBOLS_FILE
libexempi_la_LDFLAGS += -Wl,--retain-symbols-file=$(srcdir)/libexempi.sym
endif

dist_man1_MANS = exempi.1

EXTRA_DIST = libexempi.sym

