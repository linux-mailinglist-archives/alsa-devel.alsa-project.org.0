Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A70D2E0A
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 17:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F13651685;
	Thu, 10 Oct 2019 17:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F13651685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570722338;
	bh=Ccp83PyuOkWhPtHGWEAlATz4pLI3RKg5Emmc9A8MDls=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NmDjo+EBjyHa3fWUTz27NahaLLYT+kjl25mHrlKM3P9dRWABRV8XteU7Ye45VA8+V
	 /T4iM2NwOepV5ZHFotSRemyYKRqkGP/gk3KkYV0Mdxza9Mgkf6mA+DEn6gpxNF3rql
	 7hDpVl9Hx/tcHtiK9X63oXcLwQknKSokrXdewuPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5EEF8064C;
	Thu, 10 Oct 2019 17:41:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3E80F804CA; Thu, 10 Oct 2019 17:41:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4752DF80322
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 17:41:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4752DF80322
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 08:41:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="369125060"
Received: from aandraox-mobl1.amr.corp.intel.com (HELO [10.254.98.68])
 ([10.254.98.68])
 by orsmga005.jf.intel.com with ESMTP; 10 Oct 2019 08:41:00 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <8736g2ilpt.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <699c1364-425e-3049-5753-25990d7ef1e6@linux.intel.com>
Date: Thu, 10 Oct 2019 10:29:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <8736g2ilpt.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 18/21] ASoC: soc-core: use mutex_lock() at
 snd_soc_add_component()
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



On 10/8/19 11:31 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_component_add() is using mutex_lock(),
> but it should be used at snd_soc_add_component().
> This patch tidyup it.
> This is prepare for snd_soc_register_dais() cleanup
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-core.c | 26 +++++++++++++++-----------
>   1 file changed, 15 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 5d96ffa..d4f80c8 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2748,8 +2748,6 @@ EXPORT_SYMBOL_GPL(snd_soc_component_exit_regmap);
>   
>   static void snd_soc_component_add(struct snd_soc_component *component)
>   {
> -	mutex_lock(&client_mutex);
> -
>   	if (!component->driver->write && !component->driver->read) {
>   		if (!component->regmap)
>   			component->regmap = dev_get_regmap(component->dev,
> @@ -2760,8 +2758,6 @@ static void snd_soc_component_add(struct snd_soc_component *component)
>   
>   	/* see for_each_component */
>   	list_add(&component->list, &component_list);
> -
> -	mutex_unlock(&client_mutex);
>   }
>   
>   static void snd_soc_component_del(struct snd_soc_component *component)
> @@ -2835,9 +2831,11 @@ int snd_soc_add_component(struct device *dev,
>   	int ret;
>   	int i;
>   
> +	mutex_lock(&client_mutex);
> +
>   	ret = snd_soc_component_initialize(component, component_driver, dev);
>   	if (ret)
> -		goto err_free;
> +		goto err_del;
>   
>   	if (component_driver->endianness) {
>   		for (i = 0; i < num_dai; i++) {
> @@ -2849,17 +2847,23 @@ int snd_soc_add_component(struct device *dev,
>   	ret = snd_soc_register_dais(component, dai_drv, num_dai);
>   	if (ret < 0) {
>   		dev_err(dev, "ASoC: Failed to register DAIs: %d\n", ret);
> -		goto err_cleanup;
> +		goto err_del;
>   	}
>   
>   	snd_soc_component_add(component);
> -	snd_soc_try_rebind_card();
>   
> -	return 0;
> +err_del:
> +	mutex_unlock(&client_mutex);
> +
> +	/*
> +	 * these should be called without
> +	 * mutex_unlock(client_mutex)
> +	 */
> +	if (ret < 0)
> +		snd_soc_del_component(component);

the first thing done in snd_soc_del_component is to take the same mutex.


> +	else
> +		snd_soc_try_rebind_card();
>   
> -err_cleanup:
> -	snd_soc_del_component(component);
> -err_free:
>   	return ret;
>   }
>   EXPORT_SYMBOL_GPL(snd_soc_add_component);
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
