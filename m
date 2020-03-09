Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F4317EBB9
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 23:10:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 616B2167A;
	Mon,  9 Mar 2020 23:09:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 616B2167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583791829;
	bh=s1sOggaH+D1woUfR6ARdcJJrvRCykyF3nbUfn6FtiCo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PMpX+/Ul6IoviygJD1z8T5eAC3LAyEHZKmNofz3EnuaiazeAvHycHHFcRxYSUd/ny
	 V9Gyp2jNgq4YZX150L+mpjv7ExOukFVZCo2WPHhMpL6Bn32qeU1l0NWbp9GR76RiLa
	 OBicy7TY8DhVJW5vRtroxij7dYWxAZ9wGyQmLlH8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35809F802A8;
	Mon,  9 Mar 2020 23:06:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2276BF80123; Mon,  9 Mar 2020 23:06:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 62CDDF80123;
 Mon,  9 Mar 2020 23:06:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 62CDDF80123
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 15:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="388711059"
Received: from bnkannan-mobl.amr.corp.intel.com (HELO [10.254.6.234])
 ([10.254.6.234])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2020 15:06:07 -0700
Subject: Re: [PATCH 2/3] ASoC: add function parameters to enable forced path
 pruning
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200309170749.32313-1-guennadi.liakhovetski@linux.intel.com>
 <20200309170749.32313-3-guennadi.liakhovetski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <abd05e1e-5aa2-4a12-431d-def505b841a3@linux.intel.com>
Date: Mon, 9 Mar 2020 16:48:49 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200309170749.32313-3-guennadi.liakhovetski@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 sound-open-firmware@alsa-project.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 3/9/20 12:07 PM, Guennadi Liakhovetski wrote:
> This is a preparation for the host part of a virtualised VirtIO audio
> host-guest driver pair. It adds a "mode" parameter to
> soc_dpcm_runtime_update() to allow it to be used when stopping
> streaming in a virtual machine, which requires forced DPCM audio path
> pruning.
> 
> For audio virtualisation the host side driver will be using the vhost
> API, i.e. it will run completely in the kernel. When a guest begins to
> stream audio, the vhost calls snd_soc_runtime_activate() and
> soc_dpcm_runtime_update() to activate an audio path and update audio
> routing. When streaming is stopped, the vhost driver calls
> soc_dpcm_runtime_update() and snd_soc_runtime_deactivate(). The latter
> doesn't work at the moment, because the DPCM doesn't recognise the
> path as inactive. We address this by adding a "mode" parameter to
> soc_dpcm_runtime_update(). If virtualisation isn't used, the current
> behaviour isn't affected.
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

Late feedback I know, but would it make sense to split this patch in two 
where
a) first dpcm_process_paths() take a new force_prune parameter, set to 
false always
b) the prune parameter is modified depending on the update_mode

Besides making it simpler to review it would also allow to check for 
non-regressions/bisect.

