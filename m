Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 672FA4F073
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jun 2019 23:22:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50BE83A;
	Fri, 21 Jun 2019 23:21:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50BE83A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1561152121;
	bh=NK0nJxzkDC3hjJtleypgpSbKGe759ZV+y3coWqOOyG8=;
	h=From:To:In-Reply-To:References:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQKElIzoYGt8p6XDYn+Bj3PavoW3M3WxqYa88ei8UDXIpvzSNuHQb/3UfDUgTjPFp
	 7M66JyUkWcn7//VhtyiV0ClCrePpSBEoOrmxmvg1/fKnhItPth+xYHlDmDmBz3YuPK
	 Ce3S83HbExROUXuElZtaPVj0msEVgJSaCrh7A7U0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 203CAF8070D;
	Fri, 21 Jun 2019 23:20:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1958F896B8; Fri, 21 Jun 2019 23:20:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61B2AF8070D
 for <alsa-devel@alsa-project.org>; Fri, 21 Jun 2019 23:20:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61B2AF8070D
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jun 2019 14:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,401,1557212400"; d="scan'208";a="187319124"
Received: from advira-mobl1.amr.corp.intel.com ([10.254.29.243])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jun 2019 14:20:07 -0700
Message-ID: <c137f6ce9cc8d4ffb26f0ca432845b41d5f5acae.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o92r92p6.wl-kuninori.morimoto.gx@renesas.com>
References: <878stywfjt.wl-kuninori.morimoto.gx@renesas.com>
 <87o92r92p6.wl-kuninori.morimoto.gx@renesas.com>
Mime-Version: 1.0
Date: Fri, 21 Jun 2019 14:19:59 -0700
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
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

> > From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > 
> > commit 34ac3c3eb8f0c07 ("ASoC: core: lock client_mutex while
> > removing
> > link components") added mutex_lock() at
> > soc_remove_link_components().
> > 
> > Is is called from snd_soc_unbind_card()
> > 
> > 	snd_soc_unbind_card()
> > =>		soc_remove_link_components()
> > 		soc_cleanup_card_resources()
> > 			soc_remove_dai_links()
> > =>				soc_remove_link_components()
> > 
> > And, there are 2 way to call it.
> > 
> > (1)
> > 	snd_soc_unregister_component()
> > **		mutex_lock()
> > 			snd_soc_component_del_unlocked()
> > =>				snd_soc_unbind_card()
> > **		mutex_unlock()
> > 
> > (2)
> > 	snd_soc_unregister_card()
> > =>		snd_soc_unbind_card()
> > 
> > (1) case is already using mutex_lock() when it calles
> > snd_soc_unbind_card(), thus, we will get lockdep warning.

Thanks, morimoto-san. You are correct. Case 1 will result in a lockdep
warning. This patch looks good. 

Thanks,
Ranjani
> > 
> > commit 495f926c68ddb90 ("ASoC: core: Fix deadlock in
> > snd_soc_instantiate_card()") tried to fixup it, but still not
> > enough. We still have lockdep warning when we try unbind/bind.
> > 
> > We need mutex_lock() under snd_soc_unregister_card()
> > instead of snd_remove_link_components()/snd_soc_unbind_card().
> > 
> > Fixes: 34ac3c3eb8f0c07 ("ASoC: core: lock client_mutex while
> > removing link components")
> > Fixes: 495f926c68ddb90 ("ASoC: core: Fix deadlock in
> > snd_soc_instantiate_card()")
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> > ---
> >  sound/soc/soc-core.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> > index 2353886..2a408cc 100644
> > --- a/sound/soc/soc-core.c
> > +++ b/sound/soc/soc-core.c
> > @@ -2747,14 +2747,12 @@ static void snd_soc_unbind_card(struct
> > snd_soc_card *card, bool unregister)
> >  		snd_soc_dapm_shutdown(card);
> >  		snd_soc_flush_all_delayed_work(card);
> >  
> > -		mutex_lock(&client_mutex);
> >  		/* remove all components used by DAI links on this card
> > */
> >  		for_each_comp_order(order) {
> >  			for_each_card_rtds(card, rtd) {
> >  				soc_remove_link_components(card, rtd,
> > order);
> >  			}
> >  		}
> > -		mutex_unlock(&client_mutex);
> >  
> >  		soc_cleanup_card_resources(card);
> >  		if (!unregister)
> > @@ -2773,7 +2771,9 @@ static void snd_soc_unbind_card(struct
> > snd_soc_card *card, bool unregister)
> >   */
> >  int snd_soc_unregister_card(struct snd_soc_card *card)
> >  {
> > +	mutex_lock(&client_mutex);
> >  	snd_soc_unbind_card(card, true);
> > +	mutex_unlock(&client_mutex);
> >  	dev_dbg(card->dev, "ASoC: Unregistered card '%s'\n", card-
> > >name);
> >  
> >  	return 0;
> > -- 
> > 2.7.4
> > 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
