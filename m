Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C788777DF0C
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Aug 2023 12:43:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C46F03E8;
	Wed, 16 Aug 2023 12:42:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C46F03E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692182582;
	bh=O9Mi3ukPZMXGw4qpDDWQ4PFtxGV6uTKsBrO6Nq3xvJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FNT7jHReF/ibtX4/qRo/5k9Acx/8ER15yMaJPLFTRPovcCyjYww1+kqvD4ZmaskF/
	 8my4UvpA7uEisRa0QnyUEccKWiLaBfq+JKMv+yFu8hPR0YRwds+K8PKw3xnTna+BYt
	 DuA/ZYHb/9mk2R4g+tciYNSZW57qJw0XriLFWPiI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 554E0F8025F; Wed, 16 Aug 2023 12:42:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3F3CF8016A;
	Wed, 16 Aug 2023 12:42:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03519F8016D; Wed, 16 Aug 2023 12:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 26C38F80074
	for <alsa-devel@alsa-project.org>; Wed, 16 Aug 2023 12:41:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 26C38F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=L3GnilwA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692182517; x=1723718517;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=O9Mi3ukPZMXGw4qpDDWQ4PFtxGV6uTKsBrO6Nq3xvJk=;
  b=L3GnilwAsc+E21altCsIjEilEG/YRk9O35+fdRTlq57YbtGqN5EL6Yzm
   1jHl5dSmgI7hcvxrdcHyKXErfPM+V4OT6Lq2xySzunycES0zDG+DHmFn7
   VsjzVNkoWStZhP0zo95TF8psQOAse/Hm6HYX3zopoVcD49baj8NLAFSPs
   zUyGzP6UYNZYfoktDrpMNnGihu59dRirc7bCDolKUOrelAh5DOebff5QI
   jnXB3vPILG65XYrvToyqJF32JORAM13L4sEQNle+riV+SHC7xzMQNDezj
   cGnNPFmF6izNGDoRO2D4tU0+WyFerV4+rjYoHFPtMyGNds7AJ55ZTFuDM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="371405702"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200";
   d="scan'208";a="371405702"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Aug 2023 03:41:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="804181910"
X-IronPort-AV: E=Sophos;i="6.01,176,1684825200";
   d="scan'208";a="804181910"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Aug 2023 03:41:41 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWDy8-0000En-32;
	Wed, 16 Aug 2023 10:41:40 +0000
Date: Wed, 16 Aug 2023 18:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Seven Lee <wtli@nuvoton.com>, broonie@kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	lgirdwood@gmail.com, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	robh+dt@kernel.org, conor+dt@kernel.org, YHCHuang@nuvoton.com,
	KCHSU0@nuvoton.com, CTLIN0@nuvoton.com, WTLI@nuvoton.com,
	SJLIN0@nuvoton.com, scott6986@gmail.com, supercraig0719@gmail.com,
	dardar923@gmail.com
Subject: Re: [PATCH 2/2] ASoC: nau8821: Improve AMIC recording performance.
Message-ID: <202308161844.humS3QWm-lkp@intel.com>
References: <20230816080006.1624342-2-wtli@nuvoton.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230816080006.1624342-2-wtli@nuvoton.com>
Message-ID-Hash: IWSBSQKZLGYJEQA7UO5WSRVGMFQBZMW6
X-Message-ID-Hash: IWSBSQKZLGYJEQA7UO5WSRVGMFQBZMW6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWSBSQKZLGYJEQA7UO5WSRVGMFQBZMW6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Seven,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on next-20230816]
[cannot apply to linus/master v6.5-rc6]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Seven-Lee/ASoC-nau8821-Improve-AMIC-recording-performance/20230816-160236
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20230816080006.1624342-2-wtli%40nuvoton.com
patch subject: [PATCH 2/2] ASoC: nau8821: Improve AMIC recording performance.
config: hexagon-randconfig-r003-20230816 (https://download.01.org/0day-ci/archive/20230816/202308161844.humS3QWm-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308161844.humS3QWm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308161844.humS3QWm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/codecs/nau8821.c:15:
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
           val = __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
   #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
                                                     ^
   In file included from sound/soc/codecs/nau8821.c:15:
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
           val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
   #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
                                                     ^
   In file included from sound/soc/codecs/nau8821.c:15:
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
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
>> sound/soc/codecs/nau8821.c:649:2: warning: unannotated fall-through between switch labels [-Wimplicit-fallthrough]
           default:
           ^
   sound/soc/codecs/nau8821.c:649:2: note: insert 'break;' to avoid fall-through
           default:
           ^
           break; 
   7 warnings generated.


vim +649 sound/soc/codecs/nau8821.c

   626	
   627	static int nau8821_left_fepga_event(struct snd_soc_dapm_widget *w,
   628			struct snd_kcontrol *kcontrol, int event)
   629	{
   630		struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
   631		struct nau8821 *nau8821 = snd_soc_component_get_drvdata(component);
   632	
   633		if (!nau8821->left_input_single_end)
   634			return 0;
   635	
   636		switch (event) {
   637		case SND_SOC_DAPM_POST_PMU:
   638			regmap_update_bits(nau8821->regmap, NAU8821_R77_FEPGA,
   639				NAU8821_ACDC_CTRL_MASK | NAU8821_FEPGA_MODEL_MASK,
   640				NAU8821_ACDC_VREF_MICN | NAU8821_FEPGA_MODEL_AAF);
   641			regmap_update_bits(nau8821->regmap, NAU8821_R76_BOOST,
   642				NAU8821_HP_BOOST_DISCHRG_EN, NAU8821_HP_BOOST_DISCHRG_EN);
   643			break;
   644		case SND_SOC_DAPM_POST_PMD:
   645			regmap_update_bits(nau8821->regmap, NAU8821_R77_FEPGA,
   646				NAU8821_ACDC_CTRL_MASK | NAU8821_FEPGA_MODEL_MASK, 0);
   647			regmap_update_bits(nau8821->regmap, NAU8821_R76_BOOST,
   648				NAU8821_HP_BOOST_DISCHRG_EN, 0);
 > 649		default:
   650			break;
   651		}
   652	
   653		return 0;
   654	}
   655	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
