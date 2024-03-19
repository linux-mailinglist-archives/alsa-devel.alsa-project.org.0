Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B978804D7
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Mar 2024 19:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBFA52BAC;
	Tue, 19 Mar 2024 19:28:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBFA52BAC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710872944;
	bh=abdnB0gyW3XwfLvq1h9H4CJRk5if6by9tOYHJk/rUZ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IireRs6HJ1JktFVDWorqCXmMEXwuK/glEN01Uw8RgPOQVN4hCz6mTWKH/VpG/fbJN
	 Wj0tWduo+OJ21oS0UAiNYnH2wpFLwchZjm4AmY2kNvIcKkJVs+h+NofscZy9p2+wGa
	 0JuJsfBHKYo6VTWFECwNIpnbbKj0IJMewVN6C0OI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D17EF8058C; Tue, 19 Mar 2024 19:28:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 80085F80588;
	Tue, 19 Mar 2024 19:28:32 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79FA9F804E7; Tue, 19 Mar 2024 19:28:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37E8BF8025F
	for <alsa-devel@alsa-project.org>; Tue, 19 Mar 2024 19:27:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37E8BF8025F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jLLBhJxZ
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2d109e82bd0so78386481fa.3
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Mar 2024 11:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710872878; x=1711477678;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tUKjW78EP4nHLFdEFyF1sz33PGb04BsnsgyPGWHjdiY=;
        b=jLLBhJxZd8Bv1zP5mtvVAhIBGPmsPSWhtP+E68iad+Gn80ET4ncGlsAigJzAiBixZd
         UlbCbQGw747n9M4m3PQWZhbSL2HZO2Pp9mSE7IzwkkLt77YwymxR/woovUVs3uK4Azj9
         NnyUaxd5NoVWAIU/LczIzFMdXmDEfkI1G3+tB2HsteJKsIcxPFZrf3hZs59H+2/kdISM
         ilKxx613YCYtPpv6UwOzlU4Bhxq0GQwWFJhiNP7P2OUy5++fXzds6oeBwfLopokEpSmN
         aen8Yk2VcbeadTe9YetEm4kgmH8i8Rog1GgZxegzMmtnEVtizQnRNPubF9jLkG/q8y7a
         aG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710872878; x=1711477678;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tUKjW78EP4nHLFdEFyF1sz33PGb04BsnsgyPGWHjdiY=;
        b=QmbjxvSks4AG/Zbw2hCCCARIFF2D+p340CfY6o/EMpFtyXcbqSJI3PE75s2DVIgApS
         ydMahuP81Q4wmm0jN/ctJUioVc4fNb+zH6AYASnQtFs37cbpRtazeKpbWbHVk07mwCvA
         xwAW7LSsDeAkDs+IGeDCnLs8GjYVpw57UTGRHzA5Wodg9oYmZNGgz3DmVgGkHfy4lb2e
         F0S4G6Mii9xTYoAZyYbHT5H1dXk7goD1NySzfrHDC/r/ll9GJ7C9CHWgFkJuGwakuUn6
         jyFue10BPOD4//LMJdaSFnhn0/W84LxqgZwEmzI1nZh4HzSpgaPlkfscuJeDQ5UMnp6Z
         CQLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqTO6lzm/esWVzhSMLIxNC0GZyzN4HScmwybyRN/Hcprbd7k2/Nm069rPWjGd1QeuPnE2N6CxsEGcRjRzB3i44i/HcaE0yaSGYO0g=
X-Gm-Message-State: AOJu0Yz2sHjGLt9XY5hjtDn6mXzI771YlqcXSxmY1Ymj0Z6k+irvZe4k
	czl351J24F7t1BW6OZkTOnjpjSEVVDayeMFjEiSHKhw1UBZm29Tn
X-Google-Smtp-Source: 
 AGHT+IFS7dXGsCRrzrfkP3DfhxFHZGiAlHX5aRWXJ333+GTCrqWr6bFU78pTHZZanczfFxZTNcnyeQ==
X-Received: by 2002:a05:651c:19a4:b0:2d4:6df2:12c0 with SMTP id
 bx36-20020a05651c19a400b002d46df212c0mr3113178ljb.34.1710872878182;
        Tue, 19 Mar 2024 11:27:58 -0700 (PDT)
Received: from [10.0.0.100] (host-85-29-76-118.kaisa-laajakaista.fi.
 [85.29.76.118])
        by smtp.gmail.com with ESMTPSA id
 d2-20020a2e3602000000b002d3f3da0702sm1846927lja.107.2024.03.19.11.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Mar 2024 11:27:57 -0700 (PDT)
Message-ID: <00182d1d-ef29-457f-9e3e-6e9b57592118@gmail.com>
Date: Tue, 19 Mar 2024 20:29:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] ASoC: ti: davinci-i2s: Opitonally drive DX pin
 during capture streams
Content-Language: en-US
To: Bastien Curutchet <bastien.curutchet@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, herve.codina@bootlin.com,
 christophercordahi@nanometrics.ca
