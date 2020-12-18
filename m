Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6028A2DE775
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Dec 2020 17:30:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0324517BD;
	Fri, 18 Dec 2020 17:29:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0324517BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608309003;
	bh=tUoVOavY8zZtqAopNTtCYcSdY1XcUvw/JJ50JmtjBW8=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UDR6ziGnzHLzR/k6xyEYWUQgek0piqNnezMLmxkqCNDtzpzrChgLBAAh4CAV3QLNH
	 2oXMqmXXUtbbc21Rh+HmQ+AaOwykIYAETfy58x8dmVRZlXA86vv5cH4prIaz/tdJSf
	 +wKWUiDMB2gEAPJM9pLV/TZc3DSlT+Fz57LXiNK0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76509F80240;
	Fri, 18 Dec 2020 17:28:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B0EFBF801F7; Fri, 18 Dec 2020 17:28:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3DB67F80103
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 17:28:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3DB67F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="sed/+h5l"
Received: by mail-wm1-x32c.google.com with SMTP id x22so2863584wmc.5
 for <alsa-devel@alsa-project.org>; Fri, 18 Dec 2020 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
 :date:mime-version;
 bh=hDH2L+0P9kjAoF52t+jsWol3EBTxZEBQ7riSP+6cwyM=;
 b=sed/+h5lEgewcmpW0voVHGQrAOThkQ7IGs9sM1TAoMI9yNT0sgR6BS3StvKNXW1H25
 Dpc1++5oCp8OAh0C6DFwOVNYwUkS3xqZVGy9S+SmYWq8nAXKBCPuuHNF5tJuoXMZzRoJ
 IsmJASRFv8vmC/aK0JpG84+Md1ASFL6vTXc5FOf+jZ81gExR4K/P8L8ie5ZnhDV8zDhK
 4PqyBF8tkZiXiGUueP3QQQxhWEbFC8GtGRc7ApcGL8qlToLJ/63MyAP1eaVmI1zO+ZNp
 pSMkAPmBNJyfdoTKZKmshKqWjxEFQ8XgOXiTaYZ68D+DCSDdXf6mzIvQTFumpant7Xen
 bDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:message-id:date:mime-version;
 bh=hDH2L+0P9kjAoF52t+jsWol3EBTxZEBQ7riSP+6cwyM=;
 b=Oomi93k7xtewSlngM5+Xwbye1y5whF8cqy8M7v1JUGo6jJ02p6SVr56b9H7BnvwAZW
 qgrUlcQXi2j78r/19HzJF7vFtghK5TSTgC8/XTq8SwyvhmW0WUM8L3IHDXyzRN4rvlVZ
 TlkWm9z1cb6JH7foz0UsrEBbnWYo1E3pTw/loSKbyLfnEwTbe9tlWalgfJi17v8Gbui8
 89gC+cHn0BVIrygG/SGrvDbKhr02KmsmAlfIrcPvRyArMW3N0lJdZE1rXj4oewcwGFvW
 jMdvwitZQZYyrT8SGZkeY5TaWgcgHLiS9buzkT/4N/dRSSUhCHDQBnxjYe/fRA1W7acc
 NH8w==
X-Gm-Message-State: AOAM532ozCcmDV5kyRJbBQINdwSIrCREmYoRa17MAKuRsu42zcYXpu43
 vRNLqx8jCG4wwoUtSu+Cug0yLA==
X-Google-Smtp-Source: ABdhPJz45T2wEeEYk/qdaxwS+D23F+v9yNo/z//yKmz2pRPtTfSHZ34k9nhQCSOL4Q87J7+F7owp9g==
X-Received: by 2002:a05:600c:2219:: with SMTP id
 z25mr5004724wml.27.1608308892494; 
 Fri, 18 Dec 2020 08:28:12 -0800 (PST)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id o8sm13980950wrm.17.2020.12.18.08.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 08:28:11 -0800 (PST)
References: <20201218154544.25513-1-lars@metafoo.de>
User-agent: mu4e 1.4.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH] ASoC: meson: Use managed DMA buffer allocation
In-reply-to: <20201218154544.25513-1-lars@metafoo.de>
Message-ID: <1jeejnnko5.fsf@starbuckisacylon.baylibre.com>
Date: Fri, 18 Dec 2020 17:28:10 +0100
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>
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


