Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD587EDBC6
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Nov 2023 08:06:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 88E1B1EB;
	Thu, 16 Nov 2023 08:06:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 88E1B1EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700118413;
	bh=iccyYLx60+kSDjnII5GF2rxDscXXNDcHqPGFIfB7nyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vDKf1lfbNfJ8qti3SYS5NUuc9oh0MJxv2T+hySLXbaLzbVqM3YXbvCKN72u1tJG+f
	 NChgtJXDciMnDFkoDbfSNl3S7lbf8Yn9mHkTNhlWNJBYtAD5QW5dhCO6ubO3PlpBjX
	 vYDodM8cqU2radvisP7+1T3OziHtIcd42XSqG1dI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58E95F80551; Thu, 16 Nov 2023 08:06:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CBCACF8016E;
	Thu, 16 Nov 2023 08:06:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90164F801D5; Thu, 16 Nov 2023 08:05:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C37CCF80152
	for <alsa-devel@alsa-project.org>; Thu, 16 Nov 2023 08:05:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C37CCF80152
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Cgc4IAaH
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700118341; x=1731654341;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iccyYLx60+kSDjnII5GF2rxDscXXNDcHqPGFIfB7nyk=;
  b=Cgc4IAaHrAMi0hq05LTX5XOlxtl7uV2LixFw7535ksr6AlA5jhse3Dj4
   3yoQwYb0q4NdfYklcwiI+oorQYIwLEEkxGL1foFm6e1SkiEyEHgkaX+Cc
   Ggp81uAVFj9yh7kTGtgWpL0sTSO4b38CfSL4sbEfXETErw9U+JxSiyVN9
   ocyy34gH/4/dg36vHVmYkjMr10vg297/LYcbwbl89hT+kPaGp/BJvq9Mt
   h+51KX1/sH9R7ys2Q3j9xBWKOnuJZxoDcQ3zo204228feNd09k8RgcQQ0
   cTw/nZx5w8LUQbwDH9bCG1ufJppIcUctCFgT1HZXb69kUAnUxWOzbz3py
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="477247197"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200";
   d="scan'208";a="477247197"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2023 23:05:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096702607"
X-IronPort-AV: E=Sophos;i="6.03,307,1694761200";
   d="scan'208";a="1096702607"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 23:05:34 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3WRQ-0001R2-0C;
	Thu, 16 Nov 2023 07:05:32 +0000
Date: Thu, 16 Nov 2023 15:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v3 01/16] ALSA: pcm: Introduce MSBITS subformat interface
Message-ID: <202311161421.XWUhngXI-lkp@intel.com>
References: <20231114201317.1348066-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231114201317.1348066-2-cezary.rojewski@intel.com>
Message-ID-Hash: P7GCZXQ3O77Z74NUKO2BNBZGAE37OMZ2
X-Message-ID-Hash: P7GCZXQ3O77Z74NUKO2BNBZGAE37OMZ2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P7GCZXQ3O77Z74NUKO2BNBZGAE37OMZ2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on tiwai-sound/for-linus broonie-sound/for-next linus/master v6.7-rc1 next-20231116]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20231115-041959
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20231114201317.1348066-2-cezary.rojewski%40intel.com
patch subject: [PATCH v3 01/16] ALSA: pcm: Introduce MSBITS subformat interface
config: i386-randconfig-062-20231116 (https://download.01.org/0day-ci/archive/20231116/202311161421.XWUhngXI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311161421.XWUhngXI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311161421.XWUhngXI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/pcm_native.c:2517:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [assigned] [usertype] f @@
   sound/core/pcm_native.c:2517:43: sparse:     expected unsigned int val
   sound/core/pcm_native.c:2517:43: sparse:     got restricted snd_pcm_format_t [assigned] [usertype] f
   sound/core/pcm_native.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   sound/core/pcm_native.c:95:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock' - different lock contexts for basic block
   sound/core/pcm_native.c:96:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock' - unexpected unlock
   sound/core/pcm_native.c:97:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock_irq' - different lock contexts for basic block
   sound/core/pcm_native.c:98:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock_irq' - unexpected unlock
   sound/core/pcm_native.c:145:9: sparse: sparse: context imbalance in 'snd_pcm_stream_lock_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:171:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave' - different lock contexts for basic block
   sound/core/pcm_native.c:184:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:201:39: sparse: sparse: context imbalance in 'snd_pcm_stream_unlock_irqrestore' - unexpected unlock
   sound/core/pcm_native.c:1278:44: sparse: sparse: context imbalance in 'snd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c:1348:37: sparse: sparse: context imbalance in 'snd_pcm_stream_group_ref' - different lock contexts for basic block

vim +2517 sound/core/pcm_native.c

  2502	
  2503	static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
  2504					      struct snd_pcm_hw_rule *rule)
  2505	{
  2506		struct snd_mask *sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
  2507		struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
  2508		u32 *subformats = rule->private;
  2509		snd_pcm_format_t f;
  2510		struct snd_mask m;
  2511	
  2512		snd_mask_none(&m);
  2513		/* All PCMs support at least the default STD subformat. */
  2514		snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
  2515	
  2516		pcm_for_each_format(f) {
> 2517			if (!snd_mask_test(fmask, f))
  2518				continue;
  2519	
  2520			if (f == SNDRV_PCM_FORMAT_S32_LE)
  2521				m.bits[0] |= *subformats;
  2522			else if (snd_pcm_format_linear(f))
  2523				snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
  2524		}
  2525	
  2526		return snd_mask_refine(sfmask, &m);
  2527	}
  2528	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
