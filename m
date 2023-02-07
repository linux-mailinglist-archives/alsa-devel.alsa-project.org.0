Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7320668E485
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:43:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA03F82A;
	Wed,  8 Feb 2023 00:42:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA03F82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675813394;
	bh=zwoDr1wPKNYQiCl8mRwM1UPgx4ddKwyU+8/uwG8BezI=;
	h=Date:From:To:Subject:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q+1F7iZZT86WtXX/23eVd9RQVKuCfDDuUOsRonF1WvmISTKLer7pbBA41INHv6PjL
	 RAmaGHis5p7c4vCFqNUd0/W41fx+4TyudCdupnE3ENB8/IPLy/ZqQVkNc9o7Y4TwMO
	 IhVU9u2jE34GTBQHaVg2SBdl/1nqnyYFq1boYO3E=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0386CF804CC;
	Wed,  8 Feb 2023 00:41:46 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E6A1F80518; Wed,  8 Feb 2023 00:41:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70B8CF80224
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70B8CF80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=QdadQGye
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675813298; x=1707349298;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zwoDr1wPKNYQiCl8mRwM1UPgx4ddKwyU+8/uwG8BezI=;
  b=QdadQGyeRdRpgc9KmHTbBnQIpSVSthqyfOaxsx3OCNC4Vmbp2JjF1n94
   hFeIuUnJKEsu0/WCe2ZiZQgAA0DNMC3G8eww50jVUzpOXr46L940TXEgc
   OlC/VjMls71FVbH+z8emxWK3aOsr3US+RkTQy65IVd+1xqtSW529z9RjX
   wJoA7hqGqhjkbbIeWDRAi6x+LWS+VGjK9OVCLxjZzF02SsNKjs9Z0BcxL
   yX2W+6Yvzfrb7Om5y18qM1QCfl6fg5CLL+/27Ry6ogbc3wr5o3YEAOQ/8
   8Hmc5Oo4AcfRr5Jy5ZGwDh7sQtQA3WE4VhfA6mp4l5SvjWR+qfJtIrEvR
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="391983047"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000";
   d="scan'208";a="391983047"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2023 10:18:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="730547125"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000";
   d="scan'208";a="730547125"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Feb 2023 10:18:26 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPSXx-0003li-1E;
	Tue, 07 Feb 2023 18:18:25 +0000
Date: Wed, 08 Feb 2023 02:18:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 49a8133221c71b935f36a7c340c0271c2a9ee2db
Message-ID: <63e295f0.u1bD0VjqG0iQsm1w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-ID-Hash: FSFVUHNISVWBGD3W4YZNTEWCO4ARUWBV
X-Message-ID-Hash: FSFVUHNISVWBGD3W4YZNTEWCO4ARUWBV
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-usb@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alsa-devel@alsa-project.org,
 Linux Memory Management List <linux-mm@kvack.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FSFVUHNISVWBGD3W4YZNTEWCO4ARUWBV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 49a8133221c71b935f36a7c340c0271c2a9ee2db  Add linux-next specific files for 20230207

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202301230743.Xnut0Zvc-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301300743.bp7Dpazv-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301301801.y5O08tQx-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301302110.mEtNwkBD-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202301310939.TAgCOEZb-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302011836.kA3BxqdY-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302061911.C7xvHX9v-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302062224.ByzeTXh1-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202302072055.odjDVd5V-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Documentation/riscv/uabi.rst:24: WARNING: Enumerated list ends without a blank line; unexpected unindent.
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
FAILED: load BTF from vmlinux: No data available
arch/arm64/kvm/arm.c:2207: warning: expecting prototype for Initialize Hyp(). Prototype was for kvm_arm_init() instead
drivers/clk/qcom/gcc-sa8775p.c:313:32: warning: unused variable 'gcc_parent_map_10' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:318:37: warning: unused variable 'gcc_parent_data_10' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:333:32: warning: unused variable 'gcc_parent_map_12' [-Wunused-const-variable]
drivers/clk/qcom/gcc-sa8775p.c:338:37: warning: unused variable 'gcc_parent_data_12' [-Wunused-const-variable]
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.h:62:10: fatal error: mod_info_packet.h: No such file or directory
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn31/dcn31_hubbub.c:1011:6: warning: no previous prototype for 'hubbub31_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubbub.c:948:6: warning: no previous prototype for 'hubbub32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_hubp.c:158:6: warning: no previous prototype for 'hubp32_init' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_resource_helpers.c:62:18: warning: variable 'cursor_bpp' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:148:6: warning: no previous prototype for 'link_dp_trace_set_edp_power_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:158:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweron_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/accessories/link_dp_trace.c:163:10: warning: no previous prototype for 'link_dp_trace_get_edp_poweroff_timestamp' [-Wmissing-prototypes]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:1295:32: warning: variable 'result_write_min_hblank' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_capability.c:279:42: warning: variable 'ds_port' set but not used [-Wunused-but-set-variable]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/protocols/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]
ftrace-ops.c:(.init.text+0x2c3): undefined reference to `__udivdi3'
libbpf: failed to find '.BTF' ELF section in vmlinux

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/media/i2c/max9286.c:802 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32
drivers/thermal/qcom/tsens-v0_1.c:106:40: sparse: sparse: symbol 'tsens_9607_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:26:40: sparse: sparse: symbol 'tsens_8916_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:42:40: sparse: sparse: symbol 'tsens_8939_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:62:40: sparse: sparse: symbol 'tsens_8974_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v0_1.c:84:40: sparse: sparse: symbol 'tsens_8974_backup_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:24:40: sparse: sparse: symbol 'tsens_qcs404_nvmem' was not declared. Should it be static?
drivers/thermal/qcom/tsens-v1.c:45:40: sparse: sparse: symbol 'tsens_8976_nvmem' was not declared. Should it be static?
drivers/usb/gadget/composite.c:2082:33: sparse: sparse: restricted __le16 degrades to integer
sound/firewire/amdtp-stream.c:1187 process_rx_packets() error: uninitialized symbol 'curr_cycle_time'.

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-allyesconfig
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm64-randconfig-c023-20230205
|   `-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|-- arm64-randconfig-s042-20230205
|   |-- arch-arm64-kvm-arm.c:warning:expecting-prototype-for-Initialize-Hyp().-Prototype-was-for-kvm_arm_init()-instead
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn31-dcn31_hubbub.c:warning:no-previous-prototype-for-hubbub31_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubbub.c:warning:no-previous-prototype-for-hubbub32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_hubp.c:warning:no-previous-prototype-for-hubp32_init
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-dcn32-dcn32_resource_helpers.c:warning:variable-cursor_bpp-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweroff_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_get_edp_poweron_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-accessories-link_dp_trace.c:warning:no-previous-prototype-for-link_dp_trace_set_edp_power_timestamp
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-ds_port-set-but-not-used
|   |-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-protocols-link_dp_capability.c:warning:variable-result_write_min_hblank-set-but-not-used
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8916_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8939_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8974_backup_nvmem-was-not-declared.-Should-it-be-static
|   |-- drivers-thermal-qcom-tsens-v0_1.c:sparse:sparse:symbol-tsens_8974_nvmem-was-not-declared.-Should-it-be-static
clang_recent_errors
`-- riscv-randconfig-r003-20230204
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_10
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_data_12
    |-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_10
    `-- drivers-clk-qcom-gcc-sa8775p.c:warning:unused-variable-gcc_parent_map_12

