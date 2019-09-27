Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86660BFCF7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 03:56:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A0661673;
	Fri, 27 Sep 2019 03:55:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A0661673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569549391;
	bh=uAyoHvQxpUF/UrFwwgd+xDZbKliOJyH0mqWzmdsspoU=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XWS2FUv3UkA6mxgO7RRD7/qxYXttXYrRPEkK1LxtLnSyL5MkJxH7uqUeFZsXZpCOJ
	 nVX05TlokJX06yLM/sZefJh6v9vBgsKdU89EodvrJvY3gunJWrwrvsttzdz7O7n8SF
	 qsy7laYWPAMfEC70onVUuT9IgGDZQN4K2sDjD8vU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A33D4F8049A;
	Fri, 27 Sep 2019 03:54:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4FF88F8049A; Fri, 27 Sep 2019 03:54:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C908F800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 03:54:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C908F800B3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="r9jRo5ii"
Received: by mail-pg1-x542.google.com with SMTP id q7so2532958pgi.12
 for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2019 18:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Jkv3+m25h7+mBhaDAmoi1fNnMKQwdsBy4HY8NW+mFDw=;
 b=r9jRo5iilNs2wTjYGE0eSV/p47GTFQWk4EutxtXr3Bcmzu2B+W8P2aA+zWEaQG3XpI
 q+vSIcrJCKg7pixYzCF1spux84sDxuwZJRfoBGT084K6gTz5zIkRZtrDN4YMHQPopUKX
 B61JV1lqcFDNK6jOs9Mf8k3uFulbefsTS/0H76qPF5eKIpuHQwtmhcEjBA9Al5WEl0Km
 tVZAPt23J+8MxX7V88vgWWe07RDsuuJHtlAvLVua2+UMP8f/azziJlTqrsVJNOkN0K5G
 CF7/ji92yJsZN3tG9o7/tNMZdSqOE8xjFP5EoGJBrNwCKwMQKXn2nqoQRSFFG0Y26OZo
 oGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Jkv3+m25h7+mBhaDAmoi1fNnMKQwdsBy4HY8NW+mFDw=;
 b=MLKbYYhD8SR18USvu9T8JcJ227fd8cPN4x6fMoSilJm5FZPgL1SRMhon0qFgRpsXxn
 hrD0+4Y54EuR1aKZYBFNX1QByhHBoOz+wIGqt8dCx9iMcm+vfHG1H6fkGgxdwZC0QTIQ
 yqdutYnhcQlQKW5kjiz6XpYuOH6Hbcwi1VNbcQEc6yBvd2lckAtLaH1hxIXHnv6A0eMK
 CCLmyoc33C6YsI6NL5FOxbH1Ohf7S0LjnHZKHL1DpjajOx5qrKiDmN59etm8zwCJb/Y1
 AwqSb8yxu6mYF5/N3doL6SsaE9GfKTl6sCENLMcepYVrCyjFAHDSr9a4010kf7mLjGQQ
 YI9Q==
X-Gm-Message-State: APjAAAVsc7wD4Xc8zr/mc1Vn9Cu2+s52BSTWA9F0fkYxxrkdmt0BPRJf
 i/E66o96DBcSInvR+xtkcAI=
X-Google-Smtp-Source: APXvYqzl/BASHUYGj0Nc0aDqh/JKm2tGMJg8oKPiZ1pYyew3VA2OEU6saze0fWlG1mYPcdifDALaLQ==
X-Received: by 2002:a63:5566:: with SMTP id f38mr6495741pgm.389.1569549279228; 
 Thu, 26 Sep 2019 18:54:39 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x9sm9494303pje.27.2019.09.26.18.54.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 26 Sep 2019 18:54:38 -0700 (PDT)
Date: Thu, 26 Sep 2019 18:53:53 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Message-ID: <20190927015352.GA3253@Asurada-Nvidia.nvidia.com>
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <b6a4de2bbf960ef291ee902afe4388bd0fc1d347.1569493933.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b6a4de2bbf960ef291ee902afe4388bd0fc1d347.1569493933.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH V6 4/4] ASoC: fsl_asrc: Fix error with
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

On Fri, Sep 27, 2019 at 09:46:12AM +0800, Shengjiu Wang wrote:
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

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

