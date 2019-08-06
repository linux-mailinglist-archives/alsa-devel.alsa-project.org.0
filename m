Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C888282A6D
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 06:37:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 47C8B1663;
	Tue,  6 Aug 2019 06:37:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 47C8B1663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565066274;
	bh=vbGJUXLaBiRCPLZebSVSfbjGrOas1iHPdt9Lhn9CoZg=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DSeN3D3DUpIUF6If6+xgjxdm71x6U7tkXlLALAayh/a/lyTOFlBQtO2Apa2nuox6h
	 97h8WzMWqseY3u/AGGtJb1DGQOsc2o0K3upvXKftD0QOWXQB8ZrVdGtvYRdTKU4ti+
	 87F9aPJWMJoc3dPPZit3+qBI8vvrntkkVXavppLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F3EDF804CA;
	Tue,  6 Aug 2019 06:36:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8BFCAF80483; Tue,  6 Aug 2019 06:36:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0096FF800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 06:36:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0096FF800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 21:35:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="325519789"
Received: from sbaqai-mobl.amr.corp.intel.com ([10.251.144.137])
 by orsmga004.jf.intel.com with ESMTP; 05 Aug 2019 21:35:58 -0700
Message-ID: <203f012de6a77b8994060448b30dc795f03a0528.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 05 Aug 2019 21:35:58 -0700
In-Reply-To: <87r25z2ihd.wl-kuninori.morimoto.gx@renesas.com>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87r25z2ihd.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 07/28] ASoC: soc-core: don't check widget
 for snd_soc_dapm_new_controls()
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
> snd_soc_dapm_new_controls() registers controls by using
> for(... i < num; ...). It means if widget was NULL, num should be
> zero.
> Thus, we don't need to check about widget pointer.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 22 +++++++++-------------
>  1 file changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 6347d65..bdd6a2e 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1264,16 +1264,14 @@ static int soc_probe_component(struct
> snd_soc_card *card,
>  
>  	soc_init_component_debugfs(component);
>  
> -	if (component->driver->dapm_widgets) {
> -		ret = snd_soc_dapm_new_controls(dapm,
> +	ret = snd_soc_dapm_new_controls(dapm,
>  					component->driver-
> >dapm_widgets,
>  					component->driver-
> >num_dapm_widgets);
>  
> -		if (ret != 0) {
> -			dev_err(component->dev,
> -				"Failed to create new controls %d\n",
> ret);
> -			goto err_probe;
> -		}
> +	if (ret != 0) {
> +		dev_err(component->dev,
> +			"Failed to create new controls %d\n", ret);
> +		goto err_probe;
>  	}
>  
>  	for_each_component_dais(component, dai) {
> @@ -1989,13 +1987,11 @@ static int snd_soc_instantiate_card(struct
> snd_soc_card *card)
>  	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
>  #endif
>  
> -	if (card->dapm_widgets)
> -		snd_soc_dapm_new_controls(&card->dapm, card-
> >dapm_widgets,
> -					  card->num_dapm_widgets);
> +	snd_soc_dapm_new_controls(&card->dapm, card->dapm_widgets,
> +				  card->num_dapm_widgets);
Should the return value be checked here?
>  
> -	if (card->of_dapm_widgets)
> -		snd_soc_dapm_new_controls(&card->dapm, card-
> >of_dapm_widgets,
> -					  card->num_of_dapm_widgets);
> +	snd_soc_dapm_new_controls(&card->dapm, card->of_dapm_widgets,
> +				  card->num_of_dapm_widgets);
and here?

Thanks,
Ranjani


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
