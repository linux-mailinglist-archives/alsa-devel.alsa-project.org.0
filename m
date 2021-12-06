Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBE746932C
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Dec 2021 11:04:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 494321FBC;
	Mon,  6 Dec 2021 11:03:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 494321FBC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638785069;
	bh=wFadtt61gBYRUFC+VL+y88VcTxPsGzTOIBuKcgYsB/I=;
	h=References:From:To:Subject:Date:In-reply-to:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lDbytB6sQzKPH3jGFy3fZRd8107/wcLM8fS3z9WsofAITNPYb2wMqt7/XxWz7aXO2
	 LtdedmxDY6O+I+3gApLV5TMT+a4I7na9IwQ1YvvncHXZxn7Ph9E+iIelEdQsV29mdM
	 oCy0X6RoCJWEGkQFi2jcURVeBW1ROmo12IEWB2k4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFA5DF80108;
	Mon,  6 Dec 2021 11:03:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 10979F8026C; Mon,  6 Dec 2021 11:03:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5E95F80147
 for <alsa-devel@alsa-project.org>; Mon,  6 Dec 2021 11:03:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5E95F80147
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20210112.gappssmtp.com
 header.i=@baylibre-com.20210112.gappssmtp.com header.b="ES8wHdih"
Received: by mail-wm1-x334.google.com with SMTP id
 m25-20020a7bcb99000000b0033aa12cdd33so7815604wmi.1
 for <alsa-devel@alsa-project.org>; Mon, 06 Dec 2021 02:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version;
 bh=EwRufzCkL9m3IObuRmZqykjV86a7hGWtyM9bMzT3rvA=;
 b=ES8wHdihRhnjRJos4Z/tDeIEjiR5kMVsaAuYNps2766HZYtyaiwZAMwMIEJTUsG5cD
 ue75eGjnGiufCHqPNFD2XXeCsoAkiBgdS32RKWIkWUwNvJ+/Xr5inysiTWbtOkK3lqm2
 GOK7DNwfwhB5VxgGuRXXDC+brk7OqBLi2o34QeXDWw87dl8LoDwmPYQsUw+pCKjNl1qu
 kaoCWtvgvGtl1jK4/L9I+4ExuYFjWAZ9RI4xC5JXSSDXadyrK5JZZKj9YVOxyi7ZqBGg
 4miTMxqZs8aI0wGib2Sbc9l8h/wukqCkZNIW2hG5hzLCpHo0TpY8cGTrljDXEuaXq90o
 XN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version;
 bh=EwRufzCkL9m3IObuRmZqykjV86a7hGWtyM9bMzT3rvA=;
 b=uZuso1uBVCQoxmUlUcJafW1hAygQB4umiz8ncTxUMQCitma33UFtjVA9voceVg1gfJ
 xgObYgP71qiO2dDzqzsW/aJtv0Hjqan4HZJybFNwxSakWZW4aoTjpCuVt8IXUmYPH7ZP
 rdJpNK1K8RiVI0/FejTo+DILWYgnwpZe6aLlfTMrK3eDItWbcUAxeCSsS+RU0zF4yNDz
 d2aBjVu8kGdmd7gtdGPhh/bYhRGxRSj/RM699JNC9XQXBDrDoGc3yaZAZcZKvjdmitAs
 0s/xw8Y9sMdCaGz+ihLLLgezGG9Q7kzvtSI6nc1L3VLp4bTWQMujHnGZd9F44nhzS9V1
 40yQ==
X-Gm-Message-State: AOAM531G1e1n6ZoTrwr4l8LXry2S3IRDnCrJ3w2Mn+h+3Q5uvQlPmb6h
 hFmtM7UTGy7jUJWWlLNMDgOtfQ==
X-Google-Smtp-Source: ABdhPJyURKFQsrvAfs7KZPb2/UzHqWFRqkiP8mA5+YJrcWw8UrelaZtMVRmjB+okG8CcJKxS0nho5w==
X-Received: by 2002:a1c:ed18:: with SMTP id l24mr39249182wmh.99.1638784978119; 
 Mon, 06 Dec 2021 02:02:58 -0800 (PST)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id n14sm8423719wrf.69.2021.12.06.02.02.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:02:57 -0800 (PST)
References: <20211205180816.2083864-1-martin.blumenstingl@googlemail.com>
 <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.6.10; emacs 27.1
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH RFC v1 2/2] ASoC: meson: aiu: Move AIU_I2S_MISC hold
 setting to aiu-fifo-i2s
Date: Mon, 06 Dec 2021 10:54:19 +0100
In-reply-to: <20211205180816.2083864-3-martin.blumenstingl@googlemail.com>
Message-ID: <1jfsr659v1.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Christian Hewitt <christianshewitt@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Geraldo Nascimento <geraldogabriel@gmail.com>
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


On Sun 05 Dec 2021 at 19:08, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The out-of-tree vendor driver uses the following approach to set the
> AIU_I2S_MISC register:
> 1) write AIU_MEM_I2S_START_PTR and AIU_MEM_I2S_RD_PTR
> 2) configure AIU_I2S_MUTE_SWAP[15:0]
> 3) write AIU_MEM_I2S_END_PTR
> 4) set AIU_I2S_MISC[2] to 1 (documented as: "put I2S interface in hold
>    mode")
> 5) set AIU_I2S_MISC[4] to 1 (depending on the driver revision it always
>    stays at 1 while for older drivers this bit is unset in step 4)
> 6) set AIU_I2S_MISC[2] to 0
> 7) write AIU_MEM_I2S_MASKS
> 8) toggle AIU_MEM_I2S_CONTROL[0]
> 9) toggle AIU_MEM_I2S_BUF_CNTL[0]
>
> Additional testing shows that when AIU_I2S_MISC[2] is set to 1 then no
> interrupts are generated anymore. The way this bit is managed by the
> vendor driver as well as not getting any interrupts can mean that it's
> related to the FIFO and not the encoder.

