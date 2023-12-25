#!/bin/sh


cd $MESON_DIST_ROOT

rm -fr \
   XMPFiles/build \
   XMPFilesPlugins/PDF_Handler/i80386linux \
   XMPFilesPlugins/PDF_Handler/macintosh \
   XMPFilesPlugins/PDF_Handler/resource \
   XMPFilesPlugins/PDF_Handler/windows \
   XMP-Toolkit-SDK-Overview.pdf \
   XMPFilesPlugins/PluginTemplate \
   build/shared \
   build/*.bat \
   build/Generate* \
   build/CMakeList.txt \
   samples/build \
   docs \
   tools
