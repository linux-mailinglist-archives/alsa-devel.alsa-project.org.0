Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D648218E6
	for <lists+alsa-devel@lfdr.de>; Fri, 17 May 2019 15:10:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E946416BF;
	Fri, 17 May 2019 15:09:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E946416BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558098603;
	bh=t0bCvqku3rUb0UoPuJpkNGYOFR4xt3WrVJS+qEuVwXc=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vXr5XaF9ABuv2+pl4QrVgU54B/jH//ny6lCoKYjGcpdx+b78imNzjo2j6qsJcGq77
	 MKURTX2mHRD6qPJe3rKSsDSfc4e/mJxT7H8n2AV08sIuRUJHWxUP0MNPM+QjIkW5Li
	 TA60354y1FrUaC3JzaFLXrbUPoZ+54PFIoulKYXE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30147F8968A;
	Fri, 17 May 2019 15:08:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 47D39F8968A; Fri, 17 May 2019 15:08:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4A6D6F806E7
 for <alsa-devel@alsa-project.org>; Fri, 17 May 2019 15:08:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A6D6F806E7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 May 2019 06:08:10 -0700
X-ExtLoop1: 1
Received: from pamoncad-mobl.amr.corp.intel.com (HELO [10.251.156.2])
 ([10.251.156.2])
 by orsmga007.jf.intel.com with ESMTP; 17 May 2019 06:08:09 -0700
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Vinod Koul <vkoul@kernel.org>
References: <87imu939x3.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <0ba565ea-2f61-015d-f6e3-63124f94e78a@linux.intel.com>
Date: Fri, 17 May 2019 08:08:08 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87imu939x3.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Subject: Re: [alsa-devel] [PATCH][RFC] ASoC: soc-core: WARN() is not related
 to component->driver->probe
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



On 5/17/19 1:06 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> soc_probe_component() has WARN() under if (component->driver->probe),
> but, this WARN() check is not related to .probe callback.
> So, it should be called at (B) instead of (A).
> This patch moves it out of if().
> 
> 	if (component->driver->probe) {
> 		ret = component->driver->probe(component);
> 		...
> (A)		WARN(...)
> 	}
> (B)	WARN(...)
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> Mark, Pierre-Louis, Vinod, Liam
> 
> I think this patch is correct, but I'm not sure.
> I'm happy someone can confirm it.

This WARN() was added in 2012 by ff541f4b2a75 ('ASoC: core: giving WARN 
when device starting from non-off bias with idle_bias_off')

The commit message hints at an intentional check

"
Just found some cases that some codec drivers set the bias to _STANDBY 
and set idle_bias_off to 1 during probing.
It will cause unpaired runtime_get_sync/put() issue. Also as Mark 
suggested, there is no reason to start from _STANDBY bias with 
idle_bias_off == 1.

So here giving one warning when detected (dapm.idle_bias_off == 1) and
     (dapm.bias_level != SND_SOC_BIAS_OFF) just after driver->probe().
"

My take is that unless we can prove this is incorrect we leave it as is.

> 
>   sound/soc/soc-core.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index cab30ae..7157d67 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -1420,12 +1420,11 @@ static int soc_probe_component(struct snd_soc_card *card,
>   				"ASoC: failed to probe component %d\n", ret);
>   			goto err_probe;
>   		}
> -
> -		WARN(dapm->idle_bias_off &&
> -			dapm->bias_level != SND_SOC_BIAS_OFF,
> -			"codec %s can not start from non-off bias with idle_bias_off==1\n",
> -			component->name);
>   	}
> +	WARN(dapm->idle_bias_off &&
> +	     dapm->bias_level != SND_SOC_BIAS_OFF,
> +	     "codec %s can not start from non-off bias with idle_bias_off==1\n",
> +	     component->name);
>   
>   	/* machine specific init */
>   	if (component->init) {
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
