Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 241FCF87C4
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Nov 2019 06:23:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A31F61658;
	Tue, 12 Nov 2019 06:22:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A31F61658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573536190;
	bh=avocupmqtApHhHDprv9D2IZPgU2PxHwIU6kIYkuQjZo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UK19/RLgNg+CUJiFVVj2XTk2RW+2KHoFW7piQMSXn7QoYfpwtMft4SjL9L7ZeUHy/
	 Li2dOhq/huDVC7TCtudbXsbDocoGSnUScObNoH7EHZrKfVkencTD3W/5KY0I4UcI3q
	 ndGFNZ/0Lpn2iVnCPIIFHEqiNDyDmim23+kz6lQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A4AA5F80483;
	Tue, 12 Nov 2019 06:21:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 691EFF80483; Tue, 12 Nov 2019 06:21:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D5410F80275
 for <alsa-devel@alsa-project.org>; Tue, 12 Nov 2019 06:21:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D5410F80275
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Nov 2019 21:21:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,295,1569308400"; d="scan'208";a="404128320"
Received: from grueda-mobl1.amr.corp.intel.com (HELO [10.251.144.145])
 ([10.251.144.145])
 by fmsmga005.fm.intel.com with ESMTP; 11 Nov 2019 21:21:14 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87ftj23jph.wl-kuninori.morimoto.gx@renesas.com>
 <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <8ed58ca1-0f9d-63e8-ba5d-28ee5209aee5@linux.intel.com>
Date: Mon, 11 Nov 2019 23:21:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <877e4e3jni.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH v3 06/19] ASoC: soc-core: add
 soc_unbind_dai_link()
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



On 11/5/19 12:46 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> It is easy to read code if it is cleanly using paired function/naming,
> like start <-> stop, register <-> unregister, etc, etc.
> But, current ALSA SoC code is very random, unbalance, not paired, etc.
> It is easy to create bug at the such code, and it will be difficult to
> debug.
> 
> ALSA SoC has soc_bind_dai_link(), but its paired soc_unbind_dai_link()
> is not implemented.
> More confusable is that soc_remove_pcm_runtimes() which should be
> soc_unbind_dai_link() is implemented without synchronised
> to soc_bind_dai_link().
> 
> This patch cleanup this unbalance.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Morimoto-san, this patch seems to introduce a regression in our SOF 
module removal tests. Without a couple of load/unload modules cycles, we 
hit a kernel oops while freeing the card.

see https://github.com/thesofproject/linux/issues/1466 for some logs.

This issue did not happen with our November 6 rebase on Mark's tree, and 
showed up today. I couldn't really bisect the whole tree due to other 
issues, so manually applied your patches on top of this 11/06 tree and 
bisected from there.

I will need to confirm this finding (it's quite late for me) but looking 
at the code I wonder if the move of pcm_runtime deletion is correct?


> ---
> v2 -> v3
> 	- no change
> 	- add Reviewed-by
> 
>   sound/soc/soc-core.c | 22 ++++++++++++----------
>   1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e8ff6f2..1e8dd19 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -470,14 +470,6 @@ static struct snd_soc_pcm_runtime *soc_new_pcm_runtime(
>   	return NULL;
>   }
>   
> -static void soc_remove_pcm_runtimes(struct snd_soc_card *card)
> -{
> -	struct snd_soc_pcm_runtime *rtd, *_rtd;
> -
> -	for_each_card_rtds_safe(card, rtd, _rtd)
> -		soc_free_pcm_runtime(rtd);
> -}
> -
>   struct snd_soc_pcm_runtime *snd_soc_get_pcm_runtime(struct snd_soc_card *card,
>   		const char *dai_link)
>   {
> @@ -1037,6 +1029,16 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
>   	return 0;
>   }
>   
> +static void soc_unbind_dai_link(struct snd_soc_card *card,
> +				struct snd_soc_dai_link *dai_link)
> +{
> +	struct snd_soc_pcm_runtime *rtd;
> +
> +	rtd = snd_soc_get_pcm_runtime(card, dai_link->name);
> +	if (rtd)
> +		soc_free_pcm_runtime(rtd);
> +}
> +
>   static int soc_bind_dai_link(struct snd_soc_card *card,
>   	struct snd_soc_dai_link *dai_link)
>   {
> @@ -1466,6 +1468,8 @@ void snd_soc_remove_dai_link(struct snd_soc_card *card,
>   		card->remove_dai_link(card, dai_link);
>   
>   	list_del(&dai_link->list);
> +
> +	soc_unbind_dai_link(card, dai_link);
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_remove_dai_link);
>   
> @@ -1974,8 +1978,6 @@ static void soc_cleanup_card_resources(struct snd_soc_card *card)
>   	for_each_card_links_safe(card, link, _link)
>   		snd_soc_remove_dai_link(card, link);
>   
> -	soc_remove_pcm_runtimes(card);
> -
>   	/* remove auxiliary devices */
>   	soc_remove_aux_devices(card);
>   	soc_unbind_aux_dev(card);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
