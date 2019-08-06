Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD71782A7B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 06:42:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6ED431669;
	Tue,  6 Aug 2019 06:42:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6ED431669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565066576;
	bh=ipFAG5TqOn2Bh7BqhKXZbIEFtQhWax67vwQWiDR4Yts=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IgPZicqy9n2lTtosKlCQabqWSJpKBftNN2QuWd+l9QiE1U+MVX6XAxFXAky51kLPs
	 zUQW2sGKgNmC6NbzA05NS6RuyEfE3uTqqycs46ljfox6cL4dB+adP7xopkzOVcNa/B
	 gQPWak64lGe0ofVBPLLmt4kuUhgTRzofUwWaRURo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D998BF804CA;
	Tue,  6 Aug 2019 06:41:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 340AAF80483; Tue,  6 Aug 2019 06:41:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F006F8011B
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 06:41:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F006F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 21:41:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="168181831"
Received: from sbaqai-mobl.amr.corp.intel.com ([10.251.144.137])
 by orsmga008.jf.intel.com with ESMTP; 05 Aug 2019 21:41:04 -0700
Message-ID: <3849f0d37debfab976f0c5be6d9afe77965a43e0.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 05 Aug 2019 21:41:04 -0700
In-Reply-To: <87o9132ih0.wl-kuninori.morimoto.gx@renesas.com>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87o9132ih0.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 09/28] ASoC: soc-core: don't check routes
 for snd_soc_dapm_add_routes()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, 2019-08-06 at 10:28 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_dapm_add_routes() registers routes by using
> for(... i < num; ...). If routes was NULL, num should be zero.
> Thus, we don't need to check about route pointer.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 7be8385..5b26a59 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1307,10 +1307,9 @@ static int soc_probe_component(struct
> snd_soc_card *card,
>  	snd_soc_add_component_controls(component,
>  				       component->driver->controls,
>  				       component->driver-
> >num_controls);
> -	if (component->driver->dapm_routes)
> -		snd_soc_dapm_add_routes(dapm,
> -					component->driver->dapm_routes,
> -					component->driver-
> >num_dapm_routes);
> +	snd_soc_dapm_add_routes(dapm,
> +				component->driver->dapm_routes,
> +				component->driver->num_dapm_routes);
return value needs to be checked for all the snd_soc_dapm_add_routes()
calls?

Thanks,
Ranjani
>  
>  	list_add(&dapm->list, &card->dapm_list);
>  	/* see for_each_card_components */
> @@ -2053,13 +2052,11 @@ static int snd_soc_instantiate_card(struct
> snd_soc_card *card)
>  		snd_soc_add_card_controls(card, card->controls,
>  					  card->num_controls);
>  
> -	if (card->dapm_routes)
> -		snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
> -					card->num_dapm_routes);
> +	snd_soc_dapm_add_routes(&card->dapm, card->dapm_routes,
> +				card->num_dapm_routes);
>  
> -	if (card->of_dapm_routes)
> -		snd_soc_dapm_add_routes(&card->dapm, card-
> >of_dapm_routes,
> -					card->num_of_dapm_routes);
> +	snd_soc_dapm_add_routes(&card->dapm, card->of_dapm_routes,
> +				card->num_of_dapm_routes);
>  
>  	/* try to set some sane longname if DMI is available */
>  	snd_soc_set_dmi_name(card, NULL);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
