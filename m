Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD0DEF6E4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 09:09:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 270DE170B;
	Tue,  5 Nov 2019 09:08:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 270DE170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572941376;
	bh=Mp5oLnwi4cxGgbejHQPDkJeOoglEmmC1THM6xBKnVWs=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QuEuy68bbMg+v6H7QRAPqSyUIWKrKz6UMJ+7YEhRcy1fjmQTXDYlvfaICAbaUoKcJ
	 KTAPamklPWRUoWBcRJDA9KXSKr7xR8L07MmKgownnsxN0R67CDXcvaN8A+x+oAKUNf
	 9YKp8iEsmbyay92vYVBzd8yZM1Zvmy8IT48miIMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EAE2F8049B;
	Tue,  5 Nov 2019 09:07:51 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B86A9F8049B; Tue,  5 Nov 2019 09:07:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DF27F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 09:07:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DF27F8015B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="K/lv/GMo"
Received: by mail-wr1-x442.google.com with SMTP id a11so20136985wra.6
 for <alsa-devel@alsa-project.org>; Tue, 05 Nov 2019 00:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KWQ99QS+X8BEqCKWT2trqsJqAabsKqFZy5Xi2IzmRCc=;
 b=K/lv/GMoSZg27cmqRmKAgjoO7z0tRFwpQRWi94QHaovqwvw9nEX3aqD/dRSXuirH1V
 iqdOahCCKBVtbLpk+ach1niunvSrmmI/Ideea21Xp3nPGefXd3gPjBlk7fUdjH6zzr6S
 QZlhmUMZMSVRYGUsQ1Qb0DInYZmTKtbQv09vP0ZGvEGyWDTbkEO+ppqVgDxJk0EexFBW
 8D/Whz+O7VvWG8rrYUWImK+gGap+yyUDfZFxhM7vY3fGZAA5hGCrqYx+vP7sUabm7aLh
 dKTusxMJp7S4iGuqw6nCWAAnudik9p+35pOb5lFItcdB2Zb4MyoIdpwKyXkKe1cye/wB
 Lcug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=KWQ99QS+X8BEqCKWT2trqsJqAabsKqFZy5Xi2IzmRCc=;
 b=m8F03TQaEbj3L7K61baYi+OMT//sybJPnEduiEcwzCUK4zOilRPM/my/Q7I+aa7Xpb
 MlMr0jigqRmF1mqbIsCl1I+tIbZQw6uy9xDzutXUx6jWJEjfmrAZFRMgZszM0RNH5iVY
 qqPeNT2LU0SCihPGrC5Iap5f66JnLxLZ+Jx9eRX1oOIeTZoxSuSfxHYTHjv64oafAEW8
 fvoMLF4xOKUfTACNa5mPiawyvzn5VQhKTzv+2ZawfsHP4zkuF71fHYcqkxeNpB77xZdB
 qrZgDpblzTRb1ObU1zH/Ve3BlaQ5UxyAThxwJK3qBrd7gMbMvWbtq0bfwUcZkYsaCAyk
 nWTQ==
X-Gm-Message-State: APjAAAUJ5Mh9avJprH3NMGSlhMcG1XfSbnmyIxkUW9eXYSPA8+miD45j
 WYfkJJFfQJ7x8Cxykmxk44ogO4lgVj8HlQ==
X-Google-Smtp-Source: APXvYqydM7ca/l5TyvqJYFelXiiF3oFftNScjLKlhYi1nMf07E61Uej57QSebHBU17PrUd1U9yASCg==
X-Received: by 2002:adf:e78c:: with SMTP id n12mr11423747wrm.94.1572941264686; 
 Tue, 05 Nov 2019 00:07:44 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 62sm23734256wre.38.2019.11.05.00.07.43
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Nov 2019 00:07:44 -0800 (PST)
To: Takashi Iwai <tiwai@suse.de>, Andrzej Hajda <a.hajda@samsung.com>
References: <s5heeymbvva.wl-tiwai@suse.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <6ad19121-c0e3-d278-2943-ff93ef80353b@baylibre.com>
Date: Tue, 5 Nov 2019 09:07:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <s5heeymbvva.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [alsa-devel] Incorrect buffer handling in dw-hdmi bridge audio
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

Hi,

On 05/11/2019 08:55, Takashi Iwai wrote:
> Hi,
> 
> while recently working on the ALSA memory allocator API cleanup, I
> noticed that dw-hdmi bridge driver seems doing weird about the buffer
> management.  It pre-allocates the usual device buffers fully at the
> probe time, while each stream allocates the buffer via the vmalloc
> helpers and replaces with it at each open.
> 
> I guess it's no expected behavior?  It's basically a full waste of
> resources, and the vmalloc buffer isn't guaranteed to work well for
> mmap on every architecture.
> 
> Below is the patch to address it.  Can anyone check whether this still
> works?

I don't have the setup to check, but this has been pushed by Russell I Added in CC.

I also added the imx maintainer since it's (AFAIK) only used on iMX SoCs.

Neil

> 
> Since I have a cleanup series and this is involved, I'd like to take
> the fix through my tree once after it's confirmed (and get ACK if
> possible).
> 
> 
> Thanks!
> 
> Takashi
> 
> -- 8< --
> From: Takashi Iwai <tiwai@suse.de>
> Subject: [PATCH] drm/bridge: dw-hdmi: Fix the incorrect buffer allocations
> 
> The driver sets up the buffer preallocation with SNDRV_DMA_TYPE_DEV,
> while it re-allocates and releases vmalloc pages.  This is not only a
> lot of waste resources but also causes the mmap malfunction.
> 
> Change / drop the vmalloc-related code and use the standard buffer
> allocation / release code instead.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> index 2b7539701b42..8fe7a6e8ff94 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-ahb-audio.c
> @@ -384,15 +384,14 @@ static int dw_hdmi_close(struct snd_pcm_substream *substream)
>  
>  static int dw_hdmi_hw_free(struct snd_pcm_substream *substream)
>  {
> -	return snd_pcm_lib_free_vmalloc_buffer(substream);
> +	return snd_pcm_lib_free_pages(substream);
>  }
>  
>  static int dw_hdmi_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_pcm_hw_params *params)
>  {
>  	/* Allocate the PCM runtime buffer, which is exposed to userspace. */
> -	return snd_pcm_lib_alloc_vmalloc_buffer(substream,
> -						params_buffer_bytes(params));
> +	return snd_pcm_lib_malloc_pages(substream, params_buffer_bytes(params));
>  }
>  
>  static int dw_hdmi_prepare(struct snd_pcm_substream *substream)
> @@ -511,7 +510,6 @@ static const struct snd_pcm_ops snd_dw_hdmi_ops = {
>  	.prepare = dw_hdmi_prepare,
>  	.trigger = dw_hdmi_trigger,
>  	.pointer = dw_hdmi_pointer,
> -	.page = snd_pcm_lib_get_vmalloc_page,
>  };
>  
>  static int snd_dw_hdmi_probe(struct platform_device *pdev)
> 

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
