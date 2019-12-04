Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 831B3113618
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 21:03:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04D3A1665;
	Wed,  4 Dec 2019 21:02:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04D3A1665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575489822;
	bh=2MeLfErBuFLNcZ3g40nmln5WtyW4OC47cCR/KpjtPwg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aX9Shwkh4HMe+4XML1kYTBGvElzIUkIR1gvZKjegq2i39LyO/ppV3HyGhHAAHeQbF
	 ILhQpVcUOotGGcGokM6m3R0z/kUw1zcsJBhm/K8qnuggarz76fX0P9oEwTS+HVR48j
	 2/9czGKLfRGvOQIi74EnroUgnwq+XQ4e1Mcop9oo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9F410F80233;
	Wed,  4 Dec 2019 21:01:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D531DF800F0; Wed,  4 Dec 2019 21:01:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AA206F800F0
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 21:01:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AA206F800F0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 12:01:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="411382170"
Received: from jcourage-mobl.amr.corp.intel.com (HELO [10.251.152.230])
 ([10.251.152.230])
 by fmsmga005.fm.intel.com with ESMTP; 04 Dec 2019 12:01:23 -0800
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20191204151454.21643-1-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <5342d6cc-bdc4-f62c-77b4-a433ec8372d4@linux.intel.com>
Date: Wed, 4 Dec 2019 13:23:36 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191204151454.21643-1-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ASoC: core: Fix access to uninitialized
 list heads
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/4/19 9:14 AM, Takashi Iwai wrote:
> The error path of soc_new_pcm_runtime() invokes soc_free_pcm_runtime()
> that may cause a few problems.  First off, it calls list_del() for
> rtd->list that may not be initialized.  Similarly,
> snd_soc_pcm_component_free() traverses over the component list that
> may not be initialized, either.  Such access to the uninitialized list
> head would lead to either a BUG_ON() or a memory corruption.
> 
> This patch fixes the access to uninitialized list heads by
> initializing the list heads properly at the beginning before those
> error paths.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>   sound/soc/soc-core.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 0e2e628302f1..726e5de850c4 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -478,6 +478,12 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   		goto free_rtd;
>   
>   	rtd->dev = dev;
> +	INIT_LIST_HEAD(&rtd->list);
> +	INIT_LIST_HEAD(&rtd->component_list);
> +	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
> +	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
> +	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
> +	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
>   	dev_set_drvdata(dev, rtd);
>   	INIT_DELAYED_WORK(&rtd->delayed_work, close_delayed_work);
>   
> @@ -493,12 +499,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   	/*
>   	 * rtd remaining settings
>   	 */
> -	INIT_LIST_HEAD(&rtd->component_list);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].be_clients);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].be_clients);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_PLAYBACK].fe_clients);
> -	INIT_LIST_HEAD(&rtd->dpcm[SNDRV_PCM_STREAM_CAPTURE].fe_clients);
> -
>   	rtd->card = card;
>   	rtd->dai_link = dai_link;
>   	if (!rtd->dai_link->ops)
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
