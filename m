Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2321CE479
	for <lists+alsa-devel@lfdr.de>; Mon, 11 May 2020 21:29:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 58EB815E0;
	Mon, 11 May 2020 21:28:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 58EB815E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589225365;
	bh=ABKN5sqFpH68locdV7euyltO2S3aon0EoBNdyexb3Jw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bP8fSG6egfsO9HvmqtY74kCSweJMqF7iThvrkKVthZiXHZQ9BG+8wcPGo9Dyc+XK4
	 dhPTWVxzORIbLbbqVz+7eAsSe4p9c6PIw5JENSozSXVmwwjsTOobLfOIvtGQQ9SRS5
	 +hPlTC9rheWvfAk0Q4CJojA+tixb05l+5ZXeI+pg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7842F8027D;
	Mon, 11 May 2020 21:26:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C1F5BF8027B; Mon, 11 May 2020 21:26:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A3E8F80157
 for <alsa-devel@alsa-project.org>; Mon, 11 May 2020 21:26:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A3E8F80157
IronPort-SDR: 0Mo6ouQX6wJXlB+3gu4eI/4wEjBRHcGwdcWN4Ogsz6P8RYWIRkf2+T24axO9fie9i8RpDTZZDh
 gPDJLaF2u+Og==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2020 12:26:31 -0700
IronPort-SDR: jmuhnsGt0RS+NQepeqNFAduCHEerajBUOr3mRyDfpuZmg7ePOuChOXF5zQjTi3qumXA/2uIZqg
 VkZlP5j+KxUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,381,1583222400"; d="scan'208";a="297786529"
Received: from mlamm-mobl1.amr.corp.intel.com (HELO [10.255.230.116])
 ([10.255.230.116])
 by orsmga008.jf.intel.com with ESMTP; 11 May 2020 12:26:31 -0700
Subject: Re: [PATCH 03/17] ASoC: soc-dai: add snd_soc_component_activity()
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <875zd39frp.wl-kuninori.morimoto.gx@renesas.com>
 <871rnr9fq5.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f9c8f3c6-a47e-dfa5-0d01-d2eca666ce29@linux.intel.com>
Date: Mon, 11 May 2020 14:07:56 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <871rnr9fq5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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



On 5/11/20 12:56 AM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   include/sound/soc-component.h | 1 +
>   sound/soc/soc-pcm.c           | 2 +-
>   2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
> index 864983b09846..29b0c2c1d2db 100644
> --- a/include/sound/soc-component.h
> +++ b/include/sound/soc-component.h
> @@ -358,6 +358,7 @@ int snd_soc_component_stream_event(struct snd_soc_component *component,
>   				   int event);
>   int snd_soc_component_set_bias_level(struct snd_soc_component *component,
>   				     enum snd_soc_bias_level level);
> +#define snd_soc_component_activity(component)	((component)->active)

this patch would need to be added as patch2, before 
snd_soc_component_activity() is used to avoid breaking bisection

>   
>   #ifdef CONFIG_REGMAP
>   void snd_soc_component_init_regmap(struct snd_soc_component *component,
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index e923e3746fec..420595356111 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -267,7 +267,7 @@ static void snd_soc_runtime_action(struct snd_soc_pcm_runtime *rtd,
>   	for_each_rtd_dais(rtd, i, dai) {
>   		dai->stream_active[stream] += action;
>   		dai->active += action;
> -		dai->component->active += action;
> +		snd_soc_component_activity(dai->component) += action;
>   	}
>   }
>   
> 
