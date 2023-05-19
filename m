Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC1270944E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 May 2023 11:59:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 60DD1825;
	Fri, 19 May 2023 11:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 60DD1825
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684490341;
	bh=FE8s+NBZqQ/ssG1pt++a2gCcj+eyY0JJylveLlt/h9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WkxOw1/jbxszfCShzpPYLsItCN0JEqFqxeQkdCnEe+QIZHWaBwoEzs4DTyJ65sMlu
	 nV7OYdX31W5b3aKrWXxw3IXDGrcQ3eZP8OnCoC+ScF65FvB9WrgQrCVpNSW3ycs8lR
	 7XwTQ8t/jAMWqZos3EGdLHMu3scO4AtnRi1IVWok=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 211EFF80549; Fri, 19 May 2023 11:57:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A76BBF8024E;
	Fri, 19 May 2023 11:57:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0BBC1F8025A; Fri, 19 May 2023 11:57:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E3A6F8016D
	for <alsa-devel@alsa-project.org>; Fri, 19 May 2023 11:57:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E3A6F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SdRkx3lw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684490262; x=1716026262;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=FE8s+NBZqQ/ssG1pt++a2gCcj+eyY0JJylveLlt/h9A=;
  b=SdRkx3lwp54hten4Gc0mQz8/aGJCHFla5lKmZ8bTG4nOpGli3cm5t2ux
   9vEc5e4GfDxXlU9nWqbvFxaD7mXLO4zRVFLVkMnBZa6mccY/U9a5j4+4W
   QQFqPumqO6tjoijXaCkkXyab1Zo7QSG6Djkb7ALt9fx2TjPWPupEKRhar
   +6FKtOwiPzjFafvelgxNkXAYOOthTP5UiPgLG3kklUPr+Qtcb1sawa3Eu
   6PqllOgNWX72wynIayFCIuIrFt8xy9GzxrxI9NOKPtUi+Q4q8QBQsUqr+
   P8wgqW73V61aJ68YAvH+elpZPhrjJOHCXmjIhWYqu5ktazYGsOFBi3tQT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="380544406"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="380544406"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:57:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10714"; a="652994429"
X-IronPort-AV: E=Sophos;i="6.00,176,1681196400";
   d="scan'208";a="652994429"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 May 2023 02:57:30 -0700
Message-ID: <2e84d6f3-902f-d6f3-0084-ddfbd61ffa1f@linux.intel.com>
Date: Fri, 19 May 2023 11:57:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 08/20] ASoC: soc-pcm.c: cleanup soc_get_playback_capture()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
 <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87r0rep4we.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VWOPSGDM5YSH73CSHAK226G6ZX4ZDTPN
