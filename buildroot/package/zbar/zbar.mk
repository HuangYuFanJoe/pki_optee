################################################################################
#
# zbar
#
################################################################################

ZBAR_VERSION = 681b0f305fb5c5bb0df8437f7d740b29a93a7889
ZBAR_SITE = git://linuxtv.org/zbar.git
ZBAR_LICENSE = LGPL-2.1+
ZBAR_LICENSE_FILES = LICENSE
ZBAR_INSTALL_STAGING = YES
ZBAR_AUTORECONF = YES
ZBAR_DEPENDENCIES = libv4l jpeg
# add host-gettext for AM_ICONV macro
ZBAR_DEPENDENCIES += host-gettext
ZBAR_CONF_OPTS = \
	--disable-doc \
	--without-imagemagick \
	--without-qt \
	--without-qt5 \
	--without-gtk \
	--without-python2 \
	--without-x \
	--without-java

ifeq ($(BR2_PACKAGE_DBUS),y)
ZBAR_DEPENDENCIES += dbus
ZBAR_CONF_OPTS += --with-dbus
else
ZBAR_CONF_OPTS += --without-dbus
endif

$(eval $(autotools-package))
