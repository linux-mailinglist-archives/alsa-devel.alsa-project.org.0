Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7106F5B11F5
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Sep 2022 03:13:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04DA01697;
	Thu,  8 Sep 2022 03:13:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04DA01697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662599635;
	bh=DzghnYU0wzVB6WTARjWFLQMkyj0Z+o+JZG+YW32sRcI=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oZ31gwyJ95272QPH1VgpWua5Xik9wRxFvqv5WbNwRjKXzi6ZbbjHQsIxeRu/eZPb1
	 7IPNVWVtenUN4+IUwrvXEK7MOmlbncmKMV2Rs2lc/7k9sZSqkTSOjzMGoM/vNr6oKa
	 DVeZZgQo2cihsSBXmthUMSn2KiuExZpkFFSyvKkg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73BAFF80423;
	Thu,  8 Sep 2022 03:12:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 931A0F8028D; Thu,  8 Sep 2022 03:12:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D2DD0F8023B
 for <alsa-devel@alsa-project.org>; Thu,  8 Sep 2022 03:12:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2DD0F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Q2shg3/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662599568; x=1694135568;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=DzghnYU0wzVB6WTARjWFLQMkyj0Z+o+JZG+YW32sRcI=;
 b=Q2shg3/HKtoJWpjuYS3KszHEYFWhyGd7kL0KlQthH1sIB6/BHgNstuZZ
 VCgB2qefjti74zY9mTjB18JUSU5Rn2hrYdKVplo06Z1+QEQ8Lib8WJ3oo
 5ZiXtsZ0oGfiZYzdcMrUGwVSjPKro1ird66xHUqBGsTFe9y0SBV9neoDX
 +tF8a12S1tAF3k1mM5Yxctv/1s4hrITONKXQFef28a1kJwoasmA8elZ7d
 3mEcU81bsxQcA+/ME/IE+XkWwYe08ZMtxprPjGELUBDnmIrqaHPdhCtSi
 zwyF9JZDCOHuKezMtiOXHiPgqJCjAWZbdaIIerO+lsSiPWu9NK9Xvb6nE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="295771119"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="295771119"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 18:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="683033955"
Received: from lkp-server02.sh.intel.com (HELO 95dfd251caa2) ([10.239.97.151])
 by fmsmga004.fm.intel.com with ESMTP; 07 Sep 2022 18:12:42 -0700
Received: from kbuild by 95dfd251caa2 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oW65x-0007C3-1W;
 Thu, 08 Sep 2022 01:12:41 +0000
Date: Thu, 08 Sep 2022 09:12:15 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 5957ac6635a1a12d4aa2661bbf04d3085a73372a
Message-ID: <6319416f.h232K5rqqAPQe4ZI%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-btrfs@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 5957ac6635a1a12d4aa2661bbf04d3085a73372a  Add linux-next specific files for 20220907

Error/Warning reports:

