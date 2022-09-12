Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E156F5B63B0
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 00:28:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1851516DE;
	Tue, 13 Sep 2022 00:28:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1851516DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663021732;
	bh=EBpU68xsLpcCQoQ5Ydg1RH2aVA+reCYJEVoDTaANPPA=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qIO53x2zLYgxTlhKQFmZ55JhQMbgIZrfKCI1Y9LQAIP37oNEj2VtETvaroriPcCZD
	 vCWJkgIF+bT5WKg3hQykZovg/JWBdRAVm9JpZSuyS/bsZ/Z/XUx58miLpISucxKKEb
	 xGpGOuHnV6ghBWD+Dxixzdwn84hM+s3W39zKY9DU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CA83F8030F;
	Tue, 13 Sep 2022 00:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA651F80095; Tue, 13 Sep 2022 00:27:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 13478F800EC
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 00:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 13478F800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="jkMyLh7t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663021663; x=1694557663;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=EBpU68xsLpcCQoQ5Ydg1RH2aVA+reCYJEVoDTaANPPA=;
 b=jkMyLh7t/h73+ASzfHcv+Do9BD3SJwr3Ei9iwU/nuq72i5F4VG5MHshi
 mt2YJr/Jy6/64DivKu0h2ZcoY8j7TO8sPp/lrgjd7NaMlo45bSUaSZiH0
 liy1fCXm8s0VcssftYyg5Xh3ds89TZ9gXWNeXx2kjo4VAQeJjKTrHXE4j
 qh8Mtnt5r33jNgMSBgr7XHPDtT8COH55gM+2YGB/oZLRlI5AOXapGG8UH
 1A6VJD2ZFJvS7haYALDrXdEDJ69uiYeBpGeqjvXXTRcFBRpSi3qP0IQ1/
 KVdfvai1PQWP1vdiYwZoELLZVqMchf7yWx6ACrZAxr095StNvb+TcEnvH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281002255"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="281002255"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 15:27:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="646659772"
Received: from lkp-server02.sh.intel.com (HELO 4011df4f4fd3) ([10.239.97.151])
 by orsmga008.jf.intel.com with ESMTP; 12 Sep 2022 15:27:33 -0700
Received: from kbuild by 4011df4f4fd3 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1oXrts-0002w5-1D;
 Mon, 12 Sep 2022 22:27:32 +0000
Date: Tue, 13 Sep 2022 06:26:56 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 044b771be9c5de9d817dfafb829d2f049c71c3b4
Message-ID: <631fb230.qcoZqD19biA2J50w%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>, linux-gpio@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 linux-media@vger.kernel.org
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
branch HEAD: 044b771be9c5de9d817dfafb829d2f049c71c3b4  Add linux-next specific files for 20220912

Error/Warning reports:

