Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D36938AA005
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Apr 2024 18:30:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D6031939;
	Thu, 18 Apr 2024 18:30:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D6031939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1713457840;
	bh=0kP32U7Suy6uQoOJjorW965cKQphIdVvkl6Lvh1uZ0g=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=EsGMAVFuSfJZ1b71fC4/7f2HhT8H0LzH1xOpEsMSx6tY0aNbDVtsw4Lh61wzHNced
	 WBTBoreYTY1tehYWtxaTFmDmFgEQg7YghsC20oUsgzuwEwO2euR1sq2/6uVh+56I2I
	 0bX9sTD5mYGI6jblNH+6uHErZdjNyV4Blc12Q69A=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 91A19F80580; Thu, 18 Apr 2024 18:29:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A948F805A8;
	Thu, 18 Apr 2024 18:29:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7EAAFF8025A; Thu, 18 Apr 2024 18:29:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 386F2F8013D
	for <alsa-devel@alsa-project.org>; Thu, 18 Apr 2024 18:29:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 386F2F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B5QV1A1s
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713457774; x=1744993774;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=0kP32U7Suy6uQoOJjorW965cKQphIdVvkl6Lvh1uZ0g=;
  b=B5QV1A1szocUHQ/rlUTpFVwhBVr84U2U815zKWgdJF4eMDCtzgbSH9Di
   BxSn1mkoUoYjwHuom3biSPG9Xo5tiUV9yD5sRBiys8ydD80uuhp4MKPx1
   u2oTDCzXaWKWMNMiRZ91uzP00AW8Cjiy7PciKZhUV8rWExni3+pq09dWP
   DKACybm+8nFO/2Xx++gpQW9FEgxt8QEDVMSGmx+ezr7kiW5Yf561T9o1H
   nuX0ibY01iS1kuWI8Xz9S+TDS+fuge1ztTWgdcoq1dUjPE9kHBHw4kEG+
   7jxcs/rWnTz1fKI+f/2zmvTFJOgabaO3wkz01JVurxse1EAsRHxuZDKwg
   w==;
X-CSE-ConnectionGUID: Z4iy9xytRtyW713FEnE0gw==
X-CSE-MsgGUID: E3hZXoNTT8erl3yhQwJ+jQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="8882330"
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="8882330"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 09:27:57 -0700
X-CSE-ConnectionGUID: 0j6z5O/LTrGXaM4mMcGzeQ==
X-CSE-MsgGUID: 6pcNHd1SRuG8qoQ9W8Rdxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,212,1708416000";
   d="scan'208";a="23105110"
Received: from rswoodsx-mobl.amr.corp.intel.com (HELO [10.213.167.100])
 ([10.213.167.100])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Apr 2024 09:27:50 -0700
Message-ID: <a1f63065-6d8a-404f-b4be-331d829f802f@linux.intel.com>
Date: Thu, 18 Apr 2024 11:20:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/23] ASoC: soc-pcm: cleanup
 soc_get_playback_capture()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Hans de Goede <hdegoede@redhat.com>,
 Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Jiawei Wang <me@jwang.link>, Jonathan Corbet <corbet@lwn.net>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maso Huang <maso.huang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Vinod Koul <vkoul@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 alsa-devel@alsa-project.org, imx@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <87h6fz8g3u.wl-kuninori.morimoto.gx@renesas.com>
 <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87frvj8g2v.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4HSJZ26K4YK444WOACY5V74WH4Q3SAE6
X-Message-ID-Hash: 4HSJZ26K4YK444WOACY5V74WH4Q3SAE6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4HSJZ26K4YK444WOACY5V74WH4Q3SAE6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


> (X) part is for DPCM, and it checks playback/capture availability
> if dai_link has dpcm_playback/capture flag (a)(b).
> This availability check should be available not only for DPCM, but for
> all connections. But it is not mandatory option. Let's name it as
> assertion.

I don't follow the 'not mandatory option'. Why not make these
'assertions' mandatory? What happens in case the the option is not present?

> In case of having assertion flag, non specific side will be disabled.

Not following the wording, multiple negatives and not clear on what
'side' refers to (direction or DPCM/non-DPCM).

