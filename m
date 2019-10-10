Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63811D2DB9
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 17:28:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7AD21675;
	Thu, 10 Oct 2019 17:27:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7AD21675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570721324;
	bh=ehSoAlRF2JWE9Ab2p6tA5pNQ17wtPozaCHt1W3SzxLs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EOxqHmJU9dnlH+Th56Fi9yfdXTLKLHQczYS0hoiKVWAosB+Y9/LqJFmRSIA0UZZPM
	 k9AotsJOb3E3Rydn9RHlHmym1ysZJ8USOZ1PRoc1XDhfKa4Y7qIhr9SHgASpdFnFHA
	 m4J3fje1+Dm1XXYPR3Ne3Lijlt9jnZkjUh4Qyx48=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E0B3F8045E;
	Thu, 10 Oct 2019 17:27:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2F9EF8038F; Thu, 10 Oct 2019 17:26:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1D97F800E3
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 17:26:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1D97F800E3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Oct 2019 08:26:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,280,1566889200"; d="scan'208";a="193244343"
Received: from jbelstn-mobl1.amr.corp.intel.com (HELO [10.251.134.143])
 ([10.251.134.143])
 by fmsmga008.fm.intel.com with ESMTP; 10 Oct 2019 08:26:51 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87sgo2ilso.wl-kuninori.morimoto.gx@renesas.com>
 <878spuilqd.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <df9de456-a4c2-53c4-2143-edb4d4b2292f@linux.intel.com>
Date: Thu, 10 Oct 2019 10:26:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <878spuilqd.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 14/21] ASoC: soc-core: have
 legacy_dai_naming at snd_soc_register_dai()
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



On 10/8/19 11:30 PM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ALSA SoC has 2 similar but diffarent implementation.

different

> snd_soc_register_dai()  is used from topology
> snd_soc_register_dais() is used from snd_soc_add_component()
> 
> Because of this kind of confusable naming, and duplicated

confusing

> implementation, code is very unreadale.

unreadable

> We shouldn't have duplicated and confusable implementation.

confusing

> snd_soc_register_dai() is now used from topology.
> But, to reduce duplicated code, it will be used from soc-core, too.
> To prepare for it, this patch adds missing parameter legacy_dai_naming
> to snd_soc_register_dai().

It doesn't look like this series reduces the confusion between 
snd_soc_register_dai() and snd_soc_register_dais() ?

maybe for the latter case since it's a static function we don't want the 
entire prefix then?

> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc.h      | 3 ++-
>   sound/soc/soc-core.c     | 5 +++--
>   sound/soc/soc-topology.c | 2 +-
>   3 files changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 320dcd4..827322a 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1327,7 +1327,8 @@ struct snd_soc_dai_link *snd_soc_find_dai_link(struct snd_soc_card *card,
>   					       const char *stream_name);
>   
>   int snd_soc_register_dai(struct snd_soc_component *component,
> -	struct snd_soc_dai_driver *dai_drv);
> +			 struct snd_soc_dai_driver *dai_drv,
> +			 bool legacy_dai_naming);
>   
>   struct snd_soc_dai *snd_soc_find_dai(
>   	const struct snd_soc_dai_link_component *dlc);
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index be4e1b5..3a16868 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2611,7 +2611,8 @@ static struct snd_soc_dai *soc_add_dai(struct snd_soc_component *component,
>    * will be freed in the component cleanup.
>    */
>   int snd_soc_register_dai(struct snd_soc_component *component,
> -			 struct snd_soc_dai_driver *dai_drv)
> +			 struct snd_soc_dai_driver *dai_drv,
> +			 bool legacy_dai_naming)
>   {
>   	struct snd_soc_dapm_context *dapm =
>   		snd_soc_component_get_dapm(component);
> @@ -2625,7 +2626,7 @@ int snd_soc_register_dai(struct snd_soc_component *component,
>   	}
>   
>   	lockdep_assert_held(&client_mutex);
> -	dai = soc_add_dai(component, dai_drv, false);
> +	dai = soc_add_dai(component, dai_drv, legacy_dai_naming);
>   	if (!dai)
>   		return -ENOMEM;
>   
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index 0fd0329..b6e1456 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1842,7 +1842,7 @@ static int soc_tplg_dai_create(struct soc_tplg *tplg,
>   	list_add(&dai_drv->dobj.list, &tplg->comp->dobj_list);
>   
>   	/* register the DAI to the component */
> -	return snd_soc_register_dai(tplg->comp, dai_drv);
> +	return snd_soc_register_dai(tplg->comp, dai_drv, false);
>   }
>   
>   static void set_link_flags(struct snd_soc_dai_link *link,
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
