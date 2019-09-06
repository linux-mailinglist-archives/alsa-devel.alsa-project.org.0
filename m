Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A736AABAC3
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 16:22:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2C6961655;
	Fri,  6 Sep 2019 16:21:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2C6961655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567779750;
	bh=aIOWvegVUJF8uYzm3fDMZ9ofA58TS/FPGvz97Z0FptY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mDTIklf9tBPOcGetO8P1orMHGz4kuP+/T5CGQzB8VXFuyYFu+Be3+Ki7P0hDz94Rz
	 x6+cybbs0txu86nKqS+GDWrE6+Zx27xzQxvMnLtZlFOJOTsfmbsDKElDqFIv/VzFiC
	 GSqZsujXXGPSXKcFGFlPBL7bO36gg4frb3BXIZmA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C6F4F803A6;
	Fri,  6 Sep 2019 16:20:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27A59F803A6; Fri,  6 Sep 2019 16:20:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 68DABF80214
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 16:20:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68DABF80214
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 07:20:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="384226932"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2019 07:20:36 -0700
Received: from ravisha1-mobl1.amr.corp.intel.com (unknown [10.255.36.89])
 by linux.intel.com (Postfix) with ESMTP id 29AA35800FE;
 Fri,  6 Sep 2019 07:20:35 -0700 (PDT)
To: Brent Lu <brent.lu@intel.com>, alsa-devel@alsa-project.org
References: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <391e8f6c-7e35-deb4-4f4d-c39396b778ba@linux.intel.com>
Date: Fri, 6 Sep 2019 09:20:31 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1567733058-9561-1-git-send-email-brent.lu@intel.com>
Content-Language: en-US
Cc: cezary.rojewski@intel.com, kuninori.morimoto.gx@renesas.com,
 linux-kernel@vger.kernel.org, yang.jie@linux.intel.com, tiwai@suse.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org, tglx@linutronix.de
Subject: Re: [alsa-devel] [PATCH] ASoC: bdw-rt5677: channel constraint
	support
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

On 9/5/19 8:24 PM, Brent Lu wrote:
> BDW boards using this machine driver supports only stereo capture and
> playback. Implement a constraint to enforce it.

Humm, can you clarify what problem/error this patch fixes?

There are already constraints on the hsw_dais[] where the channels are 
stereo only.

Thanks
-Pierre

> 
> Signed-off-by: Brent Lu <brent.lu@intel.com>
> ---
>   sound/soc/intel/boards/bdw-rt5677.c | 33 +++++++++++++++++++++++++++++++++
>   1 file changed, 33 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bdw-rt5677.c b/sound/soc/intel/boards/bdw-rt5677.c
> index 4a4d335..a312b55 100644
> --- a/sound/soc/intel/boards/bdw-rt5677.c
> +++ b/sound/soc/intel/boards/bdw-rt5677.c
> @@ -22,6 +22,8 @@
>   
>   #include "../../codecs/rt5677.h"
>   
> +#define DUAL_CHANNEL 2
> +
>   struct bdw_rt5677_priv {
>   	struct gpio_desc *gpio_hp_en;
>   	struct snd_soc_component *component;
> @@ -245,6 +247,36 @@ static int bdw_rt5677_init(struct snd_soc_pcm_runtime *rtd)
>   	return 0;
>   }
>   
> +static const unsigned int channels[] = {
> +	DUAL_CHANNEL,
> +};
> +
> +static const struct snd_pcm_hw_constraint_list constraints_channels = {
> +	.count = ARRAY_SIZE(channels),
> +	.list = channels,
> +	.mask = 0,
> +};
> +
> +static int bdw_fe_startup(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	/*
> +	 * On this platform for PCM device we support,
> +	 * stereo
> +	 */
> +
> +	runtime->hw.channels_max = DUAL_CHANNEL;
> +	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
> +					   &constraints_channels);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_ops bdw_rt5677_fe_ops = {
> +	.startup = bdw_fe_startup,
> +};
> +
>   /* broadwell digital audio interface glue - connects codec <--> CPU */
>   SND_SOC_DAILINK_DEF(dummy,
>   	DAILINK_COMP_ARRAY(COMP_DUMMY()));
> @@ -273,6 +305,7 @@ static struct snd_soc_dai_link bdw_rt5677_dais[] = {
>   		},
>   		.dpcm_capture = 1,
>   		.dpcm_playback = 1,
> +		.ops = &bdw_rt5677_fe_ops,
>   		SND_SOC_DAILINK_REG(fe, dummy, platform),
>   	},
>   
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
