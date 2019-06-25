Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 304B852045
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Jun 2019 03:15:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852C815F2;
	Tue, 25 Jun 2019 03:14:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852C815F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561425304;
	bh=55hZ+UHSZZpnjN/bqH1t47dIDa3qYA70VOWcCYvRGFM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WoDlDSt9xmYAQxzYVjQfQUS2h7A48qNR3usFO9g2Xyumvj5pcL5QtP34CXpKJu3nr
	 M7fBYtu+DpgDPPC2bxKpp/6NjurPHk/xxuuS7S9cIZ8w+84f6+EcwrQNRh1fcqL4bB
	 P90nEyWcue8IOVFpoOqvYGVIxfoO2EE/3kjKloyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 229D7F896B7;
	Tue, 25 Jun 2019 03:13:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7955EF896B7; Tue, 25 Jun 2019 03:13:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCBC1F8065B
 for <alsa-devel@alsa-project.org>; Tue, 25 Jun 2019 03:13:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCBC1F8065B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jun 2019 18:13:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,413,1557212400"; d="scan'208";a="360203030"
Received: from advira-mobl1.amr.corp.intel.com ([10.254.29.243])
 by fmsmga006.fm.intel.com with ESMTP; 24 Jun 2019 18:13:08 -0700
Message-ID: <c98d6db0d63f8ecb51a87209432f5f00d76eac78.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 24 Jun 2019 18:13:08 -0700
In-Reply-To: <878stywfjt.wl-kuninori.morimoto.gx@renesas.com>
References: <878stywfjt.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH] ASoC: soc-core: call snd_soc_unbind_card()
 under mutex_lock; 
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

On Wed, 2019-06-19 at 10:07 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> commit 34ac3c3eb8f0c07 ("ASoC: core: lock client_mutex while removing
> link components") added mutex_lock() at soc_remove_link_components().
> 
> Is is called from snd_soc_unbind_card()
> 
> 	snd_soc_unbind_card()
> =>		soc_remove_link_components()
> 		soc_cleanup_card_resources()
> 			soc_remove_dai_links()
> =>				soc_remove_link_components()
> 
> And, there are 2 way to call it.
> 
> (1)
> 	snd_soc_unregister_component()
> **		mutex_lock()
> 			snd_soc_component_del_unlocked()
> =>				snd_soc_unbind_card()
> **		mutex_unlock()
> 
> (2)
> 	snd_soc_unregister_card()
> =>		snd_soc_unbind_card()
> 
> (1) case is already using mutex_lock() when it calles
> snd_soc_unbind_card(), thus, we will get lockdep warning.
> 
> commit 495f926c68ddb90 ("ASoC: core: Fix deadlock in
> snd_soc_instantiate_card()") tried to fixup it, but still not
> enough. We still have lockdep warning when we try unbind/bind.
> 
> We need mutex_lock() under snd_soc_unregister_card()
> instead of snd_remove_link_components()/snd_soc_unbind_card().
> 
> Fixes: 34ac3c3eb8f0c07 ("ASoC: core: lock client_mutex while removing
> link components")
> Fixes: 495f926c68ddb90 ("ASoC: core: Fix deadlock in
> snd_soc_instantiate_card()")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

> ---
>  sound/soc/soc-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 2353886..2a408cc 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2747,14 +2747,12 @@ static void snd_soc_unbind_card(struct
> snd_soc_card *card, bool unregister)
>  		snd_soc_dapm_shutdown(card);
>  		snd_soc_flush_all_delayed_work(card);
>  
> -		mutex_lock(&client_mutex);
>  		/* remove all components used by DAI links on this card
> */
>  		for_each_comp_order(order) {
>  			for_each_card_rtds(card, rtd) {
>  				soc_remove_link_components(card, rtd,
> order);
>  			}
>  		}
> -		mutex_unlock(&client_mutex);
>  
>  		soc_cleanup_card_resources(card);
>  		if (!unregister)
> @@ -2773,7 +2771,9 @@ static void snd_soc_unbind_card(struct
> snd_soc_card *card, bool unregister)
>   */
>  int snd_soc_unregister_card(struct snd_soc_card *card)
>  {
> +	mutex_lock(&client_mutex);
>  	snd_soc_unbind_card(card, true);
> +	mutex_unlock(&client_mutex);
>  	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card-
> >name);
>  
>  	return 0;

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
