Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6454381D401
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Dec 2023 13:22:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9B0DF1;
	Sat, 23 Dec 2023 13:22:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9B0DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703334179;
	bh=JdTJVddce5nTGKgEYfvCn0hUfu9G4o5BGyVJH1RDGFU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=iqYpde4V6+DAoJcXGR0aq/0woAGO7io+qvQxq/0NwO7mZ/UkDVUIYqCETPwmc/Dqj
	 y3X+eu7IdE4dtCDb20qfJlFfE3o1NkpWszgUUWJlB5v1wHSevkiLLV0ozm8UoAOmto
	 Z3GLNo1kdFchQSbiXsgMGbpi0099Hd7EQ7d89I9I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F19FF800BD; Sat, 23 Dec 2023 13:22:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF2F6F80578;
	Sat, 23 Dec 2023 13:22:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C253DF8016E; Sat, 23 Dec 2023 13:22:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E65BF800F5
	for <alsa-devel@alsa-project.org>; Sat, 23 Dec 2023 13:22:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E65BF800F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FC2x4jAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703334138; x=1734870138;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JdTJVddce5nTGKgEYfvCn0hUfu9G4o5BGyVJH1RDGFU=;
  b=FC2x4jAJFTRyqxcgKb+4s0+rjASzydV9QqQzWDTyr/dQtlBiP21woUOi
   7G92QxV3p8SYUY0lnDz8zpIaoaLR4SUckyyJrNZ+uyP97izyZkt5TpEKR
   12IBp3vkELRFr77JWaflgk8stETXew8F6Y0lcnp4x4QKpRbwlZcVU6smZ
   oJHkDOAVyt1NbpFINWW+GDj/PbwrghQk4bJ5dJuvA0jVY5cu6ZZKjTIh7
   wXcIxFVnFLVWNPAoL/FFROYs/IEal92R2Mgpq8Qf9XBn8khEtxg8t7zzj
   V7KlkHywld5+DWtFsA/sej3ij8GhbqCvbuSGBUOpm7aHHx+krw2WE17JQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="376335441"
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600";
   d="scan'208";a="376335441"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2023 04:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,299,1695711600";
   d="scan'208";a="19013064"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2023 04:22:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rH113-000AxU-18;
	Sat, 23 Dec 2023 12:22:05 +0000
Date: Sat, 23 Dec 2023 19:54:50 +0800
From: kernel test robot <lkp@intel.com>
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <Claudiu.Beznea@microchip.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Walker Chen <walker.chen@starfivetech.com>,
	Xingyu Wu <xingyu.wu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ASoC: starfive: Add drivers of Cadence
 Multi-Channel I2S Controller
Message-ID: <202312231911.DFYqQ9Gl-lkp@intel.com>
References: <20231221033223.73201-3-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231221033223.73201-3-xingyu.wu@starfivetech.com>
Message-ID-Hash: I25GP3BUQQWTN2G3NDEY73ZXT3S4NMM2
X-Message-ID-Hash: I25GP3BUQQWTN2G3NDEY73ZXT3S4NMM2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I25GP3BUQQWTN2G3NDEY73ZXT3S4NMM2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Xingyu,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on robh/for-next linus/master v6.7-rc6 next-20231222]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xingyu-Wu/dt-bindings-ASoC-Add-Cadence-I2S-controller-for-StarFive-JH8100-SoC/20231222-172628
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20231221033223.73201-3-xingyu.wu%40starfivetech.com
patch subject: [PATCH v1 2/2] ASoC: starfive: Add drivers of Cadence Multi-Channel I2S Controller
config: sparc64-randconfig-r071-20231223 (https://download.01.org/0day-ci/archive/20231223/202312231911.DFYqQ9Gl-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231911.DFYqQ9Gl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312231911.DFYqQ9Gl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from sound/soc/starfive/cdns-jh8100-i2s.c:18:
>> sound/soc/starfive/cdns-jh8100-i2s.h:163:6: warning: no previous prototype for 'cdns_jh8100_i2s_pcm_push_tx' [-Wmissing-prototypes]
     163 | void cdns_jh8100_i2s_pcm_push_tx(struct cdns_jh8100_i2s_dev *dev) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/starfive/cdns-jh8100-i2s.h:164:6: warning: no previous prototype for 'cdns_jh8100_i2s_pcm_pop_rx' [-Wmissing-prototypes]
     164 | void cdns_jh8100_i2s_pcm_pop_rx(struct cdns_jh8100_i2s_dev *dev) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> sound/soc/starfive/cdns-jh8100-i2s.h:165:5: warning: no previous prototype for 'cdns_jh8100_i2s_pcm_register' [-Wmissing-prototypes]
     165 | int cdns_jh8100_i2s_pcm_register(struct platform_device *pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/cdns_jh8100_i2s_pcm_push_tx +163 sound/soc/starfive/cdns-jh8100-i2s.h

   157	
   158	#if IS_ENABLED(CONFIG_SND_SOC_JH8100_CADENCE_I2S_PCM)
   159	void cdns_jh8100_i2s_pcm_push_tx(struct cdns_jh8100_i2s_dev *dev);
   160	void cdns_jh8100_i2s_pcm_pop_rx(struct cdns_jh8100_i2s_dev *dev);
   161	int cdns_jh8100_i2s_pcm_register(struct platform_device *pdev);
   162	#else
 > 163	void cdns_jh8100_i2s_pcm_push_tx(struct cdns_jh8100_i2s_dev *dev) { }
 > 164	void cdns_jh8100_i2s_pcm_pop_rx(struct cdns_jh8100_i2s_dev *dev) { }
 > 165	int cdns_jh8100_i2s_pcm_register(struct platform_device *pdev)
   166	{
   167		return -EINVAL;
   168	}
   169	#endif
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
