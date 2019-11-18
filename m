Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAA4100B61
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 19:21:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6FFA21688;
	Mon, 18 Nov 2019 19:20:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6FFA21688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574101268;
	bh=asybNwlbIBeC7DB7JcVAkQrzrjRAxZsnrflegx7hRX4=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=c2Hy33hj8K0babXMKsIf78xv/9eWZTuL1z8+qhH1aUV5ci1130HlSjtJy7eMZsenP
	 6Bn3/JvQXoN1jB9UcBKdD3BIcwR/I1HscNqk0rEaLgEJiTzS9qv1l9LEC+ZQa4kELk
	 qsRDf8fG6QZTozIaIsJwNOcqdiQG4qwaD18J3tes=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 303B8F8013D;
	Mon, 18 Nov 2019 19:19:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC701F8013D; Mon, 18 Nov 2019 19:19:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 52051F800FF
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 19:19:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52051F800FF
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 10:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,321,1569308400"; d="scan'208";a="407480019"
Received: from asimomai-mobl1.amr.corp.intel.com (HELO [10.251.156.191])
 ([10.251.156.191])
 by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2019 10:19:14 -0800
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20191117085308.23915-1-tiwai@suse.de>
 <20191117085308.23915-2-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1613de8d-3418-c2cf-d7d3-87c66843f5fd@linux.intel.com>
Date: Mon, 18 Nov 2019 10:24:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191117085308.23915-2-tiwai@suse.de>
Content-Language: en-US
Subject: Re: [alsa-devel] [PATCH 1/8] ALSA: pcm: Introduce managed buffer
 allocation mode
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



On 11/17/19 2:53 AM, Takashi Iwai wrote:
> This patch adds the support for the feature to automatically allocate
> and free PCM buffers, so called "managed buffer allocation" mode.
> It's set up via new PCM helpers, snd_pcm_set_managed_buffer() and
> snd_pcm_set_managed_buffer_all(), both of which correspond to the
> existing preallocator helpers, snd_pcm_lib_preallocate_pages() and
> snd_pcm_lib_preallocate_pages_for_all().  When the new helper is used,
> it not only performs the pre-allocation of buffers, but also it
> manages to call snd_pcm_lib_malloc_pages() before the PCM hw_params
> ops and snd_lib_pcm_free() after the PCM hw_free ops inside PCM core,
> respectively.  This allows drivers to drop the explicit calls of the
> memory allocation / release functions, and it will be a good amount of
> code reduction in the end of this patch series.
> 
> When the PCM substream is set to the managed buffer allocation mode,
> the managed_buffer_alloc flag is set in the substream object.  Since
> some drivers want to know when a buffer is newly allocated or
> re-allocated at hw_params callback (e.g. want to set up the additional
> stuff for the given buffer only at allocation time), now PCM core
> turns on buffer_changed flag when the buffer has changed.

I am a bit lost on the directions:
a) is this introducing a new API that will eventually replace the 
existing one?
b) or are we going to have two options, managed and non-managed buffers?
in this case, what would drive an implementer to keep using non-managed 
buffers? It'd be useful to provide examples.

In the cover letter, the wording 'almost all drivers' is used, which 
leads be to think option b) it is, but the exceptions are not clear to me.