References: <20240315112745.63230-1-bastien.curutchet@bootlin.com>
 <20240315112745.63230-14-bastien.curutchet@bootlin.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20240315112745.63230-14-bastien.curutchet@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TBB3JFITDEPGOR63KHXWPNUBZEFXHJVF
X-Message-ID-Hash: TBB3JFITDEPGOR63KHXWPNUBZEFXHJVF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TBB3JFITDEPGOR63KHXWPNUBZEFXHJVF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 15/03/2024 13:27, Bastien Curutchet wrote:
> The McBSP's DX pin that outputs serial data during playback streams can
> be used during capture streams to repeatedly output a chosen pattern.
> For instance, this can be useful to drive an active-low signal during
> captures (by choosing <0> as output pattern).

Are there really any other use of this than to pull down or up the DX
pin (0 or 0xffff)?

If you just use the pin as GPIO then you don't need to change anything
in the driver, The playback would not erach the pin, so no need to block it.

> Enable this behaviour when the device-tree property 'ti,drive-dx' is
> present. DX pin is driven with the provided pattern every time a
> capture stream is launched.

It is an interesting use of the hardware... You are controlling an
external device (light an LED when capture is on)?

> This property is not compatible with classic playback stream so
> davinci_i2s_trigger() returns an error if a playback stream is started
> while 'ti,drive-dx' flag is present.

Propbaly add the .startup() callback and block the playback right there?

> 
> This has been tested on a board designed of a DAVINCI/OMAP-L138 where
> the DX pin is linked to the chip select pin of the converters of the
> capture side.

Isn't the DX will be pulled down as soon as the McBSP is enabled?
Can you just re-configure the PUPD_SEL for the pin group to make the pin
to be pulled the other way?

> Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
> ---
>  sound/soc/ti/davinci-i2s.c | 74 ++++++++++++++++++++++++++++++++------
>  1 file changed, 63 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
> index 13e349e7a6ec..e289a84bdd6a 100644
> --- a/sound/soc/ti/davinci-i2s.c
> +++ b/sound/soc/ti/davinci-i2s.c
> @@ -101,6 +101,9 @@
>  #define DAVINCI_MCBSP_PCR_FSRM		(1 << 10)
>  #define DAVINCI_MCBSP_PCR_FSXM		(1 << 11)
>  
> +#define PLAYBACK_CLOCK			1
> +#define CAPTURE_CLOCK			0
> +
>  enum {
>  	DAVINCI_MCBSP_WORD_8 = 0,
>  	DAVINCI_MCBSP_WORD_12,
> @@ -164,6 +167,8 @@ struct davinci_mcbsp_dev {
>  
>  	bool sync_err;
>  	bool free_run;
> +	bool drive_dx;
> +	u32 dx_val;
>  };
>  
>  static inline void davinci_mcbsp_write_reg(struct davinci_mcbsp_dev *dev,
> @@ -187,6 +192,19 @@ static void toggle_clock(struct davinci_mcbsp_dev *dev, int playback)
>  	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_PCR_REG, dev->pcr);
>  }
>  
> +static int davinci_drive_dx(struct davinci_mcbsp_dev *dev)
> +{
> +	unsigned int spcr;
> +
> +	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_DXR_REG, dev->dx_val);
> +
> +	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
> +	spcr |= DAVINCI_MCBSP_SPCR_XRST;
> +	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);



