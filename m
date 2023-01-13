Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 461AF669F36
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 18:13:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 71CDEAD76;
	Fri, 13 Jan 2023 18:12:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 71CDEAD76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673629989;
	bh=uaaXZV3sG79+TeMR+hrFRsa8RvzQpx4iYxOp0B1DqCM=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=M+yNLjwy5NmHqcrXGVjiTEWq66LWofgc9fdSSGoRSeZj6kkll3A6+c0X354+FGGHk
	 taL5RSSh2sxq927g9L38AbDrrWsGTJm8D0UmYc21n/cSQnTmqezQig4bX5SpN1ADbl
	 3ttN6vgrZQ15sYQxsxMIlTap3EDtnelbwznpcctQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B46DF8026D;
	Fri, 13 Jan 2023 18:12:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AA4BF8030F; Fri, 13 Jan 2023 18:12:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46D12F8026D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 18:12:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D12F8026D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=AuwlW2Y0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673629930; x=1705165930;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=uaaXZV3sG79+TeMR+hrFRsa8RvzQpx4iYxOp0B1DqCM=;
 b=AuwlW2Y04gk4FU2FfJAaXAdT5YM8Ladj5tugVXys9sA8dnJnWBwDXd2a
 o3qjdSkvoRRFLQKj7cyWPE3YWsVjKlRyTOCDYlSXGeZOJgYdHNFNYiMc5
 4fjEfvh25Q1kpjARoVNJGGuUmMk9PC0ckJjiHjd+cAhfa9mEMHq/w0rGB
 Ot+4HSJLxRWfvq3e3nsHy+RjhGH6v6Ynmh59Nna4sd0am4AkZ1CtgOCQ0
 YH2R3rHlMa47+mZl6i3Ql99uOG2pLWRW1odWcWMRcWZ8K9WADLlgtRqfN
 cwZZqjUz2Au2IqzSAy4OUQV1kPe37OE6PytSqVGdiBc36B9JYgo9EuOgb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="322742862"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="322742862"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 09:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="660282846"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="660282846"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
 by fmsmga007.fm.intel.com with ESMTP; 13 Jan 2023 09:10:30 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1pGNZV-000BHg-2D;
 Fri, 13 Jan 2023 17:10:29 +0000
Date: Sat, 14 Jan 2023 01:10:00 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master] BUILD REGRESSION
 6b31ffe9c8b9947d6d3552d6e10752fd96d0f80f
Message-ID: <63c19068.KJJoDMv4WFq0GgOm%lkp@intel.com>
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
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 dri-devel@lists.freedesktop.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 6b31ffe9c8b9947d6d3552d6e10752fd96d0f80f  Add linux-next specific files for 20230113

Error/Warning: (recently discovered and may have been fixed)

aarch64-linux-ld: ID map text too big or misaligned
arch/arm/kernel/entry-armv.S:485:5: warning: "CONFIG_ARM_THUMB" is not defined, evaluates to 0 [-Wundef]
drivers/gpu/drm/ttm/ttm_bo_util.c:364:32: error: implicit declaration of function 'vmap'; did you mean 'kmap'? [-Werror=implicit-function-declaration]
drivers/gpu/drm/ttm/ttm_bo_util.c:429:17: error: implicit declaration of function 'vunmap'; did you mean 'kunmap'? [-Werror=implicit-function-declaration]

Unverified Error/Warning (likely false positive, please contact us if interested):

drivers/nvmem/layouts/sl28vpd.c:143:21: sparse: sparse: symbol 'sl28vpd_layout' was not declared. Should it be static?
drivers/scsi/qla2xxx/qla_mid.c:1189:6: sparse: sparse: symbol 'qla_trim_buf' was not declared. Should it be static?
drivers/scsi/qla2xxx/qla_mid.c:1221:6: sparse: sparse: symbol '__qla_adjust_buf' was not declared. Should it be static?
sound/ac97/bus.c:465:1: sparse: sparse: symbol 'dev_attr_vendor_id' was not declared. Should it be static?

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arm-buildonly-randconfig-r003-20230113
|   `-- arch-arm-kernel-entry-armv.S:warning:CONFIG_ARM_THUMB-is-not-defined-evaluates-to
|-- arm64-allyesconfig
|   `-- aarch64-linux-ld:ID-map-text-too-big-or-misaligned
|-- microblaze-randconfig-s041-20230112
|   |-- drivers-nvmem-layouts-sl28vpd.c:sparse:sparse:symbol-sl28vpd_layout-was-not-declared.-Should-it-be-static
|   `-- sound-ac97-bus.c:sparse:sparse:symbol-dev_attr_vendor_id-was-not-declared.-Should-it-be-static
|-- microblaze-randconfig-s043-20230112
|   |-- drivers-scsi-qla2xxx-qla_mid.c:sparse:sparse:symbol-__qla_adjust_buf-was-not-declared.-Should-it-be-static
|   `-- drivers-scsi-qla2xxx-qla_mid.c:sparse:sparse:symbol-qla_trim_buf-was-not-declared.-Should-it-be-static
|-- mips-allyesconfig
|   |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
|   `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap
`-- mips-randconfig-r012-20230113
    |-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vmap
    `-- drivers-gpu-drm-ttm-ttm_bo_util.c:error:implicit-declaration-of-function-vunmap

elapsed time: 725m

configs tested: 68
configs skipped: 2

gcc tested configs:
x86_64                            allnoconfig
um                             i386_defconfig
um                           x86_64_defconfig
powerpc                           allnoconfig
x86_64                          rhel-8.3-func
x86_64                    rhel-8.3-kselftests
arc                                 defconfig
s390                             allmodconfig
alpha                               defconfig
s390                                defconfig
sh                               allmodconfig
x86_64                              defconfig
mips                             allyesconfig
x86_64                               rhel-8.3
s390                             allyesconfig
powerpc                          allmodconfig
arc                  randconfig-r043-20230112
arm                                 defconfig
x86_64                           allyesconfig
i386                                defconfig
ia64                             allmodconfig
i386                          randconfig-a001
x86_64                           rhel-8.3-bpf
i386                          randconfig-a003
riscv                randconfig-r042-20230112
s390                 randconfig-r044-20230112
x86_64                        randconfig-a013
i386                          randconfig-a005
arm64                            allyesconfig
x86_64                        randconfig-a011
i386                          randconfig-a014
x86_64                        randconfig-a002
arm                              allyesconfig
i386                          randconfig-a012
x86_64                        randconfig-a015
i386                          randconfig-a016
x86_64                        randconfig-a006
i386                             allyesconfig
x86_64                        randconfig-a004
sh                          urquell_defconfig
sh                     magicpanelr2_defconfig
xtensa                       common_defconfig
m68k                             allyesconfig
m68k                             allmodconfig
alpha                            allyesconfig
arc                              allyesconfig
x86_64                           rhel-8.3-syz
x86_64                         rhel-8.3-kunit
x86_64                           rhel-8.3-kvm

clang tested configs:
x86_64                          rhel-8.3-rust
arm                  randconfig-r046-20230112
hexagon              randconfig-r041-20230112
hexagon              randconfig-r045-20230112
i386                          randconfig-a002
x86_64                        randconfig-a014
i386                          randconfig-a013
i386                          randconfig-a006
i386                          randconfig-a011
x86_64                        randconfig-a012
x86_64                        randconfig-a001
i386                          randconfig-a015
i386                          randconfig-a004
x86_64                        randconfig-a016
x86_64                        randconfig-a003
x86_64                        randconfig-a005
mips                       rbtx49xx_defconfig
s390                             alldefconfig
powerpc                      walnut_defconfig

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