https://lore.kernel.org/linux-mm/202209070728.o3stvgVt-lkp@intel.com
https://lore.kernel.org/linux-mm/202209080545.qMIVj7YM-lkp@intel.com
https://lore.kernel.org/linux-mm/202209080718.y5QmlNKH-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "__divdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
ERROR: modpost: "__udivdi3" [drivers/gpu/drm/vkms/vkms.ko] undefined!
arm-linux-gnueabi-ld: vkms_formats.c:(.text+0x824): undefined reference to `__aeabi_ldivmod'
arm-linux-gnueabi-ld: warning: orphan section `.data.rel.ro.local' from `arch/arm/boot/compressed/fdt.o' being placed in section `.data.rel.ro.local'
arm-linux-gnueabi-ld: warning: orphan section `.data.rel.ro.local' from `arch/arm/boot/compressed/fdt_ro.o' being placed in section `.data.rel.ro.local'
arm-linux-gnueabi-ld: warning: orphan section `.data.rel.ro.local' from `arch/arm/boot/compressed/fdt_rw.o' being placed in section `.data.rel.ro.local'
arm-linux-gnueabi-ld: warning: orphan section `.data.rel.ro.local' from `arch/arm/boot/compressed/fdt_wip.o' being placed in section `.data.rel.ro.local'
arm-linux-gnueabi-ld: warning: orphan section `.printk_index' from `arch/arm/boot/compressed/fdt.o' being placed in section `.printk_index'
arm-linux-gnueabi-ld: warning: orphan section `.printk_index' from `arch/arm/boot/compressed/fdt_ro.o' being placed in section `.printk_index'
arm-linux-gnueabi-ld: warning: orphan section `.printk_index' from `arch/arm/boot/compressed/fdt_rw.o' being placed in section `.printk_index'
arm-linux-gnueabi-ld: warning: orphan section `.printk_index' from `arch/arm/boot/compressed/fdt_wip.o' being placed in section `.printk_index'
drivers/base/regmap/regmap-mmio.c:221:17: error: implicit declaration of function 'writesb'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:224:17: error: implicit declaration of function 'writesw'; did you mean 'writew'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:227:17: error: implicit declaration of function 'writesl'; did you mean 'writel'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writeq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:231:17: error: implicit declaration of function 'writesq'; did you mean 'writesl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:358:17: error: implicit declaration of function 'readsb'; did you mean 'readb'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:361:17: error: implicit declaration of function 'readsw'; did you mean 'readw'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:364:17: error: implicit declaration of function 'readsl'; did you mean 'readl'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readq'? [-Werror=implicit-function-declaration]
drivers/base/regmap/regmap-mmio.c:368:17: error: implicit declaration of function 'readsq'; did you mean 'readsl'? [-Werror=implicit-function-declaration]
drivers/clk/xilinx/clk-xlnx-clock-wizard.c:431: undefined reference to `devm_platform_ioremap_resource'
drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c:139:6: warning: no previous prototype for 'imu_v11_0_3_program_rlc_ram' [-Wmissing-prototypes]
drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead
drivers/gpu/drm/vkms/vkms_plane.c:110 vkms_plane_atomic_update() warn: variable dereferenced before check 'fb' (see line 108)
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
fs/btrfs/volumes.c:6549 __btrfs_map_block() error: we previously assumed 'mirror_num_ret' could be null (see line 6376)
include/linux/string.h:303:42: warning: 'strnlen' specified bound 4 exceeds source size 3 [-Wstringop-overread]
kernel/bpf/memalloc.c:499 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
ld: vkms_formats.c:(.text+0x3ba): undefined reference to `__divdi3'
microblaze-linux-ld: vkms_formats.o:(.text+0xc74): undefined reference to `__divdi3'
mips-linux-ld: vkms_formats.c:(.text+0x384): undefined reference to `__divdi3'
mips-linux-ld: vkms_formats.c:(.text.argb_u16_to_RGB565+0xd0): undefined reference to `__divdi3'
sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
vkms_formats.c:(.text+0x266): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x364): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x390): undefined reference to `__divdi3'
vkms_formats.c:(.text+0x804): undefined reference to `__aeabi_ldivmod'
vkms_formats.c:(.text.argb_u16_to_RGB565+0xb0): undefined reference to `__divdi3'
vkms_formats.o:(.text+0xb28): undefined reference to `__divdi3'
xtensa-linux-ld: vkms_formats.c:(.text+0x560): undefined reference to `__divdi3'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   |-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- alpha-randconfig-r015-20220907
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsq
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-readsw
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesb
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesl
|   |-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesq
|   `-- drivers-base-regmap-regmap-mmio.c:error:implicit-declaration-of-function-writesw
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-randconfig-r001-20220907
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-allyesconfig
|   |-- arm-linux-gnueabi-ld:vkms_formats.c:(.text):undefined-reference-to-__aeabi_ldivmod
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   |-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|   `-- vkms_formats.c:(.text):undefined-reference-to-__aeabi_ldivmod
|-- arm-buildonly-randconfig-r006-20220907
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-data.rel.ro.local-from-arch-arm-boot-compressed-fdt.o-being-placed-in-section-.data.rel.ro.local
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-data.rel.ro.local-from-arch-arm-boot-compressed-fdt_ro.o-being-placed-in-section-.data.rel.ro.local
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-data.rel.ro.local-from-arch-arm-boot-compressed-fdt_rw.o-being-placed-in-section-.data.rel.ro.local
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-data.rel.ro.local-from-arch-arm-boot-compressed-fdt_wip.o-being-placed-in-section-.data.rel.ro.local
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-printk_index-from-arch-arm-boot-compressed-fdt.o-being-placed-in-section-.printk_index
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-printk_index-from-arch-arm-boot-compressed-fdt_ro.o-being-placed-in-section-.printk_index
|   |-- arm-linux-gnueabi-ld:warning:orphan-section-printk_index-from-arch-arm-boot-compressed-fdt_rw.o-being-placed-in-section-.printk_index
|   `-- arm-linux-gnueabi-ld:warning:orphan-section-printk_index-from-arch-arm-boot-compressed-fdt_wip.o-being-placed-in-section-.printk_index
|-- arm-defconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm64-randconfig-r033-20220907
clang_recent_errors
|-- i386-randconfig-a006
|   `-- ld.lld:error:undefined-symbol:__udivdi3
|-- i386-randconfig-a013
|   `-- ld.lld:error:undefined-symbol:__udivdi3
|-- powerpc-randconfig-r013-20220907
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
`-- riscv-randconfig-r021-20220907
    `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead

elapsed time: 723m

configs tested: 35
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                    rhel-8.3-kselftests
x86_64                          rhel-8.3-func
x86_64                              defconfig
arc                  randconfig-r043-20220907
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm
x86_64                               rhel-8.3
x86_64                           rhel-8.3-syz
x86_64                        randconfig-a013
x86_64                           allyesconfig
x86_64                        randconfig-a011
x86_64                        randconfig-a004
m68k                             allyesconfig
arm                                 defconfig
m68k                             allmodconfig
alpha                            allyesconfig
powerpc                           allnoconfig
arc                              allyesconfig
ia64                             allmodconfig
arm                              allyesconfig
arm64                            allyesconfig
sh                               allmodconfig
mips                             allyesconfig
powerpc                          allmodconfig
i386                             allyesconfig

clang tested configs:
hexagon              randconfig-r041-20220907
riscv                randconfig-r042-20220907
hexagon              randconfig-r045-20220907
s390                 randconfig-r044-20220907
i386                          randconfig-a013
i386                          randconfig-a006
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
