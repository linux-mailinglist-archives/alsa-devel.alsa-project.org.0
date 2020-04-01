Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFF419A47D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 07:07:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18358167A;
	Wed,  1 Apr 2020 07:07:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18358167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585717679;
	bh=CHwZ7t4T2n+93moxoWET1ChbbS9nLUQ4W/xKqHQDHhE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cftjv9mm9a4uV6rt+R52Lu6TSGrwRcm4ozduKcmetBDzwpggeDCnXQAUiPAxw4l/k
	 Xue5GKEQ0SJNfs0Ac7Bl+06IiClR51DSDxj4MGZTIVVkHfoVZCmm+3oQoLTBBCuuV+
	 tamvH9KrDcDZMSChjD+3uS3QSguqu81yGG/0s+jA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0159F80110;
	Wed,  1 Apr 2020 07:06:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DE8AF8014B; Wed,  1 Apr 2020 07:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 25F99F80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 07:06:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 25F99F80110
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KjEaWA28"
Received: from localhost (unknown [122.167.76.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9B182074D;
 Wed,  1 Apr 2020 05:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1585717566;
 bh=CHwZ7t4T2n+93moxoWET1ChbbS9nLUQ4W/xKqHQDHhE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KjEaWA28I4dRrDFwkprzyYnJc/KjzARW+1KsGpPskpPpMB7mM44lbENGnu3KEjFRA
 4pTEGFojFEfp6npQ24PP+QxW3/eoO8Uu78rsFC5QGDdeP5vFxvj9jXZw07Y0hAqzQp
 t8PGfXfL7SdnCLCTk21fzEq75IBVdFmvurB29sH4=
Date: Wed, 1 Apr 2020 10:36:01 +0530
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?B?77+9zLDvv73vv73vv70=?= <gt82.lee@samsung.com>
Subject: Re: [PATCH] ASoC: dpcm: allow start or stop during pause for backend
Message-ID: <20200401050601.GB72691@vkoul-mobl>
References: <CGME20200401010421epcas2p3d5b16041fa59efa0ac8786f682d4c991@epcas2p3.samsung.com>
 <004d01d607c1$7a3d5250$6eb7f6f0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <004d01d607c1$7a3d5250$6eb7f6f0$@samsung.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org, hmseo@samsung.com, tkjung@samsung.com,
 pilsun.jang@samsung.com
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

Hello Gyeongtaek,

On 01-04-20, 10:04, �̰��� wrote:
> soc_compr_trigger_fe() allows start or stop after pause_push.
> In dpcm_be_dai_trigger(), however, only pause_release is allowed
> command after pause_push.
> So, start or stop after pause in compress offload is always
> returned as error if the compress offload is used with dpcm.
> To fix the problem, SND_SOC_DPCM_STATE_PAUSED should be allowed
> for start or stop command.

I think it makes sense to allow START if the stream is paused. Similarly
a STOP should be legal as well for paused stream, so:

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Gyeongtaek Lee <gt82.lee@samsung.com>
> ---
>  sound/soc/soc-pcm.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 2c59b3688ca0..8f6f0ad50288 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2236,7 +2236,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>  		switch (cmd) {
>  		case SNDRV_PCM_TRIGGER_START:
>  			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_PREPARE) &&
> -			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP))
> +			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_STOP) &&
> +			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>  				continue;
>  
>  			ret = dpcm_do_trigger(dpcm, be_substream, cmd);
> @@ -2266,7 +2267,8 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
>  			be->dpcm[stream].state = SND_SOC_DPCM_STATE_START;
>  			break;
>  		case SNDRV_PCM_TRIGGER_STOP:
> -			if (be->dpcm[stream].state != SND_SOC_DPCM_STATE_START)
> +			if ((be->dpcm[stream].state != SND_SOC_DPCM_STATE_START) &&
> +			    (be->dpcm[stream].state != SND_SOC_DPCM_STATE_PAUSED))
>  				continue;
>  
>  			if (!snd_soc_dpcm_can_be_free_stop(fe, be, stream))
> -- 
> 2.21.0
> 

-- 
~Vinod
