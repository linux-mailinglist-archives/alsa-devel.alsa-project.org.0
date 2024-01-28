Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 881E283F2C5
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jan 2024 02:43:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6E2783B;
	Sun, 28 Jan 2024 02:42:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6E2783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706406181;
	bh=08dPiRtzzLSCCatnrYfrnj2orslCPsY7FuVdcd3xhhU=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AghVYJ254SPlGmq0jGHBcQsnyw9n6WtRajfOcLtD7rkOBNW20GDDSdvxQsUEocxEi
	 mCPuRV2+tWsba08EcDSHypfdbA61pG2TluIfjkpRf1W+1I89ImJokrEYEWjCp6F27u
	 6quTwDnhHVng2Qx1aZfHkCR4Qhg3SP5bVykkDZaI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E419F8057D; Sun, 28 Jan 2024 02:42:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B3DFDF80579;
	Sun, 28 Jan 2024 02:42:29 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 481C2F80310; Sun, 28 Jan 2024 02:40:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ED65BF8017A
	for <alsa-devel@alsa-project.org>; Sun, 28 Jan 2024 02:40:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ED65BF8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=meWi1OpU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706406017; x=1737942017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=08dPiRtzzLSCCatnrYfrnj2orslCPsY7FuVdcd3xhhU=;
  b=meWi1OpUrNnrd0FHWvt7bw5aEozJRSRPY1kvugqT6/2VWWNzZC6m5FmY
   jBvR+EsKtFUSf1z3Fl0J2FJkVvn3WEdRkG3qKN2YJeP4mBpy+v/GbmwVM
   6edj2kM6Gk/a1BJRW+2lwajVQjJkdrYQUgOUt6cITlLZiK8knG/9QSJlr
   2eMCSmHgCJ9SxJdZy+ec5cUTEuBaTqQG8KsLOt0RsTjOiDpDtzWtalK1K
   C5uS95mcXtn013SpMDorMmUoysWV/bWT6t4Nl5ozxgDNCr2F7713+GL+s
   OpbKTFtOcfv7RxIGGZ8It6JZGCrTZEIVPqCVkXzXS4J+CPFgy4hq8b9Qb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="2621271"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="2621271"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2024 17:40:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400";
   d="scan'208";a="35794850"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 27 Jan 2024 17:40:11 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTu9X-0002xi-2K;
	Sun, 28 Jan 2024 01:40:07 +0000
Date: Sun, 28 Jan 2024 09:39:53 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:topic/pm-ops 5/29] sound/isa/cmi8330.c:55:12: warning:
 'index' defined but not used
