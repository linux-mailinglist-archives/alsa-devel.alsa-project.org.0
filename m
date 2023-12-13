Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98936810902
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Dec 2023 05:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F259DF8;
	Wed, 13 Dec 2023 05:15:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F259DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702440949;
	bh=DySq/P2u34ETi6VtKGLzLebRvg7X37ashfOppXnocBA=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=vSHe/+cC6caMdHT9j9L1y2oZ7YhtEskGEVKY/l/g48k0uAHCnN6W/KeMoFGP2yZWU
	 ZaJPyH9UoCeUgpJ2TtQ65cPOkPBmqNaKTk2V12rnd9mWop8HTKUpebV45JsyP8D6gS
	 d0nm/3JVgwedH1Xpzjp4uPca3pN9tRyO2Dtlii/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E006F8016E; Wed, 13 Dec 2023 05:15:15 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3955DF80571;
	Wed, 13 Dec 2023 05:15:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA028F8016A; Wed, 13 Dec 2023 05:10:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EA3D6F8001F
	for <alsa-devel@alsa-project.org>; Wed, 13 Dec 2023 05:10:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EA3D6F8001F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=l0t+z8YJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702440614; x=1733976614;
  h=date:from:to:cc:subject:message-id;
  bh=DySq/P2u34ETi6VtKGLzLebRvg7X37ashfOppXnocBA=;
  b=l0t+z8YJKQKpMC+yX7fY5DHU19wXtMIlQFQCd4liLtGFbOevw0KFsSTj
   GRu7QPGvFqc+3lFCIV+7DO6MvmfGhdKmtKF6kmcrH/fn6AvzV7g2W65Go
   Gs2KddvIRVmDrcdLwZD0yyV7MhnpvVfXR1v0/HYT98aYxpTJX3dgZCBrk
   tEG3Rbufe2tDKUQmfqd2YwdO8nGTuomwcZPe3ba4/ZUjZv+hMnU3H261H
   YPoSE2gADQpzZkCUxtRxaP8MlsfuE4OAWpYXBKf0Mfbpoa52zD5JYsHqP
   71oQgZ/2yHyg4vb0znnxOMzhY80OWDH/VrrS1okmu73djTjaD+RgDBESb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1766869"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600";
   d="scan'208";a="1766869"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2023 20:10:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="947035443"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600";
   d="scan'208";a="947035443"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 12 Dec 2023 20:10:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDGZM-000K3H-2z;
	Wed, 13 Dec 2023 04:10:00 +0000
Date: Wed, 13 Dec 2023 12:09:34 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 alsa-devel@alsa-project.org, linux-alpha@vger.kernel.org,
 linux-bcachefs@vger.kernel.org, linux-leds@vger.kernel.org,
 ntfs3@lists.linux.dev, patches@opensource.cirrus.com,
 sparclinux@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 abb240f7a2bd14567ab53e602db562bb683391e6
