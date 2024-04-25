Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 791D08B24F1
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Apr 2024 17:21:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3E3BBC0;
	Thu, 25 Apr 2024 17:21:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3E3BBC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714058496;
	bh=mmLsdfjl+vt5s+WbAbjRVO5Rv2WciQMRN+lZc7QYbGI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E36MXGYQ2aJYxlMDrC4XUcG8aaBqjNSME0p9hiiAOdbzCzvnU7WTvmuRaBiM5dvgG
	 lnomLgh0I/EKpnavDk0kfVmLRTcJjEsoPvMeXqfy7alNg61NXvffd8uHW29H8xjSnJ
	 32fPgdDTVtOuevfyyiE31aojUKTRPGzFCdXsQ03Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A5DFF805A8; Thu, 25 Apr 2024 17:21:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1036CF80568;
	Thu, 25 Apr 2024 17:21:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24AA5F80423; Thu, 25 Apr 2024 17:20:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81A9DF801C0
	for <alsa-devel@alsa-project.org>; Thu, 25 Apr 2024 17:20:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81A9DF801C0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=DY813AM5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714058449; x=1745594449;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mmLsdfjl+vt5s+WbAbjRVO5Rv2WciQMRN+lZc7QYbGI=;
  b=DY813AM5zgLV+pxswC6owexQeg0Jajwk/QnbUu4khFCfUpZiMJAgg+HP
   ujaj6wOJDU4JRXxPaODOlz8G1idPljrkXH2XuUcyQqZEm+s/lN/XKW+29
   fm9zQ63Xe3b9txi+cwXR6ELWJBDmXKJfH/mB65f4c3DQh4uPr8p7Kaghx
   0aciI7nX5ywF2bXQeIbn6FnQ/vlifUF3cJA01w2lmZ8vk7cvHUBKDLTBk
   DZd/QvjE2PpoBOb06T3Ubux85jRoAv9GydPnc2ANz5/vxXVOLIDgKRIX7
   47Cyf9+bNqWp1huY4qJdtveJzu+E6ZT7YxFGHxIW6rBixwn5CxJxfhLGB
   A==;
X-CSE-ConnectionGUID: 9RiIYynjSpenRxeYmYWIXA==
X-CSE-MsgGUID: xcgWfyG9QmyT2x0aaFIvkQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="21160636"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000";
   d="scan'208";a="21160636"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:20:44 -0700
X-CSE-ConnectionGUID: UNOZuSbNRQmT8vF2T00TrQ==
X-CSE-MsgGUID: 1j5XIcEYSZ2SAI43Ch6clA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000";
   d="scan'208";a="25170934"
Received: from shivapri-mobl.amr.corp.intel.com (HELO [10.209.176.73])
 ([10.209.176.73])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 08:20:44 -0700
Message-ID: <f65efc7b-d268-4b39-8665-5c4fe8e3ca1a@linux.intel.com>
Date: Thu, 25 Apr 2024 10:20:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
 <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
 <87ttjytayy.wl-kuninori.morimoto.gx@renesas.com>
 <92054f87-dded-4b66-8108-8b2a10909883@linux.intel.com>
 <87edaym2cg.wl-kuninori.morimoto.gx@renesas.com>
 <93294e52-97e5-4441-a849-867429da6573@linux.intel.com>
 <87h6fsisn8.wl-kuninori.morimoto.gx@renesas.com>
 <87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87plueovm1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GJDBO6KM3FAVOYOLE5LY4V4DUCJTUODZ
X-Message-ID-Hash: GJDBO6KM3FAVOYOLE5LY4V4DUCJTUODZ
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GJDBO6KM3FAVOYOLE5LY4V4DUCJTUODZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>




> Because Japanese will dive into long vacation since next week,
> I want to post mail before that. I will back at 7th May.

Enjoy!

