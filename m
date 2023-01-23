Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 043C36782EA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Jan 2023 18:20:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9930DE10;
	Mon, 23 Jan 2023 18:19:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9930DE10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674494427;
	bh=QxKTXC1q61zdzF23NI5tLZ2E5StXSr3Z/SKaZ/ipFdc=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=BuuDVII2/Xk4Synclrnl1O3FTAMzx6upwoC/0pQtNycyF2ayZCyU1ayJSY07IqVFM
	 R/N1f+bUGpdePC0aQLdkTtRIzG7A5PTheKw3C8wn+gW8iQRMUhhlyMemYx9AVItK/3
	 +ojgngcCXjVj2C9/KK0hVAoohrSG1rnzK1ax0KpQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B603F804C2;
	Mon, 23 Jan 2023 18:19:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3EC3F804A9; Mon, 23 Jan 2023 18:19:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 409CBF801D5
 for <alsa-devel@alsa-project.org>; Mon, 23 Jan 2023 18:19:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 409CBF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=WGKeX4wy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674494362; x=1706030362;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=QxKTXC1q61zdzF23NI5tLZ2E5StXSr3Z/SKaZ/ipFdc=;
 b=WGKeX4wyS3KtR3bljhLESefhccap/QnC3k1L7CP6t5pi8WXOEsb6uX+f
 H3WS6q4+2zeuScemBaydw6teRfLRyrNjkQnEfxAF1uj5ZgYsqCYh3StYx
 b195Zl7UtF2wxFiJoUPG6N5HT80dJVuf4JtfkO05FHd93/UTDU7FsZsGa
 P53Xk9p9jjFIHx6z7oNnxlo3ChPUlCKW53pcO3w9O7ZlfL5tg5UoBhGTs
 5eQRrpJFff9fVrfaDG8iiJj34j6MMCD6V0YnKaQOm5kDJN5hMAly05TGf
 ohEdbwWxfj42QuxsmNY7jRj7s2BKkrzO6sL8M814RvjDiEZVSew5oyBuS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="306451044"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="306451044"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2023 09:19:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="661791647"
X-IronPort-AV: E=Sophos;i="5.97,240,1669104000"; d="scan'208";a="661791647"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 23 Jan 2023 09:19:15 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pK0TS-0005mq-0v;
 Mon, 23 Jan 2023 17:19:14 +0000
