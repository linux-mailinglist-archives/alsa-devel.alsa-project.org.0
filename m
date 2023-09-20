Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A89E7A8FEA
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Sep 2023 01:41:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C3F20C;
	Thu, 21 Sep 2023 01:40:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C3F20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695253266;
	bh=UTR46IBrTkbQ0Ugvt+v5ysaDfs4jKCRtGqauY0gMI14=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=jCXS/VTtXuk59cPoHrpjmwrCwmVobcUrLgb4uqNqZzZZ5Haii25ACHerIpf5MBCXt
	 tSJt+vIWcXJmsqAREtIMJSv4buCHwDFL73s2kT5Y20rwDfeJh9HNEUXie6XM+VqmBH
	 cp/YKLLIn3JzrX8YtblfgVJCsRYTMxo8DfbXmios=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4E0F5F800AA; Thu, 21 Sep 2023 01:40:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFF03F801F5;
	Thu, 21 Sep 2023 01:40:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 92E3AF8025A; Thu, 21 Sep 2023 01:40:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 76CC4F80125
	for <alsa-devel@alsa-project.org>; Thu, 21 Sep 2023 01:39:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76CC4F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oDcF+PW7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695253201; x=1726789201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UTR46IBrTkbQ0Ugvt+v5ysaDfs4jKCRtGqauY0gMI14=;
  b=oDcF+PW7CPBziVdnvDbDBXmrKEaz3TleMlMvB6bfKOngyPt7yehOhyJQ
   I+TMm3loAcjH+GMWG+O8H71B/5nw4a6r+Dc6u5B0u8oGKgqe1hgSKJkiW
   U1dvYqrMolZbwf7E1CCgqUskG3cTDMdgJAr6CUibZAM/Ng/vvNvtc0Tox
   S684PLGyDPLlIugBWwDw+KVi+QcbryuaER9uH2YBqxJiNh3K8q287T1l3
   mbQTbAhF/Pz9+ymsefVFYpeiA9wmXJoVNBZhdTHlPUWz6+3vI+17eHkjl
   RxyT6cdIv5KDlrrEITCHH0eHVgtK53o+lRyOdBpcFgtrOW4CYbUwTbN67
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384209302"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200";
   d="scan'208";a="384209302"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 16:35:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="750146566"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200";
   d="scan'208";a="750146566"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 16:35:27 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qj6j7-0009GU-04;
	Wed, 20 Sep 2023 23:35:25 +0000
Date: Thu, 21 Sep 2023 07:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-next 36/38]
 sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not
 a compile-time constant
Message-ID: <202309210751.TXlnuEMF-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: CRVPYKIK4HDOVSFOWEBE6CTBKWPUTO4T
X-Message-ID-Hash: CRVPYKIK4HDOVSFOWEBE6CTBKWPUTO4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CRVPYKIK4HDOVSFOWEBE6CTBKWPUTO4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   72f6a13022f3bf16df305b75c32f95ece263a5ce
commit: 2144833e7b41459fa2d52bb0676f0ab4920cf32c [36/38] ALSA: hda: cirrus_scodec: Add KUnit test
config: hexagon-randconfig-r041-20211219 (https://download.01.org/0day-ci/archive/20230921/202309210751.TXlnuEMF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230921/202309210751.TXlnuEMF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309210751.TXlnuEMF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/cirrus_scodec_test.c:9:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from sound/pci/hda/cirrus_scodec_test.c:9:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/pci/hda/cirrus_scodec_test.c:9:
   In file included from include/linux/gpio/driver.h:6:
   In file included from include/linux/irqchip/chained_irq.h:10:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:337:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> sound/pci/hda/cirrus_scodec_test.c:151:60: error: initializer element is not a compile-time constant
                   SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
                                                                            ^~~~~~~~
   include/linux/property.h:291:37: note: expanded from macro 'SOFTWARE_NODE_REFERENCE'
           .nargs = ARRAY_SIZE(((u64[]){ 0, ##__VA_ARGS__ })) - 1, \
                                              ^~~~~~~~~~~
   include/linux/kernel.h:57:75: note: expanded from macro 'ARRAY_SIZE'
   #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
                                                                             ^~~
   include/linux/compiler.h:231:59: note: expanded from macro '__must_be_array'
   #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
                                                                  ^
   include/linux/compiler_types.h:366:63: note: expanded from macro '__same_type'
   #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
                                                                 ^
   include/linux/build_bug.h:16:62: note: expanded from macro 'BUILD_BUG_ON_ZERO'
   #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
                                                                ^
   6 warnings and 1 error generated.


vim +151 sound/pci/hda/cirrus_scodec_test.c

   146	
   147	static void cirrus_scodec_test_set_gpio_ref_arg(struct software_node_ref_args *arg,
   148							int gpio_num)
   149	{
   150		struct software_node_ref_args template =
 > 151			SOFTWARE_NODE_REFERENCE(&cirrus_scodec_test_gpio_swnode, gpio_num, 0);
   152	
   153		*arg = template;
   154	}
   155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