Not necessarily. If the encoder stops pulling data, the FIFO will going
over the DDR. Since it generates an IRQ after reading N bytes, IRQ would
stop too. AFAIK, if the pipeline is stalled, the IRQ stops anyway

... but this is not really important

>
> Move setting the AIU_I2S_MISC[2] bit to aiu_fifo_i2s_hw_params() so it
> closer resembles the flow in the vendor kernel. While here also
> configure AIU_I2S_MISC[4] (documented as: "force each audio data to
> left or right according to the bit attached with the audio data")
> similar to how the vendor driver does this.

I understand the part of HOLD, not about FORCE_LR.
Is it necessary to fix the problem ? Have you tested without this change
?

> This fixes the infamous and
> long-standing "machine gun noise" issue (a buffer underrun issue).

Well done ! It took us a while to nail it, Thanks a lot !!

>
> Fixes: 6ae9ca9ce986bf ("ASoC: meson: aiu: add i2s and spdif support")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Reported-by: Geraldo Nascimento <geraldogabriel@gmail.com>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  sound/soc/meson/aiu-encoder-i2s.c | 33 -------------------------------
>  sound/soc/meson/aiu-fifo-i2s.c    | 12 +++++++++++
>  2 files changed, 12 insertions(+), 33 deletions(-)
>
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 932224552146..67729de41a73 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -18,7 +18,6 @@
>  #define AIU_RST_SOFT_I2S_FAST		BIT(0)
>  
>  #define AIU_I2S_DAC_CFG_MSB_FIRST	BIT(2)
> -#define AIU_I2S_MISC_HOLD_EN		BIT(2)
>  #define AIU_CLK_CTRL_I2S_DIV_EN		BIT(0)
>  #define AIU_CLK_CTRL_I2S_DIV		GENMASK(3, 2)
>  #define AIU_CLK_CTRL_AOCLK_INVERT	BIT(6)
> @@ -36,37 +35,6 @@ static void aiu_encoder_i2s_divider_enable(struct snd_soc_component *component,
>  				      enable ? AIU_CLK_CTRL_I2S_DIV_EN : 0);
>  }
>  
> -static void aiu_encoder_i2s_hold(struct snd_soc_component *component,
> -				 bool enable)
> -{
> -	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> -				      AIU_I2S_MISC_HOLD_EN,
> -				      enable ? AIU_I2S_MISC_HOLD_EN : 0);
> -}
> -
> -static int aiu_encoder_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
> -				   struct snd_soc_dai *dai)
> -{
> -	struct snd_soc_component *component = dai->component;
> -
> -	switch (cmd) {
> -	case SNDRV_PCM_TRIGGER_START:
> -	case SNDRV_PCM_TRIGGER_RESUME:
> -	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> -		aiu_encoder_i2s_hold(component, false);
> -		return 0;
> -
> -	case SNDRV_PCM_TRIGGER_STOP:
> -	case SNDRV_PCM_TRIGGER_SUSPEND:
> -	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> -		aiu_encoder_i2s_hold(component, true);
> -		return 0;
> -
> -	default:
> -		return -EINVAL;
> -	}
> -}
> -
>  static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
>  				      struct snd_pcm_hw_params *params)
>  {
> @@ -353,7 +321,6 @@ static void aiu_encoder_i2s_shutdown(struct snd_pcm_substream *substream,
>  }
>  
>  const struct snd_soc_dai_ops aiu_encoder_i2s_dai_ops = {
> -	.trigger	= aiu_encoder_i2s_trigger,
>  	.hw_params	= aiu_encoder_i2s_hw_params,
>  	.hw_free	= aiu_encoder_i2s_hw_free,
>  	.set_fmt	= aiu_encoder_i2s_set_fmt,
> diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
> index 2388a2d0b3a6..d0a1090d6465 100644
> --- a/sound/soc/meson/aiu-fifo-i2s.c
> +++ b/sound/soc/meson/aiu-fifo-i2s.c
> @@ -20,6 +20,8 @@
>  #define AIU_MEM_I2S_CONTROL_MODE_16BIT	BIT(6)
>  #define AIU_MEM_I2S_BUF_CNTL_INIT	BIT(0)
>  #define AIU_RST_SOFT_I2S_FAST		BIT(0)
> +#define AIU_I2S_MISC_HOLD_EN		BIT(2)
> +#define AIU_I2S_MISC_FORCE_LEFT_RIGHT	BIT(4)
>  
>  #define AIU_FIFO_I2S_BLOCK		256
>  
> @@ -90,6 +92,10 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
>  	unsigned int val;
>  	int ret;
>  
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_HOLD_EN,
> +				      AIU_I2S_MISC_HOLD_EN);
> +
>  	ret = aiu_fifo_hw_params(substream, params, dai);
>  	if (ret)
>  		return ret;
> @@ -117,6 +123,12 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
>  	snd_soc_component_update_bits(component, AIU_MEM_I2S_MASKS,
>  				      AIU_MEM_I2S_MASKS_IRQ_BLOCK, val);
>  
> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_FORCE_LEFT_RIGHT,
> +				      AIU_I2S_MISC_FORCE_LEFT_RIGHT);

If it is necessary, even if we don't really understand why, it is fine
by me. But if it is not, I would prefer we leave it out of it, or at
least, make it a separate patch.


> +	snd_soc_component_update_bits(component, AIU_I2S_MISC,
> +				      AIU_I2S_MISC_HOLD_EN, 0);
> +
>  	return 0;
>  }