>>>> (B) commit 1e9de42f4324b91ce2e9da0939cab8fc6ae93893
>>>> ("Explicitly set BE DAI link supported stream directions") force use to
>>>> dpcm_xxx flag
>>>>
>>>> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
>>>> 		playback = rtd->dai_link->dpcm_playback;
>>>> 		capture = rtd->dai_link->dpcm_capture;
>>>
>>> The reason for this (B) addition is very clear from the commit message
>>>
>>> "
>>> Some BE DAIs can be "dummy" (when the DSP is controlling the DAI) and as
>>> such wont have set a minimum number of playback or capture channels
>>> required for BE DAI registration (to establish supported stream directions).
>>> "
>>
>> I'm still not yet 100% understand around this "dummy" DAI, but is it
>> *not* soc-utils.c :: dummy_dai, but some original dummy DAI is used
>> somewhere ?
>>
>> I know ${LINUX}/sound/soc/codecs/hda.c :: card_binder_dai is one of
>> the DAI which is used but doesn't have channels_min.
>> I think it is used as BE "Codec", but code is checking "CPU" side.
>>
>> Do you know what does this "BE dummy DAI" specifically means here?
> 
> 	(A) : checked CPU capabilities
> 	(B) : uses dpcm_xxx flag
> 	(C) : checks both dpcm_xxx and capabilities
> 	...
> 
> In my understanding, in summary, this dpcm_xxx flag was added to rescue
> dummy DAI which is used on DCPM BE as CPU at (B), because some of them
> might not have channels_min (This "dummy DAI" is not same as soc-utils's
> dummy DAI). Let's name it as "no_chan_DAI" here.
> In this patch, it was added as "mandatory flag", not "option flag",
> thus all DPCM needed to use this dpcm_xxx flag.
> 
> After that (C) was added, but it was contradiction, because
> it checks both dpcm_xxx and channels_min.
> If my understanding was correct, original "no_chan_DAI" was supposed to
> stop working, because it doesn't have channels_min. But there is no
> such report after (C), during this 4 years.
> We don't know which DAI is the "no_chan_DAI" (?)
> 
> Possibilities are as follows
> 	- No one is using "no_chan_DAI"
> 	- "no_chan_DAI" is no longer exist : it was removed ?
> 	- "no_chan_DAI" is no longer exist : it has channels_min ?
> 
> If my expectation was correct, we don't need dpcm_xxx anymore.

I agree with your analysis. We don't have a clear memory/understanding
of which "no_chan_DAI" platforms (B) was supposed to handle, and why no
one reported them as broken by (C).

> But because we have been used dpcm_xxx for 10 years since (B),
> I understand to feel anxious to suddenly remove dpcm_xxx.

Indeed we err on the side of paranoia with such changes!

> I think it should be removed anyway, but want to have grace time ?
> If so, the idea is that we can use it as "option flag" instead of
> "mandatory flag" for a while, like below
> 
> 	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> 		playback = (cpu_dai->driver->playback.channels_min > 0) ||
> 			   rtd->dai_link->dpcm_playback;
> 		capture  = (cpu_dai->driver->capture.channels_min  > 0) ||
> 			   rtd->dai_link->dpcm_capture;
> 
> * maybe we want to indicate message like "place re-check the flag and
>   remove it" via dev_info() if dpcm_xxx flag was used ?
> 
> I think +2 kernel version or so is enough for grace time ?
> After that, we can remove dpcm_xxx flag.

I am good with that plan, but I'll need to investigate first why we had
a failure with one of the Chromebooks on this v3 patchset. That may give
us some insights on "special" uses of those flags.

> When we consider it very detail, above code can't 100% keep compatibility
> if the user have been used this dpcm_xxx flag to limit availability,
> for example in case of DAI can use both playback/capture, but it had
> dpcm_playback flag only. But it can use playback_only flag, instead.
> But it is very difficult to find such DAI. Each user need to check.
> 
> I personally think that remove dpcm_xxx directly is no ploblem, but what
> do you think ? I'm happy to hear any opinion, and happy to create
> grace time code if someone want, but if there was no comment during
> Japanese long vacation, I will create patch to remove dpcm_xxx directly.
> 
> 
> BTW, I would like to know detail things around this topic. I'm happy if
> someone knows it.
> 
> * Why dummy DAI doesn't/can't have channels_min ?
> 
> * Why it checks CPU side channels_min only when DPCM ?
>   I think it should check both CPU and Codec.
>   I could understand if it checks FE:CPU and BE:Codec (it is assuming
>   other side was dummy), but both (FE/BE) check CPU side only...
