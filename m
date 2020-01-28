Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 997F314B330
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jan 2020 12:01:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 448B41682;
	Tue, 28 Jan 2020 12:00:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 448B41682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580209302;
	bh=ENDmOytKfQ1eprQVi0MD6hTAlBJ3BluRBzqMvZ/1sv8=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JhnJqUI13xkSApOhVSAhrxztAUnzQUBIldAAIYvq7tv4c/ny6f3zEQUJm5kwAGSif
	 7l1oHX8FX24wxZdm1ceDPuNCNz4lIYOyEIG9bUwGlhP4HR0mzuUJNS6T3BamnSRPAP
	 WrVdh9T78C0X4km4XzZ+aaG09/t6V7Ck+QB5a/iA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0B3AF80150;
	Tue, 28 Jan 2020 12:00:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CC6A7F8014B; Tue, 28 Jan 2020 11:59:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09CA7F80082
 for <alsa-devel@alsa-project.org>; Tue, 28 Jan 2020 11:59:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09CA7F80082
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ci4YCOPp"
Received: from localhost (unknown [223.226.101.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 823872467B;
 Tue, 28 Jan 2020 10:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580209192;
 bh=k0SvNUtpz1DwV73rIZmM3abGe3+wRTZxNYyrAGnJzT4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ci4YCOPpiI/uFDU+1Bl0lEylfpbxo/ah7QhZnhN9uR3GnqMLmjW1Uih2RKeSfSDS6
 qS7SKcXtqXwAY3mu0YWYU2XzzMe2dfk56CyR0JxcPcl7ZLEq8GYXERBv6wUXpjceHG
 9W9mCMMy5VYKdEdldE+bdd3U7FGCNWYn4oCpoYJM=
Date: Tue, 28 Jan 2020 16:29:46 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20200128105946.GP2841@vkoul-mobl>
References: <20200128104356.16570-1-cezary.rojewski@intel.com>
 <20200128104356.16570-5-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200128104356.16570-5-cezary.rojewski@intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 broonie@kernel.org, lgirdwood@gmail.com, tiwai@suse.com
Subject: Re: [alsa-devel] [PATCH v3 04/11] ALSA: core: Expand DMA buffer
 information
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

On 28-01-20, 11:43, Cezary Rojewski wrote:
> Update DMA buffer definition for snd_compr_runtime so it is represented
> similarly as in snd_pcm_runtime. While at it, modify
> snd_compr_set_runtime_buffer to account for newly added members.

Please run ./scripts/get_maintainer.pl, it will tell you the people you
should CC on a patch.

Also Takashi already acked, so you should add the acks/reviews received
in subsequent versions (unless they changed)

And for this:

Acked-by: Vinod Koul <vkoul@kernel.org>

> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  include/sound/compress_driver.h | 35 ++++++++++++++++++++++++---------
>  1 file changed, 26 insertions(+), 9 deletions(-)
> 
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
> index bc88d6f964da..00f633c0c3ba 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -23,7 +23,6 @@ struct snd_compr_ops;
>   * struct snd_compr_runtime: runtime stream description
>   * @state: stream state
>   * @ops: pointer to DSP callbacks
> - * @dma_buffer_p: runtime dma buffer pointer
>   * @buffer: pointer to kernel buffer, valid only when not in mmap mode or
>   *	DSP doesn't implement copy
>   * @buffer_size: size of the above buffer
> @@ -34,11 +33,14 @@ struct snd_compr_ops;
>   * @total_bytes_transferred: cumulative bytes transferred by offload DSP
>   * @sleep: poll sleep
>   * @private_data: driver private data pointer
> + * @dma_area: virtual buffer address
> + * @dma_addr: physical buffer address (not accessible from main CPU)
> + * @dma_bytes: size of DMA area
> + * @dma_buffer_p: runtime dma buffer pointer
>   */
>  struct snd_compr_runtime {
>  	snd_pcm_state_t state;
>  	struct snd_compr_ops *ops;
> -	struct snd_dma_buffer *dma_buffer_p;
>  	void *buffer;
>  	u64 buffer_size;
>  	u32 fragment_size;
> @@ -47,6 +49,11 @@ struct snd_compr_runtime {
>  	u64 total_bytes_transferred;
>  	wait_queue_head_t sleep;
>  	void *private_data;
> +
> +	unsigned char *dma_area;
> +	dma_addr_t dma_addr;
> +	size_t dma_bytes;
> +	struct snd_dma_buffer *dma_buffer_p;
>  };
>  
>  /**
> @@ -180,19 +187,29 @@ static inline void snd_compr_drain_notify(struct snd_compr_stream *stream)
>  
>  /**
>   * snd_compr_set_runtime_buffer - Set the Compress runtime buffer
> - * @substream: compress substream to set
> + * @stream: compress stream to set
>   * @bufp: the buffer information, NULL to clear
>   *
>   * Copy the buffer information to runtime buffer when @bufp is non-NULL.
>   * Otherwise it clears the current buffer information.
>   */
> -static inline void snd_compr_set_runtime_buffer(
> -					struct snd_compr_stream *substream,
> -					struct snd_dma_buffer *bufp)
> +static inline void
> +snd_compr_set_runtime_buffer(struct snd_compr_stream *stream,
> +			     struct snd_dma_buffer *bufp)
>  {
> -	struct snd_compr_runtime *runtime = substream->runtime;
> -
> -	runtime->dma_buffer_p = bufp;
> +	struct snd_compr_runtime *runtime = stream->runtime;
> +
> +	if (bufp) {
> +		runtime->dma_buffer_p = bufp;
> +		runtime->dma_area = bufp->area;
> +		runtime->dma_addr = bufp->addr;
> +		runtime->dma_bytes = bufp->bytes;
> +	} else {
> +		runtime->dma_buffer_p = NULL;
> +		runtime->dma_area = NULL;
> +		runtime->dma_addr = 0;
> +		runtime->dma_bytes = 0;
> +	}
>  }
>  
>  int snd_compr_stop_error(struct snd_compr_stream *stream,
> -- 
> 2.17.1
> 
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel

-- 
~Vinod
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
