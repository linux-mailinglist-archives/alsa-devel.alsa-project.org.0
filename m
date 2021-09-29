Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9B41C876
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 17:31:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A64B016FE;
	Wed, 29 Sep 2021 17:30:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A64B016FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632929471;
	bh=t3MtYp2LBJvyxGBbxSvlODKPa3A5zidD7nPJNix+GAo=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rdFijVkdQ1jkFab/trP/zsH0B9b/H6wNv8BDzdLrGiDDQKG1NP5y/HJ3USH2sjPBD
	 NJzyYU+rJwPduBnLDilmIzcjoTWrlcSAIpr53WLuu7AUTHqQvV0L3a0QZB7m1ykY9Q
	 CkvImQrrNLoZ/MBVod18Pb2/IlW1xqn/HnxIJYVM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D8F8F8026D;
	Wed, 29 Sep 2021 17:30:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4F0AF80301; Wed, 29 Sep 2021 17:30:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE2DCF801F7
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 17:30:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE2DCF801F7
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="225036975"
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="225036975"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 08:30:07 -0700
X-IronPort-AV: E=Sophos;i="5.85,332,1624345200"; d="scan'208";a="588091570"
Received: from ibarchen-mobl.amr.corp.intel.com (HELO [10.209.150.234])
 ([10.209.150.234])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2021 08:30:06 -0700
Subject: Re: [PATCH] ASoC: dpcm: fix race condition to dpcm links in
 dpcm_be_dai_trigger
To: Gyeongtaek Lee <gt82.lee@samsung.com>, 'Takashi Iwai' <tiwai@suse.de>
References: <CGME20210929054921epcas2p2fbe35a6262405e064aac3bd92b22b1aa@epcas2p2.samsung.com>
 <002f01d7b4f5$c030f4a0$4092dde0$@samsung.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <27786697-1309-8336-6f53-abff32e0b6c2@linux.intel.com>
Date: Wed, 29 Sep 2021 09:11:35 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <002f01d7b4f5$c030f4a0$4092dde0$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, kimty@samsung.com, lgirdwood@gmail.com,
 senius.park@samsung.com, donggyun.ko@samsung.com, hmseo@samsung.com,
 seungbin.lee@samsung.com, s47.kang@samsung.com, pilsun.jang@samsung.com
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



On 9/29/21 12:49 AM, Gyeongtaek Lee wrote:
> If routing change and underrun stop is run at the same time,
> data abort can be occurred by the following sequence.
> 
> CPU0: Processing underrun 	CPU1: Processing routing change
> dpcm_be_dai_trigger():		dpcm_be_disconnect():
> 
> for_each_dpcm_be(fe, stream, dpcm) {
> 
> 				spin_lock_irqsave(&fe->card->dpcm_lock, flags);
> 				list_del(&dpcm->list_be);
> 				list_del(&dpcm->list_fe);
> 				spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
> 				kfree(dpcm);
> 
> struct snd_soc_pcm_runtime *be = dpcm->be; <-- Accessing freed memory
> 
> To prevent this situation, dpcm_lock is needed during accessing
> the lists for dpcm links.

Isn't there still a possible inconsistency here introduced by the
duplication of the BE list?

You protect the list creation, but before you use it in
dpcm_be_dai_trigger(), there's a time window where the function could be
pre-empted and a disconnect event might have happened. As a result you
could trigger a BE that's no longer connected.

What you identified as a race is likely valid, but how to fix it isn't
clear to me - the DPCM code isn't self-explanatory at all with its use
in various places of the dpcm_lock spinlock, the pcm mutex, the card mutex.

Ideally we would need to find a way to prevent changes in connections
while we are doing the triggers, but triggers can take a bit of time if
they involve any sort of communication over a bus. I really wonder if
this dpcm_lock should be a mutex and if the model for DPCM really
involves interrupt contexts as the irqsave/irqrestore mentions hint at.

> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
> Cc: stable@vger.kernel.org
> ---
>  sound/soc/soc-pcm.c | 53 ++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 50 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 48f71bb81a2f..df2cd4c0dabe 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -1993,17 +1993,63 @@ static int dpcm_fe_dai_hw_params(struct snd_pcm_substream *substream,
>  	return ret;
>  }
>  
> +struct dpcm_be_list {
> +	unsigned int num;
> +	struct snd_soc_pcm_runtime *be[];
> +};
> +
> +static int dpcm_create_be_list(struct snd_soc_pcm_runtime *fe, int stream,
> +		struct dpcm_be_list **be_list)
> +{
> +	struct snd_soc_dpcm *dpcm;
> +	struct dpcm_be_list *be;
> +	int size = 0;
> +	int ret = 0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fe->card->dpcm_lock, flags);
> +
> +	for_each_dpcm_be(fe, stream, dpcm)
> +		size++;
> +
> +	be = kzalloc(struct_size(be, be, size), GFP_ATOMIC);
> +	if (!be) {
> +		ret = -ENOMEM;
> +	} else {
> +		unsigned int i = 0;
> +
> +		for_each_dpcm_be(fe, stream, dpcm)
> +			be->be[i++] = dpcm->be;
> +
> +		*be_list = be;
> +	}
> +
> +	spin_unlock_irqrestore(&fe->card->dpcm_lock, flags);
> +
> +	return ret;
> +}
> +
> +static void dpcm_free_be_list(struct dpcm_be_list *be_list)
> +{
> +	kfree(be_list);
> +}
> +
>  int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>  			       int cmd)
>  {
>  	struct snd_soc_pcm_runtime *be;
> -	struct snd_soc_dpcm *dpcm;
> +	struct dpcm_be_list *be_list;
>  	int ret = 0;
> +	int i;
>  
> -	for_each_dpcm_be(fe, stream, dpcm) {
> +	ret = dpcm_create_be_list(fe, stream, &be_list);
> +	if (ret < 0)
> +		return ret;
> +
> +	for(i = 0; i < be_list->num; i++) {
>  		struct snd_pcm_substream *be_substream;
>  
> -		be = dpcm->be;
> +		be = be_list->be[i];
>  		be_substream = snd_soc_dpcm_get_substream(be, stream);
>  
>  		/* is this op for this BE ? */
> @@ -2092,6 +2138,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>  	if (ret < 0)
>  		dev_err(fe->dev, "ASoC: %s() failed at %s (%d)\n",
>  			__func__, be->dai_link->name, ret);
> +	dpcm_free_be_list(be_list);
>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(dpcm_be_dai_trigger);
> 
> base-commit: 4ac6d90867a4de2e12117e755dbd76e08d88697f
> 