> +
> +	return 0;
> +}
> +
>  static void davinci_mcbsp_start(struct davinci_mcbsp_dev *dev,
>  		struct snd_pcm_substream *substream)
>  {
> @@ -194,6 +212,9 @@ static void davinci_mcbsp_start(struct davinci_mcbsp_dev *dev,
>  	u32 spcr;
>  	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
>  
> +	if (!playback && dev->drive_dx)
> +		davinci_drive_dx(dev);
> +
>  	/* Enable transmitter or receiver */
>  	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
>  	spcr |= mask;

if (dev->drive_dx) {
	spcr |= DAVINCI_MCBSP_SPCR_XRST;
	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_DXR_REG, dev->dx_val);
}

and no need for the davinci_drive_dx() function, plus it makes it
symmetric of what you do on stop()

> @@ -212,9 +233,17 @@ static void davinci_mcbsp_stop(struct davinci_mcbsp_dev *dev, int playback)
>  	/* Reset transmitter/receiver and sample rate/frame sync generators */
>  	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
>  	spcr &= ~(DAVINCI_MCBSP_SPCR_GRST | DAVINCI_MCBSP_SPCR_FRST);
> -	spcr &= playback ? ~DAVINCI_MCBSP_SPCR_XRST : ~DAVINCI_MCBSP_SPCR_RRST;
> -	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
> -	toggle_clock(dev, playback);
> +
> +	if (!playback) {
> +		spcr &= ~DAVINCI_MCBSP_SPCR_RRST;
> +		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
> +		toggle_clock(dev, CAPTURE_CLOCK);
> +	}
> +	if (playback || dev->drive_dx) {
> +		spcr &= ~DAVINCI_MCBSP_SPCR_XRST;
> +		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
> +		toggle_clock(dev, PLAYBACK_CLOCK);
> +	}
>  }
>  
>  static int davinci_i2s_tdm_word_length(int tdm_slot_width)
> @@ -408,6 +437,10 @@ static int davinci_i2s_set_dai_fmt(struct snd_soc_dai *cpu_dai,
>  	}
>  	if (inv_fs == true)
>  		pcr ^= (DAVINCI_MCBSP_PCR_FSXP | DAVINCI_MCBSP_PCR_FSRP);
> +
> +	if (dev->drive_dx)
> +		pcr |= DAVINCI_MCBSP_PCR_CLKRP;
> +
>  	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SRGR_REG, srgr);
>  	dev->pcr = pcr;
>  	davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_PCR_REG, pcr);
> @@ -562,6 +595,9 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(1);
>  	}
>  
> +	if (dev->drive_dx)
> +		xcr |= DAVINCI_MCBSP_XCR_XDATDLY(2);
> +
>  	if (params_channels(params) == 2) {
>  		element_cnt = 2;
>  		if (double_fmt[fmt] && dev->enable_channel_combine) {
> @@ -611,9 +647,9 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
>  	xcr |= DAVINCI_MCBSP_XCR_XWDLEN1(mcbsp_word_length) |
>  		DAVINCI_MCBSP_XCR_XWDLEN2(mcbsp_word_length);
>  
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK || dev->drive_dx)
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_XCR_REG, xcr);
> -	else
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_RCR_REG, rcr);
>  
>  	pr_debug("%s - %d  srgr=%X\n", __func__, __LINE__, srgr);
> @@ -628,16 +664,21 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
>  	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
>  	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
>  	u32 spcr;
> -	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
>  
>  	davinci_mcbsp_stop(dev, playback);
>  
>  	spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
> -	if (spcr & mask) {
> +	if (spcr & DAVINCI_MCBSP_SPCR_XRST) {
>  		/* start off disabled */
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG,
> -					spcr & ~mask);
> -		toggle_clock(dev, playback);
> +					spcr & ~DAVINCI_MCBSP_SPCR_XRST);
> +		toggle_clock(dev, PLAYBACK_CLOCK);
> +	}
> +	if (spcr & DAVINCI_MCBSP_SPCR_RRST) {
> +		/* start off disabled */
> +		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG,
> +					spcr & ~DAVINCI_MCBSP_SPCR_RRST);
> +		toggle_clock(dev, CAPTURE_CLOCK);
>  	}
>  	if (dev->pcr & (DAVINCI_MCBSP_PCR_FSXM | DAVINCI_MCBSP_PCR_FSRM |
>  			DAVINCI_MCBSP_PCR_CLKXM | DAVINCI_MCBSP_PCR_CLKRM)) {
> @@ -646,7 +687,7 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
>  	}
>  
> -	if (playback) {
> +	if (playback || dev->drive_dx) {
>  		/* Enable the transmitter */
>  		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
>  		spcr |= DAVINCI_MCBSP_SPCR_XRST;
> @@ -659,7 +700,7 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
>  		spcr = davinci_mcbsp_read_reg(dev, DAVINCI_MCBSP_SPCR_REG);
>  		spcr &= ~DAVINCI_MCBSP_SPCR_XRST;
>  		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
> -		toggle_clock(dev, playback);
> +		toggle_clock(dev, PLAYBACK_CLOCK);
>  	}
>  
>  	return 0;
> @@ -672,6 +713,11 @@ static int davinci_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
>  	int ret = 0;
>  	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
>  
> +	if (playback && dev->drive_dx) {
> +		dev_err(dev->dev, "Playback is not allowed when drive-cs flag is set\n");
> +		return -EINVAL;
> +	}
> +
>  	switch (cmd) {
>  	case SNDRV_PCM_TRIGGER_START:
>  	case SNDRV_PCM_TRIGGER_RESUME:
> @@ -779,6 +825,12 @@ static int davinci_i2s_probe(struct platform_device *pdev)
>  
>  	dev->free_run = !of_property_read_bool(pdev->dev.of_node, "ti,disable-free-run");
>  	dev->sync_err = of_property_read_bool(pdev->dev.of_node, "ti,enable-sync-err");
> +	dev->drive_dx = false;

no need to initialize it to 0, dev is allocated with devm_kzalloc()

> +	ret = of_property_read_u32(pdev->dev.of_node, "ti,drive-dx", &dev->dx_val);
> +	if (ret && ret != -EINVAL)
> +		return ret;
> +	if (!ret)
> +		dev->drive_dx = true;

if (!ret)
	dev->drive_dx = true;
else if (ret != -EINVAL)
	return ret;

>  
>  	/* setup DMA, first TX, then RX */
>  	dma_data = &dev->dma_data[SNDRV_PCM_STREAM_PLAYBACK];

-- 
Péter
