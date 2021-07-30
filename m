Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9C43DB46A
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jul 2021 09:20:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 582161AA1;
	Fri, 30 Jul 2021 09:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 582161AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627629655;
	bh=+nxYGgap4TAdB1i3B/UmYl+gE78d8DaXFQfHw/ETeVQ=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eLgIaE1FJBgHbvsF0MbUxznpFrK40j32t1kJjCaU3bKAdid8kfN7UIeoRY1moFZiu
	 D6GjKNe6OvDJXaCbJKUiPJcOXNCanQHGG4VRgZNZYdEhXqZgX+dVzQYuYcy2wKIe8K
	 zxs5jLKKtVwcYeWakasfIwD0lXSE+np+5OKCk9Co=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B485EF8025A;
	Fri, 30 Jul 2021 09:19:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3BA73F80253; Fri, 30 Jul 2021 09:19:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F43AF800E9
 for <alsa-devel@alsa-project.org>; Fri, 30 Jul 2021 09:19:19 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7A45AA0040;
 Fri, 30 Jul 2021 09:19:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7A45AA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1627629558; bh=Hr9Ivlhoy/ID0k9dRLCgcEi8Vx4mc5oyqWtmLh362j0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=VA/hlAf7YIY3S2/zQQyf4U2kpmP9LoByrzd3fkbQ78Kx3/rma3CJNGH2a8OWG99Cx
 ZpHxA1DooO4UU+qXaf7Wbe+90SowYUy6E/5ij9GkKN4tWqHjWHE9hmT8+DyZZYaaN6
 ksVFt2DPsDLR32UL3ZHeY9+tHTN1aSNiNlN1T3L8=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 30 Jul 2021 09:19:16 +0200 (CEST)
Subject: Re: [PATCH] ALSA: pcm: Fix mmap capability check
To: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
References: <20210720092640.12338-1-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <d0fdfe67-99fc-85be-24f0-316f6ef0a0cd@perex.cz>
Date: Fri, 30 Jul 2021 09:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720092640.12338-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

On 20. 07. 21 11:26, Takashi Iwai wrote:
> The hw_support_mmap() doesn't cover all memory allocation types and
> might use a wrong device pointer for checking the capability.
> Check the all memory allocation types more completely.

This change breaks mmap for the snd-dummy driver (fake_buffer). It seems that
we need this fix?

diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
index 6a2971a7e6a1..09c0e2a6489c 100644
--- a/sound/core/pcm_native.c
+++ b/sound/core/pcm_native.c
@@ -246,7 +246,7 @@ static bool hw_support_mmap(struct snd_pcm_substream
*substream)
        if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
                return false;

-       if (substream->ops->mmap)
+       if (substream->ops->mmap || substream->ops->page)
                return true;

        switch (substream->dma_buffer.dev.type) {


					Jaroslav


> 
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/core/pcm_native.c | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index c88c4316c417..6919d2943b9d 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -246,12 +246,18 @@ static bool hw_support_mmap(struct snd_pcm_substream *substream)
>  	if (!(substream->runtime->hw.info & SNDRV_PCM_INFO_MMAP))
>  		return false;
>  
> -	if (substream->ops->mmap ||
> -	    (substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV &&
> -	     substream->dma_buffer.dev.type != SNDRV_DMA_TYPE_DEV_UC))
> +	if (substream->ops->mmap)
>  		return true;
>  
> -	return dma_can_mmap(substream->dma_buffer.dev.dev);
> +	switch (substream->dma_buffer.dev.type) {
> +	case SNDRV_DMA_TYPE_UNKNOWN:
> +		return false;
> +	case SNDRV_DMA_TYPE_CONTINUOUS:
> +	case SNDRV_DMA_TYPE_VMALLOC:
> +		return true;
> +	default:
> +		return dma_can_mmap(substream->dma_buffer.dev.dev);
> +	}
>  }
>  
>  static int constrain_mask_params(struct snd_pcm_substream *substream,
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
