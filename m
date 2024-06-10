Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F24890245E
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jun 2024 16:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57D08845;
	Mon, 10 Jun 2024 16:44:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57D08845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718030683;
	bh=l/Grbzei5fBRjJCWKEoGR/gpM9K22wBlsaDZreuU82w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VprZrPyNFc77KL5AcgL+SyDh21TMzA94aCCK+wSg4Zo+TrC6fqHdwX6bGL32PrHcN
	 7++Qkv4ESlhkGeFR0XZbkXv/D96X8cEDzcK9PN3ENmLhDFlJ8TLPxEB7J3QqrddJQ9
	 y6oNs+5KgTe1gtLW27rDu5ZNzZtC7B6O5PCQjnjM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C5A2F805B2; Mon, 10 Jun 2024 16:44:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 175F0F805B4;
	Mon, 10 Jun 2024 16:44:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59128F80580; Mon, 10 Jun 2024 16:44:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 59E57F80578
	for <alsa-devel@alsa-project.org>; Mon, 10 Jun 2024 16:44:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 59E57F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Bm9h+R/o
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebd421a931so23096851fa.1
        for <alsa-devel@alsa-project.org>;
 Mon, 10 Jun 2024 07:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718030640; x=1718635440;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+X8rAX9jRAKaOSNNc0p/ItKQWY3t87U4LU5WMC+wGlk=;
        b=Bm9h+R/omW5vjCH/HQXzL75mA3kchKgz0roVeHDWpzEHoxHS+SIXcuLS4alZNIDOi7
         Y+XrI1X2M3Y45yvXvg/6ImDDLl6Tty1GeO55CtvH01+mD8HKEekwwBj+2MvddWn7Ji3j
         TEQWIyBV4Q2WXK6urh87U4Jyu0X0X6Y6fkyYJPFQfligyERAU/je61eBljGsv6X2n/gD
         gwlyOds+DpTAdJvzaRN2G6FBdZlNE22oS/TGxzo8Fka/7KXgC8Jmx2uH2wgi7tbUkDG/
         bGErhktewb8UNMuQmDMzJj6v0w7w5QcctgRwEMhq9D3rJWT4mG7DY1n/zPowtIsWNUx5
         rkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718030640; x=1718635440;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+X8rAX9jRAKaOSNNc0p/ItKQWY3t87U4LU5WMC+wGlk=;
        b=OZHFOK43x2FDjkfV1DLCg4gd7W5dfrK/56rqRl/Mq0kZhS/Nd69baGklLHd93A/22r
         eKwNreBfB5YDkZmJGGnCIW7RL6q5qu3Ipx00psd9dAZN7o9S7iRBVmqwYk/+VG+0VCL9
         u+2JKgkJQxB0O4VQ29KxrhFKGio9BIJDWmNfUAGSJS2Vii4+e4mr9V/u0owoLtTxAXKX
         nzroOl0ThYDuGldxxTzQ5jSF0cqqzn3S02J+uWTeVx7FDhfocBtHove0arZc3RKW4Ic4
         1+ylJsJeFnRUs6sZVFlUMJ28uv8w1oG41DcmLkTxjFGajyfsKxGhw4/8I85aJdZmGnMr
         eq2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWelTUKZpdQ+Kn59g6iuL6TTr7OboaGnCkrHC0O4sj8JrhWjUivhVxzBgu6AaqM2ayVm47s2Bgxb+4hbiZLuUooZX0bb1EKGZQgZtY=
X-Gm-Message-State: AOJu0Yykwko19Rs7M3H7p6eQNb/wPAPEi0d+VUoKX9QEJTNjkfaMCnz1
	gyQj1NGUMzj0MgZJoPjfqHxOdGJ7ZsIX5ABfvBD/bD6AQeOMfbF7e3ZNDdvfiOo=
X-Google-Smtp-Source: 
 AGHT+IEqPiXMp7uVz35JdOOGzlUzWqUmfOqh8p/wjktqliXLyYoDdm4rNv+eqVWsaDjHEEKy7jCsbg==
X-Received: by 2002:a2e:6e16:0:b0:2eb:da38:971f with SMTP id
 38308e7fff4ca-2ebda38989cmr30649031fa.44.1718030638594;
        Mon, 10 Jun 2024 07:43:58 -0700 (PDT)
Received: from [10.0.0.42] (host-85-29-124-88.kaisa-laajakaista.fi.
 [85.29.124.88])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2eaec3ba8d7sm13372621fa.1.2024.06.10.07.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 07:43:58 -0700 (PDT)
Message-ID: <ce260655-df6e-442f-8d2f-2eff7b4d6a5a@gmail.com>
Date: Mon, 10 Jun 2024 17:47:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: ti: davinci-mcasp: Set min period size using
 FIFO config
To: Jai Luthra <j-luthra@ti.com>, Lars-Peter Clausen <lars@metafoo.de>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Devarsh Thakkar <devarsht@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20240610-asoc_next-v2-0-b52aaf5d67c4@ti.com>
 <20240610-asoc_next-v2-2-b52aaf5d67c4@ti.com>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240610-asoc_next-v2-2-b52aaf5d67c4@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X5LDA2WSYU3G7JKNU4VZGDSDVTHWPSGE
X-Message-ID-Hash: X5LDA2WSYU3G7JKNU4VZGDSDVTHWPSGE
X-MailFrom: peter.ujfalusi@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5LDA2WSYU3G7JKNU4VZGDSDVTHWPSGE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi,

On 6/10/24 1:56 PM, Jai Luthra wrote:
> The minimum period size was enforced to 64 as older devices integrating
> McASP with EDMA used an internal FIFO of 64 samples.
> 
> With UDMA based platforms this internal McASP FIFO is optional, as the
> DMA engine internally does some buffering which is already accounted for
> when registering the platform. So we should read the actual FIFO
> configuration (txnumevt/rxnumevt) instead of hardcoding frames.min to
> 64.

Thank you the patch and the fix,
Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  sound/soc/ti/davinci-mcasp.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
> index 1e760c315521..2b1ed91a736c 100644
> --- a/sound/soc/ti/davinci-mcasp.c
> +++ b/sound/soc/ti/davinci-mcasp.c
> @@ -1472,10 +1472,11 @@ static int davinci_mcasp_hw_rule_min_periodsize(
>  {
>  	struct snd_interval *period_size = hw_param_interval(params,
>  						SNDRV_PCM_HW_PARAM_PERIOD_SIZE);
> +	u8 numevt = *((u8 *)rule->private);
>  	struct snd_interval frames;
>  
>  	snd_interval_any(&frames);
> -	frames.min = 64;
> +	frames.min = numevt;
>  	frames.integer = 1;
>  
>  	return snd_interval_refine(period_size, &frames);
> @@ -1490,6 +1491,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
>  	u32 max_channels = 0;
>  	int i, dir, ret;
>  	int tdm_slots = mcasp->tdm_slots;
> +	u8 *numevt;
>  
>  	/* Do not allow more then one stream per direction */
>  	if (mcasp->substreams[substream->stream])
> @@ -1589,9 +1591,12 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
>  			return ret;
>  	}
>  
> +	numevt = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
> +			 &mcasp->txnumevt :
> +			 &mcasp->rxnumevt;
>  	snd_pcm_hw_rule_add(substream->runtime, 0,
>  			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE,
> -			    davinci_mcasp_hw_rule_min_periodsize, NULL,
> +			    davinci_mcasp_hw_rule_min_periodsize, numevt,
>  			    SNDRV_PCM_HW_PARAM_PERIOD_SIZE, -1);
>  
>  	return 0;
> 

-- 
Péter
