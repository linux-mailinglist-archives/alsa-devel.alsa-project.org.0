Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86055894091
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 18:31:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8EDBD22CB;
	Mon,  1 Apr 2024 18:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8EDBD22CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711989094;
	bh=nYxRI4YPjJaafHMZxnvW480v5rMNRirBAjGbT0asLOU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=Ek7U8ZK0d50CRPAjYaX3CXYFbNs78wUtHlflBxxnrJC3yOxHwuz9h9pLEwZHqlFvu
	 CBK+qNjAprAuZ8RW6b43CkB4kuUVfwjltbKDxr178GAo6Zlkfskkybdzplb1ccxnkP
	 HoeaDmxR14odV6lztbBlzaHgaOHM9JHK7EGR7ReU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66076F8057A; Mon,  1 Apr 2024 18:31:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2FB9CF805A8;
	Mon,  1 Apr 2024 18:31:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CDF39F8056F; Mon,  1 Apr 2024 18:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53E7CF80130
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 18:30:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53E7CF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W49VVXao
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989048; x=1743525048;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=nYxRI4YPjJaafHMZxnvW480v5rMNRirBAjGbT0asLOU=;
  b=W49VVXaovysITCQt/msG/TQgZsXw5pvPkhBgtI1jq3LhPMYQOUqovPjx
   8WTEsFazEYXgiBToD9YbnaKSFQ2GsGDyQOhPodKzBZSNzEacy6WI7mznu
   PBzWr8CUtTSroIGiHU4/K3aOzrQ7t/HX8nR2j23SIFS+1OBR0XFTPcE8u
   W07eMJTm0BYF58YCed10efGhAx0u6ah5u4PQ5ugxX8Gg0C5Wo3Upegotm
   THQv6Tcrq7DDAyB7m4MALpAQtq0s59/8bxpI+qLFrgJCAH2Ywh79ukgyE
   50yV9qe05yYMWhNNVIztoChcAQAylwvwhZBpTAZyV2cMB8XpOsVQ029YC
   g==;
X-CSE-ConnectionGUID: 80l0xBi+R7G+05A3BlvHjQ==
X-CSE-MsgGUID: 0nRCFeUPRRG/PdNB8hAbUA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083710"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="10083710"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="18224572"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:38 -0700
Message-ID: <b4b37541-b67f-4593-9fd5-fc6242a0673a@linux.intel.com>
Date: Mon, 1 Apr 2024 11:10:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/16] ASoC: soc-pcm.c: cleanup
 soc_get_playback_capture()
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
 <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87y19xudor.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4YJQYSYOTBHAQ6ROVDEHUKSXJBZ5HG2J
