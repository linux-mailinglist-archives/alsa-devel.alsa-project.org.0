Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C19095D21
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Aug 2019 13:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6866166D;
	Tue, 20 Aug 2019 13:19:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6866166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566299996;
	bh=xdM+kuQ9qAIwFdYllvH1dpU0AUf6v7xf2Ia2T25epFg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BPSUzigKO0Kw5N6fbpm2oPH6fImof7JFCogVmWnrrCtUmZtrypVdSdHve9JCp/K1Z
	 3kn+PQlBLhvYEk1KKo/mefYZhXbDIFKlwi/gZrnVWK22/H3SGIV7Nh+JI2M4pmVDkT
	 dEeuaj2F5QF0u+hkfBQXv7B9PaUVTZtnS2ys4aMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63396F80391;
	Tue, 20 Aug 2019 13:18:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54765F8036E; Tue, 20 Aug 2019 13:18:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5DB90F800BF
 for <alsa-devel@alsa-project.org>; Tue, 20 Aug 2019 13:18:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5DB90F800BF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Aug 2019 04:18:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,408,1559545200"; d="scan'208";a="207331395"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.237.137.172])
 ([10.237.137.172])
 by fmsmga002.fm.intel.com with ESMTP; 20 Aug 2019 04:18:01 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87pnlhahr6.wl-kuninori.morimoto.gx@renesas.com>
 <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <928df91b-997f-c1eb-5ab5-bda1fc374c1a@intel.com>
Date: Tue, 20 Aug 2019 13:18:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87d0hhahon.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 09/25] ASoC: soc-core: tidyup for
 snd_soc_dapm_add_routes()
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

On 2019-08-07 03:31, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_dapm_add_routes() registers routes by using
> for(... i < num; ...). If routes was NULL, num should be zero.
> Thus, we don't need to check about route pointer.
> This patch also cares missing return value.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 
> 	- check return value
> 	- change Subject
> 
>   sound/soc/soc-core.c | 23 +++++++++++++----------
>   1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 21cdd3c..ca1b04c 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1310,10 +1310,11 @@ static int soc_probe_component(struct snd_soc_card *card,
>   	if (ret < 0)
>   		goto err_probe;
>   
> -	if (component->driver->dapm_routes)
> -		snd_soc_dapm_add_routes(dapm,
> -					component->driver->dapm_routes,
> -					component->driver->num_dapm_routes);
> +	ret = snd_soc_dapm_add_routes(dapm,
> +				      component->driver->dapm_routes,
> +				      component->driver->num_dapm_routes);
> +	if (ret < 0)
> +		goto err_probe;
>   
>   	list_add(&dapm->list, &card->dapm_list);
>   	/* see for_each_card_components */
> @@ -2060,13 +2061,15 @@ static int snd_soc_instantiate_card(struct snd_soc_card *card)
>   		snd_soc_add_card_controls(card, card->controls,
>   					  card->num_controls);
>   
> -	if (card->dapm_routes)
> -		snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
> -					card->num_dapm_routes);
> +	ret = snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
> +				      card->num_dapm_routes);
> +	if (ret < 0)
> +		goto probe_end;
>   
> -	if (card->of_dapm_routes)
> -		snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
> -					card->num_of_dapm_routes);
> +	ret = snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
> +				      card->num_of_dapm_routes);
> +	if (ret < 0)
> +		goto probe_end;
>   
>   	/* try to set some sane longname if DMI is available */
>   	snd_soc_set_dmi_name(card, NULL);
> 

Hello there,

I've run a validation cycle on recent broonie/for-next and this commit 
caused regression. However, it may be simply an error on board side instead.

Previously, ret from snd_soc_dapm_add_routes has been ignored thus it 
was permissive for addition of several routes to fail. As long as some 
routes succeeded, card was working just fine. Now it's no longer the 
case - behavior of the card initialization has changed: it is required 
for ALL routes to succeed before card can be fully instantiated.

Must say collapsing snd_soc_instantiate_card is a wonderful way to test 
your card's removal flow (soc__cleanup_card_resources and friends)..

Question is simple: are we staying with all-for-one/ one-for-all 
approach or we reverting to permissive behavior?

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
