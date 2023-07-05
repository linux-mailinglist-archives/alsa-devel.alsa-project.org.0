Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FA1748778
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 17:08:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A55133E7;
	Wed,  5 Jul 2023 17:07:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A55133E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688569710;
	bh=2VpaZbRfmHCXtXMLPIOmDje+7EMPnAYq7+Bzz2xAHJM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Bed9DTObxPQFMy+wFnw+tQZSpQp2QSW6uhswF7LIFD2FF3TJa9ibOGjSqSSy/1y6v
	 8bwJhPDBmWe6FnE6AV3DKIeQ1IdOq9c/7vKCAVabJqj1rs49Rse57OWjDJ3lhwvxUb
	 Nf939GwUPv3cylj23zqzGzrcXpBoetJAuCs5Ai2U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A861F80124; Wed,  5 Jul 2023 17:07:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AF08F80124;
	Wed,  5 Jul 2023 17:07:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A3B6F80125; Wed,  5 Jul 2023 17:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 20725F800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 17:07:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 20725F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LkFPG2OI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688569653; x=1720105653;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=2VpaZbRfmHCXtXMLPIOmDje+7EMPnAYq7+Bzz2xAHJM=;
  b=LkFPG2OI04YGcPi96pGcfcVaAkabr9MyJyLGSmpsuu5qM9xIRPads93l
   2yYKPmRvkRR0aYUikOnb315N9wRU6xJakpYLtWsHKTtxVH2ckAtpQqUzx
   vc7Yqi022TTaY4Ro8ZrDDwe8iOYUyEeJlqLbDqgsD933WKrR871ZoGMuq
   CO25J28odygY5nTJs9pyw9hTrJZevz/+qQlsb2rSdBmR7GMJediSkpucr
   Cdq1U6Y94mj80joPf7dUgKx3sfUAkk47ssf0tjOBSrvZT7tmA+V219pbj
   msugWziZIk3HxB1Ay3Kn87kpr2bF8SkfiOWzzPUvCjL8pxIC0MxAau6mC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="429401368"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="429401368"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 08:07:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="669440968"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="669440968"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144])
 ([10.99.16.144])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 08:07:25 -0700
Message-ID: <ac232872-734f-d192-d46c-555ebe3625c5@linux.intel.com>
Date: Wed, 5 Jul 2023 17:07:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 7/8] ASoC: topology: suppress probe deferral errors
Content-Language: en-US
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20230705123018.30903-1-johan+linaro@kernel.org>
 <20230705123018.30903-8-johan+linaro@kernel.org>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20230705123018.30903-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QWD7IMC55H6UCXJWM4DWVFTMPJA7XEAP
X-Message-ID-Hash: QWD7IMC55H6UCXJWM4DWVFTMPJA7XEAP
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QWD7IMC55H6UCXJWM4DWVFTMPJA7XEAP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 7/5/2023 2:30 PM, Johan Hovold wrote:
> Suppress probe deferral error messages when loading topologies and
> creating frontend links to avoid spamming the logs when a component has
> not yet been registered:
> 
>      snd-sc8280xp sound: ASoC: adding FE link failed
>      snd-sc8280xp sound: ASoC: topology: could not load header: -517
> 
> Note that dev_err_probe() is not used as the topology component can be
> probed and removed while the underlying platform device remains bound to
> its driver.

I'm not sure that I understand that argument... what's wrong with
dev_err_probe(tplg->dev, err, "ASoC: adding FE link failed\n");
instead of
dev_err(tplg->dev, "ASoC: adding FE link failed\n");
?
Personally I would prefer dev_err_probe() to be used as it also provides 
debug message.

> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   sound/soc/soc-topology.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/soc-topology.c b/sound/soc/soc-topology.c
> index d0aca6b9058b..696c9647debe 100644
> --- a/sound/soc/soc-topology.c
> +++ b/sound/soc/soc-topology.c
> @@ -1751,7 +1751,8 @@ static int soc_tplg_fe_link_create(struct soc_tplg *tplg,
>   
>   	ret = snd_soc_add_pcm_runtimes(tplg->comp->card, link, 1);
>   	if (ret < 0) {
> -		dev_err(tplg->dev, "ASoC: adding FE link failed\n");
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(tplg->dev, "ASoC: adding FE link failed\n");
>   		goto err;
>   	}
>   
> @@ -2514,8 +2515,11 @@ static int soc_tplg_process_headers(struct soc_tplg *tplg)
>   			/* load the header object */
>   			ret = soc_tplg_load_header(tplg, hdr);
>   			if (ret < 0) {
> -				dev_err(tplg->dev,
> -					"ASoC: topology: could not load header: %d\n", ret);
> +				if (ret != -EPROBE_DEFER) {
> +					dev_err(tplg->dev,
> +						"ASoC: topology: could not load header: %d\n",
> +						ret);
> +				}
>   				return ret;
>   			}
>   

