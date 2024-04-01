Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6538940A1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Apr 2024 18:32:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A3BAD2369;
	Mon,  1 Apr 2024 18:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A3BAD2369
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711989143;
	bh=AczA0vvBlhEgaTyRAAogpcX/Z5MI2QUY4sUERwvz+hk=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=idazedhe6S+xP9jSqvacd4eoEKRzK2ZfhMKZsdbk3Jni/Tlb2HcgjoBQ1wuPCTj5e
	 Qu+gnqUh4cLor/r/vgrRIGIozgZaijsLqlcBNrUbuDsQcpg9g8NNvVFSq5RwFJVu+w
	 h6Ft2m67I9sjOVJ2MQtAOGu+mF4VIdwT58/BXyEQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E8E8F80608; Mon,  1 Apr 2024 18:31:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BB15F80612;
	Mon,  1 Apr 2024 18:31:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1AD32F8055C; Mon,  1 Apr 2024 18:31:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A363CF8020D
	for <alsa-devel@alsa-project.org>; Mon,  1 Apr 2024 18:30:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A363CF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=InQV8mRs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711989056; x=1743525056;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=AczA0vvBlhEgaTyRAAogpcX/Z5MI2QUY4sUERwvz+hk=;
  b=InQV8mRsS+mWvDYhjWC7c6sZn4zou40lyD8FqUuEdE1T5MvTC+XZr/ch
   uEI13Z9b4AIRGI0v9WL/qqCDlISRrsJMIeEZfL8MPljlOkjQfdfHv3/YR
   lCRysFdcZcEKIZ52PaPvdyKKn7N0A6NWrpbXz+7Z6bFgzGCxNh5swF1H9
   9bwqfMGcjb5mp3jPxDqks9WJuSRuiJ+koSQRz38vHTtQJ//OUru8IxpJ8
   DzBq2gAvqyiErmWvgZa5slwhtU+21W0xdzuwDUGP8PzbL3Oh0V71k3ABV
   hxOGpMH6R9gsMZhgwwwFc7eWiQc8ZZnyOTeuMqw8s8eYTofXTD5KkdmLq
   g==;
X-CSE-ConnectionGUID: 4k1vpjI3Q46X8JO9RrB+Yg==
X-CSE-MsgGUID: bIe5i+JoQGuLazbaVvxOAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="10083811"
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="10083811"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,172,1708416000";
   d="scan'208";a="18224603"
Received: from anahar-mobl.amr.corp.intel.com (HELO [10.212.2.239])
 ([10.212.2.239])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 09:30:49 -0700
Message-ID: <94a85305-2761-458f-84c9-4d76e59ae11c@linux.intel.com>
Date: Mon, 1 Apr 2024 11:28:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/16] ASoC: soc-pcm: indicate warning if DPCM BE Codec
 has no settings
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
 <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87edbpudm9.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WQ6RLAVCI3DIVV2OSMEDDGFHAKDYVXHM
X-Message-ID-Hash: WQ6RLAVCI3DIVV2OSMEDDGFHAKDYVXHM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WQ6RLAVCI3DIVV2OSMEDDGFHAKDYVXHM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/31/24 19:32, Kuninori Morimoto wrote:
> Historically, ASoC doesn't have validation check for DPCM BE Codec,
> but it should have. Current ASoC is ignoring it same as before,
> but let's indicate the warning about that.
> 
> This warning and code should be removed and cleanuped if DPCM BE Codec
> has necessary settings.
> One of the big user which doesn't have it is Intel.
> 
> 	--- sound/soc/codecs/hda.c ---
> 
> 	static struct snd_soc_dai_driver card_binder_dai = {
> 		.id = -1,
> 		.name = "codec-probing-DAI",
> +		.capture.channels_min = 1,
> +		.playback.channels_min = 1,
> 	};
> 
> 	--- sound/pci/hda/patch_hdmi.c ---
> 
> 	static int generic_hdmi_build_pcms(...)
> 	{
> 		...
> 		for (...) {
> 			...
> +			pstr->channels_min = 1;
> 		}
> 
> 		return 0;
> 	}
> 
> Link: https://lore.kernel.org/r/ab3f0c0a-62fd-a468-b3cf-0e4b59bac6ae@linux.intel.com
> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-pcm.c | 31 +++++++++++++++++++++----------
>  1 file changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index ac42c089815b..95a5e28dead3 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2796,7 +2796,6 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  	struct snd_soc_dai_link_ch_map *ch_maps;
>  	struct snd_soc_dai *cpu_dai;
>  	struct snd_soc_dai *codec_dai;
> -	struct snd_soc_dai *dummy_dai = snd_soc_find_dai(&snd_soc_dummy_dlc);
>  	int cpu_playback;
>  	int cpu_capture;
>  	int has_playback = 0;
> @@ -2817,24 +2816,36 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>  	 *	soc.h :: [dai_link->ch_maps Image sample]
>  	 */
>  	for_each_rtd_ch_maps(rtd, i, ch_maps) {
> -		cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> -		codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +		int cpu_play_t, cpu_capture_t;
> +		int codec_play_t, codec_capture_t;
> +
> +		cpu_dai		= snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
> +		codec_dai	= snd_soc_rtd_to_codec(rtd, ch_maps->codec);
> +
> +		cpu_play_t	= snd_soc_dai_stream_valid(cpu_dai,   cpu_playback);
> +		codec_play_t	= snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK);
> +
> +		cpu_capture_t	= snd_soc_dai_stream_valid(cpu_dai,   cpu_capture);
> +		codec_capture_t	= snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE);
>  
>  		/*
> -		 * FIXME
> +		 * FIXME / CLEAN-UP-ME
>  		 *
>  		 * DPCM BE Codec has been no checked before.
>  		 * It should be checked, but it breaks compatibility.
>  		 * It ignores BE Codec here, so far.
>  		 */
> -		if (dai_link->no_pcm)
> -			codec_dai = dummy_dai;
> +		if ((dai_link->no_pcm) &&
> +		    (!codec_play_t && !codec_capture_t)) {
> +			dev_warn_once(rtd->dev, "DCPM BE Codec has no stream settings (%s)\n",
> +				      codec_dai->name);
> +			codec_play_t	= 1;
> +			codec_capture_t	= 1;
> +		}
>  
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_playback) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK))
> +		if (cpu_play_t && codec_play_t)
>  			has_playback = 1;
> -		if (snd_soc_dai_stream_valid(cpu_dai,   cpu_capture) &&
> -		    snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE))
> +		if (cpu_capture_t && codec_capture_t)
>  			has_capture = 1;
>  	}

All that code should be added earlier, and there's still the issue that
all this code is now overridden by the dai_link settings.
