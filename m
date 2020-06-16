Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A8B1FABB0
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jun 2020 10:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A9751688;
	Tue, 16 Jun 2020 10:55:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A9751688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592297767;
	bh=DUcEoj2ybnoaOkUbYrjx2ubpDiZLe6Q6vCDKI4ctli8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=C+uPPe4KHxH+mbFzTvgZtIVPaQS3BAZ06LNnW5mSF6ktef9enfNYj+2N1UO0/3yct
	 bqXjdNKZrhIjYNrU2ATxRosEMYS5sryPuCZJeS7Pz61cR6ULwA2woTPgUFRlywo38y
	 0U0fcYqq/lGZvA3zVmdfBWouQxtPziHtUi6fckOg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ABA0F80101;
	Tue, 16 Jun 2020 10:54:26 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6E89BF8022B; Tue, 16 Jun 2020 10:54:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [81.169.146.166])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BBE2DF800EF
 for <alsa-devel@alsa-project.org>; Tue, 16 Jun 2020 10:54:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBE2DF800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="WHbXqtpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592297660;
 s=strato-dkim-0002; d=gerhold.net;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=5TxNJcnWyg3sMqmAyiIU0P1y85/NwlMc7d+Go9muFbc=;
 b=WHbXqtpmdDortVxCqrWEVcXPQzneCnHIcUZM91BrZvDhyymeUWJi5Fqz9Rcy3B8lIZ
 8bN0M3zQxVZv0sG9fCNiT6ZrPbIbgZqGUQGg7ErgaH3UpIf9EWYPdeR5qWSQgYM1Ml3i
 KmDGEYOpLviJSQXLn6IXh3XihUjvDVTEs5D6knsRh1wBx1xGKGFziGm7B5EayxpZSdlM
 h8nt5AtWTwF1FfFbrU0KOyFfzSZ92rRp8hYnBulYBZDo5PK8YVLfyOEAR22ScUJ1PgoW
 z2qGrqyKn+sYmNeaYcvknx3y+BK5Ybx7tKTk1f+XnBZVhDM25HazdV7rm5Asf81CJB/1
 tuQg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IcfFBg=="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
 with ESMTPSA id 6005e9w5G8sGRRD
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 16 Jun 2020 10:54:16 +0200 (CEST)
Date: Tue, 16 Jun 2020 10:54:09 +0200
From: Stephan Gerhold <stephan@gerhold.net>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 1/4] ASoC: soc-pcm: dpcm: fix playback/capture checks
Message-ID: <20200616085409.GA110999@gerhold.net>
References: <20200608194415.4663-1-pierre-louis.bossart@linux.intel.com>
 <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200608194415.4663-2-pierre-louis.bossart@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, tiwai@suse.de,
 Daniel Baluta <daniel.baluta@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Hi Pierre,

On Mon, Jun 08, 2020 at 02:44:12PM -0500, Pierre-Louis Bossart wrote:
> Recent changes in the ASoC core prevent multi-cpu BE dailinks from
> being used. DPCM does support multi-cpu DAIs for BE Dailinks, but not
> for FE.

First I want to apologize for introducing this regression.
Actually when I made the "Only allow playback/capture if supported"
patch I did not realize it would also be used for BE DAIs. :)

