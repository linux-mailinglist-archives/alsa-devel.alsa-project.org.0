Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D4EF404
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 04:22:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 36BEE1711;
	Tue,  5 Nov 2019 04:21:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 36BEE1711
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572924167;
	bh=Ir3MeF+XuiZnwifwojGIl2Da2h4Fp+50gVRFhpZERnQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cL5pNkoiYnlWCAfdi7T6DK6tm5u8CiqiNClnxk5Q3FCwhKg9mA5qkZ3kB7NLV+7TX
	 ZzCtCzMryGJnfwuJyrbth5mI6mw/KfpZC1Wh3qTJnqItQlHCo5vt+NPJkgn78mzy1v
	 hk496CYnKNdL2Mlm9QThPZXExLKJ+Hz8hdn/I4ps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B297AF8049B;
	Tue,  5 Nov 2019 04:21:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90EB9F8049B; Tue,  5 Nov 2019 04:20:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C2EBF800F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 04:20:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C2EBF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Nov 2019 19:20:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,269,1569308400"; d="scan'208";a="204832626"
Received: from njdenler-mobl1.amr.corp.intel.com ([10.254.94.55])
 by orsmga003.jf.intel.com with ESMTP; 04 Nov 2019 19:20:52 -0800
Message-ID: <3a6f27ed62f9cb0b97b9e7a6ae5b3399cd9c8e15.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 04 Nov 2019 19:20:56 -0800
In-Reply-To: <87imo7c9ae.wl-kuninori.morimoto.gx@renesas.com>
References: <874kzrdo1x.wl-kuninori.morimoto.gx@renesas.com>
 <87imo7c9ae.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v2 resend 15/18] ASoC: soc-core: don't call
 snd_soc_dapm_new_dai_widgets() at snd_soc_register_dai()
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

On Wed, 2019-10-30 at 10:27 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> ALSA SoC has 2 functions.
> snd_soc_register_dai()  is used from topology
> snd_soc_register_dais() is used from snd_soc_add_component()
> 
> In general, people think like _dai() is called from _dais()
> with for loop. But in reality, these are very similar
> but different implementation.
> We shouldn't have duplicated and confusing implementation.
> 
> snd_soc_register_dai() is now used from topology.
> But to reduce duplicated code, it should be used from _dais(), too.
> 
> Because of topology side specific reason,
> it is calling snd_soc_dapm_new_dai_widgets(),
> but it is not needed _dais() side.
> 
> This patch factorizes snd_soc_register_dai() to
> topology / _dais() common part, and topology specific part.
> And do topology specific part at soc-topology.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc.h      |  6 +++---
>  sound/soc/soc-core.c     | 25 ++++++-------------------
>  sound/soc/soc-topology.c | 17 ++++++++++++++++-
>  3 files changed, 25 insertions(+), 23 deletions(-)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 766fa81..4e38ee6 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1326,9 +1326,9 @@ struct snd_soc_dai_link
> *snd_soc_find_dai_link(struct snd_soc_card *card,
>  					       int id, const char
> *name,
>  					       const char
> *stream_name);
>  
> -int snd_soc_register_dai(struct snd_soc_component *component,
> -			 struct snd_soc_dai_driver *dai_drv,
> -			 bool legacy_dai_naming);
> +struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component
> *component,
> +					 struct snd_soc_dai_driver
> *dai_drv,
> +					 bool legacy_dai_naming);
>  void snd_soc_unregister_dai(struct snd_soc_dai *dai);
>  
>  struct snd_soc_dai *snd_soc_find_dai(
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 7bd38fb..8045f4f 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2606,37 +2606,24 @@ EXPORT_SYMBOL_GPL(snd_soc_unregister_dai);
>   * These DAIs's widgets will be freed in the card cleanup and the
> DAIs
>   * will be freed in the component cleanup.
>   */
> -int snd_soc_register_dai(struct snd_soc_component *component,
> -			 struct snd_soc_dai_driver *dai_drv,
> -			 bool legacy_dai_naming)
> +struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component
> *component,
> +					 struct snd_soc_dai_driver
> *dai_drv,
> +					 bool legacy_dai_naming)
>  {
> -	struct snd_soc_dapm_context *dapm =
> -		snd_soc_component_get_dapm(component);
>  	struct snd_soc_dai *dai;
> -	int ret;
>  
>  	if (dai_drv->dobj.type != SND_SOC_DOBJ_PCM) {
>  		dev_err(component->dev, "Invalid dai type %d\n",
>  			dai_drv->dobj.type);
> -		return -EINVAL;
> +		return NULL;
>  	}
>  
>  	lockdep_assert_held(&client_mutex);
>  	dai = soc_add_dai(component, dai_drv, legacy_dai_naming);
Maybe you could just say "return soc_add_dai(component, dai_drv,
legacy_dai_naming);" here?
>  	if (!dai)
> -		return -ENOMEM;
> -
> -	/*
> -	 * Create the DAI widgets here. After adding DAIs, topology may
> -	 * also add routes that need these widgets as source or sink.
> -	 */
> -	ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
> -	if (ret != 0) {
> -		dev_err(component->dev,
> -			"Failed to create DAI widgets %d\n", ret);
> -	}
> +		return NULL;
>  
> -	return ret;
> +	return dai;
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_register_dai);
>  
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index b6e1456..81d2af0 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1800,6 +1800,9 @@ static int soc_tplg_dai_create(struct soc_tplg
> *tplg,
>  	struct snd_soc_dai_driver *dai_drv;
>  	struct snd_soc_pcm_stream *stream;
>  	struct snd_soc_tplg_stream_caps *caps;
> +	struct snd_soc_dai *dai;
> +	struct snd_soc_dapm_context *dapm =
> +		snd_soc_component_get_dapm(tplg->comp);
>  	int ret;
>  
>  	dai_drv = kzalloc(sizeof(struct snd_soc_dai_driver),
> GFP_KERNEL);
> @@ -1842,7 +1845,19 @@ static int soc_tplg_dai_create(struct soc_tplg
> *tplg,
>  	list_add(&dai_drv->dobj.list, &tplg->comp->dobj_list);
>  
>  	/* register the DAI to the component */
> -	return snd_soc_register_dai(tplg->comp, dai_drv, false);
> +	dai = snd_soc_register_dai(tplg->comp, dai_drv, false);
> +	if (!dai)
> +		return -ENOMEM;
> +
> +	/* Create the DAI widgets here */
> +	ret = snd_soc_dapm_new_dai_widgets(dapm, dai);
> +	if (ret != 0) {
> +		dev_err(dai->dev, "Failed to create DAI widgets %d\n",
> ret);
> +		snd_soc_unregister_dai(dai);
> +		return ret;
> +	}
> +
> +	return ret;
>  }
>  
>  static void set_link_flags(struct snd_soc_dai_link *link,

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