X-Message-ID-Hash: 4YJQYSYOTBHAQ6ROVDEHUKSXJBZ5HG2J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4YJQYSYOTBHAQ6ROVDEHUKSXJBZ5HG2J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/31/24 19:30, Kuninori Morimoto wrote:
> Current soc_get_playback_capture() (A) is checking playback/capture
> availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.
> 
> (A)	static int soc_get_playback_capture(...)
> 	{
> 		...
>  ^		if (dai_link->dynamic || dai_link->no_pcm) {
>  |			...
>  |(a)			if (dai_link->dpcm_playback) {
>  |				...
>  | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>  |(*)					...
>  | v				}
>  |				...
> (X)			}
>  |(b)			if (dai_link->dpcm_capture) {
>  |				...
>  | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>  |(*)					...
>  | v				}
>  |				...
>  v			}
> 		} else {
>  ^ ^			/* Adapt stream for codec2codec links */
>  |(Z)			int cpu_capture = ...
>  | v			int cpu_playback = ...
> (Y)
>  | ^			for_each_rtd_ch_maps(rtd, i, ch_maps) {
>  |(*)				...
>  v v			}
> 		}
> 		...
> 	}
> 
> (*) part is checking each DAI's availability.
> 
> At first, (X) part is for DPCM, and it checks playback/capture
> availability if dai_link has dpcm_playback/capture flag (a)(b).
> But we are already using playback/capture_only flag for Normal (Y) and
> Codec2Codec (Z). We can use this flags for DPCM too.
> 
> Before				After
> 	dpcm_playback = 1;	=>	/* no flags */
> 	dpcm_capture  = 1;
> 
> 	dpcm_playback = 1;	=>	playback_only = 1;
> 
> 	dpcm_capture  = 1;	=>	capture_only = 1;
> 
> 	dpcm_playback = 0;	=>	error
> 	dpcm_capture  = 0;
> 
> This patch convert dpcm_ flags to _only flag, and dpcm_ flag will be
> removed if all driver switched to _only flags.
> 
> Here, CPU <-> Codec relationship is like this
> 
> 	DPCM
> 		[CPU/dummy]-[dummy/Codec]
> 		^^^^         ^^^^^
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
> 
> DPCM   part (X) is checking only CPU       DAI, and
> Normal part (Y) is checking both CPU/Codec DAI
> 
> Here, validation check on dummy DAI is always true,
> Therefor we want to expand validation check to all cases.
> 
> One note here is that unfortunately DPCM BE Codec had been no validation
> check before, but all cases validation check breaks compatibility on
> some vender's devices. Thus this patch ignore it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 90 +++++++++++++++++++--------------------------
>  1 file changed, 38 insertions(+), 52 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 77ee103b7cd1..8761ae8fc05f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2793,7 +2793,12 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  				    int *playback, int *capture)
>  {
>  	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +	struct snd_soc_dai_link_ch_map *ch_maps;
>  	struct snd_soc_dai *cpu_dai;
> +	struct snd_soc_dai *codec_dai;
> +	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
> +	int cpu_playback;
> +	int cpu_capture;
>  	int has_playback = 0;
>  	int has_capture  = 0;
>  	int i;
> @@ -2803,65 +2808,46 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  		return -EINVAL;
>  	}
>  
> +	/* REMOVE ME */
>  	if (dai_link->dynamic || dai_link->no_pcm) {
> -		int stream;
> -
> -		if (dai_link->dpcm_playback) {
> -			stream = SNDRV_PCM_STREAM_PLAYBACK;
> -
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					has_playback = 1;
> -					break;
> -				}
> -			}
> -			if (!has_playback) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support playback for stream %s\n",
> -					dai_link->stream_name);
> -				return -EINVAL;
> -			}
> +		if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
> +			dai_link->playback_only = 1;
> +		if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
> +			dai_link->capture_only = 1;
> +		if (!dai_link->dpcm_playback && !dai_link->dpcm_capture) {
> +			dev_err(rtd->dev, "no dpcm_playback/capture are selected\n");
> +			return -EINVAL;
>  		}
> -		if (dai_link->dpcm_capture) {
> -			stream = SNDRV_PCM_STREAM_CAPTURE;
> +	}
>  
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					has_capture = 1;
> -					break;
> -				}
> -			}
> +	/* Adapt stream for codec2codec links */
> +	cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
> +	cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
>  
> -			if (!has_capture) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support capture for stream %s\n",
> -					dai_link->stream_name);
> -				return -EINVAL;
> -			}
> -		}
> -	} else {
> -		struct snd_soc_dai_link_ch_map *ch_maps;
> -		struct snd_soc_dai *codec_dai;
> -
> -		/* Adapt stream for codec2codec links */
> -		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
> -		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
> +	/*
> +	 * see
> +	 *	soc.h :: [dai_link->ch_maps Image sample]
> +	 */
> +	for_each_rtd_ch_maps(rtd, i, ch_maps) {
> +		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
>  
>  		/*
> -		 * see
> -		 *	soc.h :: [dai_link->ch_maps Image sample]
> +		 * FIXME
> +		 *
> +		 * DPCM BE Codec has been no checked before.
> +		 * It should be checked, but it breaks compatibility.
> +		 * It ignores BE Codec here, so far.
>  		 */
> -		for_each_rtd_ch_maps(rtd, i, ch_maps) {
> -			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> -			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> -
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> -				has_playback = 1;
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> -				has_capture = 1;
> -		}
> +		if (dai_link->no_pcm)
> +			codec_dai = dummy_dai;
> +
> +		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
> +		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +			has_playback = 1;
> +		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
> +		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +			has_capture = 1;
>  	}

The problem I have is with the following code (not shown with diff)

	if (dai_link->playback_only)
		has_capture = 0;

	if (dai_link->capture_only)
		has_playback = 0;

So with this grand unification, all the loops above may make a decision
that could be overridden by these two branches.

This was not the case before for DPCM, all the 'has_capture' and
'has_playback' variables were used as a verification of the dai_link
settings with an error thrown e.g. if the dpcm_playback was set without
any DAIs supporting playback.

Now the dailink settings are used unconditionally. There is one warning
added if there are no settings for a dailink, but we've lost the
detection of a mismatch between dailink and the set of cpu/codec dais
that are part of this dailink.


