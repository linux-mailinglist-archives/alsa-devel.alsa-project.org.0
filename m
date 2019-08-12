Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4CA8A53B
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 20:02:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 688901668;
	Mon, 12 Aug 2019 20:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 688901668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565632971;
	bh=XH0KPZUYVMjUuXw4s88yGsO8hB68vptVvS8Vd9CAmHk=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qygH6cjncFCGPVMrMQZhQrQCFP0RPmTrORWFw0RTRaYFc6gUOeol2KLBxxcF4y3y8
	 6IK7tGEhO5ZVK/XyWGGHhm9LFLRsBW12a9i4y2AaJWdb9nS4C/Y4OsCLF4NjuPK3NN
	 Q346tNshtwbL8vce8hjdnZKA7evOXYKAWNg7lj9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9BD0AF8015B;
	Mon, 12 Aug 2019 20:01:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F6C0F8015B; Mon, 12 Aug 2019 20:01:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4732F8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 20:00:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4732F8015B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Aug 2019 11:00:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,378,1559545200"; d="scan'208";a="170135567"
Received: from remichie-mobl.amr.corp.intel.com (HELO [10.254.189.60])
 ([10.254.189.60])
 by orsmga008.jf.intel.com with ESMTP; 12 Aug 2019 11:00:55 -0700
To: kbuild test robot <lkp@intel.com>, Takashi Iwai <tiwai@suse.de>
References: <201908122356.TFAqJdGy%lkp@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4fd60aba-28f6-af5c-ebc8-4bc9e6595320@linux.intel.com>
Date: Mon, 12 Aug 2019 13:00:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <201908122356.TFAqJdGy%lkp@intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kbuild-all@01.org
Subject: Re: [alsa-devel] [asoc:for-5.4 195/232]
 sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 8/12/19 10:34 AM, kbuild test robot wrote:
> Hi Mark,
> 
> FYI, the error/warning still remains.

We reproduced this issue when trying to rebase on Mark's for-next 
branch. Takashi's work started from an older code, and the git merge 
just pushed older stuff into the wrong location.

I have a simple fix currently being tested on the SOF CI machines, will 
share when I have the results. see 
https://github.com/thesofproject/linux/pull/1124 if you are interested.

