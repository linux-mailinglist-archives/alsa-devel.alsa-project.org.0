Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC79896F5E
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 14:52:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69EBA2CF6;
	Wed,  3 Apr 2024 14:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69EBA2CF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712148738;
	bh=kMKCTwKn8cIKYzkCfS7drdn8LHov9ndMuinvA3lbcgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BDHxcXCIT0xTmLdjfLDNpdHcNxxVn1uYe+ZnmYL1vFfHouVsQoRhBasFlCmhlNPYo
	 Fibyj/HKP2CdHtINp8aNosEVvSlgatOKeJxZQ6HUtxPv7PAB56SfBIeowLcpOxQAkj
	 kbNDi4fCrWYg4sCibN6U6qs1CTH0otliJINVm3cE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90EEAF80652; Wed,  3 Apr 2024 14:50:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 87C13F80649;
	Wed,  3 Apr 2024 14:50:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57373F805CA; Wed,  3 Apr 2024 14:50:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29FB0F8020D
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 14:50:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29FB0F8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FvJNPFYJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148631; x=1743684631;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=kMKCTwKn8cIKYzkCfS7drdn8LHov9ndMuinvA3lbcgw=;
  b=FvJNPFYJyt5NF09iih9ivV/uyjfuz8x1XtE7tw65EDtD5iUElzyhVN7t
   zpTXkXSgrOPu2NOtL4Q2JdDFLNCDkjcKPvtW9FrpawmGU3Y951rz++akc
   XlBi6n6yGLRQHWczKH/o7q7wh8TcLx3QKtOxccn+Z0OzncK6xrw+jtkS5
   pvw3ibd6xNfk4Fv80kiJLnT2CksY61drHf6BMNbzSsroxtpZnuX7mzJLJ
   CpAyEoRlIUbBeaeEHrmKAH2+NFwAIev++ZYTnBtIBWvHh//iEqzh9DErp
   R/i8I8UJo45FYA/j1OvJD8vz/dEmnyAy5xl0MZ8OE7eH79P8SRCcj5ELD
   A==;
X-CSE-ConnectionGUID: T0LsHCntSDOBgZQGUlZSLA==
X-CSE-MsgGUID: sKA3Jan/QtSM4ZgzHzXe4g==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539311"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7539311"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:26 -0700
X-CSE-ConnectionGUID: hVk+VsPMTNGqw+pBvOSqyw==
X-CSE-MsgGUID: RwciptEsRAWsX8VxQF1m0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18343230"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:24 -0700
Message-ID: <27d79c07-4ff9-48f4-9785-2643a8c5f4c5@linux.intel.com>
Date: Tue, 2 Apr 2024 09:06:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>,
 Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Trevor Wu <trevor.wu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, alsa-devel@alsa-project.org,
 imx@lists.linux.dev, linux-sound@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <87zfuesz8y.wl-kuninori.morimoto.gx@renesas.com>
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
 <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
 <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
 <87ttkk9se3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttkk9se3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GKC2H6NODSZTJUMPHXMQEYVETF54PGF7
X-Message-ID-Hash: GKC2H6NODSZTJUMPHXMQEYVETF54PGF7
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GKC2H6NODSZTJUMPHXMQEYVETF54PGF7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/2/24 01:43, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, again
> 
>>> The problem I have is with the following code (not shown with diff)
>>>
>>> 	if (dai_link->playback_only)
>>> 		has_capture = 0;
>>>
>>> 	if (dai_link->capture_only)
>>> 		has_playback = 0;
>>>
>>> So with this grand unification, all the loops above may make a decision
>>> that could be overridden by these two branches.
>>>
>>> This was not the case before for DPCM, all the 'has_capture' and
>>> 'has_playback' variables were used as a verification of the dai_link
>>> settings with an error thrown e.g. if the dpcm_playback was set without
>>> any DAIs supporting playback.
> 
> Hmm... above 2 branches are used for DPCM too before.

Not really, playback_only and capture_only were never set so those two
branches were always false.
> 
>>> Now the dailink settings are used unconditionally. There is one warning
>>> added if there are no settings for a dailink, but we've lost the
>>> detection of a mismatch between dailink and the set of cpu/codec dais
>>> that are part of this dailink.
> 
> Does this mean, for example you want to have warning/error by dpcm_playback
> flag if you are thinking it can use playback , but FE or BE playback was
> not valid ?

Again we had a verification that if the dpcm_playback was set at the
dailink level, it was actually supported by the dais.

We seem to have lost this verification. We only have an error when there
are no settings at all.

> 
> If so, yes indeed this patch removes such flags.
> But I wonder why you want to get it in case of DPCM only ?

It's helpful to detect invalid configurations. And I see to reason why
the removal of flags should change the functionality.

> I can understand if all case want to have it.
> 
> Then, I think we can check _only for this purpose too ?
> 
> (A)	if dai_link has playback_only        -> it should have has_playback
> (B)	if dai_link has capture_only         -> it should have has_capture
> (C)	if dai_link don't have both xxx_only -> it should have both has_xxx
> 
> I think we already have (A)(B) check. We want to add (C) check ?
> 
> If my understanding was correct, the things dpcm_xxx flag can do is also
> can do by xxx_only flag. But dpcm_xxx flag is used only DPCM, but xxx_only
> flag is used on all cases.

I am only concerned about mismatches between dailinks and dai
capabilities. The logic above is fine, but it's in the scope of the
dailink only.