X-Message-ID-Hash: VWOPSGDM5YSH73CSHAK226G6ZX4ZDTPN
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VWOPSGDM5YSH73CSHAK226G6ZX4ZDTPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 5/18/2023 7:47 AM, Kuninori Morimoto wrote:
> Current soc_get_playback_capture() (A) is checking playback/capture
> availability for DPCM (X) / Normal (Y) / Codec2Codec (Z) connections.
> 
> (A)	static int soc_get_playback_capture(...)
> 	{
> 		...
>   ^		if (dai_link->dynamic || dai_link->no_pcm) {
>   |			...
>   |(a)			if (dai_link->dpcm_playback) {
>   |				...
>   | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>   |(*)					...
>   | v				}
>   |				...
> (X)			}
>   |(b)			if (dai_link->dpcm_capture) {
>   |				...
>   | ^				for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
>   |(*)					...
>   | v				}
>   |				...
>   v			}
> 		} else {
>   ^ ^			/* Adapt stream for codec2codec links */
>   |(Z)			int cpu_capture = ...
>   | v			int cpu_playback = ...
> (Y)
>   | ^			for_each_rtd_codec_dais(rtd, i, codec_dai) {
>   |(*)				...
>   v v			}
> 		}
> 		...
> 	}
> 
> (*) part is checking each DAI's availability.
> 
> At first, (X) part is for DPCM, and it checks playback/capture
> availability if dai_link has dpcm_playback/capture flag (a)(b).
> But we are already using playback/capture_only flag.
> for Normal (Y) and Codec2Codec (Z). We can use this flags for DPCM too.
> 
> Before				After
> 	dpcm_playback = 1;	=>	/* no flags */
> 	dpcm_capture  = 1;
> 
> 	dpcm_playback = 1;	=>	playback_only = 1;
> 
> 	dpcm_capture = 1;	=>	capture_only = 1;
> 
> This patch enables both flags case, but dpcm_playback/capture flags
> will be removed if all driver were switched to new playback/capture_only
> flags.
> 
> Here, CPU <-> Codec relationship is like this
> 
> 	DPCM
> 		[CPU/dummy]-[dummy/Codec]
> 		^^^^^^^^^^^
> 	Normal
> 		[CPU/Codec]
> 		^^^^^^^^^^^
> 
> (X) part is checking only CPU       DAI, and
> (Y) part is checking both CPU/Codec DAI
> 
> This means (X)/(Y) are checking same position.
> Because dammy DAI is always available,
> we can share same code for all cases (= X/Y/Z).
> 
> This patch merge these.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-pcm.c | 75 +++++++++++++--------------------------------
>   1 file changed, 22 insertions(+), 53 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index af5d4e1effdf..f47ddf660c57 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2732,7 +2732,10 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   				    int *playback, int *capture)
>   {
>   	struct snd_soc_dai_link *dai_link = rtd->dai_link;
> +	struct snd_soc_dai *codec_dai;
>   	struct snd_soc_dai *cpu_dai;
> +	int cpu_capture  = SNDRV_PCM_STREAM_CAPTURE;
> +	int cpu_playback = SNDRV_PCM_STREAM_PLAYBACK;
>   	int tmp_playback = 0;
>   	int tmp_capture  = 0;
>   	int i;
> @@ -2748,61 +2751,27 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
>   		return -EINVAL;
>   	}
>   
> -	if (dai_link->dynamic || dai_link->no_pcm) {
> -		int stream;
> -
> -		if (dai_link->dpcm_playback) {
> -			stream = SNDRV_PCM_STREAM_PLAYBACK;
> +	/* Adapt stream for codec2codec links */
> +	if (dai_link->c2c_params) {
> +		cpu_capture  = SNDRV_PCM_STREAM_PLAYBACK;
> +		cpu_playback = SNDRV_PCM_STREAM_CAPTURE;
> +	}
>   
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					tmp_playback = 1;
> -					break;
> -				}
> -			}
> -			if (!tmp_playback) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support playback for stream %s\n",
> -					dai_link->stream_name);
> -				return -EINVAL;
> -			}
> -		}
> -		if (dai_link->dpcm_capture) {
> -			stream = SNDRV_PCM_STREAM_CAPTURE;
> +	/* REMOVE ME */
> +	if (dai_link->dpcm_playback && !dai_link->dpcm_capture)
> +		dai_link->playback_only = 1;
> +	if (!dai_link->dpcm_playback && dai_link->dpcm_capture)
> +		dai_link->capture_only = 1;
>   
> -			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> -				if (snd_soc_dai_stream_valid(cpu_dai, stream)) {
> -					tmp_capture = 1;
> -					break;
> -				}
> -			}
> -
> -			if (!tmp_capture) {
> -				dev_err(rtd->card->dev,
> -					"No CPU DAIs support capture for stream %s\n",
> -					dai_link->stream_name);
> -				return -EINVAL;
> -			}
> -		}
> -	} else {
> -		struct snd_soc_dai *codec_dai;
> -
> -		/* Adapt stream for codec2codec links */
> -		int cpu_capture = dai_link->c2c_params ?
> -			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
> -		int cpu_playback = dai_link->c2c_params ?
> -			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
> -
> -		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> -			cpu_dai = asoc_rtd_to_cpu(rtd, i);
> -
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> -				tmp_playback = 1;
> -			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> -			    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> -				tmp_capture = 1;
> -		}
> +	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
> +		codec_dai = asoc_rtd_to_codec(rtd, i); /* get paired codec */
> +
> +		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
> +		    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
> +			tmp_playback = 1;
> +		if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_CAPTURE) &&
> +		    snd_soc_dai_stream_valid(cpu_dai,   cpu_capture))
> +			tmp_capture = 1;
>   	}
>   
>   	if (dai_link->playback_only)

I put the patchset to test and it fails to enumerate devices on our 
platforms.

Bisect leads me to this patch, here is dmesg fragment:

[   34.609909] snd_soc_avs:avs_component_probe: avs_hdaudio 
avs_hdaudio.2: probing hdaudioB0D2-platform card hdaudioB0D2
[   34.612274] snd_soc_core:soc_tplg_load_header: avs_hdaudio 
avs_hdaudio.2: ASoC: Got 0x490 bytes of type 8 version 0 vendor 0 at pass 0
[   34.612456] snd_soc_core:soc_tplg_load_header: avs_hdaudio 
avs_hdaudio.2: ASoC: Got 0x7ec bytes of type 5 version 0 vendor 0 at pass 3
[   34.612477] snd_soc_core:soc_tplg_dapm_widget_elems_load: avs_hdaudio 
avs_hdaudio.2: ASoC: adding 6 DAPM widgets
[   34.612493] snd_soc_core:soc_tplg_dapm_widget_create: avs_hdaudio 
avs_hdaudio.2: ASoC: creating DAPM widget hdmi1_fe id 17
[   34.612774] snd_soc_core:soc_tplg_dapm_widget_create: avs_hdaudio 
avs_hdaudio.2: ASoC: creating DAPM widget hdmi1_be id 17
[   34.613025] snd_soc_core:soc_tplg_dapm_widget_create: avs_hdaudio 
avs_hdaudio.2: ASoC: creating DAPM widget hdmi2_fe id 17
[   34.613297] snd_soc_core:soc_tplg_dapm_widget_create: avs_hdaudio 
avs_hdaudio.2: ASoC: creating DAPM widget hdmi2_be id 17
[   34.613552] snd_soc_core:soc_tplg_dapm_widget_create: avs_hdaudio 
avs_hdaudio.2: ASoC: creating DAPM widget hdmi3_fe id 17
[   34.613823] snd_soc_core:soc_tplg_dapm_widget_create: avs_hdaudio 
avs_hdaudio.2: ASoC: creating DAPM widget hdmi3_be id 17
[   34.614077] snd_soc_core:soc_tplg_load_header: avs_hdaudio 
avs_hdaudio.2: ASoC: Got 0xab0 bytes of type 7 version 0 vendor 0 at pass 4
[   34.614272] snd_soc_core:snd_soc_register_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Registered DAI 'HDMI1-dai'
[   34.614290] snd_soc_core:snd_soc_dapm_new_dai_widgets: snd_soc_avs 
0000:00:0e.0: ASoC: adding HDMI1-playback widget
[   34.614453] snd_soc_core:snd_soc_add_pcm_runtime: avs_hdaudio 
avs_hdaudio.2: ASoC: binding HDMI1
[   34.615192] snd_soc_core:snd_soc_register_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Registered DAI 'HDMI2-dai'
[   34.615210] snd_soc_core:snd_soc_dapm_new_dai_widgets: snd_soc_avs 
0000:00:0e.0: ASoC: adding HDMI2-playback widget
[   34.615371] snd_soc_core:snd_soc_add_pcm_runtime: avs_hdaudio 
avs_hdaudio.2: ASoC: binding HDMI2
[   34.616060] snd_soc_core:snd_soc_register_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Registered DAI 'HDMI3-dai'
[   34.616077] snd_soc_core:snd_soc_dapm_new_dai_widgets: snd_soc_avs 
0000:00:0e.0: ASoC: adding HDMI3-playback widget
[   34.616235] snd_soc_core:snd_soc_add_pcm_runtime: avs_hdaudio 
avs_hdaudio.2: ASoC: binding HDMI3
[   34.616858] snd_soc_core:soc_tplg_pcm_elems_load: avs_hdaudio 
avs_hdaudio.2: ASoC: adding 3 PCM DAIs
[   34.616876] snd_soc_core:soc_tplg_load_header: avs_hdaudio 
avs_hdaudio.2: ASoC: Got 0x4a4 bytes of type 4 version 0 vendor 0 at pass 5
[   34.616895] snd_soc_core:soc_tplg_dapm_graph_elems_load: avs_hdaudio 
avs_hdaudio.2: ASoC: adding 9 DAPM routes for index 0
[   34.617601] avs_hdaudio avs_hdaudio.2: ASoC: Parent card not yet 
available, widget card binding deferred
[   34.618153] snd_soc_core:snd_soc_add_pcm_runtime: avs_hdaudio 
avs_hdaudio.2: ASoC: binding hdaudioB0D2 link0
[   34.618724] snd_soc_core:snd_soc_add_pcm_runtime: avs_hdaudio 
avs_hdaudio.2: ASoC: binding hdaudioB0D2 link1
[   34.619221] snd_soc_core:snd_soc_add_pcm_runtime: avs_hdaudio 
avs_hdaudio.2: ASoC: binding hdaudioB0D2 link2
[   34.619973]  probing-LINK: substream (null) has no playback, no capture
[   34.620016] avs_hdaudio avs_hdaudio.2: ASoC: can't create pcm (null) :-22
[   34.620196] snd_soc_core:snd_soc_unregister_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Unregistered DAI 'hdaudioB0D2-cpu0'
[   34.620309] snd_soc_core:snd_soc_unregister_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Unregistered DAI 'hdaudioB0D2-cpu1'
[   34.620419] snd_soc_core:snd_soc_unregister_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Unregistered DAI 'hdaudioB0D2-cpu2'
[   34.621254] snd_soc_core:snd_soc_unregister_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Unregistered DAI 'HDMI3-dai'
[   34.621837] snd_soc_core:snd_soc_unregister_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Unregistered DAI 'HDMI2-dai'
[   34.622704] snd_soc_core:snd_soc_unregister_dai: snd_soc_avs 
0000:00:0e.0: ASoC: Unregistered DAI 'HDMI1-dai'
[   34.623620] snd_soc_core:snd_soc_unregister_dai: snd_hda_codec_hdmi 
hdaudioB0D2: ASoC: Unregistered DAI 'HDMI 0'
[   34.623695] snd_soc_core:snd_soc_unregister_dai: snd_hda_codec_hdmi 
hdaudioB0D2: ASoC: Unregistered DAI 'HDMI 1'
[   34.623769] snd_soc_core:snd_soc_unregister_dai: snd_hda_codec_hdmi 
hdaudioB0D2: ASoC: Unregistered DAI 'HDMI 2'
[   34.624779] snd_hda_core:snd_hdac_display_power: snd_soc_avs 
0000:00:0e.0: display power disable
[   34.628057] avs_hdaudio: probe of avs_hdaudio.2 failed with error -22


