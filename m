Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 176A37AF68A
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Sep 2023 01:05:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AD1A31F4;
	Wed, 27 Sep 2023 01:04:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AD1A31F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695769499;
	bh=sA7LBRpIsJ3hLCPML1SA1tlwFRm5MzDuynlpuK4il5o=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NXaTg/sTKit/8gRZ1LAA9ELhfki1NgUmd4z0G/RpzgvYwvcAXKRuWoBLHuUNF0Ugo
	 0Pgbuu17KJMVbydgF27x68F9ezSQakAvYwHAHeUMPgTvh+hTJK8R/sH2s+IJXy/8nG
	 GloYOZs7FDMnUPylv09asYXa9gtWXZIqn8qYgKpc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86054F8007C; Wed, 27 Sep 2023 01:04:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF71AF80166;
	Wed, 27 Sep 2023 01:04:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51DD4F8016A; Wed, 27 Sep 2023 01:04:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 93B6AF80130
	for <alsa-devel@alsa-project.org>; Wed, 27 Sep 2023 01:03:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 93B6AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=VnqEs8eF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695769427; x=1727305427;
  h=date:from:to:cc:subject:message-id;
  bh=sA7LBRpIsJ3hLCPML1SA1tlwFRm5MzDuynlpuK4il5o=;
  b=VnqEs8eFmnhkpaSASQXJZur5oOPk9QUYU7OCKo+nPD8BN5NXeNLF6/A3
   It5bjfDJ7nUCXqkkoEgrfKlx9LzgzcdavWb613p/JXKUuljoHtkOhZzxQ
   /L8KzB0yYm/wBnHhXV34/4BC0536hnM4yffRAdB02C7jUYzizXgJwKkm7
   7IbdFplDidiaql1Y6m8mDkAxDR7spSHXcOz5tTm15NsNoF0Jl/2qRYrPh
   6yY36+A753NpwtmNbxspQl0VR22s0dgY6dsCJhORByK7SrU1JvsXw7xAE
   NjiZui5oUA7+Zmw9Z1jRhOnejIw/DLlUjL6fXNSAHuyVpb9dx1p21X/6O
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10845"; a="385539276"
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200";
   d="scan'208";a="385539276"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2023 16:03:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,179,1694761200";
   d="scan'208";a="325267"
Received: from lkp-server02.sh.intel.com (HELO 32c80313467c) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Sep 2023 16:03:07 -0700
Received: from kbuild by 32c80313467c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlH5b-0003Rq-0h;
	Tue, 26 Sep 2023 23:03:35 +0000
