Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1852B65BA
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Nov 2020 14:58:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75BA3170D;
	Tue, 17 Nov 2020 14:57:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75BA3170D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605621509;
	bh=ZyankfSl4R1U5CWxxnkm53How2ZamDshlzruxvEdrVk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cN7Uk5m//NqBj/f7+AiEM31Ek3ApnIUDj2Q6TaGkf6DHTv1xvu4E4gxTfvbUESPHZ
	 n1+CIHCkC1m70hBex78DS/1TClnekiiYx9UYnSsQSFIaZcdYqKEU5nP1W+G0wEkU3W
	 +916uuKgOf+ZQ/2+WbvwnmjFB9sHwWZ7auVaZq1I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6A3DF801F9;
	Tue, 17 Nov 2020 14:56:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CA016F801F5; Tue, 17 Nov 2020 14:56:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46852F800FE
 for <alsa-devel@alsa-project.org>; Tue, 17 Nov 2020 14:56:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46852F800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="o7DHTNn5"
Received: from localhost (unknown [122.171.203.152])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA48A206F1;
 Tue, 17 Nov 2020 13:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605621395;
 bh=ZyankfSl4R1U5CWxxnkm53How2ZamDshlzruxvEdrVk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=o7DHTNn5RQQRTe+ps+nCTKmFqcR0gcJHuErjjFDH89gD0GR6BWyT8WBG3541MhgwI
 MX/aBZtn9PJ6Onl4u9qZt+ed+meV1pbJ4GdO3N4rmKRY9Qo5jhQs1mWX3zkC7KIP7L
 fFq0EgY3JcTmsScsfgrpMns+Oi2gfFw8w/YpBohg=
Date: Tue, 17 Nov 2020 19:26:30 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
Subject: Re: [RFC PATCH 2/4] ASoC: soc-generic-dmaengine-pcm: Add custom
 prepare and submit function
Message-ID: <20201117135630.GG50232@vkoul-mobl>
References: <20201117080354.4309-1-michael.wei.hong.sit@intel.com>
 <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201117080354.4309-4-michael.wei.hong.sit@intel.com>
Cc: pierre-louis.bossart@linux.intel.com, cezary.rojewski@intel.com,
 lars@metafoo.de, andriy.shevchenko@intel.com, alsa-devel@alsa-project.org,
 jee.heng.sia@intel.com, tiwai@suse.com, liam.r.girdwood@linux.intel.com,
 broonie@kernel.org
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

On 17-11-20, 16:03, Michael Sit Wei Hong wrote:
> Enabling custom prepare and submit function to overcome DMA limitation.
> 
> In the Intel KeemBay solution, the DW AXI-based DMA has a limitation on
> the number of DMA blocks per transfer. In the case of 16 bit audio ASoC
> would allocate blocks exceeding the DMA block limitation.

Looking at this and cover does not tell me the limitation of the
hardware. Can you please elaborate what is the special feature this
hardware brings which results in custom solution here..?
> 
> The ASoC layers are not aware of such DMA limitation, and the DMA engine
> does not provide an API to set the maximum number of blocks per linked link.

What does a block refer to here..?

Btw have you looked into dma_slave_caps specifically max_sg_burst field
added recently

Thanks

