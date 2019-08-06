Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1EF82A79
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2019 06:40:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8180950;
	Tue,  6 Aug 2019 06:39:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8180950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565066427;
	bh=YniDFDRLSrSWVz04FKroxKj+mxDoywoM4LWe32FZc3g=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iujaz9NRbE7EM+J5IVRYDraJp+60eXpUscbKzdDrVrMkZMMt0ZH8QZL64HFLp6loN
	 ukBH8WW+FPaPWPcxXyodDBMud+U17eKb4tBTIFxYXsKtY87huEfZHwHnTs1olBIQgl
	 yZ2myELVlbPUX93jYGoZojDGd3aOVbYrM+meWInA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E59EF804CB;
	Tue,  6 Aug 2019 06:38:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54CEFF80483; Tue,  6 Aug 2019 06:38:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8AD94F800F3
 for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2019 06:38:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8AD94F800F3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 21:38:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,352,1559545200"; d="scan'208";a="325520156"
Received: from sbaqai-mobl.amr.corp.intel.com ([10.251.144.137])
 by orsmga004.jf.intel.com with ESMTP; 05 Aug 2019 21:38:35 -0700
Message-ID: <be2a83d94bce44931ffa16ec5c6a33b153b100fb.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 05 Aug 2019 21:38:34 -0700
In-Reply-To: <87pnlj2ih6.wl-kuninori.morimoto.gx@renesas.com>
References: <871rxz3x7e.wl-kuninori.morimoto.gx@renesas.com>
 <87pnlj2ih6.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 08/28] ASoC: soc-core: don't check controls
 for snd_soc_add_component_controls()
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
> snd_soc_add_component_controls() registers controls by using
> for(... i < num; ...). If controls was NULL, num should be zero.
> Thus, we don't need to check about controls pointer.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/soc-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index bdd6a2e..7be8385 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1304,10 +1304,9 @@ static int soc_probe_component(struct
> snd_soc_card *card,
>  		}
>  	}
>  
> -	if (component->driver->controls)
> -		snd_soc_add_component_controls(component,
> -					       component->driver-
> >controls,
> -					       component->driver-
> >num_controls);
> +	snd_soc_add_component_controls(component,
> +				       component->driver->controls,
> +				       component->driver-
> >num_controls);
Should the return value be checked?

Thanks,
Ranjani

>  	if (component->driver->dapm_routes)
>  		snd_soc_dapm_add_routes(dapm,
>  					component->driver->dapm_routes,

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
