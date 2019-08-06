Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA68183500
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 17:19:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4418D84B;
	Tue,  6 Aug 2019 17:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4418D84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565104790;
	bh=X9HDgietMGeo5dOVSZ58d6L4ByaPuzyN0hFXv7t18+Y=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NO3NYmoCj4R0NyKHR3kq5ibnsEtHvuZ+EkMmhHB4xhBSJtwZ3ijVGBc5xKF7EVbI6
	 cB5Dtn5aHTj/VEMGqmjbSeOkEOcUWjnLaBZUXNG5GXiG99EeA0o0XIqIx8a6lepZiM
	 lbZ1dCeca7/TwfsDPIez9kgcDQY/kWhYpvSGNemU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF823F805F5;
	Tue,  6 Aug 2019 17:16:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9890BF805AA; Tue,  6 Aug 2019 17:16:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7F4BF805A8
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 17:16:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7F4BF805A8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 08:16:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="165012438"
Received: from tremilla-mobl1.amr.corp.intel.com (HELO [10.251.15.130])
 ([10.251.15.130])
 by orsmga007.jf.intel.com with ESMTP; 06 Aug 2019 08:16:02 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87ftmf2ifk.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b0fee4cb-2347-7c21-e9b8-ad41133340aa@linux.intel.com>
Date: Tue, 6 Aug 2019 09:55:21 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87ftmf2ifk.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 15/28] ASoC: soc-core: tidyup for
 card->deferred_resume_work
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



On 8/5/19 8:29 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> card->deferred_resume_work is used if CONFIG_PM_SLEEP was defined.
> but
> 	1) It is defined even though CONFIG_PM_SLEEP was not defined
> 	2) randam ifdef code is difficlut to read.

typos: random .. difficult

> This patch tidyup these issues.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc.h  |  5 +++--
>   sound/soc/soc-core.c | 14 ++++++++++----
>   2 files changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 6ac6481..85ad971 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1058,8 +1058,6 @@ struct snd_soc_card {
>   	int num_of_dapm_routes;
>   	bool fully_routed;
>   
> -	struct work_struct deferred_resume_work;
> -
>   	/* lists of probed devices belonging to this card */
>   	struct list_head component_dev_list;
>   	struct list_head list;
> @@ -1080,6 +1078,9 @@ struct snd_soc_card {
>   #ifdef CONFIG_DEBUG_FS
>   	struct dentry *debugfs_card_root;
>   #endif
> +#ifdef CONFIG_PM_SLEEP
> +	struct work_struct deferred_resume_work;
> +#endif
>   	u32 pop_time;
>   
>   	void *drvdata;
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e8ed57a..2536ba4 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -701,9 +701,18 @@ int snd_soc_resume(struct device *dev)
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_resume);
> +
> +static void soc_resume_init(struct snd_soc_card *card)
> +{
> +	/* deferred resume work */
> +	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
> +}
>   #else
>   #define snd_soc_suspend NULL
>   #define snd_soc_resume NULL
> +static inline void soc_resume_init(struct snd_soc_card *card)
> +{
> +}
>   #endif
>   
>   static const struct snd_soc_dai_ops null_dai_ops = {
> @@ -1975,10 +1984,7 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
>   
>   	soc_init_card_debugfs(card);
>   
> -#ifdef CONFIG_PM_SLEEP
> -	/* deferred resume work */
> -	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
> -#endif
> +	soc_resume_init(card);
>   
>   	snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
>   				  card->num_dapm_widgets);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