Message-ID: <202312131229.xRLy6uuw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Message-ID-Hash: UNMPNKEG7RJURKBFXKREPK6YVZU4FMU4
X-Message-ID-Hash: UNMPNKEG7RJURKBFXKREPK6YVZU4FMU4
X-MailFrom: lkp@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNMPNKEG7RJURKBFXKREPK6YVZU4FMU4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: abb240f7a2bd14567ab53e602db562bb683391e6  Add linux-next specific files for 20231212

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202312121926.GC7OYtbZ-lkp@intel.com
https://lore.kernel.org/oe-kbuild-all/202312130153.eBbUNFQa-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/panel/synaptics,r63353.yaml

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- alpha-randconfig-r113-20231212
|   |-- arch-alpha-mm-fault.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|   |-- sound-soc-codecs-cs42l43.c:sparse:sparse:symbol-cs42l43_hp_ilimit_clear_work-was-not-declared.-Should-it-be-static
|   `-- sound-soc-codecs-cs42l43.c:sparse:sparse:symbol-cs42l43_hp_ilimit_work-was-not-declared.-Should-it-be-static
|-- arc-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arc-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-003-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- arm-randconfig-r133-20231212
|   |-- fs-ntfs3-ntfs.h:sparse:sparse:static-assertion-failed:sizeof(struct-ATTR_LIST_ENTRY)
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- arm64-randconfig-002-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- arm64-randconfig-003-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- arm64-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- csky-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-003-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-buildonly-randconfig-005-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-003-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-004-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-006-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-053-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- i386-randconfig-061-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-062-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- i386-randconfig-141-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- loongarch-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- m68k-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- microblaze-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- mips-decstation_defconfig
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- nios2-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- nios2-randconfig-r051-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- openrisc-randconfig-r131-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- parisc-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-tty-serial-8250_parisc.o
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- parisc-randconfig-002-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-tty-serial-8250_parisc.o
|-- parisc-randconfig-r132-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-r062-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- powerpc-randconfig-r112-20231212
|   |-- lib-raid6-altivec4.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-__preempt_count_sub(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-toplevel-unative_t
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc-randconfig-r123-20231212
|   |-- fs-ntfs3-ntfs.h:sparse:sparse:static-assertion-failed:sizeof(struct-ATTR_LIST_ENTRY)
|   |-- lib-raid6-altivec4.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec4.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec4.c:sparse:int-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:incomplete-type-static-toplevel-unative_t
|   |-- lib-raid6-altivec8.c:sparse:int-static-signed-toplevel-disable_kernel_altivec(-...-)
|   |-- lib-raid6-altivec8.c:sparse:int-static-toplevel-unative_t
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- powerpc64-randconfig-001-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- riscv-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- riscv-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-allmodconfig
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-s390-block-dasd_diag_mod.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-s390-block-dasd_eckd_mod.o
|   |-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-drivers-s390-block-dasd_fba_mod.o
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- s390-defconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allmodconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-allyesconfig
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sh-randconfig-r121-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- sparc-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-allnoconfig
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-randconfig-001-20231212
|   |-- (.head.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-init.text
|   |-- (.init.text):relocation-truncated-to-fit:R_SPARC_WDISP22-against-symbol-leon_smp_cpu_startup-defined-in-.text-section-in-arch-sparc-kernel-trampoline_32.o
|   |-- arch-sparc-mm-leon_mm.c:warning:variable-paddrbase-set-but-not-used
|   `-- arch-sparc-mm-srmmu.c:warning:variable-clear-set-but-not-used
|-- sparc-randconfig-002-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc-randconfig-r122-20231212
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   |-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- sparc64-allmodconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-allyesconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-defconfig
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   `-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|-- sparc64-randconfig-001-20231212
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- sparc64-randconfig-002-20231212
|   |-- arch-sparc-kernel-module.c:warning:variable-strtab-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-hv_pgsz_idx-set-but-not-used
|   |-- arch-sparc-mm-init_64.c:warning:variable-pagecv_flag-set-but-not-used
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-allnoconfig
|   `-- Warning:MAINTAINERS-references-a-file-that-doesn-t-exist:Documentation-devicetree-bindings-display-panel-synaptics-r63353.yaml
|-- x86_64-buildonly-randconfig-001-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-buildonly-randconfig-004-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-lib-zlib_inflate-zlib_inflate.o
|-- x86_64-buildonly-randconfig-005-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-012-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-014-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-071-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-072-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-075-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-102-20231212
|   |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
|   `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
|-- x86_64-randconfig-161-20231212
|   |-- lib-zstd-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countLeadingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros32()-warn:inconsistent-indenting
|   |-- lib-zstd-compress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
|   |-- lib-zstd-decompress-..-common-bits.h-ZSTD_countLeadingZeros32()-warn:inconsistent-indenting
|   `-- lib-zstd-decompress-..-common-bits.h-ZSTD_countTrailingZeros64()-warn:inconsistent-indenting
`-- xtensa-randconfig-002-20231212
    |-- fs-bcachefs-chardev.c:warning:function-run_thread_with_file-might-be-a-candidate-for-gnu_printf-format-attribute
    `-- fs-bcachefs-super.c:warning:function-__bch2_print-might-be-a-candidate-for-gnu_printf-format-attribute
clang_recent_errors
|-- arm-defconfig
|   |-- WARNING:modpost:vmlinux:section-mismatch-in-reference:at91_poweroff_probe-(section:.text)-at91_wakeup_status-(section:.init.text)
|   `-- WARNING:modpost:vmlinux:section-mismatch-in-reference:at91_shdwc_probe-(section:.text)-at91_wakeup_status-(section:.init.text)
|-- arm64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- hexagon-randconfig-002-20231212
|   `-- WARNING:modpost:missing-MODULE_DESCRIPTION()-in-fs-exportfs-exportfs.o
|-- i386-allmodconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-allyesconfig
|   |-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-011-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-014-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-015-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- i386-randconfig-016-20231212
|   `-- fs-ntfs3-ntfs.h:error:static-assertion-failed-due-to-requirement-sizeof(struct-ATTR_LIST_ENTRY):sizeof(struct-ATTR_LIST_ENTRY)
|-- powerpc-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allmodconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-leds-leds-max5970.c:warning:variable-num_leds-set-but-not-used
|-- x86_64-randconfig-121-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
|-- x86_64-randconfig-122-20231212
|   `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer
`-- x86_64-randconfig-123-20231212
    `-- lib-zstd-compress-zstd_fast.c:sparse:sparse:Using-plain-integer-as-NULL-pointer

elapsed time: 1455m

