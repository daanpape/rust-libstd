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
	
define Build/Prepare
	$(call Build/Prepare/Default)
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(TOPDIR)/build_dir/hostpkg/rust/library/* $(PKG_BUILD_DIR)/
endef

define Build/Compile
	cd $(PKG_BUILD_DIR)/std && cargo rustc --target=$(RUSTC_TARGET_ARCH) --release -- -C linker=$(TARGET_CC_NOCACHE) -C ar=$(TARGET_AR)
endef

define Package/rust-libstd/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libwembed.so* $(1)/usr/lib/
endef

$(eval $(call BuildPackage,rust-libstd))