> 
> tree:   https://kernel.googlesource.com/pub/scm/linux/kernel/git/broonie/sound.git for-5.4
> head:   6fa4e0cae684d268d309d1b1f929d52e3df5649c
> commit: c2f16a94a80497e4b28c27f9ca2cd6cd60706fb6 [195/232] Merge branch 'topic/hda-bus-ops-cleanup' of https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound into asoc-5.4
> config: x86_64-randconfig-s0-08121238 (attached as .config)
> compiler: gcc-7 (Debian 7.4.0-10) 7.4.0
> reproduce:
>          git checkout c2f16a94a80497e4b28c27f9ca2cd6cd60706fb6
>          # save the attached .config to linux build tree
>          make ARCH=x86_64
> 
> If you fix the issue, kindly add following tag
> Reported-by: kbuild test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     In file included from include/linux/kobject.h:19:0,
>                      from include/linux/device.h:16,
>                      from include/sound/hdaudio.h:9,
>                      from include/sound/hdaudio_ext.h:5,
>                      from sound/soc/sof/intel/hda-dsp.c:18:
>     sound/soc/sof/intel/hda-dsp.c: In function 'hda_resume':
>>> sound/soc/sof/intel/hda-dsp.c:360:22: error: 'hlink' undeclared (first use in this function)
>       list_for_each_entry(hlink, &bus->hlink_list, list)
>                           ^
>     include/linux/list.h:577:7: note: in definition of macro 'list_for_each_entry'
>       for (pos = list_first_entry(head, typeof(*pos), member); \
>            ^~~
>     sound/soc/sof/intel/hda-dsp.c:360:22: note: each undeclared identifier is reported only once for each function it appears in
>       list_for_each_entry(hlink, &bus->hlink_list, list)
>                           ^
>     include/linux/list.h:577:7: note: in definition of macro 'list_for_each_entry'
>       for (pos = list_first_entry(head, typeof(*pos), member); \
>            ^~~
>     In file included from include/linux/list.h:9:0,
>                      from include/linux/kobject.h:19,
>                      from include/linux/device.h:16,
>                      from include/sound/hdaudio.h:9,
>                      from include/sound/hdaudio_ext.h:5,
>                      from sound/soc/sof/intel/hda-dsp.c:18:
>>> sound/soc/sof/intel/hda-dsp.c:360:30: error: 'bus' undeclared (first use in this function)
>       list_for_each_entry(hlink, &bus->hlink_list, list)
>                                   ^
>     include/linux/kernel.h:972:26: note: in definition of macro 'container_of'
>       void *__mptr = (void *)(ptr);     \
>                               ^~~
>     include/linux/list.h:490:2: note: in expansion of macro 'list_entry'
>       list_entry((ptr)->next, type, member)
>       ^~~~~~~~~~
>     include/linux/list.h:577:13: note: in expansion of macro 'list_first_entry'
>       for (pos = list_first_entry(head, typeof(*pos), member); \
>                  ^~~~~~~~~~~~~~~~
>     sound/soc/sof/intel/hda-dsp.c:360:2: note: in expansion of macro 'list_for_each_entry'
>       list_for_each_entry(hlink, &bus->hlink_list, list)
>       ^~~~~~~~~~~~~~~~~~~
>>> sound/soc/sof/intel/hda-dsp.c:364:2: error: #else without #if
>      #else
>       ^~~~
>>> sound/soc/sof/intel/hda-dsp.c:390:2: error: #endif without #if
>      #endif
>       ^~~~~
> 
> vim +/hlink +360 sound/soc/sof/intel/hda-dsp.c
> 
> 747503b1813a3e Liam Girdwood 2019-04-12  334
> fd15f2f5e27214 Rander Wang   2019-07-22  335  static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
> 747503b1813a3e Liam Girdwood 2019-04-12  336  {
> 747503b1813a3e Liam Girdwood 2019-04-12  337  #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
> 747503b1813a3e Liam Girdwood 2019-04-12  338  	struct hdac_bus *bus = sof_to_bus(sdev);
> 747503b1813a3e Liam Girdwood 2019-04-12  339  	struct hdac_ext_link *hlink = NULL;
> 747503b1813a3e Liam Girdwood 2019-04-12  340  #endif
> 747503b1813a3e Liam Girdwood 2019-04-12  341  	int ret;
> 747503b1813a3e Liam Girdwood 2019-04-12  342
> 747503b1813a3e Liam Girdwood 2019-04-12  343  	/*
> 747503b1813a3e Liam Girdwood 2019-04-12  344  	 * clear TCSEL to clear playback on some HD Audio
> 747503b1813a3e Liam Girdwood 2019-04-12  345  	 * codecs. PCI TCSEL is defined in the Intel manuals.
> 747503b1813a3e Liam Girdwood 2019-04-12  346  	 */
> 747503b1813a3e Liam Girdwood 2019-04-12  347  	snd_sof_pci_update_bits(sdev, PCI_TCSEL, 0x07, 0);
> 747503b1813a3e Liam Girdwood 2019-04-12  348
> 747503b1813a3e Liam Girdwood 2019-04-12  349  	/* reset and start hda controller */
> 747503b1813a3e Liam Girdwood 2019-04-12  350  	ret = hda_dsp_ctrl_init_chip(sdev, true);
> 747503b1813a3e Liam Girdwood 2019-04-12  351  	if (ret < 0) {
> 747503b1813a3e Liam Girdwood 2019-04-12  352  		dev_err(sdev->dev,
> 747503b1813a3e Liam Girdwood 2019-04-12  353  			"error: failed to start controller after resume\n");
> 747503b1813a3e Liam Girdwood 2019-04-12  354  		return ret;
> 747503b1813a3e Liam Girdwood 2019-04-12  355  	}
> 747503b1813a3e Liam Girdwood 2019-04-12  356
> 747503b1813a3e Liam Girdwood 2019-04-12  357  	hda_dsp_ctrl_misc_clock_gating(sdev, false);
> 747503b1813a3e Liam Girdwood 2019-04-12  358
> 747503b1813a3e Liam Girdwood 2019-04-12  359  	/* Reset stream-to-link mapping */
> 747503b1813a3e Liam Girdwood 2019-04-12 @360  	list_for_each_entry(hlink, &bus->hlink_list, list)
> 19abfefd4c7604 Takashi Iwai  2019-08-07  361  		writel(0, hlink->ml_addr + AZX_REG_ML_LOSIDV);
> 747503b1813a3e Liam Girdwood 2019-04-12  362
> 747503b1813a3e Liam Girdwood 2019-04-12  363  	hda_dsp_ctrl_misc_clock_gating(sdev, true);
> 747503b1813a3e Liam Girdwood 2019-04-12 @364  #else
> 747503b1813a3e Liam Girdwood 2019-04-12  365
> 747503b1813a3e Liam Girdwood 2019-04-12  366  	hda_dsp_ctrl_misc_clock_gating(sdev, false);
> 747503b1813a3e Liam Girdwood 2019-04-12  367
> 747503b1813a3e Liam Girdwood 2019-04-12  368  	/* reset controller */
> 747503b1813a3e Liam Girdwood 2019-04-12  369  	ret = hda_dsp_ctrl_link_reset(sdev, true);
> 747503b1813a3e Liam Girdwood 2019-04-12  370  	if (ret < 0) {
> 747503b1813a3e Liam Girdwood 2019-04-12  371  		dev_err(sdev->dev,
> 747503b1813a3e Liam Girdwood 2019-04-12  372  			"error: failed to reset controller during resume\n");
> 747503b1813a3e Liam Girdwood 2019-04-12  373  		return ret;
> 747503b1813a3e Liam Girdwood 2019-04-12  374  	}
> 747503b1813a3e Liam Girdwood 2019-04-12  375
> 747503b1813a3e Liam Girdwood 2019-04-12  376  	/* take controller out of reset */
> 747503b1813a3e Liam Girdwood 2019-04-12  377  	ret = hda_dsp_ctrl_link_reset(sdev, false);
> 747503b1813a3e Liam Girdwood 2019-04-12  378  	if (ret < 0) {
> 747503b1813a3e Liam Girdwood 2019-04-12  379  		dev_err(sdev->dev,
> 747503b1813a3e Liam Girdwood 2019-04-12  380  			"error: failed to ready controller during resume\n");
> 747503b1813a3e Liam Girdwood 2019-04-12  381  		return ret;
> 747503b1813a3e Liam Girdwood 2019-04-12  382  	}
> 747503b1813a3e Liam Girdwood 2019-04-12  383
> 747503b1813a3e Liam Girdwood 2019-04-12  384  	/* enable hda bus irq */
> 747503b1813a3e Liam Girdwood 2019-04-12  385  	snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR, SOF_HDA_INTCTL,
> 747503b1813a3e Liam Girdwood 2019-04-12  386  				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN,
> 747503b1813a3e Liam Girdwood 2019-04-12  387  				SOF_HDA_INT_CTRL_EN | SOF_HDA_INT_GLOBAL_EN);
> 747503b1813a3e Liam Girdwood 2019-04-12  388
> 747503b1813a3e Liam Girdwood 2019-04-12  389  	hda_dsp_ctrl_misc_clock_gating(sdev, true);
> 24b6ff686fce80 Zhu Yingjiang 2019-06-12 @390  #endif
> 747503b1813a3e Liam Girdwood 2019-04-12  391
> 747503b1813a3e Liam Girdwood 2019-04-12  392  	/* enable ppcap interrupt */
> 747503b1813a3e Liam Girdwood 2019-04-12  393  	hda_dsp_ctrl_ppcap_enable(sdev, true);
> 747503b1813a3e Liam Girdwood 2019-04-12  394  	hda_dsp_ctrl_ppcap_int_enable(sdev, true);
> 747503b1813a3e Liam Girdwood 2019-04-12  395
> 
> :::::: The code at line 360 was first introduced by commit
> :::::: 747503b1813a3e6e4c52d9c0b4bd462b64940940 ASoC: SOF: Intel: Add Intel specific HDA DSP HW operations
> 
> :::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> :::::: CC: Mark Brown <broonie@kernel.org>
> 
> ---
> 0-DAY kernel test infrastructure                Open Source Technology Center
> https://lists.01.org/pipermail/kbuild-all                   Intel Corporation
> 
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