> For example if it has playback_assertion but not have capture_assertion,
> capture will be force disabled.
> 
> 	dpcm_playback -> playabck_assertion = 1
> 
> 	dpcm_capture  -> capture_assertion  = 1
> 
> 	playback_only -> playback_assertion = 1
> 	                 capture_assertion  = 0
> 
> 	capture_only  -> playback_assertion = 0
> 	                 capture_assertion  = 1
> 
> By expanding this assertion to all connections, we can use same code
> for all connections, this means code can be more cleanup.

I see a contradiction between "expanding the assertion to all
connections" and "not mandatory".

> Current validation check on DPCM ignores Codec DAI, but there is no
> reason to do it.  We should check both CPU/Codec in all connection.

"there's no reason to do so" ?

> This patch expands validation check to all cases.
> 
> 	[CPU/xxxx]-[yyyy/Codec]
> 	                 *****
> 
> In many case (not all case), above [xxxx][yyyy] part are "dummy" DAI
> which is always valid for both playback/capture.
> But unfortunately DPCM BE Codec (**** part) had been no validation
> check before, and some Codec driver doesn't have necessary settings for
> it. This means all cases validation check breaks compatibility on some
> vender's drivers. Thus this patch temporary uses dummy DAI at BPCM BE

vendor

> Codec part, and avoid compatibility error. But it should be removed in
> the future.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h |   9 +++
>  sound/soc/soc-pcm.c | 143 +++++++++++++++++++++++++-------------------
>  2 files changed, 92 insertions(+), 60 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 0376f7e4c15d..e604d74f6e33 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -809,6 +809,15 @@ struct snd_soc_dai_link {
>  	unsigned int dpcm_capture:1;
>  	unsigned int dpcm_playback:1;
>  
> +	/*
> +	 * Capture / Playback support assertion. Having assertion flag is not mandatory.
> +	 * In case of having assertion flag, non specific side will be disabled.

again the 'not mandatory' and 'non specific side will be disabled' are
confusing.


> +	/*
> +	 * Assertion check
> +	 *
> +	 * playback_assertion = 0	No assertion check.
> +	 * capture_assertion  = 0	ASoC will use detected playback/capture as-is.
> +	 *				No playback, No capture will be error.

did you mean "this combination will be handled as an error" ?

It's probably best to have a different presentation, to avoid
confusions. Using multiple lines without a separator isn't great.

Suggested example:

playback_assertion = 0 capture_assertion  = 0
this combination will be handled as an error

playback_assertion = 1 capture_assertion  = 0
the DAIs in this dailink must support playback.
ASoC will disable capture.
In other words "playback_only"


> +	 *
> +	 * playback_assertion = 1	DAI must playback available. ASoC will disable capture.
> +	 * capture_assertion  = 0	In other words "playback_only"
> +	 *
> +	 * playback_assertion = 0	DAI must capture available. ASoC will disable playback.
> +	 * capture_assertion  = 1	In other words "capture_only"
> +	 *
> +	 * playback_assertion = 1	DAI must both playback/capture available.
> +	 * capture_assertion  = 1

nit-pick: the 'must X available' does not read well, 'must support X' is
probably what you meant.

> +	 */
> +	if (dai_link->playback_assertion) {
> +		if (!has_playback) {
> +			dev_err(rtd->dev, "%s playback assertion check error\n", dai_link->stream_name);

"invalid playback_assertion" ?

> +			return -EINVAL;
> +		}
> +		/* makes it plyaback only */

typo: playback

> +		if (!dai_link->capture_assertion)
> +			has_capture = 0;
> +	}
> +	if (dai_link->capture_assertion) {
> +		if (!has_capture) {
> +			dev_err(rtd->dev, "%s capture assertion check error\n", dai_link->stream_name);
> +			return -EINVAL;
> +		}
> +		/* makes it capture only */
> +		if (!dai_link->playback_assertion)
> +			has_playback = 0;
> +	}

we probably want a dev_ log when the has_playback/capture is overridden?

>  
> +	/*
> +	 * Detect Mismatch
> +	 */
>  	if (!has_playback && !has_capture) {
>  		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
>  			dai_link->stream_name);
> -
>  		return -EINVAL;
>  	}
>  
