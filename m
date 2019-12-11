Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1385711A83F
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Dec 2019 10:51:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E0C81660;
	Wed, 11 Dec 2019 10:50:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E0C81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1576057897;
	bh=auiSjtW8wHigt8leT5pBr4KpM05x6BoX9K25n8ExPJk=;
	h=References:From:To:In-reply-to:Date:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qa5CB1abZ3Fl5ILXMhA+NEMcmZGMNEXXFdY8zOp1/hryQCQMdQrKe14WuvJ7KJUth
	 tJ5BAjgd3uJCynUns5wLZTRV4EO9DUf7JuIrFRXomQIJvKoeyYXtriqd6y3TC0sYJ7
	 BxrJGP9mHlLs9Lq48SyjTkzF/+YOtZXW3NIOQWj4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D61F2F8019B;
	Wed, 11 Dec 2019 10:49:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 03143F801F4; Wed, 11 Dec 2019 10:49:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 96C1CF800F3
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 10:49:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96C1CF800F3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="cLwBaQIN"
Received: by mail-wr1-x441.google.com with SMTP id b6so23313477wrq.0
 for <alsa-devel@alsa-project.org>; Wed, 11 Dec 2019 01:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=SOcmq7BJFXxMoWg36Kiw6TYdXoO8IHDd1ZR7vSKdkrc=;
 b=cLwBaQINPai2FwvLnX1f7gG54lEdhBWqv9FeaTEYNUyT8A8SnSmJLeG7jF/roFRAYM
 pUuLRkFv28WxT6WX8RT9gDqVKxOATvcq2+phRNdE2HyJORAs6JOsIBIODo44AFbkwmq+
 OgS0rxgBDkxl1Y6l0M0SZ4GqCd8b64XuBWvYDvZ4Z3GUgGDi4+CVRFlH/7k/AS9YnMOd
 yH/bb8Etgsu5G30PMx1qs5njwjsflx6JPyXxHd8qJfLRakbZ3v/CKBLXKmPETDTPDdyb
 l9v9BPvLOl6Wlib+ByJT1D/I1xTQWkAkN8OCpb5RLnNrJzDOyW9y5mmq6HAv/w20FqCe
 wUCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=SOcmq7BJFXxMoWg36Kiw6TYdXoO8IHDd1ZR7vSKdkrc=;
 b=CIS4HxaNgR57C18yKrMS0NXDw59s1wdbWlLn0zvkJMCTMbmnIxvWwhmDz6pLszMUsf
 oUuFGtSlGRCPqzvTTNm0+08b0d7qn7G8eqa+rUFyioVItSRyJB49bH9Cjkb0GIYii6to
 UVPMOfrPciopyvPjZcUOFtJkQX+g54rDdjU6fwE3UmPyO5vnBVoNq1spZxhdUfrO752J
 L3UoSAQJbphPvp90KRnD5s2G2iZf6UPM4zo+WbKTnNMfM5k0Ei9YKzLpst7mY9GJ5COd
 tgsvqDRTnRLrvnYahc+cDUHhx/veD3u8zRSywVjYQi8QoxHoYuk6e8F/tQe85i6Wt7AJ
 /S1g==
X-Gm-Message-State: APjAAAWVNgGHNDayKIcvm8yontA/6czk89vzMX5/o85mpBSBQd5kQX1Z
 ZlIm3DMpyAjUuzkQ4uRRs6iUcg==
X-Google-Smtp-Source: APXvYqw+POmFWYT7Y5joU0USfU2wB52LW37kgoHGZb0ugvv0fTk0Zf6RhADKwtay/+cHomL+3SN5Mw==
X-Received: by 2002:a5d:4b8f:: with SMTP id b15mr2902054wrt.100.1576057786525; 
 Wed, 11 Dec 2019 01:49:46 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g2sm1621814wrw.76.2019.12.11.01.49.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2019 01:49:45 -0800 (PST)
References: <20191210142614.19405-1-tiwai@suse.de>
 <20191210142614.19405-6-tiwai@suse.de>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
In-reply-to: <20191210142614.19405-6-tiwai@suse.de>
Date: Wed, 11 Dec 2019 10:49:45 +0100
Message-ID: <1jfthrkx8m.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Cc: Kevin Hilman <khilman@baylibre.com>, alsa-devel@alsa-project.org
Subject: Re: [alsa-devel] [PATCH for-5.6 05/23] ASoC: meson: Use managed
	buffer allocation
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


On Tue 10 Dec 2019 at 15:25, Takashi Iwai <tiwai@suse.de> wrote:

> Clean up the driver with the new managed buffer allocation API.
> The superfluous snd_pcm_lib_malloc_pages() and
> snd_pcm_lib_free_pages() calls are dropped.
>
> Cc: Jerome Brunet <jbrunet@baylibre.com>

Thanks Takashi !
Acked-by: Jerome Brunet <jbrunet@baylibre.com>

> Cc: Kevin Hilman <khilman@baylibre.com>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/soc/meson/axg-fifo.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
> index d6f3eefb8f09..772eda857019 100644
> --- a/sound/soc/meson/axg-fifo.c
> +++ b/sound/soc/meson/axg-fifo.c
> @@ -115,11 +115,6 @@ int axg_fifo_pcm_hw_params(struct snd_soc_component *component,
>  	struct axg_fifo *fifo = axg_fifo_data(ss);
>  	dma_addr_t end_ptr;
>  	unsigned int burst_num;
> -	int ret;
> -
> -	ret = snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(params));
> -	if (ret < 0)
> -		return ret;
>  
>  	/* Setup dma memory pointers */
>  	end_ptr = runtime->dma_addr + runtime->dma_bytes - AXG_FIFO_BURST;
> @@ -167,7 +162,7 @@ int axg_fifo_pcm_hw_free(struct snd_soc_component *component,
>  	regmap_update_bits(fifo->map, FIFO_CTRL0,
>  			   CTRL0_INT_EN(FIFO_INT_COUNT_REPEAT), 0);
>  
> -	return snd_pcm_lib_free_pages(ss);
> +	return 0;
>  }
>  EXPORT_SYMBOL_GPL(axg_fifo_pcm_hw_free);
>  
> @@ -287,9 +282,9 @@ int axg_fifo_pcm_new(struct snd_soc_pcm_runtime *rtd, unsigned int type)
>  	struct snd_card *card = rtd->card->snd_card;
>  	size_t size = axg_fifo_hw.buffer_bytes_max;
>  
> -	snd_pcm_lib_preallocate_pages(rtd->pcm->streams[type].substream,
> -				      SNDRV_DMA_TYPE_DEV, card->dev,
> -				      size, size);
> +	snd_pcm_set_managed_buffer(rtd->pcm->streams[type].substream,
> +				   SNDRV_DMA_TYPE_DEV, card->dev,
> +				   size, size);
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(axg_fifo_pcm_new);

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