Date: Wed, 27 Sep 2023 07:03:11 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 alsa-devel@alsa-project.org, amd-gfx@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-net-drivers@amd.com, linux-usb@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 4ae73bba62a367f2314f6ce69e3085a941983d8b
Message-ID: <202309270740.m5o3LUyR-lkp@intel.com>
User-Agent: s-nail v14.9.24
Message-ID-Hash: GCEO3BBJVUQFI2TLGSGS5QYRFZMCLVQQ
X-Message-ID-Hash: GCEO3BBJVUQFI2TLGSGS5QYRFZMCLVQQ
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCEO3BBJVUQFI2TLGSGS5QYRFZMCLVQQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 4ae73bba62a367f2314f6ce69e3085a941983d8b  Add linux-next specific files for 20230926

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202308282000.2XNh0K6D-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202308301211.2HHbgs2N-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309101830.7uQV4SMc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309122047.cRi9yJrq-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309130213.mSR7X2jZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202309192314.VBsjiIm5-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "ice_cgu_get_pin_freq_supp" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_cgu_get_pin_name" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_cgu_get_pin_type" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_get_cgu_rclk_pin_info" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_get_cgu_state" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_is_cgu_present" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_is_clock_mux_present_e810t" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
ERROR: modpost: "ice_is_phy_rclk_present" [drivers/net/ethernet/intel/ice/ice.ko] undefined!
arc-elf-ld: xfrm_algo.c:(.text+0x46c): undefined reference to `crypto_has_aead'
drivers/cpufreq/sti-cpufreq.c:215:50: warning: '%d' directive output may be truncated writing between 1 and 10 bytes into a region of size 2 [-Wformat-truncation=]
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3887: warning: Function parameter or member 'srf_updates' not described in 'could_mpcc_tree_change_for_active_pipes'
drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:60:52: warning: '%s' directive output may be truncated writing up to 63 bytes into a region of size 57 [-Wformat-truncation=]
drivers/net/ethernet/sfc/ethtool_common.c:278:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
drivers/net/ethernet/sfc/falcon/ethtool.c:229:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
drivers/net/ethernet/sfc/siena/ethtool_common.c:229:32: warning: '%-24s' directive output may be truncated writing between 24 and 31 bytes into a region of size 25 [-Wformat-truncation=]
drivers/usb/gadget/udc/fsl_udc_core.c:2491:36: warning: 'out' directive writing 3 bytes into a region of size between 2 and 11 [-Wformat-overflow=]
drivers/usb/gadget/udc/fsl_udc_core.c:2493:38: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
fs/bcachefs/bcachefs_format.h:215:25: warning: 'p' offset 3 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
fs/bcachefs/bcachefs_format.h:217:25: warning: 'version' offset 27 in 'struct bkey' isn't aligned to 4 [-Wpacked-not-aligned]
ice_dpll.c:(.text.ice_dpll_init_info+0x160): undefined reference to `ice_get_cgu_rclk_pin_info'
ice_dpll.c:(.text.ice_dpll_init_info_direct_pins+0xc4): undefined reference to `ice_cgu_get_pin_freq_supp'
ice_dpll.c:(.text.ice_dpll_update_state+0x48): undefined reference to `ice_get_cgu_state'
ice_lib.c:(.text.ice_init_feature_support+0x7c): undefined reference to `ice_is_phy_rclk_present'
include/linux/fortify-string.h:57:33: warning: writing 8 bytes into a region of size 0 [-Wstringop-overflow=]
include/linux/netlink.h:116:13: warning: ') out of range, only support...' directive output truncated writing 60 bytes into a region of size between 46 and 55 [-Wformat-truncation=]
include/linux/netlink.h:116:13: warning: 'sfc: Unsupported: only suppo...' directive output truncated writing 104 bytes into a region of size 80 [-Wformat-truncation=]
powerpc-linux-ld: ice_dpll.c:(.text.ice_dpll_init_info_direct_pins+0x110): undefined reference to `ice_cgu_get_pin_type'
powerpc-linux-ld: ice_dpll.c:(.text.ice_dpll_init_info_direct_pins+0xfc): undefined reference to `ice_cgu_get_pin_name'
powerpc-linux-ld: ice_lib.c:(.text.ice_init_feature_support+0xd0): undefined reference to `ice_is_cgu_present'
powerpc-linux-ld: ice_lib.c:(.text.ice_init_feature_support+0xe0): undefined reference to `ice_is_clock_mux_present_e810t'
s390-linux-ld: drivers/net/ethernet/intel/ice/ice_dpll.c:1647:(.text+0xa6c): undefined reference to `ice_cgu_get_pin_type'
s390-linux-ld: drivers/net/ethernet/intel/ice/ice_dpll.c:1666:(.text+0xad0): undefined reference to `ice_cgu_get_pin_freq_supp'
sound/soc/mediatek/mt2701/mt2701-afe-clock-ctrl.c:44:50: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 10 [-Wformat-truncation=]
xfrm_algo.c:(.text+0x46c): undefined reference to `crypto_has_aead'

