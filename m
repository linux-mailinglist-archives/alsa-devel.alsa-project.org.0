Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 441928BCEE2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 May 2024 15:23:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92CC4208;
	Mon,  6 May 2024 15:23:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92CC4208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715001799;
	bh=HyLdIy5f9/EBvRuI0GTtSPfaqq7n1U6/buN3znQZ3Io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=npvpDST2bZiZ7yxuJhR84OMSQvoGxRhQKYkzviAJmzAnhKDOMMNG6a+SiOlYkugw8
	 U9BFL+eooOESO//yS/vUp/6YSw8+FdUjU3iYq/NOCcxImVOg1rSVlbHamfLWKmBeKa
	 lIEzDAwKcnsU60N0/eqtrixHUlBp7PF98qHpD/7g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93B3FF8058C; Mon,  6 May 2024 15:13:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3329FF8057D;
	Mon,  6 May 2024 15:13:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 081F3F8049C; Mon,  6 May 2024 15:13:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CDCBFF80152
	for <alsa-devel@alsa-project.org>; Mon,  6 May 2024 15:13:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDCBFF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=khitfA0L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715001217; x=1746537217;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HyLdIy5f9/EBvRuI0GTtSPfaqq7n1U6/buN3znQZ3Io=;
  b=khitfA0LLgsei5WSlNK7I13HqOCvu9iea2xORr0P8L7tw+8KaHJwWtxM
   NhQmoFrBBCrKexDi/VHKUg5KPDIQTJ8W+M8Sbsy2JDoK94NtVzK6/W7/c
   de75PZHsf10Pxxtuw7VH9taw4LMkF9LEJSgFevcP9WAN/yWvQ5OS1heEc
   xbDzDCExi2kNKBkZjddjHpve9cvCh+pKVttNQxJY0SORxOcEI2Ds4de57
   lvkSTrz7Tzq2SPgF4f6v36v0lnfKa8awMrmmzTVZqg2FIT+NtVzs4mGzk
   vQre1SGt+dwGCIFZqBAUIhJo4pSyCrS58lbL+0PJ2Lh1s1OdyRXaU3GyZ
   g==;
X-CSE-ConnectionGUID: PhxHn9xsSV+uQ9acpeKd2Q==
X-CSE-MsgGUID: BIjgvHHaSdS2J384LMJVFA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="21296159"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000";
   d="scan'208";a="21296159"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 06:13:32 -0700
X-CSE-ConnectionGUID: YpuMv00uSNmVbCEvdrZxkg==
X-CSE-MsgGUID: DVFmBwS7RByM34XvkpThXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000";
   d="scan'208";a="28256666"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 06 May 2024 06:13:26 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s3y9k-0000gh-07;
	Mon, 06 May 2024 13:13:24 +0000
Date: Mon, 6 May 2024 21:12:45 +0800
From: kernel test robot <lkp@intel.com>
To: Baojun Xu <baojun.xu@ti.com>, tiwai@suse.de
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, robh+dt@kernel.org,
	andriy.shevchenko@linux.intel.com, lgirdwood@gmail.com,
	perex@perex.cz, pierre-louis.bossart@linux.intel.com,
	kevin-lu@ti.com, shenghao-ding@ti.com, navada@ti.com,
	13916275206@139.com, v-po@ti.com, niranjan.hy@ti.com,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	liam.r.girdwood@intel.com, yung-chuan.liao@linux.intel.com,
	baojun.xu@ti.com, broonie@kernel.org, soyer@irl.hu
Subject: Re: [PATCH v4 2/3] ALSA: hda/tas2781: Tas2781 hda driver for SPI
Message-ID: <202405062037.6HgeMiih-lkp@intel.com>
References: <20240430072544.1877-3-baojun.xu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430072544.1877-3-baojun.xu@ti.com>
Message-ID-Hash: AGTTGQ4WPPZWFIGNN62JBUOXTDL2F43P
X-Message-ID-Hash: AGTTGQ4WPPZWFIGNN62JBUOXTDL2F43P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AGTTGQ4WPPZWFIGNN62JBUOXTDL2F43P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Baojun,

kernel test robot noticed the following build errors:

[auto build test ERROR on tiwai-sound/for-linus]
[also build test ERROR on rafael-pm/linux-next rafael-pm/bleeding-edge linus/master v6.9-rc7 next-20240506]
[cannot apply to tiwai-sound/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baojun-Xu/ALSA-hda-tas2781-Add-tas2781-hda-driver-based-on-SPI/20240430-153305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
patch link:    https://lore.kernel.org/r/20240430072544.1877-3-baojun.xu%40ti.com
patch subject: [PATCH v4 2/3] ALSA: hda/tas2781: Tas2781 hda driver for SPI
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20240506/202405062037.6HgeMiih-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240506/202405062037.6HgeMiih-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405062037.6HgeMiih-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/tas2781_hda_spi.c:15:
   In file included from include/linux/efi.h:20:
   In file included from include/linux/rtc.h:17:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   sound/pci/hda/tas2781_hda_spi.c:466:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     466 |                 guard(mutex)(&tas_hda->priv->codec_lock);
         |                 ^
   include/linux/cleanup.h:164:2: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:119:2: note: expanded from macro 'CLASS'
     119 |         class_##_name##_t var __cleanup(class_##_name##_destructor) =   \
         |         ^
   <scratch space>:107:1: note: expanded from here
     107 | class_mutex_t
         | ^
>> sound/pci/hda/tas2781_hda_spi.c:471:2: error: cannot jump from switch statement to this case label
     471 |         default:
         |         ^
   sound/pci/hda/tas2781_hda_spi.c:466:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     466 |                 guard(mutex)(&tas_hda->priv->codec_lock);
         |                 ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:105:1: note: expanded from here
     105 | __UNIQUE_ID_guard511
         | ^
   sound/pci/hda/tas2781_hda_spi.c:462:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     462 |                 guard(mutex)(&tas_hda->priv->codec_lock);
         |                 ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:96:1: note: expanded from here
      96 | __UNIQUE_ID_guard510
         | ^
   sound/pci/hda/tas2781_hda_spi.c:465:2: error: cannot jump from switch statement to this case label
     465 |         case HDA_GEN_PCM_ACT_CLOSE:
         |         ^
   sound/pci/hda/tas2781_hda_spi.c:462:3: note: jump bypasses initialization of variable with __attribute__((cleanup))
     462 |                 guard(mutex)(&tas_hda->priv->codec_lock);
         |                 ^
   include/linux/cleanup.h:164:15: note: expanded from macro 'guard'
     164 |         CLASS(_name, __UNIQUE_ID(guard))
         |                      ^
   include/linux/compiler.h:189:29: note: expanded from macro '__UNIQUE_ID'
     189 | #define __UNIQUE_ID(prefix) __PASTE(__PASTE(__UNIQUE_ID_, prefix), __COUNTER__)
         |                             ^
   include/linux/compiler_types.h:84:22: note: expanded from macro '__PASTE'
      84 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^
   include/linux/compiler_types.h:83:23: note: expanded from macro '___PASTE'
      83 | #define ___PASTE(a,b) a##b
         |                       ^
   <scratch space>:96:1: note: expanded from here
      96 | __UNIQUE_ID_guard510
         | ^
   6 warnings and 2 errors generated.


vim +471 sound/pci/hda/tas2781_hda_spi.c

   454	
   455	static void tas2781_hda_playback_hook(struct device *dev, int action)
   456	{
   457		struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
   458	
   459		switch (action) {
   460		case HDA_GEN_PCM_ACT_OPEN:
   461			pm_runtime_get_sync(dev);
   462			guard(mutex)(&tas_hda->priv->codec_lock);
   463			tasdevice_spi_tuning_switch(tas_hda->priv, 0);
   464			break;
   465		case HDA_GEN_PCM_ACT_CLOSE:
   466			guard(mutex)(&tas_hda->priv->codec_lock);
   467			tasdevice_spi_tuning_switch(tas_hda->priv, 1);
   468			pm_runtime_mark_last_busy(dev);
   469			pm_runtime_put_autosuspend(dev);
   470			break;
 > 471		default:
   472			dev_dbg(tas_hda->priv->dev,
   473				"Playback action not supported: %d\n", action);
   474			break;
   475		}
   476	}
   477	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
