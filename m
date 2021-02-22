Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5948321D5A
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Feb 2021 17:47:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63B7F1682;
	Mon, 22 Feb 2021 17:46:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63B7F1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614012465;
	bh=OkdGbX3+wiZB2eDAx19KEfLtBJo2vzFLZjk5DK1SuBw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d6sxrgNWBRKoM9h10sbtDilHN6R6sXGCYYFFRl/WsBkbrVB5IPcM8p1Vj5ujMPuvN
	 ZQKiTh5088uXRD2BNDsmZ8ad9ld08MJym5t9HLKdcnT0fLX8Mwa7kLgawAU6ISQhTH
	 SAF8FA9wFbYJlcpIBBC/3tFq/dZ6bB7uf77whGO0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 78E28F8028B;
	Mon, 22 Feb 2021 17:45:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8FCD1F80249; Mon, 22 Feb 2021 17:45:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD65CF8016C
 for <alsa-devel@alsa-project.org>; Mon, 22 Feb 2021 17:45:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD65CF8016C
IronPort-SDR: 8kiTKP31F/usBf2rWiVPlL+JeZ1Rgv+WTYk3+4LmMqMTx1x4ph4KO9uxRRv68rmRmKCoWq5qC5
 PfKZQY7zatEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="184619501"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="184619501"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:45:14 -0800
IronPort-SDR: VFT7oNWQ/7yypkUC4b0YKgXwTbVfpR6llkh+1yfOOsIYq6IBX7c+xlP4xI9Qi2uE3FyE6HP8Pm
 fMK2RMnLucJQ==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; d="scan'208";a="364072192"
Received: from cjmerril-mobl1.amr.corp.intel.com (HELO [10.212.252.139])
 ([10.212.252.139])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2021 08:45:13 -0800
Subject: Re: [PATCH 4/8] ASoC: sh: rcar: core: rename shadowing variables
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20210219231635.5749-1-pierre-louis.bossart@linux.intel.com>
 <20210219231635.5749-5-pierre-louis.bossart@linux.intel.com>
 <87wnv1vw6a.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <03f560f1-2389-424d-5d4c-84e244baca1c@linux.intel.com>
Date: Mon, 22 Feb 2021 09:41:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87wnv1vw6a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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



On 2/21/21 5:27 PM, Kuninori Morimoto wrote:
> 
> Hi Pierre-Louis
> 
>> sound/soc/sh/rcar/core.c:1369:22: style: Local variable 'rdai' shadows
>> outer variable [shadowVariable]
>>      struct rsnd_dai *rdai = rsnd_rdai_get(priv, dai_i);
>>                       ^
> 
> I'm not 100% sure about this warning,
> but this path is overkill. Maybe below is enough ?

Hi Morimoto-san,
It might be better if we drop this patch from the series and have you 
send the proper fix with my Reported-by tag.
Would that work for you?
Thanks!

> ---------
> diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
> index 8533aa696183..cae9639c0ef9 100644
> --- a/sound/soc/sh/rcar/core.c
> +++ b/sound/soc/sh/rcar/core.c
> @@ -1382,7 +1382,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
>   		for_each_endpoint_of_node(dai_node, dai_np) {
>   			__rsnd_dai_probe(priv, dai_np, dai_i);
>   			if (rsnd_is_gen3(priv)) {
> -				struct rsnd_dai *rdai = rsnd_rdai_get(priv, dai_i);
> +				rdai = rsnd_rdai_get(priv, dai_i);
>   
>   				rsnd_parse_connect_graph(priv, &rdai->playback, dai_np);
>   				rsnd_parse_connect_graph(priv, &rdai->capture,  dai_np);
> @@ -1393,7 +1393,7 @@ static int rsnd_dai_probe(struct rsnd_priv *priv)
>   		for_each_child_of_node(dai_node, dai_np) {
>   			__rsnd_dai_probe(priv, dai_np, dai_i);
>   			if (rsnd_is_gen3(priv)) {
> -				struct rsnd_dai *rdai = rsnd_rdai_get(priv, dai_i);
> +				rdai = rsnd_rdai_get(priv, dai_i);
>   
>   				rsnd_parse_connect_simple(priv, &rdai->playback, dai_np);
>   				rsnd_parse_connect_simple(priv, &rdai->capture,  dai_np);
> ----
> 
> Thank you for your help !!
> 
> Best regards
> ---
> Kuninori Morimoto
> 
