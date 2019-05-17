Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D312127A
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 05:23:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D07416D4;
	Fri, 17 May 2019 05:22:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D07416D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558063407;
	bh=BNPCHTn8SGamL6YpGTgT1yTIHYeTU8+t+ZuvdqZD1g4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X9irkOdfWe+F3e7ZPrG/91w1YXZEwG+ZW3a2VCP6egaKlcPTAwiu6ZPkjn97Seq0d
	 KEyuBJF1SruNndBSzPBlNVBS4nr1U/ZpaQv7DtLJ4nLV842JZwLRmwG/b6lmTblyfw
	 x7Mz38jF+EYc6ykIWzZccy0QqIFMO6oFxYAdz4r8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE6BF896B8;
	Fri, 17 May 2019 05:21:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E6815F8968A; Fri, 17 May 2019 05:21:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BD8AF806E7
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 05:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BD8AF806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 20:21:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,478,1549958400"; d="scan'208";a="172628245"
Received: from bmatush-mobl.amr.corp.intel.com (HELO [10.251.147.135])
 ([10.251.147.135])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2019 20:21:32 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>
References: <87mujl3n4t.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <34505df5-e479-679c-7c67-ecb45d61414b@linux.intel.com>
Date: Thu, 16 May 2019 22:21:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87mujl3n4t.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-dpm: fixup DAI active
 unbalance
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



On 5/16/19 8:21 PM, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> snd_soc_dai_link_event() is updating snd_soc_dai :: active,
> but it is unbalance.
> It counts up if it has startup callback.
> 
> 	case SND_SOC_DAPM_PRE_PMU:
> 		...
> 		snd_soc_dapm_widget_for_each_source_path(w, path) {
> 			...
> 			if (source->driver->ops->startup) {
> 				...
> =>				source->active++;
> 			}
> 			...
> 		}
> 		...
> 
> But, always counts down
> 
> 	case SND_SOC_DAPM_PRE_PMD:
> 		...
> 		snd_soc_dapm_widget_for_each_source_path(w, path) {
> 			...
> =>			source->active--;
> 			...
> 		}
> 
> This patch always counts up when SND_SOC_DAPM_PRE_PMD.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Mark, Liam
> 
> I think this is bug, but I can't confirm it,
> because my driver need to have .startup.
> Thus, I added [RFC] on this patch.
> I'm happy if someone can confirm it.

This looks like a bug since the initial Intel contribution in 2015. 
9b8ef9f6b3fc ('ASoC: dapm: Add startup & shutdown for dai_links') 
already has this imbalance.

I don't have a clue why this is not symmetric or not done as suggested 
by Morimoto-san. Vinod, any idea?

> 
>   sound/soc/soc-dapm.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index c864502..147ad9d 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -3828,8 +3828,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
>   						ret);
>   					goto out;
>   				}
> -				source->active++;
>   			}
> +			source->active++;
>   			ret = soc_dai_hw_params(&substream, params, source);
>   			if (ret < 0)
>   				goto out;
> @@ -3850,8 +3850,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
>   						ret);
>   					goto out;
>   				}
> -				sink->active++;
>   			}
> +			sink->active++;
>   			ret = soc_dai_hw_params(&substream, params, sink);
>   			if (ret < 0)
>   				goto out;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
