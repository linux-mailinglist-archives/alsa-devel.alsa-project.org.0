Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3016D157DB6
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:46:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDD751699;
	Mon, 10 Feb 2020 15:45:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDD751699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581345998;
	bh=PfdMzqJ54jeAKXrHvhkIEYdasfeqvbYpo6SCW5LKIWQ=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Txb2b37ImGwalUM84Kj8iwFkFwnVIjG9yo3duDoLm4sIfHda27T1UnVzRZ7ZGIWG+
	 +92nYs/XJk/CZNhJXqcYHRgusaYixaoceH1Be24u8Y4SLe2pWjP3l0ufagIZjww8sK
	 B5Os4P9VmKkp4lgZ3PJd97187ImFdTcsistYHdBA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 14688F8029B;
	Mon, 10 Feb 2020 15:42:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B999BF8028B; Mon, 10 Feb 2020 15:42:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2C80DF80279
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:42:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C80DF80279
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 06:42:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,425,1574150400"; d="scan'208";a="226213733"
Received: from ykatsuma-mobl1.gar.corp.intel.com (HELO [10.251.140.95])
 ([10.251.140.95])
 by fmsmga007.fm.intel.com with ESMTP; 10 Feb 2020 06:42:11 -0800
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87d0anceze.wl-kuninori.morimoto.gx@renesas.com>
 <874kvzcey1.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <095fdf34-5736-b79a-7bad-56f5a478e939@linux.intel.com>
Date: Mon, 10 Feb 2020 08:41:07 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <874kvzcey1.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH v3 6/8] ASoC: soc-pcm: call
 snd_soc_component_open/close() once
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

Hi Morimoto-san,

>   #define for_each_component_dais(component, dai)\
> diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
> index 14e175c..ee00c09 100644
> --- a/sound/soc/soc-component.c
> +++ b/sound/soc/soc-component.c
> @@ -297,34 +297,55 @@ EXPORT_SYMBOL_GPL(snd_soc_component_set_jack);
>   int snd_soc_component_module_get(struct snd_soc_component *component,
>   				 int upon_open)
>   {
> +	if (component->module)
> +		return 0;
> +
>   	if (component->driver->module_get_upon_open == !!upon_open &&
>   	    !try_module_get(component->dev->driver->owner))
>   		return -ENODEV;
>   
> +	component->module = 1;
> +

Maybe a red-herring but is there a potential for race conditions here if 
that function is called twice from different places? Don't we need some 
sort of lock for all the new flags introduced here?

Thanks
-Pierre
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
