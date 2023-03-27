Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2831D6C9BAC
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 09:10:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA220836;
	Mon, 27 Mar 2023 09:09:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA220836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679901035;
	bh=EMz9KMFHLtCenWCBhnG99qT0LCx75jII0kKAxwJMMmM=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=l9F3I5w1iC1Pn+kOlHsO45RNrXpLBPPAGLlmndCpn9jgc6DINHlzd7iE11+eoF7yW
	 fkSWq9cKLuTzLmVxAuyplR0oUynObOtnYzV01pPuXI9+PSaurEvglsWBFW6TZJbqa1
	 gEYJJdrWnkHyIGWwEG9/0g3GpG1Mrp8crT4l5EJw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B6002F8024E;
	Mon, 27 Mar 2023 09:09:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE41CF80272; Mon, 27 Mar 2023 09:09:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A8536F800C9
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 09:08:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8536F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=i4092/VB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679900940; x=1711436940;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=EMz9KMFHLtCenWCBhnG99qT0LCx75jII0kKAxwJMMmM=;
  b=i4092/VBkVghvrQzNIC1SWjxEewZI2VH3EsXZAd6q09N4V/MllMLO2Gh
   QrGrLhrrbCMRBlSWItQhRChD2X6Ren3kbpjPZZZRTWnn0nBS4otbC72dP
   tR/BafAwU3yvRxKPAf/mWAUEPZDv7+BhL1wMHYTrOmq2tnv0c5vbkrYpy
   R0+iwj++CdTeRfQNdqOzxR4SIWGL+3QaShAicv5ssjEMTRuYRXyMyyFDR
   nTomINkQlmmi6h9XAQS1XTiMOafpzv2oHM3qZ4ADcc1l0+843tyloSoR3
   vnfC4xUl0dQ8eOriUbMl6b31/6nVRETR0TGquzprM3V/kZ8RjgpKxaBBi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="402792417"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="402792417"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 00:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="633513725"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400";
   d="scan'208";a="633513725"
Received: from asebenix-mobl1.ger.corp.intel.com (HELO [10.251.223.110])
 ([10.251.223.110])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2023 00:08:53 -0700
Message-ID: <5a284544-bc08-a7e3-7be3-48641762ba44@linux.intel.com>
Date: Mon, 27 Mar 2023 10:09:27 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: soc-dapm.c: tidyup dapm_connect_dai_pair()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <87ilen6ni4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EZYOS4VSNKYRMYGP5HXS3J5AFCANPV5D
X-Message-ID-Hash: EZYOS4VSNKYRMYGP5HXS3J5AFCANPV5D
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EZYOS4VSNKYRMYGP5HXS3J5AFCANPV5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 27/03/2023 03:34, Kuninori Morimoto wrote:
> dapm_connect_dai_pair() handles
> "Normal/Codec2Codec" x "CPU/Codec" x "Playback/Capture".
> 
> (A) is "Codec2Codec" case of "CPU"   widget x "Playback/Capture",
> (B) is "Normal"      case of "CPU"   widget x "Playback/Capture",
> (C) is each          case of "Codec" widget.
> 
> (X) is handling "Playback" case DAI connecting,
> (Y) is handling "Capture"  case DAI connecting.
> 
> 	static void dapm_connect_dai_pair(...)
> 	{
> 		...
> 
> (A)		if (dai_link->params) {
> 			playback_cpu	= ...
> 			capture_cpu	= ...
> (B)		} else {
> 			playback_cpu	= ...
> 			capture_cpu	= ...
> 		}
> 
>  ^		/* connect BE DAI playback if widgets are valid */
>  |		stream = SNDRV_PCM_STREAM_PLAYBACK;
>  | (C)		codec = codec_dai->playback_widget;
>  |
>  |		if (playback_cpu && codec) {
> (X)			if (dai_link->params && !rtd->c2c_widget[stream]) {
>  |				...
>  |			}
>  |
>  | (z)			dapm_connect_dai_routes(...);
>  v		}
> 
> 	capture:
>  ^		/* connect BE DAI capture if widgets are valid */
>  |		stream = SNDRV_PCM_STREAM_CAPTURE;
>  | (C)		codec = codec_dai->capture_widget;
>  |
>  |		if (codec && capture_cpu) {
> (Y)			if (dai_link->params && !rtd->c2c_widget[stream]) {
>  |				...
>  |			}
>  |
>  | (z)			dapm_connect_dai_routes(...);
>  v		}
> 	}
> 
> (X) part and (Y) part are almost same.
> Main purpose of these parts (and this function) is calling
> dapm_connect_dai_routes() (= z) on each cases.
> The difference is "parameter"
> (= Normal/Codec2Codec x CPU/Codec x Playback/Capture).
> 
> This patch cleanup these, but nothing changed for meaning.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-dapm.c | 93 +++++++++++++++++++++++++++-----------------
>  1 file changed, 58 insertions(+), 35 deletions(-)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 3fa30a3afec2..064547e77063 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -4325,60 +4325,83 @@ static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
>  	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
>  }
>  
> +static int convert_stream(int stream)
> +{
> +	if (stream == SNDRV_PCM_STREAM_CAPTURE)
> +		return SNDRV_PCM_STREAM_PLAYBACK;
> +
> +	return SNDRV_PCM_STREAM_CAPTURE;
> +}

