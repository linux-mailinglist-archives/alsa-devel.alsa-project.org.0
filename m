Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C295896F59
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Apr 2024 14:51:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2EEEE2CF6;
	Wed,  3 Apr 2024 14:51:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2EEEE2CF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712148706;
	bh=4umRmk03vF9fr1bGI0vLvaFyerPGebWSjguYoGPrI8c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nZyR1twr0+gXHhjb0W1J3A4eM1eXObmoW1ANFi6Do68nERsfZr3f33uNxUiFbm8p0
	 lvQb+Ca2rDoPd1vZuprDCct4QfnX5fJUQFzF6snfLbUhmYmU2UbvcQF1cYZX90U0qk
	 eM4FdQdOOjD2lxFW8J3j2Zm2dIEQtHJleLvC3d08=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ADE0EF805EC; Wed,  3 Apr 2024 14:50:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C55B0F805FF;
	Wed,  3 Apr 2024 14:50:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41E0AF8015B; Wed,  3 Apr 2024 14:50:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=DATE_IN_PAST_12_24,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DDAF4F8015B
	for <alsa-devel@alsa-project.org>; Wed,  3 Apr 2024 14:50:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DDAF4F8015B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Sb2l3lgO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712148630; x=1743684630;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=4umRmk03vF9fr1bGI0vLvaFyerPGebWSjguYoGPrI8c=;
  b=Sb2l3lgO9V4CpUq6FcXfffxO+EQAThkOAT2bPVswNmSUdOPyvG0kpMjs
   U3FAKu5j/edUs//oA1bxr6iVHU4q/D9VhCYzIvg+/vI9rG1EeCnQ9196I
   io2wIXeRzDlsNePW1m/h8BHUfpxtL12rLMe6/fok3fQh0NZRmiuxfMHUu
   6aUrd6JexpoRYUqLen0Os1Q98Ortaa2/j+zWbmAm/La0EL+Sv2yTBmiwB
   lHkrUW231JzYvZqIEyWOZ07HRwyY9MVNhLuaOzLiLKz8FfckYUyEzwUzp
   HBii8UuqeRaXtA/1Mn8W8NnsMois7Zi50t8BwCIOAeWjatMJTkI4sc5CY
   g==;
X-CSE-ConnectionGUID: z1yiH9phQWuYrZhd+I7Aiw==
X-CSE-MsgGUID: X0zu+wO5S3aqrAFHtzmkyw==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="7539287"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="7539287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:24 -0700
X-CSE-ConnectionGUID: BYDsrZNkTaC/LT2slJN6iw==
X-CSE-MsgGUID: /OB8Lz1iQYq2CjAHV31VPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000";
   d="scan'208";a="18343217"
Received: from makulkar-mobl1.amr.corp.intel.com (HELO [10.212.52.18])
 ([10.212.52.18])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 05:50:22 -0700
Message-ID: <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
Date: Tue, 2 Apr 2024 09:02:26 -0500
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
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87zfuc7gya.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3W3Q75W5P5GNELHUD52NJ6UIXGTTKHYN
X-Message-ID-Hash: 3W3Q75W5P5GNELHUD52NJ6UIXGTTKHYN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3W3Q75W5P5GNELHUD52NJ6UIXGTTKHYN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/1/24 19:21, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
> Thank you for your review
> 
>> The problem I have is with the following code (not shown with diff)
>>
>> 	if (dai_link->playback_only)
>> 		has_capture = 0;
>>
>> 	if (dai_link->capture_only)
>> 		has_playback = 0;
>>
>> So with this grand unification, all the loops above may make a decision
>> that could be overridden by these two branches.
>>
>> This was not the case before for DPCM, all the 'has_capture' and
>> 'has_playback' variables were used as a verification of the dai_link
>> settings with an error thrown e.g. if the dpcm_playback was set without
>> any DAIs supporting playback.
> 
> I could understand so far.
> 
>> Now the dailink settings are used unconditionally. There is one warning
>> added if there are no settings for a dailink, but we've lost the
>> detection of a mismatch between dailink and the set of cpu/codec dais
>> that are part of this dailink.
> 
> But sorry I could understand this.
> 
> 	"There is one warning added if there are no settings for a dailink"
> 
> By [01/16] patch ? I think no warning is added. Or do you mean by [15/16]
> patch ?

Yes I looked at the entire series, it's just too complicated to look
with diff.

> 
> 	"we've lost the detection of a mismatch between dailink and the
> 	 set of cpu/codec dais that are part of this dailink"
> 
> Sorry I couldn't understand about this.
> Which mismatch detection we lost ?? Concrete sample / code / image
> is very helpful for me to well understanding.

With the older code, if the dpcm_playback was set for the dailink but
there isn't any dai connected to support playback, an error was thrown.

With the new code, if playback_only is set but there isn't any dai
connected, there is no error thrown, is there?

The point is that these flags are sometimes set in the machine driver,
sometimes set in the framework, and the open is which one has the priority.