configs tested: 178
configs skipped: 2

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                        nsimosci_defconfig   gcc  
arc                   randconfig-001-20231212   gcc  
arc                   randconfig-002-20231212   gcc  
arm                              alldefconfig   clang
arm                              allmodconfig   gcc  
arm                               allnoconfig   gcc  
arm                              allyesconfig   gcc  
arm                                 defconfig   clang
arm                         lpc32xx_defconfig   clang
arm                   randconfig-001-20231212   gcc  
arm                   randconfig-002-20231212   gcc  
arm                   randconfig-003-20231212   gcc  
arm                   randconfig-004-20231212   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-001-20231212   gcc  
arm64                 randconfig-002-20231212   gcc  
arm64                 randconfig-003-20231212   gcc  
arm64                 randconfig-004-20231212   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20231212   gcc  
csky                  randconfig-002-20231212   gcc  
hexagon                          allmodconfig   clang
hexagon                           allnoconfig   clang
hexagon                          allyesconfig   clang
hexagon                             defconfig   clang
hexagon               randconfig-001-20231212   clang
hexagon               randconfig-002-20231212   clang
i386                             allmodconfig   clang
i386                              allnoconfig   clang
i386                             allyesconfig   clang
i386         buildonly-randconfig-001-20231212   gcc  
i386         buildonly-randconfig-002-20231212   gcc  
i386         buildonly-randconfig-003-20231212   gcc  
i386         buildonly-randconfig-004-20231212   gcc  
i386         buildonly-randconfig-005-20231212   gcc  
i386         buildonly-randconfig-006-20231212   gcc  
i386                                defconfig   gcc  
i386                  randconfig-001-20231212   gcc  
i386                  randconfig-002-20231212   gcc  
i386                  randconfig-003-20231212   gcc  
i386                  randconfig-004-20231212   gcc  
i386                  randconfig-005-20231212   gcc  
i386                  randconfig-006-20231212   gcc  
i386                  randconfig-011-20231212   clang
i386                  randconfig-012-20231212   clang
i386                  randconfig-013-20231212   clang
i386                  randconfig-014-20231212   clang
i386                  randconfig-015-20231212   clang
i386                  randconfig-016-20231212   clang
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20231212   gcc  
loongarch             randconfig-002-20231212   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
m68k                        m5407c3_defconfig   gcc  
m68k                          sun3x_defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   clang
mips                             allyesconfig   gcc  
mips                        bcm63xx_defconfig   clang
mips                         db1xxx_defconfig   gcc  
mips                     decstation_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20231212   gcc  
nios2                 randconfig-002-20231212   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20231212   gcc  
parisc                randconfig-002-20231212   gcc  
parisc64                            defconfig   gcc  
powerpc                     akebono_defconfig   clang
powerpc                          allmodconfig   clang
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                 mpc8315_rdb_defconfig   clang
powerpc                 mpc836x_rdk_defconfig   clang
powerpc                         ps3_defconfig   gcc  
powerpc               randconfig-001-20231212   gcc  
powerpc               randconfig-002-20231212   gcc  
powerpc               randconfig-003-20231212   gcc  
powerpc64             randconfig-001-20231212   gcc  
powerpc64             randconfig-002-20231212   gcc  
powerpc64             randconfig-003-20231212   gcc  
riscv                            allmodconfig   gcc  
riscv                             allnoconfig   clang
riscv                            allyesconfig   gcc  
riscv                               defconfig   gcc  
riscv                 randconfig-001-20231212   gcc  
riscv                 randconfig-002-20231212   gcc  
riscv                          rv32_defconfig   clang
s390                             allmodconfig   gcc  
s390                              allnoconfig   gcc  
s390                             allyesconfig   gcc  
s390                                defconfig   gcc  
s390                  randconfig-001-20231212   clang
s390                  randconfig-002-20231212   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                    randconfig-001-20231212   gcc  
sh                    randconfig-002-20231212   gcc  
sh                          rsk7269_defconfig   gcc  
sparc                            allmodconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20231212   gcc  
sparc64               randconfig-002-20231212   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   clang
um                                  defconfig   gcc  
um                             i386_defconfig   gcc  
um                    randconfig-001-20231212   gcc  
um                    randconfig-002-20231212   gcc  
um                           x86_64_defconfig   gcc  
x86_64                            allnoconfig   gcc  
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20231212   gcc  
x86_64       buildonly-randconfig-002-20231212   gcc  
x86_64       buildonly-randconfig-003-20231212   gcc  
x86_64       buildonly-randconfig-004-20231212   gcc  
x86_64       buildonly-randconfig-005-20231212   gcc  
x86_64       buildonly-randconfig-006-20231212   gcc  
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20231212   clang
x86_64                randconfig-002-20231212   clang
x86_64                randconfig-003-20231212   clang
x86_64                randconfig-004-20231212   clang
x86_64                randconfig-005-20231212   clang
x86_64                randconfig-006-20231212   clang
x86_64                randconfig-011-20231212   gcc  
x86_64                randconfig-012-20231212   gcc  
x86_64                randconfig-013-20231212   gcc  
x86_64                randconfig-014-20231212   gcc  
x86_64                randconfig-015-20231212   gcc  
x86_64                randconfig-016-20231212   gcc  
x86_64                randconfig-071-20231212   gcc  
x86_64                randconfig-072-20231212   gcc  
x86_64                randconfig-073-20231212   gcc  
x86_64                randconfig-074-20231212   gcc  
x86_64                randconfig-075-20231212   gcc  
x86_64                randconfig-076-20231212   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                  cadence_csp_defconfig   gcc  
xtensa                          iss_defconfig   gcc  
xtensa                randconfig-001-20231212   gcc  
xtensa                randconfig-002-20231212   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
