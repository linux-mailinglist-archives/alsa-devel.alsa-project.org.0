Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1AB6198B1
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Nov 2022 15:02:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1C72D1670;
	Fri,  4 Nov 2022 15:02:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1C72D1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667570570;
	bh=efmcWroeuQyRtmDkFtVeu8ScT8EbrzgbnEizz5PylEI=;
	h=Date:From:Subject:To:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ek36HVaAZfN9J3xC3Q6ybNDM37Uet5EOf3MiI/ItZxzNkY1LyQyRVKpHzrsR0nVwk
	 OzE9itbt/AOCFlM+bMtfWPQbcCUV4bEhP0gKaXMplp02iEFXs/cb9IXmkYFFVnVRsk
	 Aa9OJuqk9pTWIn0hz2hG91TKqpTZTPuPDXkgKwoI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB547F80149;
	Fri,  4 Nov 2022 15:01:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 774DEF804AC; Fri,  4 Nov 2022 15:01:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E09BF80431
 for <alsa-devel@alsa-project.org>; Fri,  4 Nov 2022 15:01:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E09BF80431
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="YilKUkcO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667570484; x=1699106484;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=efmcWroeuQyRtmDkFtVeu8ScT8EbrzgbnEizz5PylEI=;
 b=YilKUkcOD52bdj+/Qj2+Pswhk7T/GEbbp3cyO8lRVc/7dba7HneEvZAV
 ELudP+SfMonFvaPLMYK0Vb/o4f+iwEN6vgGmWXuJRDlIs8Z1tKoC1Du7C
 XlZrOwh47RyjQA7LvbVfjeqJtpOwKoTJ0ltxf5jR74gJx55R9mTg/7hdQ
 gKkg5M3C4D+By/FQZFqHLRCKGsZXKcVbrTZiDuKtboecFgIdOsRG8ypL+
 t9oG4205NLC78dFQg6XvOUJU4cphLlk3hsfAeK+7YF8EJw53co34+Rb/J
 jJ3br6tgIgruFonOwSgrxzW9v5CvwY1nN0hDXOIwMl5/E+77yZUKckXE4 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="293298011"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="293298011"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:01:18 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10521"; a="668363707"
X-IronPort-AV: E=Sophos;i="5.96,137,1665471600"; d="scan'208";a="668363707"
Received: from cavargas-mobl.amr.corp.intel.com (HELO [10.212.85.188])
 ([10.212.85.188])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2022 07:01:17 -0700
Message-ID: <b8bd9830-c933-092b-42db-75dd39bcb0c0@linux.intel.com>
Date: Fri, 4 Nov 2022 10:00:23 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.2
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/3] ASoC: component: Propagate result of suspend and
 resume callbacks
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org, 
 broonie@kernel.org
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-2-cezary.rojewski@intel.com>
Content-Language: en-US
In-Reply-To: <20221104131244.3920179-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, amadeuszx.slawinski@linux.intel.com, tiwai@suse.com
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



On 11/4/22 09:12, Cezary Rojewski wrote:
> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> 
> Both component->driver->suspend and ->resume() do return an int value
> but it isn't propagated to the core later on. Update
> snd_soc_component_suspend() and snd_soc_component_resume() so that the
> possible errors are not squelched.

This looks alright on paper but could break existing solutions.
There are a number of cases where an error during suspend is not fatal
and you don't want to prevent a system suspend if this is recoverable on
resume.

See for example the errors on clock-stop for SoundWire, which are
squelched on purpose. See also Andy Ross' PR to precisely stop
propagating errors in SOF https://github.com/thesofproject/linux/pull/3863

Maybe a less intrusive change would be to add a WARN_ON or something
visible to make sure solutions are fixed, and only critical issues can
prevent suspend? And in a second step the errors are propagated.

> Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/soc-component.h |  4 ++--
>  sound/soc/soc-component.c     | 22 ++++++++++++++++------
>  2 files changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index c26ffb033777..421f0fc4df3e 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -456,8 +456,8 @@ int snd_soc_component_open(struct snd_soc_component *component,
>  int snd_soc_component_close(struct snd_soc_component *component,
>  			    struct snd_pcm_substream *substream,
>  			    int rollback);
> -void snd_soc_component_suspend(struct snd_soc_component *component);
> -void snd_soc_component_resume(struct snd_soc_component *component);
> +int snd_soc_component_suspend(struct snd_soc_component *component);
> +int snd_soc_component_resume(struct snd_soc_component *component);
>  int snd_soc_component_is_suspended(struct snd_soc_component *component);
>  int snd_soc_component_probe(struct snd_soc_component *component);
>  void snd_soc_component_remove(struct snd_soc_component *component);
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index e12f8244242b..27b862ded846 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -318,18 +318,28 @@ int snd_soc_component_close(struct snd_soc_component *component,
>  	return soc_component_ret(component, ret);
>  }
>  
> -void snd_soc_component_suspend(struct snd_soc_component *component)
> +int snd_soc_component_suspend(struct snd_soc_component *component)
>  {
> +	int ret = 0;
> +
>  	if (component->driver->suspend)
> -		component->driver->suspend(component);
> -	component->suspended = 1;
> +		ret = component->driver->suspend(component);
> +	if (!ret)
> +		component->suspended = 1;
> +
> +	return soc_component_ret(component, ret);
>  }
>  
> -void snd_soc_component_resume(struct snd_soc_component *component)
> +int snd_soc_component_resume(struct snd_soc_component *component)
>  {
> +	int ret = 0;
> +
>  	if (component->driver->resume)
> -		component->driver->resume(component);
> -	component->suspended = 0;
> +		ret = component->driver->resume(component);
> +	if (!ret)
> +		component->suspended = 0;
> +
> +	return soc_component_ret(component, ret);
>  }
>  
>  int snd_soc_component_is_suspended(struct snd_soc_component *component)
