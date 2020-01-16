Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA013D8CF
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Jan 2020 12:18:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFA8317B0;
	Thu, 16 Jan 2020 12:17:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFA8317B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579173508;
	bh=0YRsQERHqQAcF02Yg/Yfkzk6XsVshnhSMX4OUtDz+K8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RsEA+yGHVheMDth1f8AprmbHFqrLQmxWXvsBMPqQ6xIw46CyRKm2cv6iaOCYyZQa6
	 hg++pkxF8hnDxow+w2uLbGNgBS+zOLSAE+GM+V7Yv1Qzq7ZYQJfGEvqmpPk7u7+sAN
	 0yQ4SOvFWMlUwQONWeHGccId2E9jmVcmf4VitTdc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90849F8014D;
	Thu, 16 Jan 2020 12:16:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E15CF8014E; Thu, 16 Jan 2020 12:16:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30,SPF_HELO_NONE,
 SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 03281F80086
 for <alsa-devel@alsa-project.org>; Thu, 16 Jan 2020 12:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 03281F80086
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 03:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,326,1574150400"; d="scan'208";a="218496747"
Received: from unknown (HELO keyon-X299) ([10.239.159.75])
 by orsmga008.jf.intel.com with ESMTP; 16 Jan 2020 03:16:28 -0800
Message-ID: <3c0a0067043d614cd4491b28acf6d49640746b15.camel@linux.intel.com>
From: Keyon Jie <yang.jie@linux.intel.com>
To: Takashi Iwai <tiwai@suse.de>
Date: Thu, 16 Jan 2020 19:25:38 +0800
In-Reply-To: <s5hsgkf7l2e.wl-tiwai@suse.de>
References: <20200116045318.5498-1-yang.jie@linux.intel.com>
 <s5hd0bjq3cu.wl-tiwai@suse.de>
 <97bbe88d1a6b63fe8e9b02bf0c5ce4a80553c48d.camel@linux.intel.com>
 <s5hsgkf7l2e.wl-tiwai@suse.de>
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH] ALSA: pcm: fix buffer_bytes max
 constrained by preallocated bytes issue
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

On Thu, 2020-01-16 at 11:27 +0100, Takashi Iwai wrote:
> On Thu, 16 Jan 2020 10:50:33 +0100,
> 
> Oh, you're right, and I completely misread the patch.
> 
> Now I took a coffee and can tell you the story behind the scene.
> 
> I believe the current code is intentionally limiting the size to the
> preallocated size.  This limitation was brought for not trying to
> allocate a larger buffer when the buffer has been preallocated.  In
> the past, most hardware allocated the continuous pages for a buffer
> and the allocation of a large buffer fails quite likely.  This was
> the
> reason of the buffer preallocation.  So, the driver wanted to tell
> the
> user-space the limit.  If user needs to have an extra large buffer,
> they are supposed to fiddle with prealloc procfs (either setting zero
> to clear the preallocation or setting a large enough buffer
> beforehand).

Thank you for the sharing, it is interesting and knowledge learned to
me.

> 
> For SG-buffers, though, limitation makes less sense than continuous
> pages.  e.g. a patch below removes the limitation for SG-buffers.
> But changing this would definitely cause the behavior difference, and
> I don't know whether it's a reasonable move -- I'm afraid that apps
> would start hogging too much memory if the limitation is gone.

I just went through all invoking to snd_pcm_lib_preallocate_pages*(),
for those SNDRV_DMA_TYPE_DEV, some of them set the *size* equal to the
*max*, some set the *max* several times to the *size*, IMHO, the *max*s
are matched to those hardware's limiatation, comparing to the *size*s,
aren't they?

In this case, I still think my patch hanle all
TYPE_DEV/SNDRV_DMA_TYPE_DEV/TYPE_SG/SNDRV_DMA_TYPE_DEV cases more
gracefully, we will still take the limitation from the specific driver
set, from the *max* param, and the test results looks very nice here,
we will take what the user space wanted for buffer-bytes via aply
exactly, as long as it is suitable for the interval and constraints.

What's your opinion about it?

> 
> 
> thanks,
> 
> Takashi
> 
> ---
> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
> index d4702cc1d376..6a6c3469bbcd 100644
> --- a/sound/core/pcm_memory.c
> +++ b/sound/core/pcm_memory.c
> @@ -96,6 +96,29 @@ void snd_pcm_lib_preallocate_free_for_all(struct
> snd_pcm *pcm)
>  }
>  EXPORT_SYMBOL(snd_pcm_lib_preallocate_free_for_all);
>  
> +/* set up substream->buffer_bytes_max, which is used in
> hw_constraint */
> +static void set_buffer_bytes_max(struct snd_pcm_substream
> *substream,
> +				 size_t size)
> +{
> +	substream->buffer_bytes_max = UINT_MAX;
> +
> +	if (!size)
> +		return; /* no preallocation */
> +
> +	/* for SG-buffers, no limitation is needed */
> +	switch (substream->dma_buffer.dev.type) {
> +#ifdef CONFIG_SND_DMA_SGBUF
> +	case SNDRV_DMA_TYPE_DEV_SG:
> +	case SNDRV_DMA_TYPE_DEV_UC_SG:
> +#endif
> +	case SNDRV_DMA_TYPE_VMALLOC:
> +		return;
> +	}
> +
> +	/* for continuous buffers, limit to the preallocated size */
> +	substream->buffer_bytes_max = size;
> +}
> +
>  #ifdef CONFIG_SND_VERBOSE_PROCFS
>  /*
>   * read callback for prealloc proc file
> @@ -156,10 +179,8 @@ static void
> snd_pcm_lib_preallocate_proc_write(struct snd_info_entry *entry,
>  				buffer->error = -ENOMEM;

if we won't take this change from user's fiddling for SG buffer, we
should not reallocate dma pages here also?

Thanks,
~Keyon

>  				return;
>  			}
> -			substream->buffer_bytes_max = size;
> -		} else {
> -			substream->buffer_bytes_max = UINT_MAX;
>  		}
> +		set_buffer_bytes_max(substream, size);
>  		if (substream->dma_buffer.area)
>  			snd_dma_free_pages(&substream->dma_buffer);
>  		substream->dma_buffer = new_dmab;
> @@ -206,10 +227,8 @@ static void preallocate_pages(struct
> snd_pcm_substream *substream,
>  
>  	if (size > 0 && preallocate_dma && substream->number <
> maximum_substreams)
>  		preallocate_pcm_pages(substream, size);
> -
> -	if (substream->dma_buffer.bytes > 0)
> -		substream->buffer_bytes_max = substream-
> >dma_buffer.bytes;
>  	substream->dma_max = max;
> +	set_buffer_bytes_max(substream, substream->dma_buffer.bytes);
>  	if (max > 0)
>  		preallocate_info_init(substream);
>  	if (managed)
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