int get_cpu_stream_direction(struct snd_soc_dai_link *dai_link,
			     int stream)
{
	if (!dai_link->c2c_params)
		return stream;

	if (stream == SNDRV_PCM_STREAM_CAPTURE)
		return SNDRV_PCM_STREAM_PLAYBACK;

	return SNDRV_PCM_STREAM_CAPTURE;
}

Add the comments here and use this to set the stream_cpu?

The convert_stream() is an odd choice for the functionality.

> +
>  static void dapm_connect_dai_pair(struct snd_soc_card *card,
>  				  struct snd_soc_pcm_runtime *rtd,
>  				  struct snd_soc_dai *codec_dai,
>  				  struct snd_soc_dai *cpu_dai)
>  {
>  	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> -	struct snd_soc_dapm_widget *dai, *codec, *playback_cpu, *capture_cpu;
> -	struct snd_pcm_substream *substream;
> -	struct snd_pcm_str *streams = rtd->pcm->streams;
> +	struct snd_soc_dapm_widget *codec, *cpu;
> +	struct snd_soc_dai *src_dai[]		= { cpu_dai,	codec_dai };
> +	struct snd_soc_dai *sink_dai[]		= { codec_dai,	cpu_dai };
> +	struct snd_soc_dapm_widget **src[]	= { &cpu,	&codec };
> +	struct snd_soc_dapm_widget **sink[]	= { &codec,	&cpu };
> +	char *widget_name[]			= { "playback",	"capture" };
>  	int stream;
>  
> -	if (dai_link->c2c_params) {
> -		playback_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
> -		capture_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
> -	} else {
> -		playback_cpu	= snd_soc_dai_get_widget_playback(cpu_dai);
> -		capture_cpu	= snd_soc_dai_get_widget_capture(cpu_dai);
> -	}
> +	for_each_pcm_streams(stream) {
> +		int stream_cpu, stream_codec;
>  
> -	/* connect BE DAI playback if widgets are valid */
> -	stream = SNDRV_PCM_STREAM_PLAYBACK;
> -	codec = snd_soc_dai_get_widget(codec_dai, stream);
> -
> -	if (playback_cpu && codec) {
> -		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
> -			substream = streams[stream].substream;
> -			dai = snd_soc_dapm_new_dai(card, substream, "playback");
> -			if (IS_ERR(dai))
> -				goto capture;
> -			rtd->c2c_widget[stream] = dai;
> +		if (dai_link->c2c_params) {
> +			/*
> +			 * [Codec2Codec]
> +			 *
> +			 * Playback
> +			 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
> +			 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
> +			 *
> +			 * Capture
> +			 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
> +			 *	Codec: SNDRV_PCM_STREAM_CAPTURE
> +			 */
> +			stream_cpu   = convert_stream(stream);
> +			stream_codec = stream;
> +		} else {
> +			/*
> +			 * [Normal]
> +			 *
> +			 * Playback
> +			 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
> +			 *	Codec: SNDRV_PCM_STREAM_PLAYBACK
> +			 *
> +			 * Playback
> +			 *	CPU  : SNDRV_PCM_STREAM_CAPTURE
> +			 *	Codec: SNDRV_PCM_STREAM_CAPTURE
> +			 */
> +			stream_cpu   = stream;
> +			stream_codec = stream;
>  		}
>  
> -		dapm_connect_dai_routes(&card->dapm, cpu_dai, playback_cpu,
> -					rtd->c2c_widget[stream],
> -					codec_dai, codec);
> -	}
> +		/* connect BE DAI playback if widgets are valid */
> +		cpu	= snd_soc_dai_get_widget(cpu_dai,	stream_cpu);
> +		codec	= snd_soc_dai_get_widget(codec_dai,	stream_codec);
>  
> -capture:
> -	/* connect BE DAI capture if widgets are valid */
> -	stream = SNDRV_PCM_STREAM_CAPTURE;
> -	codec = snd_soc_dai_get_widget(codec_dai, stream);
> +		if (!cpu || !codec)
> +			continue;
>  
> -	if (codec && capture_cpu) {
> +		/* special handling for [Codec2Codec] */
>  		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
> -			substream = streams[stream].substream;
> -			dai = snd_soc_dapm_new_dai(card, substream, "capture");
> +			struct snd_pcm_substream *substream = rtd->pcm->streams[stream].substream;
> +			struct snd_soc_dapm_widget *dai = snd_soc_dapm_new_dai(card, substream,
> +									       widget_name[stream]);
> +
>  			if (IS_ERR(dai))
> -				return;
> +				continue;
> +
>  			rtd->c2c_widget[stream] = dai;
>  		}
>  
> -		dapm_connect_dai_routes(&card->dapm, codec_dai, codec,
> +		dapm_connect_dai_routes(&card->dapm, src_dai[stream], *src[stream],
>  					rtd->c2c_widget[stream],
> -					cpu_dai, capture_cpu);
> +					sink_dai[stream], *sink[stream]);
>  	}
>  }
>  

-- 
Péter
