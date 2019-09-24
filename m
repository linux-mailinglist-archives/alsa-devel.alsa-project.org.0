Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26118BD475
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 23:46:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B6F616BD;
	Tue, 24 Sep 2019 23:45:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B6F616BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569361585;
	bh=mdEsehiQisWzlTndea8s979Z6TrhzDKFliUwYjGDkAc=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Eq//5uzW4wO5Wf8AJlvYoYckCQ+J1Bz8BhOU/ArQMjlu2HXkiR9WOHMb3ap1d+R1j
	 pyIflnYeX2fk+G4nrxEcKm3V82e1wY7RcDfIMCbt4DDBvHnqhATvjj8wz8Vk+Uo3JB
	 cyP+KwM0T7MQO+3800GRgU4ImOnhZw2KMkojspBc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F33B8F80533;
	Tue, 24 Sep 2019 23:44:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3018DF8045F; Tue, 24 Sep 2019 23:44:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4779AF80213
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 23:44:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4779AF80213
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="PiWxYZbA"
Received: by mail-pf1-x443.google.com with SMTP id y22so2120314pfr.3
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 14:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8TaXClZL44x6R6m23BGIIOYUw8sFdA7SimmvF1Bs6II=;
 b=PiWxYZbA9Phtp8IDK7idRhXLPFpVl8Nivv0bnnYLe3e3GtA0prmh/cyb4fHtq4Gim9
 aqlwpu5kw/gwGvZgr1PevcKG1YZRm4NRav9JQY8t4jD9ouA1/i6jCrKJGPq1MnRdm8Za
 zcVcS52Iw7UOovvfOTsRw0smUUa/8C1pIbP5pRVkoBa2JcIuY3/NaibW6X98J/DrVnPP
 u4jagDKOIj26zhiMKPopz6CkiPG+busIukqq/hxVnslcJhWs4Uqbf5clU765/Ug97tzP
 vOBIcRr6706g6selmfD9KRihs4X4HljViLD/zguw80jjUXENnR6hn1v0FEDtWG+aN/C7
 T+Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8TaXClZL44x6R6m23BGIIOYUw8sFdA7SimmvF1Bs6II=;
 b=s/xVG80Iw6mHgLl7dEdXTrLOXI+10ytA0CIs8twFrlvGrWot3hxfk3ef/BrZTQ/FMd
 bqmDVL/PhjxqgvxypYS064yNoZuFGd42m0S953+fCnnnFrTXxige6LtF8lbGBQL/VZj7
 xg5AF/e4zfaEzcO8U8cwjSvOLFxO/+PW+qriqKrdeX2yRsa3OvwaIQxlsdaYfuQEjpvJ
 72gSJ6Skkr5ANj79PVuZnM6d0X0Gkc+uVeNQTwxwBohfpHNVTmmA0BaOJLadNmKFKph7
 R5h4BWJ27g6bXO3ZLKTPQGuYgL/MauGcmJ1tkCmtP4k8lWMsa6k4wjMSMZZfwMi4d3BP
 IrdQ==
X-Gm-Message-State: APjAAAV9r9TfRExzB4fMNK21P7/mPflMdS3H8voUJBB+GEEuRtfGpuk1
 sUPK01vkHTm6d/SpUBynYRM=
X-Google-Smtp-Source: APXvYqx85giUVZhiQHsCv//r2YbURAPCdsrA+9rcufqztCRKD6LsbMJVknHc1eyohUWvf/YPUk/5ZA==
X-Received: by 2002:a65:64d5:: with SMTP id t21mr5237437pgv.43.1569361472982; 
 Tue, 24 Sep 2019 14:44:32 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id b22sm4651877pfo.85.2019.09.24.14.44.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 24 Sep 2019 14:44:32 -0700 (PDT)
Date: Tue, 24 Sep 2019 14:43:44 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190924214343.GA964@Asurada-Nvidia.nvidia.com>
References: <cover.1569296075.git.shengjiu.wang@nxp.com>
 <b93ce3dced55bbad8e0b4b7e700cf394b1ae1551.1569296075.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b93ce3dced55bbad8e0b4b7e700cf394b1ae1551.1569296075.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V4 4/4] ASoC: fsl_asrc: Fix error with
 S24_3LE format bitstream in i.MX8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Sep 24, 2019 at 06:52:35PM +0800, Shengjiu Wang wrote:
> There is error "aplay: pcm_write:2023: write error: Input/output error"
> on i.MX8QM/i.MX8QXP platform for S24_3LE format.
> 
> In i.MX8QM/i.MX8QXP, the DMA is EDMA, which don't support 24bit
> sample, but we didn't add any constraint, that cause issues.
> 
> So we need to query the caps of dma, then update the hw parameters
> according to the caps.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_asrc.c     |  4 +--
>  sound/soc/fsl/fsl_asrc.h     |  3 ++
>  sound/soc/fsl/fsl_asrc_dma.c | 59 +++++++++++++++++++++++++++++++-----
>  3 files changed, 56 insertions(+), 10 deletions(-)
> 
> @@ -270,12 +268,17 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
>  
>  static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  {
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
>  	struct snd_soc_pcm_runtime *rtd = substream->private_data;
>  	struct snd_pcm_runtime *runtime = substream->runtime;
>  	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, DRV_NAME);
> +	struct snd_dmaengine_dai_dma_data *dma_data;
>  	struct device *dev = component->dev;
>  	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
>  	struct fsl_asrc_pair *pair;
> +	struct dma_chan *tmp_chan = NULL;
> +	u8 dir = tx ? OUT : IN;
> +	int ret = 0;
>  
>  	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);

Sorry, I didn't catch it previously. We would need to release
this memory also for all error-out paths, as the code doesn't
have any error-out routine, prior to applying this change.

>  	if (!pair)
> @@ -285,11 +288,51 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)

> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporary.
> +	 */

"temporary" => "temporarily"

> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		return ret;
> +	}
> +
> +	/* Request a dummy dma channel, which will be release later. */

"release" => "released"
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