On Fri 18 Dec 2020 at 16:45, Lars-Peter Clausen <lars@metafoo.de> wrote:

> Using a managed buffer will pre-allocate the buffer using
> snd_pcm_lib_preallocate_pages() and automatically free it when the PCM is
> destroyed.
>
> In addition it will call snd_pcm_lib_malloc_pages() before the driver's
> hw_params() callback and snd_pcm_lib_free_pages() after the driver's
> hw_free() callback.
>
> This slightly reduces the boilerplate code of the driver.
>
> Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
> ---
>  sound/soc/meson/aiu-fifo-i2s.c   |  1 -
>  sound/soc/meson/aiu-fifo-spdif.c |  1 -
>  sound/soc/meson/aiu-fifo.c       | 18 ++----------------
>  3 files changed, 2 insertions(+), 18 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
> index d91b0d874342..2388a2d0b3a6 100644
> --- a/sound/soc/meson/aiu-fifo-i2s.c
> +++ b/sound/soc/meson/aiu-fifo-i2s.c
> @@ -124,7 +124,6 @@ const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
>  	.trigger	= aiu_fifo_i2s_trigger,
>  	.prepare	= aiu_fifo_i2s_prepare,
>  	.hw_params	= aiu_fifo_i2s_hw_params,
> -	.hw_free	= aiu_fifo_hw_free,
>  	.startup	= aiu_fifo_startup,
>  	.shutdown	= aiu_fifo_shutdown,
>  };
> diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
> index 44eb6faacf44..2fb30f89bf7a 100644
> --- a/sound/soc/meson/aiu-fifo-spdif.c
> +++ b/sound/soc/meson/aiu-fifo-spdif.c
> @@ -158,7 +158,6 @@ const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
>  	.trigger	= fifo_spdif_trigger,
>  	.prepare	= fifo_spdif_prepare,
>  	.hw_params	= fifo_spdif_hw_params,
> -	.hw_free	= aiu_fifo_hw_free,
>  	.startup	= aiu_fifo_startup,
>  	.shutdown	= aiu_fifo_shutdown,
>  };
> diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
> index aa88aae8e517..4ad23267cace 100644
> --- a/sound/soc/meson/aiu-fifo.c
> +++ b/sound/soc/meson/aiu-fifo.c
> @@ -99,11 +99,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_soc_component *component = dai->component;
>  	struct aiu_fifo *fifo = dai->playback_dma_data;
>  	dma_addr_t end;
> -	int ret;
> -
> -	ret = snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
> -	if (ret < 0)
> -		return ret;
>  
>  	/* Setup the fifo boundaries */
>  	end = runtime->dma_addr + runtime->dma_bytes - fifo->fifo_block;
> @@ -124,12 +119,6 @@ int aiu_fifo_hw_params(struct snd_pcm_substream *substream,
>  	return 0;
>  }
>  
> -int aiu_fifo_hw_free(struct snd_pcm_substream *substream,
> -		     struct snd_soc_dai *dai)
> -{
> -	return snd_pcm_lib_free_pages(substream);
> -}
> -
>  static irqreturn_t aiu_fifo_isr(int irq, void *dev_id)
>  {
>  	struct snd_pcm_substream *playback = dev_id;
> @@ -187,15 +176,12 @@ void aiu_fifo_shutdown(struct snd_pcm_substream *substream,
>  int aiu_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd,
>  		     struct snd_soc_dai *dai)
>  {
> -	struct snd_pcm_substream *substream =
> -		rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>  	struct snd_card *card = rtd->card->snd_card;
>  	struct aiu_fifo *fifo = dai->playback_dma_data;
>  	size_t size = fifo->pcm->buffer_bytes_max;
>  
> -	snd_pcm_lib_preallocate_pages(substream,
> -				      SNDRV_DMA_TYPE_DEV,
> -				      card->dev, size, size);
> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
> +				       card->dev, size, size);

Hi Lars-Peter,

These FIFOs only do playback so to avoid wasting memory
s/snd_pcm_set_managed_buffer_all/snd_pcm_set_managed_buffer ?

>  
>  	return 0;
>  }