Unverified Error/Warning (likely false positive, please contact us if interested):

Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml:

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- arc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   `-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   `-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|-- arc-defconfig
|   |-- arc-elf-ld:xfrm_algo.c:(.text):undefined-reference-to-crypto_has_aead
|   `-- xfrm_algo.c:(.text):undefined-reference-to-crypto_has_aead
|-- arm-allmodconfig
|   |-- drivers-cpufreq-sti-cpufreq.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|   `-- sound-soc-mediatek-mt2701-mt2701-afe-clock-ctrl.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|-- arm-allyesconfig
|   |-- drivers-cpufreq-sti-cpufreq.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|   `-- sound-soc-mediatek-mt2701-mt2701-afe-clock-ctrl.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|-- arm-randconfig-001-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|   `-- sound-soc-mediatek-mt2701-mt2701-afe-clock-ctrl.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   |-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|   `-- sound-soc-mediatek-mt2701-mt2701-afe-clock-ctrl.c:warning:d-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|-- arm64-randconfig-001-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm64-randconfig-002-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- arm64-randconfig-004-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- csky-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- csky-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- i386-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|-- loongarch-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-sfc-ethtool_common.c:warning:24s-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-sfc-falcon-ethtool.c:warning:24s-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-sfc-siena-ethtool_common.c:warning:24s-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- loongarch-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-sfc-ethtool_common.c:warning:24s-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-sfc-falcon-ethtool.c:warning:24s-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- drivers-net-ethernet-sfc-siena-ethtool_common.c:warning:24s-directive-output-may-be-truncated-writing-between-and-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- loongarch-defconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- loongarch-randconfig-001-20230921
|   `-- Documentation-devicetree-bindings-mfd-qcom-pm8xxx.yaml:
|-- loongarch-randconfig-001-20230926
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- m68k-allmodconfig
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   `-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|-- m68k-allyesconfig
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   `-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|-- microblaze-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- microblaze-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- mips-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   `-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   `-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|-- openrisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- openrisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- parisc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- parisc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- powerpc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- powerpc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- powerpc-randconfig-002-20230926
|   |-- drivers-usb-gadget-udc-fsl_udc_core.c:warning:out-directive-writing-bytes-into-a-region-of-size-between-and
|   `-- drivers-usb-gadget-udc-fsl_udc_core.c:warning:sprintf-may-write-a-terminating-nul-past-the-end-of-the-destination
|-- powerpc-randconfig-r002-20211004
|   |-- ice_dpll.c:(.text.ice_dpll_init_info):undefined-reference-to-ice_get_cgu_rclk_pin_info
|   |-- ice_dpll.c:(.text.ice_dpll_init_info_direct_pins):undefined-reference-to-ice_cgu_get_pin_freq_supp
|   |-- ice_dpll.c:(.text.ice_dpll_update_state):undefined-reference-to-ice_get_cgu_state
|   |-- ice_lib.c:(.text.ice_init_feature_support):undefined-reference-to-ice_is_phy_rclk_present
|   |-- powerpc-linux-ld:ice_dpll.c:(.text.ice_dpll_init_info_direct_pins):undefined-reference-to-ice_cgu_get_pin_name
|   |-- powerpc-linux-ld:ice_dpll.c:(.text.ice_dpll_init_info_direct_pins):undefined-reference-to-ice_cgu_get_pin_type
|   |-- powerpc-linux-ld:ice_lib.c:(.text.ice_init_feature_support):undefined-reference-to-ice_is_cgu_present
|   `-- powerpc-linux-ld:ice_lib.c:(.text.ice_init_feature_support):undefined-reference-to-ice_is_clock_mux_present_e810t
|-- riscv-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- riscv-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- riscv-randconfig-001-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- s390-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- s390-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- s390-randconfig-002-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- s390-randconfig-r035-20221206
|   |-- s390-linux-ld:drivers-net-ethernet-intel-ice-ice_dpll.c:(.text):undefined-reference-to-ice_cgu_get_pin_freq_supp
|   `-- s390-linux-ld:drivers-net-ethernet-intel-ice-ice_dpll.c:(.text):undefined-reference-to-ice_cgu_get_pin_type
|-- sparc-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- sparc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- sparc64-allmodconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- sparc64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- fs-bcachefs-bcachefs_format.h:warning:p-offset-in-struct-bkey-isn-t-aligned-to
|   |-- fs-bcachefs-bcachefs_format.h:warning:version-offset-in-struct-bkey-isn-t-aligned-to
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- x86_64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   |-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|   |-- include-linux-fortify-string.h:warning:writing-bytes-into-a-region-of-size
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- x86_64-buildonly-randconfig-002-20230926
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-011-20230926
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-core-dc.c:warning:Function-parameter-or-member-srf_updates-not-described-in-could_mpcc_tree_change_for_active_pipes
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-012-20230926
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
|-- x86_64-randconfig-014-20230926
|   |-- include-linux-netlink.h:warning:)-out-of-range-only-support...-directive-output-truncated-writing-bytes-into-a-region-of-size-between-and
|   `-- include-linux-netlink.h:warning:sfc:Unsupported:only-suppo...-directive-output-truncated-writing-bytes-into-a-region-of-size
|-- x86_64-randconfig-073-20230926
|   |-- ERROR:ice_cgu_get_pin_freq_supp-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_cgu_get_pin_name-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_cgu_get_pin_type-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_get_cgu_rclk_pin_info-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_get_cgu_state-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_is_cgu_present-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_is_clock_mux_present_e810t-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   |-- ERROR:ice_is_phy_rclk_present-drivers-net-ethernet-intel-ice-ice.ko-undefined
|   `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size
`-- x86_64-randconfig-076-20230926
    `-- drivers-gpu-drm-amd-amdgpu-amdgpu_vpe.c:warning:s-directive-output-may-be-truncated-writing-up-to-bytes-into-a-region-of-size

elapsed time: 953m

configs tested: 135
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20230926   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   gcc  
arm                   randconfig-001-20230926   gcc  
arm64                            allmodconfig   gcc  
arm64                             allnoconfig   gcc  
arm64                            allyesconfig   gcc  
arm64                               defconfig   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20230926   gcc  
i386         buildonly-randconfig-002-20230926   gcc  
i386         buildonly-randconfig-003-20230926   gcc  
i386         buildonly-randconfig-004-20230926   gcc  
i386         buildonly-randconfig-005-20230926   gcc  
i386         buildonly-randconfig-006-20230926   gcc  
i386                              debian-10.3   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20230926   gcc  
i386                  randconfig-002-20230926   gcc  
i386                  randconfig-003-20230926   gcc  
i386                  randconfig-004-20230926   gcc  
i386                  randconfig-005-20230926   gcc  
i386                  randconfig-006-20230926   gcc  
i386                  randconfig-011-20230926   gcc  
i386                  randconfig-012-20230926   gcc  
i386                  randconfig-013-20230926   gcc  
i386                  randconfig-014-20230926   gcc  
i386                  randconfig-015-20230926   gcc  
i386                  randconfig-016-20230926   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                        allyesconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20230926   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                             allmodconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
openrisc                         allmodconfig   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20230926   gcc  
riscv                          rv32_defconfig   gcc  
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20230926   gcc  
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                            allyesconfig   gcc  
sparc                               defconfig   gcc  
sparc                 randconfig-001-20230926   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   gcc  
x86_64       buildonly-randconfig-001-20230926   gcc  
x86_64       buildonly-randconfig-002-20230926   gcc  
x86_64       buildonly-randconfig-003-20230926   gcc  
x86_64       buildonly-randconfig-004-20230926   gcc  
x86_64       buildonly-randconfig-005-20230926   gcc  
x86_64       buildonly-randconfig-006-20230926   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20230926   gcc  
x86_64                randconfig-002-20230926   gcc  
x86_64                randconfig-003-20230926   gcc  
x86_64                randconfig-004-20230926   gcc  
x86_64                randconfig-005-20230926   gcc  
x86_64                randconfig-006-20230926   gcc  
x86_64                randconfig-011-20230926   gcc  
x86_64                randconfig-012-20230926   gcc  
x86_64                randconfig-013-20230926   gcc  
x86_64                randconfig-014-20230926   gcc  
x86_64                randconfig-015-20230926   gcc  
x86_64                randconfig-016-20230926   gcc  
x86_64                randconfig-071-20230926   gcc  
x86_64                randconfig-072-20230926   gcc  
x86_64                randconfig-073-20230926   gcc  
x86_64                randconfig-074-20230926   gcc  
x86_64                randconfig-075-20230926   gcc  
x86_64                randconfig-076-20230926   gcc  
x86_64                          rhel-8.3-rust   clang
x86_64                               rhel-8.3   gcc  
xtensa                            allnoconfig   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
