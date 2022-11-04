Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 208656198AF
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 15:02:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A1004163B;
	Fri,  4 Nov 2022 15:01:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A1004163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667570544;
	bh=MqZG52CRdQRt7ko+Jjzpuk3nUxqLdLJR/gvmOqBpTbs=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gRrXC07073ErAGDZxUwRVxIXtntoGHqElbfd1Q/NkDPXFCZHOx/t2DSUyPdhQnwTL
	 5nSiH8qkd1Q3CHogPqXeTbb1DJs/sByvVyPX0aMA3uuG2sTlOxZ6DigpfSJckanyTE
	 +ZTENfiQq8AKh3TJkh8cuH/ZmMMOir7yddwOC7mg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CA44F8049E;
	Fri,  4 Nov 2022 15:01:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B744EF8047D; Fri,  4 Nov 2022 15:01:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 246CAF801D5
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 15:01:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 246CAF801D5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HPDKraMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667570482; x=1699106482;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=MqZG52CRdQRt7ko+Jjzpuk3nUxqLdLJR/gvmOqBpTbs=;
 b=HPDKraMTqomzbKvwGBJQNB8BpwmrYLuNhyNTH7S+vkUhmW/Cy9pe5fSj
 JKAy6Ysunu3xCg5B+zoOP1O4MIakqqzeykIl8NLYCslhsZOAEaHBjgXyb
 p61zjbpA1vOEZEV246DLgpC64lXBzJq1Gqcyi4Y2vfb/EdI8cpHM+3xzK
 snn6BluR5ytk48kDD1FHrIvcjpGfPo4Dr/InyrsEnWWHv+n/Fv8j6pCCr
 gBiXd6i6sTFd6p353ddLx0/XKnPvBtnOyWjPGtMlOAu9U4fvtuBcEjjIL
 Ij3MKGD3hoheF2NgA6Us1ZbOti67OgT9HUkgpJfEnW+lzMVZ6VdWURxqZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="293298000"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="293298000"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:01:16 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="668363695"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="668363695"
Received: from cavargas-mobl.amr.corp.intel.com (HELO [10.212.85.188])
 ([10.212.85.188])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:01:15 -0700
Message-ID: <925c6405-f651-f68d-73f3-46cf85cb2fa5@linux.intel.com>
Date: Fri, 4 Nov 2022 09:58:46 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
Subject: Re: [PATCH 2/3] ASoC: core: Inline resume work back to resume function
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-3-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20221104131244.3920179-3-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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



On 11/4/22 09:12, Cezary Rojewski wrote:
> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> Commit 6ed2597883b1 ("ALSA: ASoC: Don't block system resume") introduced
> deferred_resume_work for ASoC subsystem. While this allows for potential
> speed up during boot on some slow devices, it doesn't allow to properly
> propagate return values in case something failed during system resume.

Are you suggesting to remove this workqueue that's been there since
2008, which would impact negatively slow devices?

If I follow your logic, we should also remove the workqueue used for
probes for HDaudio devices, on the grounds that probe errors are not
propagated either.

Any time we have deferred processing to avoid blocking the rest of the
system, we incur the risk of not having errors propagated. It's a
compromise between having a system that's usable and a system that's
consistent.
> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/soc.h  |  3 ---
>  sound/soc/soc-core.c | 48 +++++++++++---------------------------------
>  2 files changed, 12 insertions(+), 39 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 37bbfc8b45cb..3465aa075afe 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1005,9 +1005,6 @@ struct snd_soc_card {
>  
>  #ifdef CONFIG_DEBUG_FS
>  	struct dentry *debugfs_card_root;
> -#endif
> -#ifdef CONFIG_PM_SLEEP
> -	struct work_struct deferred_resume_work;
>  #endif
>  	u32 pop_time;
>  
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index a409fbed8f34..5f7e0735f0c1 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -643,17 +643,21 @@ int snd_soc_suspend(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_suspend);
>  
> -/*
> - * deferred resume work, so resume can complete before we finished
> - * setting our codec back up, which can be very slow on I2C
> - */
> -static void soc_resume_deferred(struct work_struct *work)
> +/* powers up audio subsystem after a suspend */
> +int snd_soc_resume(struct device *dev)
>  {
> -	struct snd_soc_card *card =
> -			container_of(work, struct snd_soc_card,
> -				     deferred_resume_work);
> +	struct snd_soc_card *card = dev_get_drvdata(dev);
>  	struct snd_soc_component *component;
>  
> +	/* If the card is not initialized yet there is nothing to do */
> +	if (!card->instantiated)
> +		return 0;
> +
> +	/* activate pins from sleep state */
> +	for_each_card_components(card, component)
> +		if (snd_soc_component_active(component))
> +			pinctrl_pm_select_default_state(component->dev);
> +
>  	/*
>  	 * our power state is still SNDRV_CTL_POWER_D3hot from suspend time,
>  	 * so userspace apps are blocked from touching us
> @@ -686,40 +690,14 @@ static void soc_resume_deferred(struct work_struct *work)
>  
>  	/* userspace can access us now we are back as we were before */
>  	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
> -}
> -
> -/* powers up audio subsystem after a suspend */
> -int snd_soc_resume(struct device *dev)
> -{
> -	struct snd_soc_card *card = dev_get_drvdata(dev);
> -	struct snd_soc_component *component;
> -
> -	/* If the card is not initialized yet there is nothing to do */
> -	if (!card->instantiated)
> -		return 0;
> -
> -	/* activate pins from sleep state */
> -	for_each_card_components(card, component)
> -		if (snd_soc_component_active(component))
> -			pinctrl_pm_select_default_state(component->dev);
> -
> -	dev_dbg(dev, "ASoC: Scheduling resume work\n");
> -	if (!schedule_work(&card->deferred_resume_work))
> -		dev_err(dev, "ASoC: resume work item may be lost\n");
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_resume);
>  
> -static void soc_resume_init(struct snd_soc_card *card)
> -{
> -	/* deferred resume work */
> -	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
> -}
>  #else
>  #define snd_soc_suspend NULL
>  #define snd_soc_resume NULL
> -static inline void soc_resume_init(struct snd_soc_card *card) { }
>  #endif
>  
>  static struct device_node
> @@ -1968,8 +1946,6 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
>  
>  	soc_init_card_debugfs(card);
>  
> -	soc_resume_init(card);
> -
>  	ret = snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
>  					card->num_dapm_widgets);
>  	if (ret < 0)
