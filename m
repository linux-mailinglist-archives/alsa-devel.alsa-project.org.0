Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7CC7478B7
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Jul 2023 21:34:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F7187F4;
	Tue,  4 Jul 2023 21:33:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F7187F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688499264;
	bh=oNIEdHaEiR8OxME2pFIicwMil9EV3QsKKDNNQ7UDEoo=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rkAH2I4GedDNWg9+tn+Ka0U5v/f/zDGFPoY6y2PkUj2TXGybVB4J76fIZLO75Fimi
	 3/zk0H0nicDqLJnPbT25EFYTsSRlxFWro7fTNQieczjuaPqMToPxPBAHCxbHRChp0E
	 3gapNm7e6uEjwGslP7Azug8ooOwCW2VtBzDfT760=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2AF80F8025F; Tue,  4 Jul 2023 21:33:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6CC9AF80124;
	Tue,  4 Jul 2023 21:33:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5BD26F80125; Tue,  4 Jul 2023 21:33:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E1A00F80104
	for <alsa-devel@alsa-project.org>; Tue,  4 Jul 2023 21:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E1A00F80104
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ZHU7xqnb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688499193; x=1720035193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oNIEdHaEiR8OxME2pFIicwMil9EV3QsKKDNNQ7UDEoo=;
  b=ZHU7xqnbZC/TmPYeAaWB3RVpMnmx6LogswdOlgtrLpKIQ3Y0Rqya1zgH
   CwCmnVe4WMZXtdovnaNFqL0eh4uV4xngm/BPjpsDaR/h6aRxIdaS01D35
   wTDz9E9N7NmG2lB8EZGMJ7/eiaWw+av0VyvhHFThK4P0dl+H2XvFCrGdg
   jjjwJua8eCsubwAKEZDS1XSJOrs6J0aBqStu3IcW8qa+b+IJ5jNW3AGVN
   F+Wjnb8w7zhU+XvlylvN3jhLblTMiNy9wPUC1p+qz6F6aMmz+l2u1cVJa
   92LmtkbzawuJxQyeG+rb1VqJwqExA8UbWH4sFVt6kP7CldOTmgkU7b7u2
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429221404"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200";
   d="scan'208";a="429221404"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2023 12:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="788939366"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200";
   d="scan'208";a="788939366"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 12:33:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGllp-000IUJ-0B;
	Tue, 04 Jul 2023 19:33:05 +0000
Date: Wed, 5 Jul 2023 03:32:52 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	alsa-devel@alsa-project.org
Subject: [tiwai-sound:test/snd_ctl_remove-lock-fix 33/38]
 sound/soc/codecs/sigmadsp.c:676:45: error: no member named 'kctl' in 'struct
 sigmadsp_control'
Message-ID: <202307050346.R8ow8O6J-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: IBI242RVVWZWRAVDRQG652GNKRYA2Z37
X-Message-ID-Hash: IBI242RVVWZWRAVDRQG652GNKRYA2Z37
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IBI242RVVWZWRAVDRQG652GNKRYA2Z37/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git test/snd_ctl_remove-lock-fix
head:   6dd4ae925ae5b90ccfbcb11dce06fd505cc18bc8
commit: f6df559bc59a922fc6bd100cd018207323c3f9d1 [33/38] ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
config: hexagon-randconfig-r045-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050346.R8ow8O6J-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050346.R8ow8O6J-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050346.R8ow8O6J-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from sound/soc/codecs/sigmadsp.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from sound/soc/codecs/sigmadsp.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from sound/soc/codecs/sigmadsp.c:11:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:13:
   In file included from arch/hexagon/include/asm/io.h:334:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
>> sound/soc/codecs/sigmadsp.c:676:45: error: no member named 'kctl' in 'struct sigmadsp_control'
     676 |         changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
         |                                              ~~~~  ^
   6 warnings and 1 error generated.


vim +676 sound/soc/codecs/sigmadsp.c

   667	
   668	static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
   669		struct sigmadsp_control *ctrl, unsigned int samplerate_mask)
   670	{
   671		struct snd_card *card = sigmadsp->component->card->snd_card;
   672		bool active;
   673		int changed;
   674	
   675		active = sigmadsp_samplerate_valid(ctrl->samplerates, samplerate_mask);
 > 676		changed = snd_ctl_activate_id(card, &ctrl->kctl->id, active);
   677		if (active && changed > 0) {
   678			mutex_lock(&sigmadsp->lock);
   679			if (ctrl->cached)
   680				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
   681			mutex_unlock(&sigmadsp->lock);
   682		}
   683	}
   684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