> This patch suggests an additional callback to let the caller check and modify
> the number of blocks per transfer to work-around the limitations.
> 
> Signed-off-by: Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/sound/dmaengine_pcm.h         |  6 ++++++
>  sound/core/pcm_dmaengine.c            | 30 ++++++++++++++++++++++-----
>  sound/soc/soc-generic-dmaengine-pcm.c |  8 ++++++-
>  3 files changed, 38 insertions(+), 6 deletions(-)
> 
> diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
> index 8c5e38180fb0..9fae56d39ae2 100644
> --- a/include/sound/dmaengine_pcm.h
> +++ b/include/sound/dmaengine_pcm.h
> @@ -28,6 +28,9 @@ snd_pcm_substream_to_dma_direction(const struct snd_pcm_substream *substream)
>  int snd_hwparams_to_dma_slave_config(const struct snd_pcm_substream *substream,
>  	const struct snd_pcm_hw_params *params, struct dma_slave_config *slave_config);
>  int snd_dmaengine_pcm_trigger(struct snd_pcm_substream *substream, int cmd);
> +int snd_dmaengine_pcm_custom_trigger(struct snd_pcm_substream *substream, int cmd,
> +	int (*custom_pcm_prepare_and_submit)(struct snd_pcm_substream *substream));
> +
>  snd_pcm_uframes_t snd_dmaengine_pcm_pointer(struct snd_pcm_substream *substream);
>  snd_pcm_uframes_t snd_dmaengine_pcm_pointer_no_residue(struct snd_pcm_substream *substream);
>  
> @@ -113,6 +116,8 @@ int snd_dmaengine_pcm_refine_runtime_hwparams(
>   *   which do not use devicetree.
>   * @process: Callback used to apply processing on samples transferred from/to
>   *   user space.
> + * @custom_pcm_prepare_and_submit: Callback used to work-around DMA limitations
> + *   related to link lists.
>   * @compat_filter_fn: Will be used as the filter function when requesting a
>   *  channel for platforms which do not use devicetree. The filter parameter
>   *  will be the DAI's DMA data.
> @@ -138,6 +143,7 @@ struct snd_dmaengine_pcm_config {
>  	int (*process)(struct snd_pcm_substream *substream,
>  		       int channel, unsigned long hwoff,
>  		       void *buf, unsigned long bytes);
> +	int (*custom_pcm_prepare_and_submit)(struct snd_pcm_substream *substream);
>  	dma_filter_fn compat_filter_fn;
>  	struct device *dma_dev;
>  	const char *chan_names[SNDRV_PCM_STREAM_LAST + 1];
> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 4d059ff2b2e4..cbd1429de509 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -170,16 +170,20 @@ static int dmaengine_pcm_prepare_and_submit(struct snd_pcm_substream *substream)
>  }
>  
>  /**
> - * snd_dmaengine_pcm_trigger - dmaengine based PCM trigger implementation
> + * snd_dmaengine_pcm_custom_trigger - customized PCM trigger implementation to
> + *  work-around DMA limitations related to link lists.
>   * @substream: PCM substream
>   * @cmd: Trigger command
> + * @custom_pcm_prepare_and_submit: custom function to deal with DMA limitations
>   *
>   * Returns 0 on success, a negative error code otherwise.
>   *
> - * This function can be used as the PCM trigger callback for dmaengine based PCM
> - * driver implementations.
> + * This function can be used as the PCM trigger callback for customized dmaengine
> + * based PCM driver implementations.
>   */
> -int snd_dmaengine_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> +
> +int snd_dmaengine_pcm_custom_trigger(struct snd_pcm_substream *substream, int cmd,
> +	int (*custom_pcm_prepare_and_submit)(struct snd_pcm_substream *substream))
>  {
>  	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
>  	struct snd_pcm_runtime *runtime = substream->runtime;
> @@ -187,7 +191,7 @@ int snd_dmaengine_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
> -		ret = dmaengine_pcm_prepare_and_submit(substream);
> +		ret = custom_pcm_prepare_and_submit(substream);
>  		if (ret)
>  			return ret;
>  		dma_async_issue_pending(prtd->dma_chan);
> @@ -214,6 +218,22 @@ int snd_dmaengine_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  
>  	return 0;
>  }
> +EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_custom_trigger);
> +
> +/**
> + * snd_dmaengine_pcm_trigger - dmaengine based PCM trigger implementation
> + * @substream: PCM substream
> + * @cmd: Trigger command
> + *
> + * Returns 0 on success, a negative error code otherwise.
> + *
> + * This function can be used as the PCM trigger callback for dmaengine based PCM
> + * driver implementations.
> + */
> +int snd_dmaengine_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	return snd_dmaengine_pcm_custom_trigger(substream, cmd, dmaengine_pcm_prepare_and_submit);
> +}
>  EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_trigger);
>  
>  /**
> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 9ef80a48707e..88fca6402a36 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> @@ -173,7 +173,13 @@ static int dmaengine_pcm_close(struct snd_soc_component *component,
>  static int dmaengine_pcm_trigger(struct snd_soc_component *component,
>  				 struct snd_pcm_substream *substream, int cmd)
>  {
> -	return snd_dmaengine_pcm_trigger(substream, cmd);
> +	struct dmaengine_pcm *pcm = soc_component_to_pcm(component);
> +
> +	if (pcm->config && pcm->config->custom_pcm_prepare_and_submit)
> +		return snd_dmaengine_pcm_custom_trigger(substream, cmd,
> +							pcm->config->custom_pcm_prepare_and_submit);
> +	else
> +		return snd_dmaengine_pcm_trigger(substream, cmd);
>  }
>  
>  static struct dma_chan *dmaengine_pcm_compat_request_channel(
> -- 
> 2.17.1

-- 
~Vinod
