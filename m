Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 244038B8F9D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 May 2024 20:36:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72D33E0F;
	Wed,  1 May 2024 20:35:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72D33E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714588565;
	bh=fCDzTzZbjGb6uqT6kSzbkYEbmAneq8Yq+jzepX8va1k=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Q5aKApAnacy98LMUjH0KD/VLBqS0/6eWwQVeR1sRAltyI3jYq07421t9NbivIv4ks
	 TJTrwtF5+nOoOCUs2aeyFGo0JEkkZ6bTspABK2DZTBceTI6cXjQRRzTuzdZb8hfTtZ
	 OhszVoLCdhyB/FIk6uffCCfGqQtGkelP6bkjDsuU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 55287F805AD; Wed,  1 May 2024 20:35:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 186BDF805A0;
	Wed,  1 May 2024 20:35:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A3FF80266; Wed,  1 May 2024 20:35:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E48EFF8023A
	for <alsa-devel@alsa-project.org>; Wed,  1 May 2024 20:35:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E48EFF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lDmL7wBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714588514; x=1746124514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fCDzTzZbjGb6uqT6kSzbkYEbmAneq8Yq+jzepX8va1k=;
  b=lDmL7wBBtla3ZUfyx8uVhP9dLeZt8GJwZ3uXstSyMRBWgfzLyT4txhXg
   /T5w6pF1dUhkENShI41tvywrnRXAoh6X0SciXS2vntCCPNPxEjbs77HC4
   nUR6vi09fQnuyAhhkeBgcG6+w2xHpBR/jg4OqOOUuVRGZJSMrUZzhP57l
   1ggWSWR/N4FST7EoUmmBAs6Dj8I3+L9Rd5g40i+udaj1BXZ0o5avwJlsg
   jRRtZmj3pO6FhTSDwYY9tLylhw7QTTgp8ZEETQR+5V3pP4xIGYjsmeT1w
   zE+M0HfaH9TG/kwKXPQXxSrA68frEvFMP0p7PIAOVna1AV7nd4/4QdHGe
   A==;
X-CSE-ConnectionGUID: TJq81GY2Scy7btBAHkNALw==
X-CSE-MsgGUID: /b6Xur8GQ62U0gSp0YelLw==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="35720566"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000";
   d="scan'208";a="35720566"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 11:35:02 -0700
X-CSE-ConnectionGUID: d+R5C+YhSvKYPrEH+M9+ig==
X-CSE-MsgGUID: kZzV5MX4TyKLpBwDNOu+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000";
   d="scan'208";a="27361187"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 01 May 2024 11:35:00 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2EnC-0009tG-0C;
	Wed, 01 May 2024 18:34:58 +0000
Date: Thu, 2 May 2024 02:34:55 +0800
From: kernel test robot <lkp@intel.com>
To: Kailang Yang <kailang@realtek.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [tiwai-sound:for-linus 1/4] sound/pci/hda/patch_realtek.c:7222:8:
 error: no member named 'power_hook' in 'struct alc_spec'
Message-ID: <202405020226.ddBTVUNI-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: B2MDU3RBQNWIT7U6WOFWUMP4PHKNFFQV
X-Message-ID-Hash: B2MDU3RBQNWIT7U6WOFWUMP4PHKNFFQV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B2MDU3RBQNWIT7U6WOFWUMP4PHKNFFQV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-linus
head:   9b3c22ab3929672b117f5c46d718692abb65da0b
commit: 1e707769df072757bdcafab158bb159ead73daa4 [1/4] ALSA: hda/realtek - Set GPIO3 to default at S4 state for Thinkpad with ALC1318
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20240502/202405020226.ddBTVUNI-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240502/202405020226.ddBTVUNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405020226.ddBTVUNI-lkp@intel.com/

Note: the tiwai-sound/for-linus HEAD 9b3c22ab3929672b117f5c46d718692abb65da0b builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:38:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from sound/pci/hda/patch_realtek.c:17:
   In file included from include/linux/pci.h:2693:
   In file included from include/linux/dma-mapping.h:11:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> sound/pci/hda/patch_realtek.c:7222:8: error: no member named 'power_hook' in 'struct alc_spec'
    7222 |         spec->power_hook = alc287_s4_power_gpio3_default;
         |         ~~~~  ^
   7 warnings and 1 error generated.


vim +7222 sound/pci/hda/patch_realtek.c

  7214	
  7215	static void alc287_fixup_lenovo_thinkpad_with_alc1318(struct hda_codec *codec,
  7216				       const struct hda_fixup *fix, int action)
  7217	{
  7218		struct alc_spec *spec = codec->spec;
  7219	
  7220		if (action != HDA_FIXUP_ACT_PRE_PROBE)
  7221			return;
> 7222		spec->power_hook = alc287_s4_power_gpio3_default;
  7223		spec->gen.pcm_playback_hook = alc287_alc1318_playback_pcm_hook;
  7224	}
  7225	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
