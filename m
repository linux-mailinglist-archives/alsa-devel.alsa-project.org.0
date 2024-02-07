Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6786584D37E
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 22:11:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEBD582C;
	Wed,  7 Feb 2024 22:11:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEBD582C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707340276;
	bh=YF5W5h5FJ2BTof0Z5hlJe4uKw4I2TVKX3szp6tcd8Yw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=npvCYS42609r/vhRczX/h2Lh9ZIIkfuJ1c10bNmoJMx5/QH08pIldYQdurIKzdJOp
	 wAJmzL0fZxnznb7EyaicHFhoZU/48cVJVONPQrcB6vn1xdJHCz2CWXxtwCTF4G1FJY
	 1ffzjXytV8U7dja9LuOPDtYA2IYZoEq1ED7Dn+Yk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64051F80587; Wed,  7 Feb 2024 22:10:40 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E0184F805A0;
	Wed,  7 Feb 2024 22:10:39 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DACA4F801EB; Wed,  7 Feb 2024 22:10:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 03D32F8016E
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 22:10:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03D32F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cp0sVWdc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707340224; x=1738876224;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YF5W5h5FJ2BTof0Z5hlJe4uKw4I2TVKX3szp6tcd8Yw=;
  b=Cp0sVWdcWz95cDSx/gEaq20VkXU/SJA/Ke+zHuEEgU4mZhojzhMBQ9iP
   24DQJZO6uyJWaR2xPuC4YLg9ANTaeZcerzC4wC86Y1a23wTBbci3/SchK
   H3gaOWc4jNeGKpwggHJmCFfRJ3nMfvTkyQYmFb38/dGRYhAZHlmXcwNu5
   7w4U/hQ5FoGFzjoM1TvDZ98+AhUUnlkv62qto3kFW6sbVtEbZKW80QqMI
   VIKaZI4nDOry7TGFC0nKvA4sZJ/h+AQeTRtsofs9r3/gP3QOSTJIrtd5w
   NcbhAy3R7cz89/41Qzi0iKm3Drdrje0pYH87k+Z0ZNm03nZOuolSkbNvQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4901641"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="4901641"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 13:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400";
   d="scan'208";a="1445149"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Feb 2024 13:10:14 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXpBL-00033A-2j;
	Wed, 07 Feb 2024 21:10:11 +0000
Date: Thu, 8 Feb 2024 05:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
	=?utf-8?Q?=C5=81ukasz?= Majczak <lma@chromium.org>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH 2/3] ASoC: Intel: avs: Add topology parsing support for
 initial config
Message-ID: <202402080403.reu2fMfN-lkp@intel.com>
References: <20240207120946.2140480-3-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207120946.2140480-3-amadeuszx.slawinski@linux.intel.com>
Message-ID-Hash: YADP2BIBXNKQGFNPQQAOKBEQK7DZLY3Z
X-Message-ID-Hash: YADP2BIBXNKQGFNPQQAOKBEQK7DZLY3Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YADP2BIBXNKQGFNPQQAOKBEQK7DZLY3Z/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Amadeusz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on tiwai-sound/for-next tiwai-sound/for-linus linus/master v6.8-rc3 next-20240207]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Amadeusz-S-awi-ski/ASoC-Intel-avs-UAPI-Add-tokens-for-initial-config-feature/20240207-201212
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20240207120946.2140480-3-amadeuszx.slawinski%40linux.intel.com
patch subject: [PATCH 2/3] ASoC: Intel: avs: Add topology parsing support for initial config
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20240208/202402080403.reu2fMfN-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080403.reu2fMfN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080403.reu2fMfN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/intel/avs/topology.c:11:
   In file included from include/sound/soc.h:21:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:547:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     547 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:560:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     560 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:37:59: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                                                           ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
     102 | #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
         |                                                      ^
   In file included from sound/soc/intel/avs/topology.c:11:
   In file included from include/sound/soc.h:21:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:573:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     573 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:35:59: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
         |                                                           ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
     115 | #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
         |                                                      ^
   In file included from sound/soc/intel/avs/topology.c:11:
   In file included from include/sound/soc.h:21:
   In file included from include/linux/regmap.h:20:
   In file included from include/linux/iopoll.h:14:
   In file included from include/linux/io.h:13:
   In file included from arch/s390/include/asm/io.h:78:
   include/asm-generic/io.h:584:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     584 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:594:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     594 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:604:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     604 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:692:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     692 |         readsb(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:700:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     700 |         readsw(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:708:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     708 |         readsl(PCI_IOBASE + addr, buffer, count);
         |                ~~~~~~~~~~ ^
   include/asm-generic/io.h:717:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     717 |         writesb(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:726:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     726 |         writesw(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
   include/asm-generic/io.h:735:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     735 |         writesl(PCI_IOBASE + addr, buffer, count);
         |                 ~~~~~~~~~~ ^
>> sound/soc/intel/avs/topology.c:1490:13: warning: parameter 'block_size' set but not used [-Wunused-but-set-parameter]
    1490 |                                            u32 block_size)
         |                                                ^
   13 warnings generated.


vim +/block_size +1490 sound/soc/intel/avs/topology.c

  1487	
  1488	static int avs_tplg_parse_initial_configs(struct snd_soc_component *comp,
  1489						   struct snd_soc_tplg_vendor_array *tuples,
> 1490						   u32 block_size)
  1491	{
  1492		struct avs_soc_component *acomp = to_avs_soc_component(comp);
  1493		struct avs_tplg *tplg = acomp->tplg;
  1494		int ret, i;
  1495	
  1496		/* Parse tuple section telling how many init configs there are. */
  1497		ret = parse_dictionary_header(comp, tuples, (void **)&tplg->init_configs,
  1498					      &tplg->num_init_configs,
  1499					      sizeof(*tplg->init_configs),
  1500					      AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32);
  1501		if (ret)
  1502			return ret;
  1503	
  1504		block_size -= le32_to_cpu(tuples->size);
  1505		/* With header parsed, move on to parsing entries. */
  1506		tuples = avs_tplg_vendor_array_next(tuples);
  1507	
  1508		for (i = 0; i < tplg->num_init_configs; i++) {
  1509			struct avs_tplg_init_config *config = &tplg->init_configs[i];
  1510			struct snd_soc_tplg_vendor_array *tmp;
  1511			void *init_config_data;
  1512			u32 esize;
  1513	
  1514			/*
  1515			 * Usually to get section length we search for first token of next group of data,
  1516			 * but in this case we can't as tuples are followed by raw data.
  1517			 */
  1518			tmp = avs_tplg_vendor_array_next(tuples);
  1519			esize = le32_to_cpu(tuples->size) + le32_to_cpu(tmp->size);
  1520	
  1521			ret = parse_dictionary_entries(comp, tuples, esize, config, 1, sizeof(*config),
  1522						       AVS_TKN_MOD_INIT_CONFIG_ID_U32,
  1523						       mod_init_config_parsers,
  1524						       ARRAY_SIZE(mod_init_config_parsers));
  1525	
  1526			block_size -= esize;
  1527	
  1528			/* handle raw data section */
  1529			init_config_data = (void *)tuples + esize;
  1530			esize = config->length;
  1531	
  1532			config->data = devm_kmemdup(comp->card->dev, init_config_data, esize, GFP_KERNEL);
  1533			if (!config->data)
  1534				return -ENOMEM;
  1535	
  1536			tuples = init_config_data + esize;
  1537		}
  1538	
  1539		return 0;
  1540	}
  1541	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