Date: Tue, 24 Jan 2023 01:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 691781f561e9868a94c3ed7daf4adad7f8af5d16
Message-ID: <63cec15f.4eitr3XQwks0MqhA%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, linux-gpio@vger.kernel.org,
 netdev@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 691781f561e9868a94c3ed7daf4adad7f8af5d16  Add linux-next specific files for 20230123

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/dma/idma64.ko] undefined!
drivers/gpio/gpio-zevio.c:174:40: error: invalid use of undefined type 'struct platform_device'
drivers/gpio/gpio-zevio.c:178:9: error: implicit declaration of function 'platform_set_drvdata' [-Werror=implicit-function-declaration]
drivers/gpio/gpio-zevio.c:184:28: error: implicit declaration of function 'devm_platform_ioremap_resource'; did you mean 'devm_ioremap_resource'? [-Werror=implicit-function-declaration]
drivers/gpio/gpio-zevio.c:211:15: error: variable 'zevio_gpio_driver' has initializer but incomplete type
drivers/gpio/gpio-zevio.c:211:31: error: storage size of 'zevio_gpio_driver' isn't known
drivers/gpio/gpio-zevio.c:212:10: error: 'struct platform_driver' has no member named 'driver'
drivers/gpio/gpio-zevio.c:212:27: error: extra brace group at end of initializer
drivers/gpio/gpio-zevio.c:217:10: error: 'struct platform_driver' has no member named 'probe'
drivers/gpio/gpio-zevio.c:219:1: error: type defaults to 'int' in declaration of 'builtin_platform_driver' [-Werror=implicit-int]
drivers/gpu/drm/amd/amdgpu/../display/dc/link/link_dp_training.c:1585:38: warning: variable 'result' set but not used [-Wunused-but-set-variable]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/block/virtio_blk.c:721:9: sparse:    bad type *
drivers/block/virtio_blk.c:721:9: sparse:    unsigned int *
drivers/block/virtio_blk.c:721:9: sparse: sparse: incompatible types in comparison expression (different base types):
drivers/block/virtio_blk.c:721:9: sparse: sparse: no generic selection for 'restricted __le32 [addressable] virtio_cread_v'
drivers/block/virtio_blk.c:721:9: sparse: sparse: no generic selection for 'restricted __le32 virtio_cread_v'
drivers/media/i2c/max9286.c:771 max9286_s_stream() error: buffer overflow 'priv->fmt' 4 <= 32
drivers/nvmem/imx-ocotp.c:599:21: sparse: sparse: symbol 'imx_ocotp_layout' was not declared. Should it be static?
mm/hugetlb.c:3100 alloc_hugetlb_folio() error: uninitialized symbol 'h_cg'.
net/devlink/leftover.c:7160 devlink_fmsg_prepare_skb() error: uninitialized symbol 'err'.
sound/ac97/bus.c:465:1: sparse: sparse: symbol 'dev_attr_vendor_id' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arc-randconfig-m031-20230123
|   `-- drivers-media-i2c-max9286.c-max9286_s_stream()-error:buffer-overflow-priv-fmt
|-- arm-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-buildonly-randconfig-r005-20230123
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- arm-randconfig-r023-20230123
|   |-- drivers-gpio-gpio-zevio.c:error:extra-brace-group-at-end-of-initializer
|   |-- drivers-gpio-gpio-zevio.c:error:implicit-declaration-of-function-devm_platform_ioremap_resource
|   |-- drivers-gpio-gpio-zevio.c:error:implicit-declaration-of-function-platform_set_drvdata
|   |-- drivers-gpio-gpio-zevio.c:error:invalid-use-of-undefined-type-struct-platform_device
|   |-- drivers-gpio-gpio-zevio.c:error:storage-size-of-zevio_gpio_driver-isn-t-known
|   |-- drivers-gpio-gpio-zevio.c:error:struct-platform_driver-has-no-member-named-driver
|   |-- drivers-gpio-gpio-zevio.c:error:struct-platform_driver-has-no-member-named-probe
|   |-- drivers-gpio-gpio-zevio.c:error:type-defaults-to-int-in-declaration-of-builtin_platform_driver
|   `-- drivers-gpio-gpio-zevio.c:error:variable-zevio_gpio_driver-has-initializer-but-incomplete-type
|-- arm64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- csky-randconfig-s033-20230123
|   |-- drivers-nvmem-imx-ocotp.c:sparse:sparse:symbol-imx_ocotp_layout-was-not-declared.-Should-it-be-static
|   `-- sound-ac97-bus.c:sparse:sparse:symbol-dev_attr_vendor_id-was-not-declared.-Should-it-be-static
|-- i386-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- parisc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- riscv-randconfig-s053-20230123
|   |-- drivers-block-virtio_blk.c:sparse:bad-type
|   |-- drivers-block-virtio_blk.c:sparse:sparse:incompatible-types-in-comparison-expression-(different-base-types):
|   |-- drivers-block-virtio_blk.c:sparse:sparse:no-generic-selection-for-restricted-__le32-addressable-virtio_cread_v
|   |-- drivers-block-virtio_blk.c:sparse:sparse:no-generic-selection-for-restricted-__le32-virtio_cread_v
|   `-- drivers-block-virtio_blk.c:sparse:unsigned-int
|-- s390-allmodconfig
|   |-- ERROR:devm_platform_ioremap_resource-drivers-dma-fsl-edma.ko-undefined
|   `-- ERROR:devm_platform_ioremap_resource-drivers-dma-idma64.ko-undefined
|-- s390-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-link-link_dp_training.c:warning:variable-result-set-but-not-used

elapsed time: 721m

configs tested: 85
configs skipped: 4

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
i386                                defconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
x86_64                              defconfig
sh                        edosk7705_defconfig
ia64                             allmodconfig
x86_64                               rhel-8.3
i386                 randconfig-a004-20230123
arm                         axm55xx_defconfig
i386                 randconfig-a003-20230123
x86_64                           allyesconfig
sh                           se7722_defconfig
sh                                  defconfig
arm                        spear6xx_defconfig
i386                 randconfig-a002-20230123
m68k                             allmodconfig
arm                           u8500_defconfig
i386                 randconfig-a001-20230123
x86_64               randconfig-a002-20230123
arc                        nsimosci_defconfig
arc                  randconfig-r043-20230123
powerpc                           allnoconfig
sh                            hp6xx_defconfig
arc                              allyesconfig
x86_64               randconfig-a004-20230123
mips                             allyesconfig
alpha                            allyesconfig
x86_64               randconfig-a003-20230123
i386                 randconfig-a005-20230123
mips                     loongson1b_defconfig
x86_64               randconfig-a005-20230123
arm                                 defconfig
x86_64                           rhel-8.3-syz
i386                             allyesconfig
i386                 randconfig-a006-20230123
x86_64                         rhel-8.3-kunit
m68k                             allyesconfig
powerpc                          allmodconfig
x86_64                           rhel-8.3-kvm
x86_64                           rhel-8.3-bpf
arm                  randconfig-r046-20230123
sh                               allmodconfig
x86_64               randconfig-a001-20230123
mips                  decstation_64_defconfig
sh                          rsk7203_defconfig
xtensa                  nommu_kc705_defconfig
arm                           imxrt_defconfig
arm                              allyesconfig
arm64                            allyesconfig
powerpc                     rainier_defconfig
ia64                             allyesconfig
powerpc              randconfig-c003-20230123
i386                 randconfig-c001-20230123
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
s390                             allyesconfig

clang tested configs:
x86_64                          rhel-8.3-rust
hexagon              randconfig-r041-20230123
hexagon              randconfig-r045-20230123
powerpc                   microwatt_defconfig
s390                 randconfig-r044-20230123
x86_64               randconfig-a015-20230123
mips                     cu1000-neo_defconfig
mips                           ip22_defconfig
x86_64               randconfig-a011-20230123
i386                 randconfig-a014-20230123
mips                          ath79_defconfig
x86_64               randconfig-a013-20230123
arm                   milbeaut_m10v_defconfig
riscv                randconfig-r042-20230123
x86_64               randconfig-a012-20230123
mips                        maltaup_defconfig
i386                 randconfig-a012-20230123
x86_64               randconfig-a014-20230123
i386                 randconfig-a013-20230123
i386                 randconfig-a011-20230123
i386                 randconfig-a015-20230123
arm                       aspeed_g4_defconfig
mips                          ath25_defconfig
arm                         socfpga_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
