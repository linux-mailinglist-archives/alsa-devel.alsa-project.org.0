Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CED1CEA10
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 03:18:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 78C0515F9;
	Tue, 12 May 2020 03:17:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 78C0515F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589246304;
	bh=kKWxQoBq4BrTeQcc4i/EIqJQloT/9PHpRe0YojkYN9k=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWJwPvkULx01B7PSduXo/Vy3Y4ul6gMA9mC+HnQmrLU57gNWeTbwDbgxkjUVs2nfj
	 TlAbCZ9Ph0K8m3nM3szV4UFdTFl7rTRyV2btEzGcYtONN0oGc40hthfZWl0OcY11jP
	 mB/tbT2vmSEcHMJBHz1leV885ix1fhtXeiXVtoP0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 577E1F802E2;
	Tue, 12 May 2020 00:48:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0977DF802E7; Tue, 12 May 2020 00:47:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16171F802E2
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 00:47:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16171F802E2
IronPort-SDR: XKBMizDH2Y3R+Gg36OpaezTJmgbH2S6PjycdTkKE9x5p8/pIXvjEg0lkWMFYQMntXWdtFjcwUI
 /psGaFPMBWOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 15:47:49 -0700
IronPort-SDR: 9xFWVZmseWlMyM0CJ9QVFIaHplXAstrPYJ7SC5yyv+WWC4cjhFw8qnvfWaenMzi5ZsKA/uut2X
 CmV07FkSsiKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="252719517"
Received: from ajgalle-mobl.amr.corp.intel.com ([10.254.179.28])
 by fmsmga008.fm.intel.com with ESMTP; 11 May 2020 15:47:48 -0700
Message-ID: <fca796666d656c06b7cf28a3a74b2a444f082cc1.camel@linux.intel.com>
Subject: Re: [PATCH 03/17] ASoC: soc-dai: add snd_soc_component_activity()
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Mon, 11 May 2020 15:47:48 -0700
In-Reply-To: <871rnr9fq5.wl-kuninori.morimoto.gx@renesas.com>
References: <875zd39frp.wl-kuninori.morimoto.gx@renesas.com>
 <871rnr9fq5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, 2020-05-11 at 14:56 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h | 1 +
>  sound/soc/soc-pcm.c           | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index 864983b09846..29b0c2c1d2db 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -358,6 +358,7 @@ int snd_soc_component_stream_event(struct
> snd_soc_component *component,
>  				   int event);
>  int snd_soc_component_set_bias_level(struct snd_soc_component
> *component,
>  				     enum snd_soc_bias_level level);
> +#define snd_soc_component_activity(component)	((component)-
> >active)
>  
>  #ifdef CONFIG_REGMAP
>  void snd_soc_component_init_regmap(struct snd_soc_component
> *component,
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index e923e3746fec..420595356111 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -267,7 +267,7 @@ static void snd_soc_runtime_action(struct
> snd_soc_pcm_runtime *rtd,
>  	for_each_rtd_dais(rtd, i, dai) {
>  		dai->stream_active[stream] += action;
>  		dai->active += action;
> -		dai->component->active += action;
> +		snd_soc_component_activity(dai->component) += action;

This is not very easy to comprehend. Maybe we could introduce another
macro for updating the usage count for the component and use that
instead? something like, snd_soc_component_update_usage_count(dai-
>component, action)?
Thanks,
Ranjani

