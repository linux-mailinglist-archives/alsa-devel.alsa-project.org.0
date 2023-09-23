Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD197AC0EB
	for <lists+alsa-devel@lfdr.de>; Sat, 23 Sep 2023 12:58:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 01603A4D;
	Sat, 23 Sep 2023 12:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 01603A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695466729;
	bh=LSPrOzzBJSALfxsi/TkmBkbdCdUmFs6Rujo4buJXlPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HP6j+3BHZFOWvlxd86iBjFDQNYiDOPueLcsUaNgVJqZOE13jbLESKzTf6Ay2iCD33
	 NF/1DD0HP7ieU1ZKg9F9E0wy1rwmI4pT1/jjrVJ+sjpna8yG49+3nQK61mlgkANAWY
	 +syLkV7/2V97i2e3+onSbaj62uDI+W/9Ejsh+4AE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5F966F800AA; Sat, 23 Sep 2023 12:57:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14C2EF80125;
	Sat, 23 Sep 2023 12:57:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA7B9F801F5; Sat, 23 Sep 2023 12:55:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 272CEF80124
	for <alsa-devel@alsa-project.org>; Sat, 23 Sep 2023 12:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 272CEF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lljZf9Kb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695466526; x=1727002526;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LSPrOzzBJSALfxsi/TkmBkbdCdUmFs6Rujo4buJXlPI=;
  b=lljZf9KbvU+xoL1VVZda0bAVOYVAtk30YEMukbWOOUaHd0WcqBXxuXIt
   21tspBe74lMT+X3QMpx/XxxngY1fY4tyLcsTtSHOh9IaQCy/4i+y8/X3Z
   s+RzcNayWbCotcR3MTUiJ1quSzcmUTFtKS6ZBdLorX4AQVcmlAYQmJ3hT
   Xor4rbGg2ZRdzeT/cdfWv93eCCPGPlkMoDWoVmmD/cXxtbtVSFQsXSIRg
   YHhQ+duWX59gEJdCTpF6ghhPk+8nXs9KTjQm0UDknDn8RQvCDmBGs0Tqh
   JLARKHXynAffnon8DMs/xWPJDY6r2Wlyj2mWyIv1jr+WLH7wIHDa+peV/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="378290314"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200";
   d="scan'208";a="378290314"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2023 03:55:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="697493257"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200";
   d="scan'208";a="697493257"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 23 Sep 2023 03:55:18 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk0I8-0002AH-0s;
	Sat, 23 Sep 2023 10:55:16 +0000
Date: Sat, 23 Sep 2023 18:55:02 +0800
From: kernel test robot <lkp@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, broonie@kernel.org,
	tiwai@suse.com, perex@perex.cz
Cc: oe-kbuild-all@lists.linux.dev, alsa-devel@alsa-project.org,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring
 substream
Message-ID: <202309231825.17qi62Yr-lkp@intel.com>
References: <20230918133940.3676091-3-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918133940.3676091-3-cezary.rojewski@intel.com>
Message-ID-Hash: 53QJOCS2FWOMDW43ST4CYLSDOYPHZI7B
X-Message-ID-Hash: 53QJOCS2FWOMDW43ST4CYLSDOYPHZI7B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53QJOCS2FWOMDW43ST4CYLSDOYPHZI7B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi Cezary,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8]

url:    https://github.com/intel-lab-lkp/linux/commits/Cezary-Rojewski/ALSA-pcm-Introduce-MSBITS-subformat-interface/20230918-214758
base:   564ee9ac788b680e4ec4a6cb3a4a953dc61d5da8
patch link:    https://lore.kernel.org/r/20230918133940.3676091-3-cezary.rojewski%40intel.com
patch subject: [PATCH v2 02/17] ALSA: pcm: Honor subformat when configuring substream
config: x86_64-randconfig-121-20230923 (https://download.01.org/0day-ci/archive/20230923/202309231825.17qi62Yr-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309231825.17qi62Yr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309231825.17qi62Yr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/core/pcm_native.c:2523:43: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned int val @@     got restricted snd_pcm_format_t [assigned] [usertype] f @@
   sound/core/pcm_native.c:2523:43: sparse:     expected unsigned int val
   sound/core/pcm_native.c:2523:43: sparse:     got restricted snd_pcm_format_t [assigned] [usertype] f
   sound/core/pcm_native.c:95:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock' - different lock contexts for basic block
   sound/core/pcm_native.c:96:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock' - unexpected unlock
   sound/core/pcm_native.c:97:1: sparse: sparse: context imbalance in 'snd_pcm_group_lock_irq' - different lock contexts for basic block
   sound/core/pcm_native.c:98:1: sparse: sparse: context imbalance in 'snd_pcm_group_unlock_irq' - unexpected unlock
   sound/core/pcm_native.c:145:9: sparse: sparse: context imbalance in 'snd_pcm_stream_lock_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:171:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave' - different lock contexts for basic block
   sound/core/pcm_native.c:184:9: sparse: sparse: context imbalance in '_snd_pcm_stream_lock_irqsave_nested' - different lock contexts for basic block
   sound/core/pcm_native.c:201:39: sparse: sparse: context imbalance in 'snd_pcm_stream_unlock_irqrestore' - unexpected unlock
   sound/core/pcm_native.c:1279:44: sparse: sparse: context imbalance in 'snd_pcm_action_group' - unexpected unlock
   sound/core/pcm_native.c:1349:37: sparse: sparse: context imbalance in 'snd_pcm_stream_group_ref' - different lock contexts for basic block
   sound/core/pcm_native.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression

vim +2523 sound/core/pcm_native.c

  2503	
  2504	static int snd_pcm_hw_rule_subformats(struct snd_pcm_hw_params *params,
  2505					      struct snd_pcm_hw_rule *rule)
  2506	{
  2507		struct snd_mask *sfmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_SUBFORMAT);
  2508		struct snd_mask *fmask = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
  2509		struct snd_pcm_hardware *hw = rule->private;
  2510		struct snd_pcm_subformat *sf;
  2511		snd_pcm_format_t f;
  2512		struct snd_mask m;
  2513		bool found;
  2514	
  2515		snd_mask_none(&m);
  2516		/* All PCMs support at least the default STD subformat. */
  2517		snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_STD);
  2518	
  2519		if (!hw->subformats)
  2520			goto exit;
  2521	
  2522		pcm_for_each_format(f) {
> 2523			if (!snd_mask_test(fmask, f))
  2524				continue;
  2525	
  2526			found = false;
  2527			for (sf = hw->subformats; sf->mask && !found; sf++) {
  2528				if (sf->format != f)
  2529					continue;
  2530				m.bits[0] |= sf->mask;
  2531				found = true;
  2532			}
  2533			if (!found && snd_pcm_format_linear(f))
  2534				snd_mask_set(&m, (__force unsigned)SNDRV_PCM_SUBFORMAT_MSBITS_MAX);
  2535		}
  2536	exit:
  2537		return snd_mask_refine(sfmask, &m);
  2538	}
  2539	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
