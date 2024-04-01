Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CAE8894099
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 18:32:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D0652356;
	Mon,  1 Apr 2024 18:31:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D0652356
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711989121;
	bh=We8RhjSoQyKJDk6eS1AbKIbMbdXENaZJi6/IEW4ighM=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=o5t2oTMxhX1gdDjmSbyigWqcXzWrO63BdEFwUPmKkcKntK5PGE8LF1IoMdmEvFnGB
	 EghrZIK4lmSvUERUzrnDCWxZOjKFKLiVNo390PavmvQ07f/gsoFAUQ9Ax+2zJP5jOV
	 KGqaNHhqWAhdsIrug7a//XVAvHz8lWGg/wxylTZ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13FB7F805AC; Mon,  1 Apr 2024 18:31:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EFE81F805D3;
	Mon,  1 Apr 2024 18:31:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2113CF80568; Mon,  1 Apr 2024 18:30:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8EBBF80114
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 18:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8EBBF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=hRQIBRI6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989049; x=1743525049;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=We8RhjSoQyKJDk6eS1AbKIbMbdXENaZJi6/IEW4ighM=;
  b=hRQIBRI6+kD1ZRYuJnANvyhXog8CINoyi1NH6I8OOfptCfgzF4HjE2of
   RHp9Y/y8pEFZ+fkxf8VnRHybSmt7Yzq861OjjK2YdIxjiHoPpSIV54D2f
   gecB/dMfD8IJc2j1tojULH0eTudEnbtKyJMBCuI1LImxijNs0x+qomE0I
   dwKAcGjccdZhNn2zApjqFrkW2sEVR/AIMl7P1B/KiYojLtCx1Y3IXdasp
   AGDGf2jQ8hB/5F6Eb0BV6GFg783cW2uzbzRhH/lZgoTc0hcjhO7e6sOlV
   gKej6mCgB+m9w+VJZRzSRNeOEMfJDNfvu2i5qeLKGu4aDj5o0k27iVJAe
   Q==;
X-CSE-ConnectionGUID: sJpsKgKlRlqmcimYGd5crQ==
X-CSE-MsgGUID: 9uRagJuHSL6VAtr3RPjjCw==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083729"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="10083729"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="18224578"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:41 -0700
Message-ID: <2b75ffc8-cb97-4a5a-bb3d-34b9e9fc3bc5@linux.intel.com>
Date: Mon, 1 Apr 2024 11:12:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/16] ASoC: sof: Replace dpcm_playback/capture to
 playback/capture_only
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
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
 <87ttkludo3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87ttkludo3.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BW4P2KXXY3CJVLRHYKVYTVZL4P7URBZB
X-Message-ID-Hash: BW4P2KXXY3CJVLRHYKVYTVZL4P7URBZB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BW4P2KXXY3CJVLRHYKVYTVZL4P7URBZB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/31/24 19:31, Kuninori Morimoto wrote:
> soc_get_playback_capture() is now handling DPCM and normal comprehensively
> for playback/capture stream. We can use playback/capture_only flag
> instead of using dpcm_playback/capture. This patch replace these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/sof/nocodec.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
> index 34aa8a7cfc7d..a0105c31723c 100644
> --- a/sound/soc/sof/nocodec.c
> +++ b/sound/soc/sof/nocodec.c
> @@ -55,10 +55,6 @@ static int sof_nocodec_bes_setup(struct device *dev,
>  		links[i].no_pcm = 1;
>  		links[i].cpus->dai_name = drv[i].name;
>  		links[i].platforms->name = dev_name(dev->parent);
> -		if (drv[i].playback.channels_min)
> -			links[i].dpcm_playback = 1;
> -		if (drv[i].capture.channels_min)
> -			links[i].dpcm_capture = 1;

Sorry, I don't see where this functionality is now moved?
soc_get_playback_capture() doesn't seem to have any logic based on the
channels_min value?

>  
>  		links[i].be_hw_params_fixup = sof_pcm_dai_link_fixup;
>  	}
