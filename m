Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8384A7588A
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 22:01:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EBBDC1F0F;
	Thu, 25 Jul 2019 22:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EBBDC1F0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564084899;
	bh=9FJMJWn6c7+bOGYItO2MJChFqM0kkuxnnapTM+LTq/c=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ml+rlhEObqkJPvcMqLLJH23Sk0sahAcOR5YLm1FxUh4I1rwRIApjILxzCWjYJ2Ag9
	 PnRjhWD0wwy+6jItq0Hnfo0yRv9BVqw7r2gZzBMWGP0JVQB6PzN84+MQ+AUPgoNAwk
	 cMnGtYf44pKCXltE7YvYkXPv8ghpi6PSqVEEm6VY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 076FBF803D0;
	Thu, 25 Jul 2019 21:59:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BAA6F803D0; Thu, 25 Jul 2019 21:59:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EACF5F800E8
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 21:59:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EACF5F800E8
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Jul 2019 12:59:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,307,1559545200"; d="scan'208";a="170385626"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.251.89.116])
 ([10.251.89.116])
 by fmsmga008.fm.intel.com with ESMTP; 25 Jul 2019 12:59:44 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <8736iwurtc.wl-kuninori.morimoto.gx@renesas.com>
 <87v9vstd7a.wl-kuninori.morimoto.gx@renesas.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <2d2e6827-1c57-caf4-88ed-4b61f3b5a990@intel.com>
Date: Thu, 25 Jul 2019 21:59:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87v9vstd7a.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Mark Brown <broonie@kernel.org>
Subject: Re: [alsa-devel] [PATCH 05/25] ASoC: soc-component: add
 snd_soc_component_prepare()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2019-07-24 03:51, Kuninori Morimoto wrote:> +
> +int snd_soc_component_prepare(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream)
> +{
> +	if (component->driver->ops &&
> +	    component->driver->ops->prepare)
> +		return component->driver->ops->prepare(substream);
> +
> +	return 0;
> +}
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 86d2e6b..a77a14c 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -774,11 +774,7 @@ static int soc_pcm_prepare(struct snd_pcm_substream *substream)
>   	for_each_rtdcom(rtd, rtdcom) {
>   		component = rtdcom->component;
>   
> -		if (!component->driver->ops ||
> -		    !component->driver->ops->prepare)
> -			continue;
> -
> -		ret = component->driver->ops->prepare(substream);
> +		snd_soc_component_prepare(component, substream);
>   		if (ret < 0) {
>   			dev_err(component->dev,
>   				"ASoC: platform prepare error: %d\n", ret);
> 

Compared to old code, ret gets ignored here. Guess unintended modification?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
