Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5B8B51EBC
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Sep 2025 19:18:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9554F601F8;
	Wed, 10 Sep 2025 19:18:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9554F601F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1757524733;
	bh=u+RA/EJQOgmXkB2Ji+LO9jhZfBEoM6aFDPAWhKf5btE=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rsY34IS1yv24h87Ypi4fUFb7EuPBwcV8VDBFLXi8rNuh9jlzvnDsvdEKsYgl8xMul
	 NxPAv4EGu697Tn5KPMEEAb4eu2cHRc1r8U9HSVVzWq22vSTR/WdBCiNVSNKuKW2h5I
	 LInbbI1PtGGNgQLhejxRzHmly7Zr2E5Xz34mH7ro=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FFCBF80587; Wed, 10 Sep 2025 19:18:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 96919F80587;
	Wed, 10 Sep 2025 19:18:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2450EF8057D; Wed, 10 Sep 2025 19:17:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 72D42F80134
	for <alsa-devel@alsa-project.org>; Wed, 10 Sep 2025 19:17:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 72D42F80134
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TU9jjRVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757524666; x=1789060666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u+RA/EJQOgmXkB2Ji+LO9jhZfBEoM6aFDPAWhKf5btE=;
  b=TU9jjRVsHXgpedk/ELUJdCMmEjfXu1m5j8XLe+n2DYADAV7jZWturAts
   UIldtxgXmh4G5Wy1CsdrGwC8oqNIqjWcsG3aA92E7+InjI1O5HBXxyOiU
   DBESrNL7f6ccF0QwvPqa9sH0BG9kCChC0iANmUAP1LSr9rysdE92Crxh1
   ZFtOIEYLJKVTZU+Xb98b6qG0BF8mEdII1NpHa5xqveBCuTTImghkJUWWW
   VYxubDCZwI91HLw8D2dgowcSVafj2PX65YInn3dk4ILceWEClEmtrwMTz
   blD4dWrXeVeeBI/bKHzadplrDjPxEBVHzXW+VuFXPlzk5Uq0R2fhCJbpD
   A==;
X-CSE-ConnectionGUID: +YTr2VuVTlCq0rXWSGWWPQ==
X-CSE-MsgGUID: Q0tdlSbETBOucVRtPH0nJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59537616"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800";
   d="scan'208";a="59537616"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 10:17:43 -0700
X-CSE-ConnectionGUID: YPJmEbG4Q7mePQRvINVbRQ==
X-CSE-MsgGUID: 2z7sanUST6SKUwI0LRmDXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800";
   d="scan'208";a="178649057"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Sep 2025 10:17:41 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwORu-0006A9-2n;
	Wed, 10 Sep 2025 17:17:38 +0000
Date: Thu, 11 Sep 2025 01:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/auto-cleanup 208/210]
 sound/sparc/amd7930.c:357:45: error: 'flags' undeclared
Message-ID: <202509110130.PlGyYo4k-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: QQZRPWJNYD5Y2CFC4AAOQ4LOGLLOESYQ
X-Message-ID-Hash: QQZRPWJNYD5Y2CFC4AAOQ4LOGLLOESYQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QQZRPWJNYD5Y2CFC4AAOQ4LOGLLOESYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/auto-cleanup
head:   f29244cff0185975fee4f55293cca61cfd83af3e
commit: db8ed7441c876cac679db2869b87b26633c89bde [208/210] ALSA: sparc/amd7930: Use guard() for spin locks
config: sparc64-randconfig-002-20250910 (https://download.01.org/0day-ci/archive/20250911/202509110130.PlGyYo4k-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250911/202509110130.PlGyYo4k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509110130.PlGyYo4k-lkp@intel.com/

All errors (new ones prefixed by >>):

   sound/sparc/amd7930.c: In function 'amd7930_enable_ints':
>> sound/sparc/amd7930.c:357:45: error: 'flags' undeclared (first use in this function)
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
   sound/sparc/amd7930.c:357:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/module.h:17,
                    from sound/sparc/amd7930.c:33:
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   sound/sparc/amd7930.c:357:9: note: in expansion of macro 'guard'
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   sound/sparc/amd7930.c: In function 'amd7930_disable_ints':
   sound/sparc/amd7930.c:365:45: error: 'flags' undeclared (first use in this function)
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   sound/sparc/amd7930.c:365:9: note: in expansion of macro 'guard'
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
--
   amd7930.c: In function 'amd7930_enable_ints':
   amd7930.c:357:45: error: 'flags' undeclared (first use in this function)
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
   amd7930.c:357:45: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/module.h:17,
                    from amd7930.c:33:
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   amd7930.c:357:9: note: in expansion of macro 'guard'
     357 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~
   amd7930.c: In function 'amd7930_disable_ints':
   amd7930.c:365:45: error: 'flags' undeclared (first use in this function)
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |                                             ^~~~~
>> include/linux/cleanup.h:291:17: error: too many arguments to function 'class_spinlock_irqsave_constructor'
     291 |                 class_##_name##_constructor
         |                 ^~~~~~
   include/linux/cleanup.h:401:9: note: in expansion of macro 'CLASS'
     401 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^~~~~
   amd7930.c:365:9: note: in expansion of macro 'guard'
     365 |         guard(spinlock_irqsave)(&amd->lock, flags);
         |         ^~~~~
   include/linux/cleanup.h:477:33: note: declared here
     477 | static inline class_##_name##_t class_##_name##_constructor(_type *l)   \
         |                                 ^~~~~~
   include/linux/cleanup.h:496:1: note: in expansion of macro '__DEFINE_LOCK_GUARD_1'
     496 | __DEFINE_LOCK_GUARD_1(_name, _type, _lock)
         | ^~~~~~~~~~~~~~~~~~~~~
   include/linux/spinlock.h:585:1: note: in expansion of macro 'DEFINE_LOCK_GUARD_1'
     585 | DEFINE_LOCK_GUARD_1(spinlock_irqsave, spinlock_t,
         | ^~~~~~~~~~~~~~~~~~~


vim +/flags +357 sound/sparc/amd7930.c

   353	
   354	/* Enable chip interrupts.  The amd->lock is not held.  */
   355	static __inline__ void amd7930_enable_ints(struct snd_amd7930 *amd)
   356	{
 > 357		guard(spinlock_irqsave)(&amd->lock, flags);
   358		sbus_writeb(AMR_INIT, amd->regs + AMD7930_CR);
   359		sbus_writeb(AM_INIT_ACTIVE, amd->regs + AMD7930_DR);
   360	}
   361	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