> ---
>  sound/soc/fsl/fsl_asrc.c     |  4 +--
>  sound/soc/fsl/fsl_asrc.h     |  3 ++
>  sound/soc/fsl/fsl_asrc_dma.c | 64 ++++++++++++++++++++++++++++++++----
>  3 files changed, 62 insertions(+), 9 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 584badf956d2..0bf91a6f54b9 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c
> @@ -115,7 +115,7 @@ static void fsl_asrc_sel_proc(int inrate, int outrate,
>   * within range [ANCA, ANCA+ANCB-1], depends on the channels of pair A
>   * while pair A and pair C are comparatively independent.
>   */
> -static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
> +int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
>  {
>  	enum asrc_pair_index index = ASRC_INVALID_PAIR;
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
> @@ -158,7 +158,7 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
>   *
>   * It clears the resource from asrc_priv and releases the occupied channels.
>   */
> -static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
> +void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
>  {
>  	struct fsl_asrc *asrc_priv = pair->asrc_priv;
>  	enum asrc_pair_index index = pair->index;
> diff --git a/sound/soc/fsl/fsl_asrc.h b/sound/soc/fsl/fsl_asrc.h
> index 38af485bdd22..2b57e8c53728 100644
> --- a/sound/soc/fsl/fsl_asrc.h
> +++ b/sound/soc/fsl/fsl_asrc.h
> @@ -462,4 +462,7 @@ struct fsl_asrc {
>  #define DRV_NAME "fsl-asrc-dai"
>  extern struct snd_soc_component_driver fsl_asrc_component;
>  struct dma_chan *fsl_asrc_get_dma_channel(struct fsl_asrc_pair *pair, bool dir);
> +int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair);
> +void fsl_asrc_release_pair(struct fsl_asrc_pair *pair);
> +
>  #endif /* _FSL_ASRC_H */
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 01052a0808b0..2a60fc6142b1 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -16,13 +16,11 @@
>  
>  #define FSL_ASRC_DMABUF_SIZE	(256 * 1024)
>  
> -static const struct snd_pcm_hardware snd_imx_hardware = {
> +static struct snd_pcm_hardware snd_imx_hardware = {
>  	.info = SNDRV_PCM_INFO_INTERLEAVED |
>  		SNDRV_PCM_INFO_BLOCK_TRANSFER |
>  		SNDRV_PCM_INFO_MMAP |
> -		SNDRV_PCM_INFO_MMAP_VALID |
> -		SNDRV_PCM_INFO_PAUSE |
> -		SNDRV_PCM_INFO_RESUME,
> +		SNDRV_PCM_INFO_MMAP_VALID,
>  	.buffer_bytes_max = FSL_ASRC_DMABUF_SIZE,
>  	.period_bytes_min = 128,
>  	.period_bytes_max = 65535, /* Limited by SDMA engine */
> @@ -270,12 +268,25 @@ static int fsl_asrc_dma_hw_free(struct snd_pcm_substream *substream)
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
> +	bool release_pair = true;
> +	int ret = 0;
> +
> +	ret = snd_pcm_hw_constraint_integer(substream->runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to set pcm hw params periods\n");
> +		return ret;
> +	}
>  
>  	pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
>  	if (!pair)
> @@ -285,11 +296,50 @@ static int fsl_asrc_dma_startup(struct snd_pcm_substream *substream)
>  
>  	runtime->private_data = pair;
>  
> -	snd_pcm_hw_constraint_integer(substream->runtime,
> -				      SNDRV_PCM_HW_PARAM_PERIODS);
> +	/* Request a dummy pair, which will be released later.
> +	 * Request pair function needs channel num as input, for this
> +	 * dummy pair, we just request "1" channel temporarily.
> +	 */
> +	ret = fsl_asrc_request_pair(1, pair);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to request asrc pair\n");
> +		goto req_pair_err;
> +	}
> +
> +	/* Request a dummy dma channel, which will be released later. */
> +	tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
> +	if (!tmp_chan) {
> +		dev_err(dev, "failed to get dma channel\n");
> +		ret = -EINVAL;
> +		goto dma_chan_err;
> +	}
> +
> +	dma_data = snd_soc_dai_get_dma_data(rtd->cpu_dai, substream);
> +
> +	/* Refine the snd_imx_hardware according to caps of DMA. */
> +	ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
> +							dma_data,
> +							&snd_imx_hardware,
> +							tmp_chan);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to refine runtime hwparams\n");
> +		goto out;
> +	}
> +
> +	release_pair = false;
>  	snd_soc_set_runtime_hwparams(substream, &snd_imx_hardware);
>  
> -	return 0;
> +out:
> +	dma_release_channel(tmp_chan);
> +
> +dma_chan_err:
> +	fsl_asrc_release_pair(pair);
> +
> +req_pair_err:
> +	if (release_pair)
> +		kfree(pair);
> +
> +	return ret;
>  }
>  
>  static int fsl_asrc_dma_shutdown(struct snd_pcm_substream *substream)
> -- 
> 2.21.0
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
