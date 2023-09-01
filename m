Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA6278FDA8
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Sep 2023 14:45:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00E56DF2;
	Fri,  1 Sep 2023 14:44:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00E56DF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693572310;
	bh=2ywJVJh0PNqpM2RLKnYJQulhCemfMfpJ1CUH0ytkIMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IuiQQ2MyXnA3Ji7TYTfrx0V0KasN+MzmQOhuNKDoBB4DzMIlgpqPQ5pbJmXRKBh8D
	 O6BMjD2OFLMsHFLv6A36ZDX16VrFSad1ff/9DqC5EzZAk7vkgGEYwEotf5+JT65W97
	 EwreuSNhrItmRtEBoSV8JAXVeWV3LX+lGV4mUVW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B868F80245; Fri,  1 Sep 2023 14:44:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40CCAF80155;
	Fri,  1 Sep 2023 14:44:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B62C5F80158; Fri,  1 Sep 2023 14:44:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A8F7F800D1;
	Fri,  1 Sep 2023 14:44:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A8F7F800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KjciHqZu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693572253; x=1725108253;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2ywJVJh0PNqpM2RLKnYJQulhCemfMfpJ1CUH0ytkIMM=;
  b=KjciHqZuTHM1QxUgiDjtI9aOa4jl+kWUSlY32ov0EVK5RxF47pRLjehA
   GKPfR4S/TXHRyqatJwREfC8BB0GXe18Lo+sVYjJr/ZGIDKKqANaW7J6sd
   xk6CVpTQkHHezbA2QY9yCTEm7SzeFRUgWdvtMDuWThM5NR32ATq9Imw57
   jRuLz2uYl5yKnwSyRgB8Z2tkPUpzdMQDlfjMdPe7XpDWVnPC+FvbTLdbl
   ZzmAsidJ2Hcv1/YADi76L1LR+6MjuiiDxUPYhqCoUoOkhYLhmU2KYM+Uz
   Ph+BNJcVqbBrFTTEaT/PZVYE3qOxsvTBTgW8FPaOaAFoDvDg5VNodZQrH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="378936748"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="378936748"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:44:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="830113531"
X-IronPort-AV: E=Sophos;i="6.02,219,1688454000";
   d="scan'208";a="830113531"
Received: from dstavrak-mobl.ger.corp.intel.com (HELO [10.252.32.139])
 ([10.252.32.139])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2023 05:44:04 -0700
Message-ID: <4252a4dc-0cf3-4ff2-aa55-c03e56345276@linux.intel.com>
Date: Fri, 1 Sep 2023 15:44:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/11] ASoC: SOF: core: add 'no_wq' probe and remove
 callbacks
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: alsa-devel@alsa-project.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 linux-kernel@vger.kernel.org, sound-open-firmware@alsa-project.org
References: <20230830153652.217855-1-maarten.lankhorst@linux.intel.com>
 <20230830153652.217855-2-maarten.lankhorst@linux.intel.com>
 <alpine.DEB.2.22.394.2309011509200.3532114@eliteleevi.tm.intel.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: 
 <alpine.DEB.2.22.394.2309011509200.3532114@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RHDRVMLQCBEJ2CKMC6QNDX2MD4EOVCOL
X-Message-ID-Hash: RHDRVMLQCBEJ2CKMC6QNDX2MD4EOVCOL
X-MailFrom: peter.ujfalusi@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RHDRVMLQCBEJ2CKMC6QNDX2MD4EOVCOL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 01/09/2023 15:15, Kai Vehmanen wrote:
> Hi,
> 
> On Wed, 30 Aug 2023, Maarten Lankhorst wrote:
> 
>> With the upcoming changes for i915/Xe driver relying on the
>> -EPROBE_DEFER mechanism, we need to have a first pass of the probe
>> which cannot be pushed to a workqueue. Introduce 2 new optional
>> callbacks.
> [...]
>> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
>> index 30db685cc5f4b..54c384a5d6140 100644
>> --- a/sound/soc/sof/core.c
>> +++ b/sound/soc/sof/core.c
>> @@ -327,8 +327,6 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
>>  dsp_err:
>>  	snd_sof_remove(sdev);
>>  probe_err:
>> -	sof_ops_free(sdev);
>> -
> 
> this seems a bit out-of-place in this patch. It seems a valid change,
> but not really related to this patch, right?

The ops needs to be preserved even if the wq fails since the patch wants
to call snd_sof_remove_no_wq() unconditionally on remove.

> We seem to have a related fix waiting to be sent to alsa-devel, by
> Peter:
> "ASoC: SOF: core: Only call sof_ops_free() on remove if the probe wa"
> https://github.com/thesofproject/linux/pull/4515

I guess we can revert that in sof-dev, if this is the preferred way?

> ... not yet in Mark's tree.
> 
> Otherwise patch looks good to me.

I would have not created the snd_sof_remove_no_wq() as it makes not much
functional sense.
It might be even better if the remove in the wq would do the
hda_codec_i915_exit() as the module will remain in there until the user
removes it.

> 
> Br, Kai

-- 
Péter
