Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E7A3B970
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2019 18:29:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33CAA16AB;
	Mon, 10 Jun 2019 18:28:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33CAA16AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560184181;
	bh=HRI/OtqgQr/zQLBHipjDOEMaZeVoQ2OiCE4WJwE58UY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=otdWZ0iRumsjm939YShNzVN93SknTpztTZzod4h+VBBcVtahRVJvcB/SsnA6EoPrI
	 a0HPiLcWQ7ginAzJdCdNdU2hq+Jcla/e4fsVYkkShH22hGySVSm7u6N5wg0cvC2qVk
	 TQuqwe9pqREtLiFYhxQN45THQ0ZinY7BZW7G7K1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9924EF896CE;
	Mon, 10 Jun 2019 18:27:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EFD6F896E0; Mon, 10 Jun 2019 18:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48A1FF80791
 for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2019 18:27:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48A1FF80791
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jun 2019 09:27:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,575,1557212400"; d="scan'208";a="183482938"
Received: from bareed-mobl1.amr.corp.intel.com ([10.254.97.61])
 by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2019 09:27:42 -0700
Message-ID: <e111b6362100444554fba6d5929c6dfa2ceefbaf.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 10 Jun 2019 09:27:41 -0700
In-Reply-To: <87imtev0l2.wl-kuninori.morimoto.gx@renesas.com>
References: <87imtev0l2.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, 2019-06-10 at 09:49 +0900, Kuninori Morimoto wrote:
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
> We need mutex_lock() under snd_soc_unregister_card()
> instead of snd_remove_link_components().
Thanks, Morimoto-san. I submitted a solution to fix the deadlock just a
couple of days ago as well (
https://mailman.alsa-project.org/pipermail/alsa-devel/2019-June/150764.html
). 

I am fine with either solution though. 

Thanks,
Ranjani
> 
> Fixes: 34ac3c3eb8f0c07 ("ASoC: core: lock client_mutex while removing
> link components")
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 94a36ee..1679990 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1018,14 +1018,12 @@ static void soc_remove_link_components(struct
> snd_soc_card *card,
>  	struct snd_soc_component *component;
>  	struct snd_soc_rtdcom_list *rtdcom;
>  
> -	mutex_lock(&client_mutex);
>  	for_each_rtdcom(rtd, rtdcom) {
>  		component = rtdcom->component;
>  
>  		if (component->driver->remove_order == order)
>  			soc_remove_component(component);
>  	}
> -	mutex_unlock(&client_mutex);
>  }
>  
>  static void soc_remove_dai_links(struct snd_soc_card *card)
> @@ -2774,7 +2772,9 @@ static void snd_soc_unbind_card(struct
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