https://lore.kernel.org/linux-media/202209020437.eXEOdmfe-lkp@intel.com
https://lore.kernel.org/linux-mm/202209042337.FQi69rLV-lkp@intel.com
https://lore.kernel.org/linux-mm/202209060229.dVuyxjBv-lkp@intel.com
https://lore.kernel.org/linux-mm/202209080718.y5QmlNKH-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "ioread64" [drivers/pci/switch/switchtec.ko] undefined!
drivers/gpu/drm/amd/amdgpu/imu_v11_0_3.c:139:6: warning: no previous prototype for 'imu_v11_0_3_program_rlc_ram' [-Wmissing-prototypes]
drivers/gpu/drm/drm_atomic_helper.c:802: warning: expecting prototype for drm_atomic_helper_check_wb_connector_state(). Prototype was for drm_atomic_helper_check_wb_encoder_state() instead
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x9a'
drivers/pinctrl/pinctrl-amd.c:288 amd_gpio_dbg_show() warn: format string contains non-ascii character '\xa1'
drivers/pinctrl/pinctrl-amd.c:370 amd_gpio_dbg_show() warn: format string contains non-ascii character '\x95'
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/scsi/qla2xxx/qla_os.c:2854:25: error: implicit declaration of function 'trace_array_get_by_name'; did you mean 'trace_array_set_clr_event'? [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_os.c:2869:9: error: implicit declaration of function 'trace_array_put' [-Werror=implicit-function-declaration]
kernel/bpf/memalloc.c:499 bpf_mem_alloc_destroy() error: potentially dereferencing uninitialized 'c'.
sound/soc/codecs/tas2562.c:442:13: warning: variable 'ret' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_get_by_name
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_put
|   |-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- alpha-randconfig-r005-20220911
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- alpha-randconfig-r033-20220911
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- alpha-randconfig-r035-20220911
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arc-axs101_defconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r016-20220912
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r032-20220912
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r043-20220911
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arc-randconfig-r043-20220912
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm-defconfig
|   `-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|-- arm-randconfig-c034-20220911
|   `-- net-bluetooth-mgmt.c:WARNING:kzalloc-should-be-used-for-rp-instead-of-kmalloc-memset
|-- arm-randconfig-r032-20220911
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm64-allyesconfig
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
|-- arm64-buildonly-randconfig-r002-20220912
|   |-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-imu_v11_0_3_program_rlc_ram
|   |-- drivers-gpu-drm-drm_atomic_helper.c:warning:expecting-prototype-for-drm_atomic_helper_check_wb_connector_state().-Prototype-was-for-drm_atomic_helper_check_wb_encoder_state()-instead
|   `-- sound-soc-codecs-tas2562.c:warning:variable-ret-set-but-not-used
clang_recent_errors
|-- arm64-randconfig-r011-20220912
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- hexagon-allyesconfig
|   |-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|   `-- drivers-staging-media-deprecated-cpia2-cpia2_usb.c:warning:variable-frame_count-set-but-not-used
|-- i386-randconfig-a012-20220912
|   `-- sound-soc-intel-skylake-skl.c:warning:unused-variable-skl
|-- i386-randconfig-a015-20220912
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- mips-randconfig-r021-20220911
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- powerpc-randconfig-r002-20220911
|   `-- drivers-gpu-drm-amd-amdgpu-imu_v11_0_3.c:warning:no-previous-prototype-for-function-imu_v11_0_3_program_rlc_ram
|-- riscv-randconfig-r015-20220912
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
`-- riscv-randconfig-r042-20220912
    `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead

elapsed time: 724m

configs tested: 82
configs skipped: 2

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
x86_64               randconfig-a001-20220912
arc                          axs101_defconfig
x86_64               randconfig-a002-20220912
i386                 randconfig-a001-20220912
x86_64                               rhel-8.3
x86_64               randconfig-a003-20220912
x86_64                          rhel-8.3-func
arm                           stm32_defconfig
alpha                            allyesconfig
sh                           se7724_defconfig
x86_64                           allyesconfig
arm                                 defconfig
alpha                             allnoconfig
i386                 randconfig-a002-20220912
x86_64                         rhel-8.3-kunit
riscv                             allnoconfig
m68k                             allmodconfig
x86_64                           rhel-8.3-kvm
x86_64               randconfig-a006-20220912
i386                 randconfig-a004-20220912
x86_64               randconfig-a004-20220912
csky                              allnoconfig
arc                               allnoconfig
sh                           se7705_defconfig
i386                                defconfig
i386                             allyesconfig
m68k                            q40_defconfig
i386                 randconfig-a003-20220912
arc                              allyesconfig
x86_64                    rhel-8.3-kselftests
x86_64                           rhel-8.3-syz
arm                          iop32x_defconfig
x86_64               randconfig-a005-20220912
powerpc                           allnoconfig
m68k                             allyesconfig
riscv                randconfig-r042-20220911
arm                        trizeps4_defconfig
i386                 randconfig-a006-20220912
arc                  randconfig-r043-20220912
mips                             allyesconfig
sparc64                             defconfig
i386                 randconfig-a005-20220912
powerpc                          allmodconfig
arm64                            allyesconfig
sh                               allmodconfig
s390                          debug_defconfig
arm                              allyesconfig
arc                  randconfig-r043-20220911
s390                 randconfig-r044-20220911
ia64                             allmodconfig
sh                           sh2007_defconfig
sh                         ecovec24_defconfig
sh                               alldefconfig
sh                          rsk7269_defconfig

clang tested configs:
x86_64               randconfig-a011-20220912
x86_64               randconfig-a012-20220912
i386                 randconfig-a013-20220912
x86_64               randconfig-a013-20220912
i386                 randconfig-a011-20220912
x86_64               randconfig-a014-20220912
mips                           rs90_defconfig
arm                          pcm027_defconfig
x86_64               randconfig-a016-20220912
i386                 randconfig-a012-20220912
arm                          ixp4xx_defconfig
x86_64               randconfig-a015-20220912
i386                 randconfig-a014-20220912
arm                        vexpress_defconfig
i386                 randconfig-a015-20220912
riscv                randconfig-r042-20220912
hexagon              randconfig-r041-20220912
i386                 randconfig-a016-20220912
hexagon              randconfig-r045-20220911
hexagon              randconfig-r041-20220911
hexagon              randconfig-r045-20220912
s390                 randconfig-r044-20220912
mips                malta_qemu_32r6_defconfig
powerpc                    gamecube_defconfig
x86_64                          rhel-8.3-rust

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
