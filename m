Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CC3EF3C7
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 04:04:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35180170F;
	Tue,  5 Nov 2019 04:03:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35180170F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572923059;
	bh=vd467P321bmHGPbQ5Yz/ZHdKjIydle8o1yX7nYYCNUU=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PZ3zM7DjPxc5JQoTO6Wji7WiZobEPVvH5y3EgnQG6N2OLH1r6e8iBsK3iddqmA8bh
	 h69qagA/0qG8aDKA7xGYZfPylAAIo4lKEfv/URs2r+zBojXyl0Vks8p+zFww373TZf
	 0Q68uNiZBB30JnNYD8LNjeEz7U37knjsA19UVOZc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B2393F8049B;
	Tue,  5 Nov 2019 04:02:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 31E33F8049B; Tue,  5 Nov 2019 04:02:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C09E4F80271
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 04:02:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C09E4F80271
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 19:02:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; d="scan'208";a="232306245"
Received: from njdenler-mobl1.amr.corp.intel.com ([10.254.94.55])
 by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2019 19:02:22 -0800
Message-ID: <9aacec2b81bbe51992da63ea33ab653019011371.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 04 Nov 2019 19:02:26 -0800
In-Reply-To: <87zhhjc9bw.wl-kuninori.morimoto.gx@renesas.com>
References: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
 <87zhhjc9bw.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 resend 03/18] ASoC: soc-core: tidyup
 soc_init_dai_link()
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

On Wed, 2019-10-30 at 10:26 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_init_dai_link() is needed to be called before
> soc_bind_dai_link().
> 
> 	int snd_soc_instantiate_card()
> 	{
> 		for_each_card_prelinks(...) {
> (1)			ret = soc_init_dai_link(...);
> 			...
> 		}
> 		...
> 		for_each_card_prelinks(...) {
> (2)			ret = soc_bind_dai_link(...);
> 			...
> 		}
> 		...
> 		for_each_card_links(...) {
> 			...
> (A)			ret = soc_init_dai_link(...);
> 			...
> (B)			ret = soc_bind_dai_link(...);
> 		}
> 		...
> 
> (1) is for (2), and (A) is for (B)
> (1) and (2) are for card prelink   dai_link.
> (A) and (B) are for topology added dai_link.
> 
> soc_init_dai_link() is sanity check for dai_link, not initializing
> today.
> Therefore, it is confusable naming. We can rename it as sanity_check.
> 
> And this check is for soc_bind_dai_link().
> It can be more simple code if we can call it from
> soc_bind_dai_link().
> 
> This patch renames it to soc_dai_link_sanity_check(), and
> call it from soc_bind_dai_link().
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 22 +++++++---------------
>  1 file changed, 7 insertions(+), 15 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index a141828..94763fc9c 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -941,8 +941,8 @@ static bool soc_is_dai_link_bound(struct
> snd_soc_card *card,
>  	return false;
>  }
>  
> -static int soc_init_dai_link(struct snd_soc_card *card,
> -			     struct snd_soc_dai_link *link)
> +static int soc_dai_link_sanity_check(struct snd_soc_card *card,
> +				     struct snd_soc_dai_link *link)
>  {
>  	int i;
>  	struct snd_soc_dai_link_component *codec, *platform;
> @@ -1043,11 +1043,15 @@ static int soc_bind_dai_link(struct
> snd_soc_card *card,
>  	struct snd_soc_pcm_runtime *rtd;
>  	struct snd_soc_dai_link_component *codec, *platform;
>  	struct snd_soc_component *component;
> -	int i;
> +	int i, ret;
>  
>  	if (dai_link->ignore)
>  		return 0;
>  
> +	ret = soc_dai_link_sanity_check(card, dai_link);
> +	if (ret < 0)
> +		return ret;
Morimoto-san,

Should this be done after checking if soc_is_dai_link_bound() maybe?

Thanks,
Ranjani
> +
>  	dev_dbg(card->dev, "ASoC: binding %s\n", dai_link->name);
>  
>  	if (soc_is_dai_link_bound(card, dai_link)) {
> @@ -1985,15 +1989,6 @@ static int snd_soc_instantiate_card(struct
> snd_soc_card *card)
>  	int ret, i;
>  
>  	mutex_lock(&client_mutex);
> -	for_each_card_prelinks(card, i, dai_link) {
> -		ret = soc_init_dai_link(card, dai_link);
> -		if (ret) {
> -			dev_err(card->dev, "ASoC: failed to init link
> %s: %d\n",
> -				dai_link->name, ret);
> -			mutex_unlock(&client_mutex);
> -			return ret;
> -		}
> -	}
>  	mutex_lock_nested(&card->mutex, SND_SOC_CARD_CLASS_INIT);
>  
>  	snd_soc_dapm_init(&card->dapm, card, NULL);
> @@ -2073,9 +2068,6 @@ static int snd_soc_instantiate_card(struct
> snd_soc_card *card)
>  		if (soc_is_dai_link_bound(card, dai_link))
>  			continue;
>  
> -		ret = soc_init_dai_link(card, dai_link);
> -		if (ret)
> -			goto probe_end;
>  		ret = soc_bind_dai_link(card, dai_link);
>  		if (ret)
>  			goto probe_end;

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