Message-ID: <202401280946.VcZLwAbo-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: JUO36Q5FOFPXMUA3PY3Z66CRF4SWFR2L
X-Message-ID-Hash: JUO36Q5FOFPXMUA3PY3Z66CRF4SWFR2L
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JUO36Q5FOFPXMUA3PY3Z66CRF4SWFR2L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Takashi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git topic/pm-ops
head:   2fe6ffd7c79f740b73533d44de3ae0e542674857
commit: 9757c2b93cfed03065a14a6cd817474891eb55fe [5/29] ALSA: als4000: Replace with DEFINE_SIMPLE_DEV_PM_OPS()
config: powerpc-randconfig-002-20240127 (https://download.01.org/0day-ci/archive/20240128/202401280946.VcZLwAbo-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280946.VcZLwAbo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280946.VcZLwAbo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/isa/cmi8330.c:41:
   include/sound/sb.h:294:20: error: two or more data types in declaration specifiers
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^~~~
   include/sound/sb.h:295:20: error: two or more data types in declaration specifiers
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^~~~
   In file included from include/linux/init.h:5,
                    from sound/isa/cmi8330.c:32:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/cmi8330.c:72:1: note: in expansion of macro 'module_param_array'
      72 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/cmi8330.c:55:12: warning: 'index' defined but not used [-Wunused-variable]
      55 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from sound/pci/cs5530.c:35:
   include/sound/sb.h:294:20: error: two or more data types in declaration specifiers
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^~~~
   include/sound/sb.h:295:20: error: two or more data types in declaration specifiers
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/bitops.h:6,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/powerpc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/delay.h:22,
                    from sound/pci/cs5530.c:30:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/cs5530.c:46:1: note: in expansion of macro 'module_param_array'
      46 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/pci/cs5530.c:42:12: warning: 'index' defined but not used [-Wunused-variable]
      42 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
         |            ^~~~~
--
   In file included from sound/isa/sb/sb16.c:14,
                    from sound/isa/sb/sbawe.c:2:
   include/sound/sb.h:294:20: error: two or more data types in declaration specifiers
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^~~~
   include/sound/sb.h:295:20: error: two or more data types in declaration specifiers
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^~~~
   In file included from include/linux/bits.h:21,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from arch/powerpc/include/asm/io.h:22,
                    from arch/powerpc/include/asm/dma.h:22,
                    from sound/isa/sb/sb16.c:7:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/sb/sb16.c:69:1: note: in expansion of macro 'module_param_array'
      69 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/sb/sb16.c:46:12: warning: 'index' defined but not used [-Wunused-variable]
      46 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~
--
   In file included from sound/isa/sb/jazz16.c:23:
   include/sound/sb.h:294:20: error: two or more data types in declaration specifiers
     294 | static inline void void snd_sbmixer_suspend(struct snd_sb *chip) {}
         |                    ^~~~
   include/sound/sb.h:295:20: error: two or more data types in declaration specifiers
     295 | static inline void void snd_sbmixer_resume(struct snd_sb *chip) {}
         |                    ^~~~
   In file included from include/linux/init.h:5,
                    from sound/isa/sb/jazz16.c:14:
   include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:228:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     228 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   include/linux/moduleparam.h:521:20: note: in expansion of macro 'ARRAY_SIZE'
     521 |         = { .max = ARRAY_SIZE(array), .num = nump,                      \
         |                    ^~~~~~~~~~
   include/linux/moduleparam.h:505:9: note: in expansion of macro 'module_param_array_named'
     505 |         module_param_array_named(name, name, type, nump, perm)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   sound/isa/sb/jazz16.c:44:1: note: in expansion of macro 'module_param_array'
      44 | module_param_array(index, int, NULL, 0444);
         | ^~~~~~~~~~~~~~~~~~
>> sound/isa/sb/jazz16.c:34:12: warning: 'index' defined but not used [-Wunused-variable]
      34 | static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;      /* Index 0-MAX */
         |            ^~~~~


vim +/index +55 sound/isa/cmi8330.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  54  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @55  static int index[SNDRV_CARDS] = SNDRV_DEFAULT_IDX;
^1da177e4c3f41 Linus Torvalds 2005-04-16  56  static char *id[SNDRV_CARDS] = SNDRV_DEFAULT_STR;
a67ff6a54095e2 Rusty Russell  2011-12-15  57  static bool enable[SNDRV_CARDS] = SNDRV_DEFAULT_ENABLE_ISAPNP;
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  #ifdef CONFIG_PNP
a67ff6a54095e2 Rusty Russell  2011-12-15  59  static bool isapnp[SNDRV_CARDS] = {[0 ... (SNDRV_CARDS - 1)] = 1};
^1da177e4c3f41 Linus Torvalds 2005-04-16  60  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  static long sbport[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  62  static int sbirq[SNDRV_CARDS] = SNDRV_DEFAULT_IRQ;
^1da177e4c3f41 Linus Torvalds 2005-04-16  63  static int sbdma8[SNDRV_CARDS] = SNDRV_DEFAULT_DMA;
^1da177e4c3f41 Linus Torvalds 2005-04-16  64  static int sbdma16[SNDRV_CARDS] = SNDRV_DEFAULT_DMA;
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  static long wssport[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  static int wssirq[SNDRV_CARDS] = SNDRV_DEFAULT_IRQ;
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  static int wssdma[SNDRV_CARDS] = SNDRV_DEFAULT_DMA;
48972cc5101dee Krzysztof Helt 2009-01-21  68  static long fmport[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;
c97dff84e0d9a4 Krzysztof Helt 2009-01-29  69  static long mpuport[SNDRV_CARDS] = SNDRV_DEFAULT_PORT;
c97dff84e0d9a4 Krzysztof Helt 2009-01-29  70  static int mpuirq[SNDRV_CARDS] = SNDRV_DEFAULT_IRQ;
^1da177e4c3f41 Linus Torvalds 2005-04-16  71  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @72  module_param_array(index, int, NULL, 0444);
69eb88825a7a56 Ondrej Zary    2009-07-04  73  MODULE_PARM_DESC(index, "Index value for CMI8330/CMI8329 soundcard.");
^1da177e4c3f41 Linus Torvalds 2005-04-16  74  module_param_array(id, charp, NULL, 0444);
69eb88825a7a56 Ondrej Zary    2009-07-04  75  MODULE_PARM_DESC(id, "ID string  for CMI8330/CMI8329 soundcard.");
^1da177e4c3f41 Linus Torvalds 2005-04-16  76  module_param_array(enable, bool, NULL, 0444);
69eb88825a7a56 Ondrej Zary    2009-07-04  77  MODULE_PARM_DESC(enable, "Enable CMI8330/CMI8329 soundcard.");
^1da177e4c3f41 Linus Torvalds 2005-04-16  78  #ifdef CONFIG_PNP
^1da177e4c3f41 Linus Torvalds 2005-04-16  79  module_param_array(isapnp, bool, NULL, 0444);
^1da177e4c3f41 Linus Torvalds 2005-04-16  80  MODULE_PARM_DESC(isapnp, "PnP detection for specified soundcard.");
^1da177e4c3f41 Linus Torvalds 2005-04-16  81  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  82  

:::::: The code at line 55 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
