Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6F89CAB4
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Apr 2024 19:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D434F23CF;
	Mon,  8 Apr 2024 19:23:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D434F23CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712597032;
	bh=9YZUFujOhMTTG62YTRxcfo0Pxm72VS2PmasBoZHfmRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XRriynR8kwfvgJ+FFn11SnifXVYRkUni7HyQA8f5fEOVTqrtR/SCiFyzr+RKwICaY
	 lE0sNH7fCah7xUP/r06ctOHYfp1+09HuiET3Fv6tSKsuY1EujksKdN2oK0iThEknef
	 EXRY+vepk6syjxc1TZPoV+uH5jjrD0qDJeMvME8A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EC93F805BA; Mon,  8 Apr 2024 19:23:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BA39F805B0;
	Mon,  8 Apr 2024 19:23:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68691F8028B; Mon,  8 Apr 2024 19:23:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4C1BBF80238
	for <alsa-devel@alsa-project.org>; Mon,  8 Apr 2024 19:23:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C1BBF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=aZRUFVI3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712596981; x=1744132981;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=9YZUFujOhMTTG62YTRxcfo0Pxm72VS2PmasBoZHfmRw=;
  b=aZRUFVI3yCaLiTmj1QS4mbrtE2p8o52v9YGJWPP5CC3sBg6V4mUEZeDF
   /5cmCrSC5SRRLw6OzKIMlrEZk4ForaI36ENCvgGkVdr6eGHKlSGmiXA6v
   O1Zdzvr7S/nblecN1Cruj4WiYVIhukW9rSjWRJcfdgcclJD7s2rux6UHn
   sZ9LU4nGer12/ffeERTZqS6W+9UvspDqWDfjWRaxvG4OW91xBs7Gezxl7
   vhm1vxM3L9yhRRWRtq4o8dEJNboDtKMPpZLibvC6gREeSvQ8aKAH+FW33
   VXm4ZGCA8Q5i/StJ6uqwUATozLNCyOvi2Tj5Nbc2mpmxqGIUkH0K1PQI6
   A==;
X-CSE-ConnectionGUID: VNxMNDKESfu3S1KMxS4qrA==
X-CSE-MsgGUID: Yofnv2ENR+Gq3bh5AQ4tGQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="7757441"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="7757441"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:58 -0700
X-CSE-ConnectionGUID: fG6IZotJT4u76Vx3qwpS7A==
X-CSE-MsgGUID: izqID2hnQtuQZJDnjXRadA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000";
   d="scan'208";a="24697450"
Received: from shahsmit-mobl1.amr.corp.intel.com (HELO [10.212.101.141])
 ([10.212.101.141])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 10:22:56 -0700
Message-ID: <acf98b6b-7c18-4f1e-ab8f-039c88679ab9@linux.intel.com>
Date: Mon, 8 Apr 2024 10:34:25 -0500
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
 <600cef67-ad90-4b67-8da7-2006339d430b@linux.intel.com>
 <874jch99m5.wl-kuninori.morimoto.gx@renesas.com>
 <40e23972-6745-48e2-81ae-4b93f2ee2dcc@linux.intel.com>
 <875xwwr60a.wl-kuninori.morimoto.gx@renesas.com>
 <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87sezwecf1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Q7NS2YYNQBZ57DL335BUVWK6JX4I6WQF
X-Message-ID-Hash: Q7NS2YYNQBZ57DL335BUVWK6JX4I6WQF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q7NS2YYNQBZ57DL335BUVWK6JX4I6WQF/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/7/24 22:55, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis, again
> 
>> dpcm_xxx is used to declare that the DAI/dailink is possible to use
>> playback/capture. For example dpcm_playback means the DAI / dailink
>> should playback-able, if not it is error.
>>
>> xxx_only is used to limit the playback/capture.
>> For example the DAI / dailink can use both playback and capture,
>> but want to use playback only for some reasons, we can use playback_only.
> 
> My pervious patch-set was "try to merge dpcm_xxx and xxx_only flag",
> but next patch will be "expand assertion flag to all connection".
> This "assertion flag" was originaly dpcm_xxx.
> 
> In next patch-set, it will assume for example current "dpcm_playback"
> as "playback_assertion". It can be used not only for DPCM, but
> all connection, but is not mandatory option.
> 
> Its pseudo code is like below, but what do you think ?
> 
> 	soc_get_playback_capture(...)
> 	{
> 		...
> 		/*
> 		 * get HW / DAI availability
> 		 */
> 		for_each_rtd_ch_maps(...) {
> 			...
> 			has_playback = xxx;
> 			has_capture  = xxx;
> 		}
> 
> 		/*
> 		 * "xxx_assersion" was "dpcm_xxx" before, but expand to
> 		 * all connection. It is not mandatory option.
> 		 * It will be error if dai_link has xxx_assersion flag,
> 		 * but DAI was not valid
> 		 */
> 		if (dai_link->playback_assertion && !has_playback) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
>  		}
> 		if (dai_link->capture_assertion  && !has_capture) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
> 		}
> 
> 		/*
> 		 * xxx_only flag limits availability. It will indicate warning
> 		 * if DAI was not valid.
> 		 */
> 		if (dai_link->playback_only) {
> 			if (!has_capture)
> 				dev_warn(rtd->dev, ...);
> 			has_capture = 0;
> 		}
> 
> 		if (dai_link->capture_only) {
> 			if (!has_playback)
> 				dev_warn(rtd->dev, ...);
> 			has_playback = 0;
> 		}
> 
> 		/*
> 		 * No Playback, No Capture is error
> 		 */
> 		if (!has_playback && !has_capture) {
> 			dev_err(rtd->dev, ...);
> 			return -EINVAL;
> 		}
> 		...
> 	}

The code looks fine, but what are we trying to achieve?
I thought the idea was to have a single field at the dailink, and with
the example above we would still have two - just like today.
This looks like a lot of code churn in many drivers for limited
benefits. Or I am missing something?
