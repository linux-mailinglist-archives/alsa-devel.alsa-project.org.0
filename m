Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A904B787B75
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Aug 2023 00:25:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2ED493A;
	Fri, 25 Aug 2023 00:24:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2ED493A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692915948;
	bh=kFt+ci+UMA4Sg/4WTvYN3a+oQZtymEUWVBRzt5wwQ6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dS25A9d6ndzLK8OHqCEMQUEFQu9AHqTo3cnOXdtNuHw3akDXixFaqXE9AsQQko46a
	 kdx1htkpvira+blbIHx0heAMV7ZdHQoObbKjieSorMqnIeTV0YoI0MZzuDEq5pagpF
	 /H13cI+KJQyRic+8eaeH5VRJHI+YamhtLHUqifq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9E41CF80551; Fri, 25 Aug 2023 00:24:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 06F48F80549;
	Fri, 25 Aug 2023 00:24:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73422F80537; Fri, 25 Aug 2023 00:24:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5228AF800AE
	for <alsa-devel@alsa-project.org>; Fri, 25 Aug 2023 00:24:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5228AF800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lpvfGbrj
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692915870; x=1724451870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kFt+ci+UMA4Sg/4WTvYN3a+oQZtymEUWVBRzt5wwQ6k=;
  b=lpvfGbrjJ14uOa+t4VlP6ahDRg7rt0PD9qNTe2D3qMYuQwOdOW0o9Fvj
   jtCr6IlxvLWPzzAnLhQ/08tDnuHdIqMkRT2OEYK0YTFy+bSMShd+m0gQj
   i/MolJ6kCm0NnXi59D+0VVHmzJenByzx0tUOAr2YecPOVBvK4GE5UY5Re
   tXuwfnePSZdR8t61FoVtb5rQCx0nyNxrDkppg3fmd6ab7SpfY27CI06PL
   XDqKKSaRj9JRZEoKU1rmMNTXU70j/Sr8pQS6ky9ymoUiCg3kYLEIf5G+B
   BkeF8soqPxf9doRDlSxu7tK1pD06h/MIxWd8Ljk5fDVDAZziBZtXTawQm
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="438516283"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000";
   d="scan'208";a="438516283"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Aug 2023 15:24:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="714129518"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000";
   d="scan'208";a="714129518"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 24 Aug 2023 15:24:23 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIkZ-00030Z-0b;
	Thu, 24 Aug 2023 22:24:23 +0000
Date: Fri, 25 Aug 2023 06:23:58 +0800
From: kernel test robot <lkp@intel.com>
To: cujomalainey@chromium.org, alsa-devel@alsa-project.org
Cc: oe-kbuild-all@lists.linux.dev,
	Curtis Malainey <cujomalainey@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <treding@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Ivan Orlov <ivan.orlov0322@gmail.com>
Subject: Re: [PATCH 1/2] ALSA: core: add snd_device_init
Message-ID: <202308250609.8A2yaCZs-lkp@intel.com>
References: <20230824210339.1126993-2-cujomalainey@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230824210339.1126993-2-cujomalainey@chromium.org>
Message-ID-Hash: WCTEJWHWXEKZLIBKW4EHV4JNWVBUQEZS
X-Message-ID-Hash: WCTEJWHWXEKZLIBKW4EHV4JNWVBUQEZS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WCTEJWHWXEKZLIBKW4EHV4JNWVBUQEZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tiwai-sound/for-next]
[also build test WARNING on next-20230824]
[cannot apply to tiwai-sound/for-linus broonie-sound/for-next linus/master v6.5-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/cujomalainey-chromium-org/ALSA-core-add-snd_device_init/20230825-050745
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
patch link:    https://lore.kernel.org/r/20230824210339.1126993-2-cujomalainey%40chromium.org
patch subject: [PATCH 1/2] ALSA: core: add snd_device_init
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230825/202308250609.8A2yaCZs-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250609.8A2yaCZs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250609.8A2yaCZs-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/core/init.c:149: warning: Function parameter or member 'dev' not described in 'snd_device_init'
>> sound/core/init.c:149: warning: Excess function parameter 'dev_p' description in 'snd_device_init'


vim +149 sound/core/init.c

   140	
   141	/**
   142	 * snd_device_init - Initialize struct device for sound devices
   143	 * @dev_p: pointer to store the allocated device
   144	 * @card: card to assign, optional
   145	 *
   146	 * For releasing the allocated device, call put_device().
   147	 */
   148	void snd_device_init(struct device *dev, struct snd_card *card)
 > 149	{
   150		device_initialize(dev);
   151		if (card)
   152			dev->parent = &card->card_dev;
   153		dev->class = &sound_class;
   154		dev->release = default_release_alloc;
   155	}
   156	EXPORT_SYMBOL_GPL(snd_device_init);
   157	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
