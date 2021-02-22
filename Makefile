#
# Copyright (C) 2006-2015 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=rust-libstd
PKG_VERSION:=0.0.1
PKG_MAINTAINER := Daan Pape <daan@dptechnics.com>

HOST_BUILD_DEPENDS:=rust/host

include $(INCLUDE_DIR)/package.mk
include ../../lang/rust/rustc-triple.mk

define Package/rust-libstd
  SECTION:=lang
  CATEGORY:=Languages
  TITLE:=Rust standard library
endef

define Package/rust-libstd/description
  The Rust standard library for dynamically linked applications
endef
	
define Build/Compile
	echo 'Nothing to be compiled'
endef

define Package/rust-libstd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(TOPDIR)/staging_dir/hostpkg/lib/rustlib/$(RUSTC_TARGET_ARCH)/lib/libstd-*.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,rust-libstd))
