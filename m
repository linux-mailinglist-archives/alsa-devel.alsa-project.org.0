Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB4374298
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 02:37:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77C801939;
	Thu, 25 Jul 2019 02:36:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77C801939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564015025;
	bh=J7YnlfhE1PxnCNSSJ8lEEG5SJkzKBXTO4AT7Q78nMkk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EP6WDzgBV26Kawbt/XvsZG7hJwbkRpDY2e5vTDUwXwiiuimHK67xLJa8YC9NLvd2p
	 LwOY8rUDB6wYazghOj9xrfnhaPzRnVRMycnEwOLM9WVOXMeQlXY1BFpiQ99xyFlpPy
	 QMGDj/CPh0GN9/fqb/GRpXvlsGSEED5O3dgAQHP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8060AF803D1;
	Thu, 25 Jul 2019 02:35:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 804FEF803D1; Thu, 25 Jul 2019 02:35:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2845CF8026F
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 02:35:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2845CF8026F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jul 2019 17:35:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,304,1559545200"; d="scan'208";a="189205387"
Received: from ayamada1-mobl.gar.corp.intel.com ([10.254.90.178])
 by fmsmga001.fm.intel.com with ESMTP; 24 Jul 2019 17:35:11 -0700
Message-ID: <31817869f1121bdaf5ce6806342d9fe93538b347.camel@linux.intel.com>
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown
 <broonie@kernel.org>
Date: Wed, 24 Jul 2019 17:35:10 -0700
In-Reply-To: <87sgqwtd71.wl-kuninori.morimoto.gx@renesas.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <87sgqwtd71.wl-kuninori.morimoto.gx@renesas.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH 07/25] ASoC: soc-component: add
 snd_soc_component_hw_free()
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

On Wed, 2019-07-24 at 10:51 +0900, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Current ALSA SoC is directly using component->driver->ops->xxx,
> thus, it is deep nested, and makes code difficult to read,
> and is not good for encapsulation.
> This patch adds new snd_soc_component_hw_free() and use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  include/sound/soc-component.h |  2 ++
>  sound/soc/soc-component.c     | 10 ++++++++++
>  sound/soc/soc-pcm.c           |  6 +-----
>  3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-
> component.h
> index ac93189..9ec67a3 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -332,5 +332,7 @@ int snd_soc_component_prepare(struct
> snd_soc_component *component,
>  int snd_soc_component_hw_params(struct snd_soc_component *component,
>  				struct snd_pcm_substream *substream,
>  				struct snd_pcm_hw_params *params);
> +int snd_soc_component_hw_free(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream);
>  
>  #endif /* __SOC_COMPONENT_H */
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 249dac4..7246518 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -326,3 +326,13 @@ int snd_soc_component_hw_params(struct
> snd_soc_component *component,
>  
>  	return 0;
>  }
> +
> +int snd_soc_component_hw_free(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream)
> +{
> +	if (component->driver->ops &&
> +	    component->driver->ops->hw_free)
> +		return component->driver->ops->hw_free(substream);
> +
> +	return 0;
> +}
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 26f73af..780a119 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -843,11 +843,7 @@ static int soc_pcm_components_hw_free(struct
> snd_pcm_substream *substream,
>  		if (component == last)
>  			break;
>  
> -		if (!component->driver->ops ||
> -		    !component->driver->ops->hw_free)
> -			continue;
> -
> -		component->driver->ops->hw_free(substream);
> +		snd_soc_component_hw_free(component, substream);
Morimoto-san,

Just wondering why we dont care about the return value here. I see that
the original code ignores the return value too but is it something that
should be addressed?

Thanks,
Ranjani
>  	}
>  
>  	return 0;

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