> ---
>   include/sound/soc-dpcm.h | 28 ++++++++++++++++----
>   sound/soc/soc-compress.c |  2 +-
>   sound/soc/soc-dapm.c     |  8 +++---
>   sound/soc/soc-pcm.c      | 68 +++++++++++++++++++++++++++++++++---------------
>   4 files changed, 75 insertions(+), 31 deletions(-)
> 
> diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
> index 4022357..aa56118 100644
> --- a/include/sound/soc-dpcm.h
> +++ b/include/sound/soc-dpcm.h
> @@ -61,6 +61,23 @@ enum snd_soc_dpcm_trigger {
>   	SND_SOC_DPCM_TRIGGER_BESPOKE,
>   };
>   
> +/**
> + * enum snd_soc_dpcm_update_mode - mode for calling soc_dpcm_runtime_update()
> + *
> + * @SND_SOC_DPCM_UPDATE_FULL:		default mode, used for mux, mixer, and
> + *					volume widgets
> + * @SND_SOC_DPCM_UPDATE_NEW_ONLY:	a pipeline is starting. Skip checking
> + *					for old paths.
> + * @SND_SOC_DPCM_UPDATE_OLD_ONLY:	a pipeline is shutting down. Skip
> + *					checking for new paths, force old path
> + *					pruning.
> + */
> +enum snd_soc_dpcm_update_mode {
> +	SND_SOC_DPCM_UPDATE_FULL,
> +	SND_SOC_DPCM_UPDATE_NEW_ONLY,
> +	SND_SOC_DPCM_UPDATE_OLD_ONLY,
> +};
> +
>   /*
>    * Dynamic PCM link
>    * This links together a FE and BE DAI at runtime and stores the link
> @@ -133,7 +150,8 @@ struct snd_pcm_substream *
>   	snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream);
>   
>   /* internal use only */
> -int soc_dpcm_runtime_update(struct snd_soc_card *);
> +int soc_dpcm_runtime_update(struct snd_soc_card *card,
> +			    enum snd_soc_dpcm_update_mode mode);
>   
>   #ifdef CONFIG_DEBUG_FS
>   void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd);
> @@ -143,11 +161,11 @@ static inline void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd)
>   }
>   #endif
>   
> -int dpcm_path_get(struct snd_soc_pcm_runtime *fe,
> -	int stream, struct snd_soc_dapm_widget_list **list_);
> +int dpcm_path_get(struct snd_soc_pcm_runtime *fe, int stream,
> +	struct snd_soc_dapm_widget_list **list_);
>   void dpcm_path_put(struct snd_soc_dapm_widget_list **list);
> -int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
> -	int stream, struct snd_soc_dapm_widget_list **list, int new);
> +int dpcm_process_paths(struct snd_soc_pcm_runtime *fe, int stream,
> +	struct snd_soc_dapm_widget_list **list, bool new, bool force_prune);
>   int dpcm_be_dai_startup(struct snd_soc_pcm_runtime *fe, int stream);
>   int dpcm_be_dai_shutdown(struct snd_soc_pcm_runtime *fe, int stream);
>   void dpcm_be_disconnect(struct snd_soc_pcm_runtime *fe, int stream);
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index 50062eb..66d7e78 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -162,7 +162,7 @@ static int soc_compr_open_fe(struct snd_compr_stream *cstream)
>   		dev_dbg(fe->dev, "Compress ASoC: %s no valid %s route\n",
>   			fe->dai_link->name, stream ? "capture" : "playback");
>   	/* calculate valid and active FE <-> BE dpcms */
> -	dpcm_process_paths(fe, stream, &list, 1);
> +	dpcm_process_paths(fe, stream, &list, true, false);
>   	fe->dpcm[stream].runtime = fe_substream->runtime;
>   
>   	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index 09fa437..f496c53 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2292,7 +2292,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
>   	card->update = NULL;
>   	mutex_unlock(&card->dapm_mutex);
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
> @@ -2357,7 +2357,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
>   	card->update = NULL;
>   	mutex_unlock(&card->dapm_mutex);
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
> @@ -3397,7 +3397,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
>   	mutex_unlock(&card->dapm_mutex);
>   
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
>   
>   	return change;
>   }
> @@ -3502,7 +3502,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
>   	mutex_unlock(&card->dapm_mutex);
>   
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		soc_dpcm_runtime_update(card, SND_SOC_DPCM_UPDATE_FULL);
>   
>   	return change;
>   }
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 8732cf1..5b3bc3f 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1658,14 +1658,14 @@ static bool dpcm_be_is_active(struct snd_soc_dpcm *dpcm, int stream,
>   }
>   
>   static int dpcm_prune_paths(struct snd_soc_pcm_runtime *fe, int stream,
> -	struct snd_soc_dapm_widget_list **list_)
> +			    struct snd_soc_dapm_widget_list **list_, bool force)
>   {
>   	struct snd_soc_dpcm *dpcm;
>   	int prune = 0;
>   
>   	/* Destroy any old FE <--> BE connections */
>   	for_each_dpcm_be(fe, stream, dpcm) {
> -		if (dpcm_be_is_active(dpcm, stream, *list_))
> +		if (!force && dpcm_be_is_active(dpcm, stream, *list_))
>   			continue;
>   
>   		dev_dbg(fe->dev, "ASoC: pruning %s BE %s for %s\n",
> @@ -1740,12 +1740,13 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
>    * FE substream.
>    */
>   int dpcm_process_paths(struct snd_soc_pcm_runtime *fe,
> -	int stream, struct snd_soc_dapm_widget_list **list, int new)
> +		       int stream, struct snd_soc_dapm_widget_list **list,
> +		       bool new, bool force_prune)
>   {
>   	if (new)
>   		return dpcm_add_paths(fe, stream, list);
>   	else
> -		return dpcm_prune_paths(fe, stream, list);
> +		return dpcm_prune_paths(fe, stream, list, force_prune);
>   }
>   
>   void dpcm_clear_pending_state(struct snd_soc_pcm_runtime *fe, int stream)
> @@ -2770,11 +2771,13 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
>   	return ret;
>   }
>   
> -static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
> +static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream,
> +				    bool force)
>   {
>   	struct snd_pcm_substream *substream =
>   		snd_soc_dpcm_get_substream(fe, stream);
>   	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
> +	int event = force ? SND_SOC_DAPM_STREAM_STOP : SND_SOC_DAPM_STREAM_NOP;
>   	int err;
>   
>   	dev_dbg(fe->dev, "ASoC: runtime %s close on FE %s\n",
> @@ -2806,7 +2809,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
>   		dev_err(fe->dev,"ASoC: shutdown FE failed %d\n", err);
>   
>   	/* run the stream event for each BE */
> -	dpcm_dapm_stream_event(fe, stream, SND_SOC_DAPM_STREAM_NOP);
> +	dpcm_dapm_stream_event(fe, stream, event);
>   
>   	return 0;
>   }
> @@ -2899,7 +2902,8 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
>   	return ret;
>   }
>   
> -static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
> +static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, bool new,
> +				      bool force_prune)
>   {
>   	struct snd_soc_dapm_widget_list *list;
>   	int stream;
> @@ -2945,13 +2949,14 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   		}
>   
>   		/* update any playback/capture paths */
> -		count = dpcm_process_paths(fe, stream, &list, new);
> +		count = dpcm_process_paths(fe, stream, &list, new, force_prune);
>   		if (count) {
>   			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_BE);
>   			if (new)
>   				ret = dpcm_run_update_startup(fe, stream);
>   			else
> -				ret = dpcm_run_update_shutdown(fe, stream);
> +				ret = dpcm_run_update_shutdown(fe, stream,
> +							       force_prune);
>   			if (ret < 0)
>   				dev_err(fe->dev, "ASoC: failed to shutdown some BEs\n");
>   			dpcm_set_fe_update_state(fe, stream, SND_SOC_DPCM_UPDATE_NO);
> @@ -2969,25 +2974,46 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   /* Called by DAPM mixer/mux changes to update audio routing between PCMs and
>    * any DAI links.
>    */
> -int soc_dpcm_runtime_update(struct snd_soc_card *card)
> +int soc_dpcm_runtime_update(struct snd_soc_card *card,
> +			    enum snd_soc_dpcm_update_mode mode)
>   {
>   	struct snd_soc_pcm_runtime *fe;
>   	int ret = 0;
>   
>   	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_RUNTIME);
> +
>   	/* shutdown all old paths first */
> -	for_each_card_rtds(card, fe) {
> -		ret = soc_dpcm_fe_runtime_update(fe, 0);
> -		if (ret)
> -			goto out;
> -	}
> +	if (mode != SND_SOC_DPCM_UPDATE_NEW_ONLY)
> +		/*
> +		 * This is entered if mode == FULL or OLD_ONLY. In both cases we
> +		 * have to call soc_dpcm_fe_runtime_update() but only in the
> +		 * OLD_ONLY case we have to set the "force" (last) parameter to
> +		 * "true."
> +		 */
> +		for_each_card_rtds(card, fe) {
> +			/*
> +			 * check "old" paths (new = false), only force for
> +			 * shutting down.
> +			 */
> +			ret = soc_dpcm_fe_runtime_update(fe, false,
> +					mode == SND_SOC_DPCM_UPDATE_OLD_ONLY);
> +			if (ret)
> +				goto out;
> +		}
>   
>   	/* bring new paths up */
> -	for_each_card_rtds(card, fe) {
> -		ret = soc_dpcm_fe_runtime_update(fe, 1);
> -		if (ret)
> -			goto out;
> -	}
> +	if (mode != SND_SOC_DPCM_UPDATE_OLD_ONLY)
> +		/*
> +		 * This is entered if mode == FULL or NEW_ONLY. In both cases we
> +		 * have to call soc_dpcm_fe_runtime_update() with the "force"
> +		 * (last) parameter set to "false"
> +		 */
> +		for_each_card_rtds(card, fe) {
> +			/* check "new" paths (new = true), no forcing */
> +			ret = soc_dpcm_fe_runtime_update(fe, true, false);
> +			if (ret)
> +				goto out;
> +		}
>   
>   out:
>   	mutex_unlock(&card->mutex);
> @@ -3042,7 +3068,7 @@ static int dpcm_fe_dai_open(struct snd_pcm_substream *fe_substream)
>   	}
>   
>   	/* calculate valid and active FE <-> BE dpcms */
> -	dpcm_process_paths(fe, stream, &list, 1);
> +	dpcm_process_paths(fe, stream, &list, true, false);
>   
>   	ret = dpcm_fe_dai_startup(fe_substream);
>   	if (ret < 0)
> 
