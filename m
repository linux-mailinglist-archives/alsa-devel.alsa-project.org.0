Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292E182F73
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Mar 2020 12:42:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 265E016CD;
	Thu, 12 Mar 2020 12:41:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 265E016CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584013338;
	bh=gmC2Yubk7gyDRMU/V6LDQFkJNGBfnyn5EnYZXE9nhZg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PRyga098bJ6WbgVG2Ek/5AULSX883knXgnyl8Ax1SIk0aie1Q89ZrNvWYyM3Uuuvf
	 0e+wrWjxRYIXsId3L696pqFxwti+MPUGUb9cI5viE+cyDQdE4YLRCi2hRVlZUCQ13d
	 vex6+XZ7er81CfN9Vb3moSwSjkjHiZPyYRDM5sGs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1438EF8028C;
	Thu, 12 Mar 2020 12:39:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53834F8020C; Thu, 12 Mar 2020 12:39:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B2C8F800BE;
 Thu, 12 Mar 2020 12:39:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B2C8F800BE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 04:39:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,544,1574150400"; d="scan'208";a="242995407"
Received: from swaydand-mobl1.amr.corp.intel.com (HELO [10.255.230.33])
 ([10.255.230.33])
 by orsmga003.jf.intel.com with ESMTP; 12 Mar 2020 04:39:43 -0700
Subject: Re: [PATCH v2 2/2] ASoC: export DPCM runtime update functions
To: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200312095214.15126-1-guennadi.liakhovetski@linux.intel.com>
 <20200312095214.15126-3-guennadi.liakhovetski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <55ea2704-121d-9940-3c84-169cc65016d9@linux.intel.com>
Date: Thu, 12 Mar 2020 05:51:59 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200312095214.15126-3-guennadi.liakhovetski@linux.intel.com>
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



On 3/12/20 4:52 AM, Guennadi Liakhovetski wrote:
> This makes DPCM runtime update functions available for external
> calling. As an example, virtualised ASoC component drivers may need
> to call these when managing shared DAPM routes that are used by more
> than one driver (i.e. when host driver and guest drivers have a DAPM
> path from guest PCM to host DAI where some parts are owned by host
> driver and others by guest driver).
> 
> Signed-off-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>

My understanding of Mark's feedback was to avoid exposing DPCM functions 
to other subsystems, since there's a long-term desire to move to a 
different domain-based handling instead of the existing FE/BE split.

> ---
>   include/sound/soc-dpcm.h | 4 ++--
>   sound/soc/soc-dapm.c     | 8 ++++----
>   sound/soc/soc-pcm.c      | 5 ++++-
>   3 files changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
> index 4022357..0f6c50b 100644
> --- a/include/sound/soc-dpcm.h
> +++ b/include/sound/soc-dpcm.h
> @@ -132,8 +132,8 @@ int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
>   struct snd_pcm_substream *
>   	snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream);
>   
> -/* internal use only */
> -int soc_dpcm_runtime_update(struct snd_soc_card *);
> +/* update audio routing between PCMs and any DAI links */
> +int snd_soc_dpcm_runtime_update(struct snd_soc_card *card);
>   
>   #ifdef CONFIG_DEBUG_FS
>   void soc_dpcm_debugfs_add(struct snd_soc_pcm_runtime *rtd);
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index e00a465..d5eb52f 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -2291,7 +2291,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
>   	card->update = NULL;
>   	mutex_unlock(&card->dapm_mutex);
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		snd_soc_dpcm_runtime_update(card);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
> @@ -2356,7 +2356,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
>   	card->update = NULL;
>   	mutex_unlock(&card->dapm_mutex);
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		snd_soc_dpcm_runtime_update(card);
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_dapm_mixer_update_power);
> @@ -3396,7 +3396,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
>   	mutex_unlock(&card->dapm_mutex);
>   
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		snd_soc_dpcm_runtime_update(card);
>   
>   	return change;
>   }
> @@ -3501,7 +3501,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
>   	mutex_unlock(&card->dapm_mutex);
>   
>   	if (ret > 0)
> -		soc_dpcm_runtime_update(card);
> +		snd_soc_dpcm_runtime_update(card);
>   
>   	return change;
>   }
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index bf4c5dc..2b915f4 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -295,6 +295,7 @@ void snd_soc_runtime_activate(struct snd_soc_pcm_runtime *rtd, int stream)
>   {
>   	snd_soc_runtime_action(rtd, stream, 1);
>   }
> +EXPORT_SYMBOL_GPL(snd_soc_runtime_activate);
>   
>   /**
>    * snd_soc_runtime_deactivate() - Decrement active count for PCM runtime components
> @@ -310,6 +311,7 @@ void snd_soc_runtime_deactivate(struct snd_soc_pcm_runtime *rtd, int stream)
>   {
>   	snd_soc_runtime_action(rtd, stream, -1);
>   }
> +EXPORT_SYMBOL_GPL(snd_soc_runtime_deactivate);
>   
>   /**
>    * snd_soc_runtime_ignore_pmdown_time() - Check whether to ignore the power down delay
> @@ -2969,7 +2971,7 @@ static int soc_dpcm_fe_runtime_update(struct snd_soc_pcm_runtime *fe, int new)
>   /* Called by DAPM mixer/mux changes to update audio routing between PCMs and
>    * any DAI links.
>    */
> -int soc_dpcm_runtime_update(struct snd_soc_card *card)
> +int snd_soc_dpcm_runtime_update(struct snd_soc_card *card)
>   {
>   	struct snd_soc_pcm_runtime *fe;
>   	int ret = 0;
> @@ -2993,6 +2995,7 @@ int soc_dpcm_runtime_update(struct snd_soc_card *card)
>   	mutex_unlock(&card->mutex);
>   	return ret;
>   }
> +EXPORT_SYMBOL_GPL(snd_soc_dpcm_runtime_update);
>   
>   static void dpcm_fe_dai_cleanup(struct snd_pcm_substream *fe_substream)
>   {
> 
