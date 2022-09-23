Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2053F5E85B6
	for <lists+alsa-devel@lfdr.de>; Sat, 24 Sep 2022 00:17:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88192825;
	Sat, 24 Sep 2022 00:16:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88192825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663971460;
	bh=HnHny9mH/Tc9Mi+8kDkl+OHLMRjchuCS0knbbnNoCE4=;
	h=Date:From:To:Subject:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=VwEWitIbIIxngmd4i8WzqDT+ksrwB2HVk7C748xJqJuhgbu+4D31HM4nm1PVA1llE
	 Ii6BtXsqszD5fAabp7i5gxghU566cVR5yRdUwBD284WjwhCPhF25Wk/DbLIkZR7he3
	 omIJaWvcvGvn6fEpIrq0yZrLVjbB8k2NsN0Rnc8I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D8CF801EC;
	Sat, 24 Sep 2022 00:16:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 583ABF80269; Sat, 24 Sep 2022 00:16:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99FCAF80107
 for <alsa-devel@alsa-project.org>; Sat, 24 Sep 2022 00:16:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99FCAF80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ONl8FLeg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663971395; x=1695507395;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=HnHny9mH/Tc9Mi+8kDkl+OHLMRjchuCS0knbbnNoCE4=;
 b=ONl8FLegnJubkjAC+ev0I6IqUJtePHBbEyIxgyN29jaS360Cb2swRcVj
 Q64tVDWLxrtNPmHJKI+TKOBXXFJHUObCvPG2w40iBBA6B7PHBEtMc/g52
 n4VAB4oOQIf4CxXRy6KRgAIOBW7Y7RIiCC025EcJy1Oo3HZqNd8v7mIZY
 F9To+ZibdvPwA9j8yi0orqs2qRtHi5iaDxoa7oB3f+Q/hlBc2qLAKjQU0
 /0mB3WxnGjL6rqxgg9AHMQ0rznWC1JgtLQ9IDNatvJhfgG5mxBmaHmmq0
 X+Kyw0on5HwC4uPMm9UJb1Cr2wsjT9mkpNoa9gH+rDXn+XykolYAdb/+6 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10479"; a="301598612"
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; d="scan'208";a="301598612"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2022 15:16:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,340,1654585200"; d="scan'208";a="688887263"
Received: from lkp-server01.sh.intel.com (HELO c0a60f19fe7e) ([10.239.97.150])
 by fmsmga004.fm.intel.com with ESMTP; 23 Sep 2022 15:16:08 -0700
Received: from kbuild by c0a60f19fe7e with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1obqxr-0005yu-32;
 Fri, 23 Sep 2022 22:16:07 +0000
Date: Sat, 24 Sep 2022 06:15:33 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd
Message-ID: <632e3005.ZYJJ6QtZHKiRIgTH%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Linux Memory Management List <linux-mm@kvack.org>,
 amd-gfx@lists.freedesktop.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
branch HEAD: aaa11ce2ffc84166d11c4d2ac88c3fcf75425fbd  Add linux-next specific files for 20220923

Error/Warning reports:

https://lore.kernel.org/linux-doc/202209231933.vcyETtUl-lkp@intel.com
https://lore.kernel.org/linux-mm/202209042337.FQi69rLV-lkp@intel.com
https://lore.kernel.org/linux-mm/202209060229.dVuyxjBv-lkp@intel.com
https://lore.kernel.org/linux-mm/202209150141.WgbAKqmX-lkp@intel.com
https://lore.kernel.org/linux-mm/202209200603.Hpvoa8Ii-lkp@intel.com
https://lore.kernel.org/linux-mm/202209200949.Vl3xrUYD-lkp@intel.com
https://lore.kernel.org/llvm/202209220019.Yr2VuXhg-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "devm_ioremap_resource" [drivers/dma/fsl-edma.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/idma64.ko] undefined!
ERROR: modpost: "devm_ioremap_resource" [drivers/dma/qcom/hdma.ko] undefined!
ERROR: modpost: "devm_memremap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_memunmap" [drivers/misc/open-dice.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/char/xillybus/xillybus_of.ko] undefined!
ERROR: modpost: "devm_platform_ioremap_resource" [drivers/clk/xilinx/clk-xlnx-clock-wizard.ko] undefined!
ERROR: modpost: "ioremap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "ioremap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
ERROR: modpost: "iounmap" [drivers/net/ethernet/8390/pcnet_cs.ko] undefined!
ERROR: modpost: "iounmap" [drivers/tty/ipwireless/ipwireless.ko] undefined!
Warning: Documentation/translations/zh_CN/devicetree/kernel-api.rst references a file that doesn't exist: Documentation/Devicetree/kernel-api.rst
arch/arm64/kernel/alternative.c:199:6: warning: no previous prototype for 'apply_alternatives_vdso' [-Wmissing-prototypes]
arch/arm64/kernel/alternative.c:295:14: warning: no previous prototype for 'alt_cb_patch_nops' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:363:5: warning: no previous prototype for 'ioread64_lo_hi' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:373:5: warning: no previous prototype for 'ioread64_hi_lo' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:448:6: warning: no previous prototype for 'iowrite64_lo_hi' [-Wmissing-prototypes]
arch/parisc/lib/iomap.c:454:6: warning: no previous prototype for 'iowrite64_hi_lo' [-Wmissing-prototypes]
drivers/scsi/qla2xxx/qla_os.c:2854:23: warning: assignment to 'struct trace_array *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
drivers/scsi/qla2xxx/qla_os.c:2854:25: error: implicit declaration of function 'trace_array_get_by_name'; did you mean 'trace_array_set_clr_event'? [-Werror=implicit-function-declaration]
drivers/scsi/qla2xxx/qla_os.c:2869:9: error: implicit declaration of function 'trace_array_put' [-Werror=implicit-function-declaration]
grep: smatch_trinity_*: No such file or directory
make[5]: *** No rule to make target 'drivers/crypto/aspeed/aspeed_crypto.o', needed by 'drivers/crypto/aspeed/'.
mm/hugetlb.c:5539:14: warning: variable 'reserve_alloc' set but not used [-Wunused-but-set-variable]

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_get_by_name
|   |-- drivers-scsi-qla2xxx-qla_os.c:error:implicit-declaration-of-function-trace_array_put
|   `-- drivers-scsi-qla2xxx-qla_os.c:warning:assignment-to-struct-trace_array-from-int-makes-pointer-from-integer-without-a-cast
|-- alpha-randconfig-c042-20220923
|   `-- make:No-rule-to-make-target-drivers-crypto-aspeed-aspeed_crypto.o-needed-by-drivers-crypto-aspeed-.
|-- arc-randconfig-s031-20220923
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:cast-to-restricted-__le16
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-got-restricted-__le16-usertype
|   |-- kernel-exit.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-struct-sighand_struct-sighand-got-struct-sighand_struct-noderef-__rcu-sighand
|   `-- sound-soc-generic-simple-card-utils.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-int-usertype-val-got-restricted-snd_pcm_format_t-usertype
|-- arm64-allnoconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   `-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|-- arm64-allyesconfig
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- arm64-randconfig-s043-20220923
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   |-- drivers-gpu-drm-tiny-simpledrm.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-vaddr-got-void-noderef-__iomem-screen_base
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:cast-to-restricted-__le16
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-got-restricted-__le16-usertype
|   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-data-got-void-noderef-__iomem-assigned-pvtmon
|   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-noderef-__iomem-pvtmon-got-void
|   |-- drivers-thermal-broadcom-ns-thermal.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-noderef-__iomem-pvtmon-got-void-devdata
|   |-- kernel-exit.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-struct-sighand_struct-sighand-got-struct-sighand_struct-noderef-__rcu-sighand
|   `-- sound-soc-generic-simple-card-utils.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-int-usertype-val-got-restricted-snd_pcm_format_t-usertype
|-- arm64-randconfig-s053-20220923
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-alt_cb_patch_nops
|   |-- arch-arm64-kernel-alternative.c:warning:no-previous-prototype-for-apply_alternatives_vdso
|   |-- drivers-gpu-drm-tiny-simpledrm.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-vaddr-got-void-noderef-__iomem-screen_base
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:cast-to-restricted-__le16
|   |-- drivers-gpu-drm-vkms-vkms_formats.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-usertype-got-restricted-__le16-usertype
|   |-- kernel-bpf-hashtab.c:sparse:sparse:cast-removes-address-space-__percpu-of-expression
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-noderef-__percpu-assigned-pptr-got-void
|   |-- kernel-bpf-hashtab.c:sparse:sparse:incorrect-type-in-assignment-(different-address-spaces)-expected-void-ptr_to_pptr-got-void-noderef-__percpu-assigned-pptr
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-argument-(different-address-spaces)-expected-void-noderef-__percpu-__pdata-got-void-pptr
|   |-- kernel-bpf-memalloc.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-void-pptr-got-void-noderef-__percpu
|   |-- kernel-exit.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-struct-sighand_struct-sighand-got-struct-sighand_struct-noderef-__rcu-sighand
|   `-- sound-soc-generic-simple-card-utils.c:sparse:sparse:incorrect-type-in-initializer-(different-base-types)-expected-unsigned-int-usertype-val-got-restricted-snd_pcm_format_t-usertype
|-- csky-randconfig-s051-20220923
|   `-- kernel-exit.c:sparse:sparse:incorrect-type-in-initializer-(different-address-spaces)-expected-struct-sighand_struct-sighand-got-struct-sighand_struct-noderef-__rcu-sighand
|-- i386-allyesconfig
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- i386-defconfig
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- i386-randconfig-a005
clang_recent_errors
|-- hexagon-buildonly-randconfig-r006-20220923
|   |-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmnewmap
|   |-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-__vmsetvec
|   `-- ld.lld:error:vmlinux.a(arch-hexagon-kernel-head.o):(.init.text):relocation-R_HEX_B22_PCREL-out-of-range:is-not-in-references-memset
|-- i386-randconfig-a002
|   |-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- i386-randconfig-a004
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- i386-randconfig-a006
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- i386-randconfig-a013
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- powerpc-mpc885_ads_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- powerpc-randconfig-r035-20220923
|   `-- drivers-gpu-drm-amd-amdgpu-..-display-dc-virtual-virtual_link_hwss.c:warning:no-previous-prototype-for-function-virtual_disable_link_output
|-- powerpc-tqm8540_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|-- powerpc-xes_mpc85xx_defconfig
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-A_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-B_c-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fcmpu.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiw.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   |-- arch-powerpc-math-emu-fctiwz.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|   `-- arch-powerpc-math-emu-fsel.c:error:variable-_fex-set-but-not-used-Werror-Wunused-but-set-variable
|-- riscv-randconfig-r015-20220922
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_offset:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_markers
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-get_symbol_offset:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_names
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-update_iter:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_names
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-update_iter:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_offsets
|   |-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-update_iter:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_relative_base
|   `-- ld.lld:error:vmlinux.a(kernel-kallsyms.o):(function-update_iter:.text):relocation-R_RISCV_PCREL_HI20-out-of-range:is-not-in-references-kallsyms_token_index
|-- x86_64-randconfig-a001
|   `-- mm-hugetlb.c:warning:variable-reserve_alloc-set-but-not-used
|-- x86_64-randconfig-a003
|   `-- drivers-extcon-extcon-usbc-tusb320.c:warning:expecting-prototype-for-drivers-extcon-extcon-tusb320c().-Prototype-was-for-TUSB320_REG8()-instead
|-- x86_64-randconfig-a005

elapsed time: 726m

configs tested: 88
configs skipped: 3

gcc tested configs:
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              defconfig
arc                  randconfig-r043-20220922
i386                                defconfig
i386                          randconfig-a001
x86_64                        randconfig-a002
i386                          randconfig-a003
arm                                 defconfig
x86_64                        randconfig-a006
x86_64                        randconfig-a013
i386                          randconfig-a005
x86_64                               rhel-8.3
x86_64                        randconfig-a004
x86_64                        randconfig-a011
i386                             allyesconfig
arc                                 defconfig
x86_64                           rhel-8.3-kvm
x86_64                    rhel-8.3-kselftests
s390                             allmodconfig
csky                             alldefconfig
x86_64                        randconfig-a015
x86_64                           rhel-8.3-syz
xtensa                    smp_lx200_defconfig
sh                           se7705_defconfig
ia64                             allmodconfig
x86_64                          rhel-8.3-func
powerpc                      tqm8xx_defconfig
arc                               allnoconfig
alpha                             allnoconfig
riscv                             allnoconfig
csky                              allnoconfig
sh                        sh7757lcr_defconfig
mips                         rt305x_defconfig
sh                   sh7770_generic_defconfig
m68k                          hp300_defconfig
arm                          lpd270_defconfig
sh                               allmodconfig
i386                          randconfig-c001
mips                          rb532_defconfig
ia64                        generic_defconfig
arm                          exynos_defconfig
mips                            ar7_defconfig
sh                          lboxre2_defconfig
powerpc                     pq2fads_defconfig
arm                        mini2440_defconfig
powerpc                  iss476-smp_defconfig
ia64                          tiger_defconfig
sh                        edosk7760_defconfig
nios2                               defconfig
parisc                              defconfig
powerpc                           allnoconfig
alpha                               defconfig
m68k                             allmodconfig
arc                              allyesconfig
x86_64                           allyesconfig
x86_64                         rhel-8.3-kunit
alpha                            allyesconfig
m68k                             allyesconfig
mips                             allyesconfig
powerpc                          allmodconfig
s390                                defconfig
arm                              allyesconfig
arm64                            allyesconfig
s390                             allyesconfig
arm                  randconfig-c002-20220924

clang tested configs:
hexagon              randconfig-r041-20220922
x86_64                        randconfig-a001
i386                          randconfig-a002
riscv                randconfig-r042-20220922
x86_64                        randconfig-a003
hexagon              randconfig-r045-20220922
i386                          randconfig-a006
x86_64                        randconfig-a005
x86_64                        randconfig-a016
i386                          randconfig-a004
s390                 randconfig-r044-20220922
mips                     loongson1c_defconfig
x86_64                        randconfig-a012
powerpc                  mpc885_ads_defconfig
x86_64                        randconfig-a014
i386                          randconfig-a013
mips                        maltaup_defconfig
arm                       versatile_defconfig
riscv                            alldefconfig
powerpc                 xes_mpc85xx_defconfig
powerpc                     tqm8540_defconfig
powerpc                 mpc8272_ads_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
