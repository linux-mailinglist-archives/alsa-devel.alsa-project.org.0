Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B9876B9AB0
	for <lists+alsa-devel@lfdr.de>; Sat, 21 Sep 2019 01:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E2A61678;
	Sat, 21 Sep 2019 01:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E2A61678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569022097;
	bh=IqMMpsnjsMWqEwMdkmeq2G8vB+al8PlJg2qKmTCkXT8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=i9XskbTSomlnmmXUgduDZqjBscuOjNcVUxSWBbu8CYy7C3/fCHsGO6VCL08VqmqjE
	 2llkxcE4Ph2j5aF2JcJyLMfJU30LwGnhv2A8kvAhysfs8FfPx+agsthIK0pcNSn9qM
	 7AvWn5oKiP/GRkHdGxuOkpxI6aIeKkWtPLTwDRfw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE25BF80506;
	Sat, 21 Sep 2019 01:26:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53532F80506; Sat, 21 Sep 2019 01:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_14,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B117FF800C7
 for <alsa-devel@alsa-project.org>; Sat, 21 Sep 2019 01:26:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B117FF800C7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="sv0ycOVZ"
Received: by mail-pl1-x641.google.com with SMTP id w10so3895987plq.5
 for <alsa-devel@alsa-project.org>; Fri, 20 Sep 2019 16:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CA6mH2s7/mQqbWPAIxBYkadhzeqMoOn4kmubZpmIYQA=;
 b=sv0ycOVZPEhTBxFw+PhY1TKXnOl5DVN2Av+2c6JW39gGUGeaaPf9JWdZpzhfhjyDvO
 tHo5pFIxpbHshEplJahmcB28BZVO66DXVbj2Etn1qVpN/UyRaEys8guhMCBUGWa3Pdps
 RwEUfv849KjqGBzz5YzRqXMYHsE2hTKKND/lC1Ak9mBG11lytDDhN+YuEfWxOa7G7DG2
 70IUKQm0VRf3zc5GtNZG2Sz8i3JA1ZgYokOXQL3Rp2Nl2Ri/jFFw2/ckRuCEF/dQ2nF8
 FRjZ4M/463RnpHE6i+2XVRXIkNXaaQzojkcpObFvr65CCoiwweYS2QoO8s5RYoJnpHod
 fXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CA6mH2s7/mQqbWPAIxBYkadhzeqMoOn4kmubZpmIYQA=;
 b=riTgztQJBvGUCbO0Hg7MNeomVWBPqfZKLXFyzpiWnJ6jBPl3nRfb3F5OKhLB/q5J38
 nUtqF1VmEMvlCq8ZoIdc2injoHdQZ0v56GK7Fhc4LD9gyx/sEwVxKEvX2Y3S7M4zm9wy
 2zXTZAzERyV0I7m3Zm8fewsPEsrDvpURLOE61WBH9BkAgsppy9rYxWweYNBcsCpc9gQN
 tDJe6vN0gfNb/ZEaDFHHKR73i+eki7CNQrE/SP1XpfPlsanZxKeKaVyzfzpKq6i4xx9C
 KHH0z/3EVXO385PIPYZXvVWBEmuGOFfJ7vKJLYWlJC67njIXMIzwYT5ukqmXPB/MJQEx
 ZVJw==
X-Gm-Message-State: APjAAAVD/Nd4TyQtejpIJelr7Qy1SX7ttCQLqsAdQ7jozCL14ngyaQ09
 CP6frzv1y3Dku7IUuo7LikY=
X-Google-Smtp-Source: APXvYqwAW5gxV9v80zvEtG/jnR4oL2FMp5gqh40w1OPjkDMijYj5VxPtPws76h5RT0qlX41fhMzS0g==
X-Received: by 2002:a17:902:8f8c:: with SMTP id
 z12mr17751680plo.2.1569021985410; 
 Fri, 20 Sep 2019 16:26:25 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id k5sm3716946pfp.109.2019.09.20.16.26.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 20 Sep 2019 16:26:25 -0700 (PDT)
Date: Fri, 20 Sep 2019 16:25:33 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190920232533.GA29851@Asurada-Nvidia.nvidia.com>
References: <cover.1568861098.git.shengjiu.wang@nxp.com>
 <0fe619f4c8f0898cf51c7324c9a0784c5782ed91.1568861098.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0fe619f4c8f0898cf51c7324c9a0784c5782ed91.1568861098.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V3 4/4] ASoC: fsl_asrc: Fix error with
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

Hello Shengjiu,

One issue for error-out and some nit-pickings inline. Thanks.

On Thu, Sep 19, 2019 at 08:11:42PM +0800, Shengjiu Wang wrote:
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
>  sound/soc/fsl/fsl_asrc.h     |  3 +++
>  sound/soc/fsl/fsl_asrc_dma.c | 52 +++++++++++++++++++++++++++++++-----
>  3 files changed, 50 insertions(+), 9 deletions(-)
> 
> @@ -276,6 +274,11 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  	struct device *dev = component->dev;
>  	struct fsl_asrc *asrc_priv = dev_get_drvdata(dev);
>  	struct fsl_asrc_pair *pair;
> +	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> +	u8 dir = tx ? OUT : IN;
> +	struct dma_chan *tmp_chan;
> +	struct snd_dmaengine_dai_dma_data *dma_data;

Nit: would it be possible to reorganize these a bit? Usually
we put struct things together unless there is a dependency,
similar to fsl_asrc_dma_hw_params().

> @@ -285,9 +288,44 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> +	/* Request a temp pair, which is release in the end */

Nit: "which will be released later" or "and will release it
later"? And could we use a work like "dummy"? Or at least I
would love to see the comments explaining the parameter "1"
in the function call below.

> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		return ret;
> +	}
> +
> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "can't get dma channel\n");

Could we align with other error messages using "failed to"?

> +	ret = snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
> +	if (ret)
> +		return ret;
> +
[...]
> +	dma_release_channel(tmp_chan);
> +	fsl_asrc_release_pair(pair);

I think we need an "out:" here for those error-out routines
to goto. Otherwise, it'd be a pair leak?

> +

Could we drop this? There is a blank line below already :)

>  
>  	return 0;
>  }
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