elapsed time: 726m

configs tested: 87
configs skipped: 3

gcc tested configs:
x86_64                            allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
um                             i386_defconfig
i386                                defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                              defconfig
arc                                 defconfig
s390                             allmodconfig
i386                 randconfig-a011-20230206
sh                               allmodconfig
i386                             allyesconfig
x86_64               randconfig-a014-20230206
x86_64                               rhel-8.3
alpha                               defconfig
ia64                             allmodconfig
mips                             allyesconfig
x86_64                           rhel-8.3-bpf
m68k                             allyesconfig
x86_64                           rhel-8.3-syz
m68k                             allmodconfig
x86_64                         rhel-8.3-kunit
arc                              allyesconfig
x86_64               randconfig-a013-20230206
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
i386                 randconfig-a014-20230206
x86_64               randconfig-a011-20230206
i386                 randconfig-a012-20230206
i386                 randconfig-a016-20230206
alpha                            allyesconfig
sh                          rsk7203_defconfig
arm                                 defconfig
s390                                defconfig
x86_64               randconfig-a015-20230206
s390                             allyesconfig
m68k                          amiga_defconfig
x86_64               randconfig-a012-20230206
x86_64                           allyesconfig
i386                 randconfig-a013-20230206
xtensa                           alldefconfig
i386                 randconfig-a015-20230206
x86_64               randconfig-a016-20230206
s390                 randconfig-r044-20230206
arc                  randconfig-r043-20230205
arm64                            allyesconfig
arm                  randconfig-r046-20230205
arc                  randconfig-r043-20230206
arm                              allyesconfig
riscv                randconfig-r042-20230206
arm                            mps2_defconfig
arm                           h3600_defconfig
m68k                       bvme6000_defconfig
sh                            hp6xx_defconfig
powerpc                      tqm8xx_defconfig
sh                        sh7785lcr_defconfig
sh                          urquell_defconfig
arm                         nhk8815_defconfig
powerpc                     rainier_defconfig
arm                         axm55xx_defconfig
powerpc                       maple_defconfig
sh                           se7705_defconfig
i386                          randconfig-c001

clang tested configs:
x86_64                          rhel-8.3-rust
x86_64               randconfig-a001-20230206
x86_64               randconfig-a005-20230206
x86_64               randconfig-a002-20230206
x86_64               randconfig-a004-20230206
x86_64               randconfig-a003-20230206
hexagon              randconfig-r041-20230205
x86_64               randconfig-a006-20230206
arm                         mv78xx0_defconfig
riscv                randconfig-r042-20230205
hexagon              randconfig-r045-20230206
i386                 randconfig-a005-20230206
hexagon              randconfig-r041-20230206
i386                 randconfig-a004-20230206
i386                 randconfig-a003-20230206
i386                 randconfig-a001-20230206
i386                 randconfig-a002-20230206
arm                  randconfig-r046-20230206
s390                 randconfig-r044-20230205
hexagon              randconfig-r045-20230205
i386                 randconfig-a006-20230206
powerpc                 mpc8315_rdb_defconfig
x86_64                        randconfig-k001

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