> 
> The standard conversions to use the new API will be straightforward:
> - Replace snd_pcm_lib_preallocate*() calls with the corresponding
>    snd_pcm_set_managed_buffer*(); the arguments should be unchanged
> - Drop superfluous snd_pcm_lib_malloc() and snd_pcm_lib_free() calls;
>    the check of snd_pcm_lib_malloc() returns should be replaced with
>    the check of runtime->buffer_changed flag.
> - If hw_params or hw_free becomes empty, drop them from PCM ops
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>   include/sound/pcm.h     |  8 +++++
>   sound/core/pcm_memory.c | 83 +++++++++++++++++++++++++++++++++++++++++--------
>   sound/core/pcm_native.c | 12 +++++++
>   3 files changed, 90 insertions(+), 13 deletions(-)
> 
> diff --git a/include/sound/pcm.h b/include/sound/pcm.h
> index 2c0aa884f5f1..253d15c61ce2 100644
> --- a/include/sound/pcm.h
> +++ b/include/sound/pcm.h
> @@ -414,6 +414,7 @@ struct snd_pcm_runtime {
>   	size_t dma_bytes;		/* size of DMA area */
>   
>   	struct snd_dma_buffer *dma_buffer_p;	/* allocated buffer */
> +	unsigned int buffer_changed:1;	/* buffer allocation changed; set only in managed mode */
>   
>   	/* -- audio timestamp config -- */
>   	struct snd_pcm_audio_tstamp_config audio_tstamp_config;
> @@ -475,6 +476,7 @@ struct snd_pcm_substream {
>   #endif /* CONFIG_SND_VERBOSE_PROCFS */
>   	/* misc flags */
>   	unsigned int hw_opened: 1;
> +	unsigned int managed_buffer_alloc:1;
>   };
>   
>   #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
> @@ -1186,6 +1188,12 @@ void snd_pcm_lib_preallocate_pages_for_all(struct snd_pcm *pcm,
>   int snd_pcm_lib_malloc_pages(struct snd_pcm_substream *substream, size_t size);
>   int snd_pcm_lib_free_pages(struct snd_pcm_substream *substream);
>   
> +void snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
> +				struct device *data, size_t size, size_t max);
> +void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
> +				    struct device *data,
> +				    size_t size, size_t max);
> +
>   int _snd_pcm_lib_alloc_vmalloc_buffer(struct snd_pcm_substream *substream,
>   				      size_t size, gfp_t gfp_flags);
>   int snd_pcm_lib_free_vmalloc_buffer(struct snd_pcm_substream *substream);
> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
> index 286f333f8e4c..73b770db2372 100644
> --- a/sound/core/pcm_memory.c
> +++ b/sound/core/pcm_memory.c
> @@ -193,9 +193,15 @@ static inline void preallocate_info_init(struct snd_pcm_substream *substream)
>   /*
>    * pre-allocate the buffer and create a proc file for the substream
>    */
> -static void snd_pcm_lib_preallocate_pages1(struct snd_pcm_substream *substream,
> -					  size_t size, size_t max)
> +static void preallocate_pages(struct snd_pcm_substream *substream,
> +			      int type, struct device *data,
> +			      size_t size, size_t max, bool managed)
>   {
> +	if (snd_BUG_ON(substream->dma_buffer.dev.type))
> +		return;
> +
> +	substream->dma_buffer.dev.type = type;
> +	substream->dma_buffer.dev.dev = data;
>   
>   	if (size > 0 && preallocate_dma && substream->number < maximum_substreams)
>   		preallocate_pcm_pages(substream, size);
> @@ -205,8 +211,23 @@ static void snd_pcm_lib_preallocate_pages1(struct snd_pcm_substream *substream,
>   	substream->dma_max = max;
>   	if (max > 0)
>   		preallocate_info_init(substream);
> +	if (managed)
> +		substream->managed_buffer_alloc = 1;
>   }
>   
> +static void preallocate_pages_for_all(struct snd_pcm *pcm, int type,
> +				      void *data, size_t size, size_t max,
> +				      bool managed)
> +{
> +	struct snd_pcm_substream *substream;
> +	int stream;
> +
> +	for (stream = 0; stream < 2; stream++)
> +		for (substream = pcm->streams[stream].substream; substream;
> +		     substream = substream->next)
> +			preallocate_pages(substream, type, data, size, max,
> +					  managed);
> +}
>   
>   /**
>    * snd_pcm_lib_preallocate_pages - pre-allocation for the given DMA type
> @@ -222,11 +243,7 @@ void snd_pcm_lib_preallocate_pages(struct snd_pcm_substream *substream,
>   				  int type, struct device *data,
>   				  size_t size, size_t max)
>   {
> -	if (snd_BUG_ON(substream->dma_buffer.dev.type))
> -		return;
> -	substream->dma_buffer.dev.type = type;
> -	substream->dma_buffer.dev.dev = data;
> -	snd_pcm_lib_preallocate_pages1(substream, size, max);
> +	preallocate_pages(substream, type, data, size, max, false);
>   }
>   EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages);
>   
> @@ -245,15 +262,55 @@ void snd_pcm_lib_preallocate_pages_for_all(struct snd_pcm *pcm,
>   					  int type, void *data,
>   					  size_t size, size_t max)
>   {
> -	struct snd_pcm_substream *substream;
> -	int stream;
> -
> -	for (stream = 0; stream < 2; stream++)
> -		for (substream = pcm->streams[stream].substream; substream; substream = substream->next)
> -			snd_pcm_lib_preallocate_pages(substream, type, data, size, max);
> +	preallocate_pages_for_all(pcm, type, data, size, max, false);
>   }
>   EXPORT_SYMBOL(snd_pcm_lib_preallocate_pages_for_all);
>   
> +/**
> + * snd_pcm_set_managed_buffer - set up buffer management for a substream
> + * @substream: the pcm substream instance
> + * @type: DMA type (SNDRV_DMA_TYPE_*)
> + * @data: DMA type dependent data
> + * @size: the requested pre-allocation size in bytes
> + * @max: the max. allowed pre-allocation size
> + *
> + * Do pre-allocation for the given DMA buffer type, and set the managed
> + * buffer allocation mode to the given substream.
> + * In this mode, PCM core will allocate a buffer automatically before PCM
> + * hw_params ops call, and release the buffer after PCM hw_free ops call
> + * as well, so that the driver doesn't need to invoke the allocation and
> + * the release explicitly in its callback.
> + * When a buffer is actually allocated before the PCM hw_params call, it
> + * turns on the runtime buffer_changed flag for drivers changing their h/w
> + * parameters accordingly.
> + */
> +void snd_pcm_set_managed_buffer(struct snd_pcm_substream *substream, int type,
> +				struct device *data, size_t size, size_t max)
> +{
> +	preallocate_pages(substream, type, data, size, max, true);
> +}
> +EXPORT_SYMBOL(snd_pcm_set_managed_buffer);
> +
> +/**
> + * snd_pcm_set_managed_buffer_all - set up buffer management for all substreams
> + *	for all substreams
> + * @pcm: the pcm instance
> + * @type: DMA type (SNDRV_DMA_TYPE_*)
> + * @data: DMA type dependent data
> + * @size: the requested pre-allocation size in bytes
> + * @max: the max. allowed pre-allocation size
> + *
> + * Do pre-allocation to all substreams of the given pcm for the specified DMA
> + * type and size, and set the managed_buffer_alloc flag to each substream.
> + */
> +void snd_pcm_set_managed_buffer_all(struct snd_pcm *pcm, int type,
> +				    struct device *data,
> +				    size_t size, size_t max)
> +{
> +	preallocate_pages_for_all(pcm, type, data, size, max, true);
> +}
> +EXPORT_SYMBOL(snd_pcm_set_managed_buffer_all);
> +
>   #ifdef CONFIG_SND_DMA_SGBUF
>   /*
>    * snd_pcm_sgbuf_ops_page - get the page struct at the given offset
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 0c27009dc3df..f1646735bde6 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -662,6 +662,14 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
>   	if (err < 0)
>   		goto _error;
>   
> +	if (substream->managed_buffer_alloc) {
> +		err = snd_pcm_lib_malloc_pages(substream,
> +					       params_buffer_bytes(params));
> +		if (err < 0)
> +			goto _error;
> +		runtime->buffer_changed = err > 0;
> +	}
> +
>   	if (substream->ops->hw_params != NULL) {
>   		err = substream->ops->hw_params(substream, params);
>   		if (err < 0)
> @@ -723,6 +731,8 @@ static int snd_pcm_hw_params(struct snd_pcm_substream *substream,
>   	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
>   	if (substream->ops->hw_free != NULL)
>   		substream->ops->hw_free(substream);
> +	if (substream->managed_buffer_alloc)
> +		snd_pcm_lib_free_pages(substream);
>   	return err;
>   }
>   
> @@ -769,6 +779,8 @@ static int snd_pcm_hw_free(struct snd_pcm_substream *substream)
>   		return -EBADFD;
>   	if (substream->ops->hw_free)
>   		result = substream->ops->hw_free(substream);
> +	if (substream->managed_buffer_alloc)
> +		snd_pcm_lib_free_pages(substream);
>   	snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
>   	pm_qos_remove_request(&substream->latency_pm_qos_req);
>   	return result;
> 
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