> 
> Handle the FE checks first, and make sure all DAIs support the same
> capabilities within the same dailink.
> 
> BugLink: https://github.com/thesofproject/linux/issues/2031
> Fixes: 9b5db059366ae2 ("ASoC: soc-pcm: dpcm: Only allow playback/capture if supported")
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
> ---
>  sound/soc/soc-pcm.c | 44 ++++++++++++++++++++++++++++++++++----------
>  1 file changed, 34 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
> index 276505fb9d50..2c114b4542ce 100644
> --- a/sound/soc/soc-pcm.c
> +++ b/sound/soc/soc-pcm.c
> @@ -2789,20 +2789,44 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
>  	struct snd_pcm *pcm;
>  	char new_name[64];
>  	int ret = 0, playback = 0, capture = 0;
> +	int stream;
>  	int i;
>  
> +	if (rtd->dai_link->dynamic && rtd->num_cpus > 1) {
> +		dev_err(rtd->dev,
> +			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
> +		return -EINVAL;
> +	}
> +
>  	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
> -		cpu_dai = asoc_rtd_to_cpu(rtd, 0);
> -		if (rtd->num_cpus > 1) {
> -			dev_err(rtd->dev,
> -				"DPCM doesn't support Multi CPU yet\n");
> -			return -EINVAL;
> +		if (rtd->dai_link->dpcm_playback) {
> +			stream = SNDRV_PCM_STREAM_PLAYBACK;
> +
> +			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> +				if (!snd_soc_dai_stream_valid(cpu_dai,
> +							      stream)) {
> +					dev_err(rtd->card->dev,
> +						"CPU DAI %s for rtd %s does not support playback\n",
> +						cpu_dai->name,
> +						rtd->dai_link->stream_name);
> +					return -EINVAL;

Unfortunately the "return -EINVAL" here and below break the case where
dpcm_playback/dpcm_capture does not exactly match the capabilities of
the referenced CPU DAIs. To quote from my commit message:

    At the moment, PCM devices for DPCM are only created based on the
    dpcm_playback/capture parameters of the DAI link, without considering
    if the CPU/FE DAI is actually capable of playback/capture.

    Normally the dpcm_playback/capture parameter should match the
    capabilities of the CPU DAI. However, there is no way to set that
    parameter from the device tree (e.g. with simple-audio-card or
    qcom sound cards). dpcm_playback/capture are always both set to 1.

The basic idea for my commit was to basically stop using
dpcm_playback/capture for the device tree case and infer the
capabilities solely based on referenced DAIs. The DAIs expose if they
are capable of playback/capture, so I see no reason to be required to
duplicate that into the DAI link setup (unless you want to specifically
restrict a DAI link to one direction for some reason...)

With your patch probe now fails with:

   7702000.sound: CPU DAI MultiMedia1 for rtd MultiMedia1 does not support capture

because sound/soc/qcom/common.c sets dpcm_playback = dpcm_capture = 1
even though that FE DAI is currently configured to be playback-only.

I believe Srinivas fixed that problem for the BE DAIs in
commit a2120089251f ("ASoC: qcom: common: set correct directions for dailinks")
(https://lore.kernel.org/alsa-devel/20200612123711.29130-2-srinivas.kandagatla@linaro.org/)

For the QCOM case it may be feasible to set dpcm_playback/dpcm_capture
appropriately because it is basically only used with one particular
DAI driver. But simple-audio-card is generic and used with many
different drivers so hard-coding a call into some other driver like
Srinivas did above won't work in that case.

I wonder if we should downgrade your dev_err(...) to a dev_dbg(...),
and then simply avoid setting playback/capture = 0.
This should fix the case I'm talking about.

What do you think?

Thanks,
Stephan

> +				}
> +			playback = 1;
> +		}
> +		if (rtd->dai_link->dpcm_capture) {
> +			stream = SNDRV_PCM_STREAM_CAPTURE;
> +
> +			for_each_rtd_cpu_dais(rtd, i, cpu_dai)
> +				if (!snd_soc_dai_stream_valid(cpu_dai,
> +							      stream)) {
> +					dev_err(rtd->card->dev,
> +						"CPU DAI %s for rtd %s does not support capture\n",
> +						cpu_dai->name,
> +						rtd->dai_link->stream_name);
> +					return -EINVAL;
> +				}
> +			capture = 1;
>  		}
> -
> -		playback = rtd->dai_link->dpcm_playback &&
> -			   snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_PLAYBACK);
> -		capture = rtd->dai_link->dpcm_capture &&
> -			  snd_soc_dai_stream_valid(cpu_dai, SNDRV_PCM_STREAM_CAPTURE);
>  	} else {
>  		/* Adapt stream for codec2codec links */
>  		int cpu_capture = rtd->dai_link->params ?
> -- 
> 2.20.1
> 
