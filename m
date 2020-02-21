Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8077E168174
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Feb 2020 16:24:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC1CC16A9;
	Fri, 21 Feb 2020 16:23:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC1CC16A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582298668;
	bh=0+zSGJ+5JL89v0acYTFoBWdhWArUuU5/CWLaK44V4xs=;
	h=References:From:To:Subject:In-reply-to:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tMheVDJfGpJYOyqKHy9hCpnMe+UlFylpGm6SxrN6x7dvCuzvs9pBjPUmpY8/69t3Q
	 HrMm15FrANUZHCcu5HEB+SRTA5pBCAI2EAn4hW1ABzMeJMqJEGTreeea1s/GGD1WM/
	 ydruA9qeg+k4dnGAICDNnIAGrUQXe8z1Dpf8EUps=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D7F13F80273;
	Fri, 21 Feb 2020 16:22:47 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6FA6AF800C5; Fri, 21 Feb 2020 16:22:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77849F800C5
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 16:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77849F800C5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com
 header.i=@baylibre-com.20150623.gappssmtp.com header.b="zYcfxKYh"
Received: by mail-wr1-x443.google.com with SMTP id z3so2499403wru.3
 for <alsa-devel@alsa-project.org>; Fri, 21 Feb 2020 07:22:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=MWznUWcF0+GyJXpKc77sr8V6T2rancb73H0vzc+QLOc=;
 b=zYcfxKYh5GVdsZmg/VVJtJjJHidVAdAv1fnWLBYz9Qrz9X2tuzafr/TrwUnnZgrVJ0
 oo/BGktTtz5M5+iAIBxO/IZGYNX5JtB/f0qTHFByoAUnTTSWHZyr/vy4DNdhXAAnrd6p
 w9UC8cXQyanPoaRPr57NkWERkM+O7GE+0v3vDXHYVz7yirmIDpPSlTLARtU9LAKMwDGc
 AEGrmIdAQreDdhoms69YXG+cNkuylJ81TqDCurkrK8BVsmuNIz2Gmm92vbpHfdExJeNh
 kiivhGNsMa7XBrLqrpIuZCXL/vk00lxZEJ19nL9AqHm9selU5roj/NJmSNle5A+btUU8
 B/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=MWznUWcF0+GyJXpKc77sr8V6T2rancb73H0vzc+QLOc=;
 b=KhSEkGShfBRa4ggfcvIVeVROzJnXOxj1zW2ZRGG2UkW5F/t415aWAKHGwa9a2ltZO6
 7gKXFF7yFX1IkXs+8tJcwSPg+7/S73rKKE4izzcsw+3LRYYdDjoVVsFGXl2S3pnqoxw4
 riFh3TEWkro+vHxifii5sNggRXlrlJyfTxhHRvDrYFL9kN5iL6Hp+KunazirLB09IU8s
 BbSXPI9OYBD4sMJhNT+zANxcDIwN9haNJREWQHLdei+RmdiuClvTn5egNRJJ/SLzPyhe
 xrBACigaCbw3DN45jY02jyo9oYfFsZRtiVjVn8IVz6/vmcTrNn7TMGSfTRgh4Ekk/Ooy
 5bbA==
X-Gm-Message-State: APjAAAWK8Aodqvel3iVKsADIIZ643fXu6a7LQSx0GkI8nFcumqlXQOOk
 TFEFWWrFBWFrbBXOyoJLpKeRJA==
X-Google-Smtp-Source: APXvYqzC5K20NkO6ffmWnXnuQxw7QWs99/LdHFkp7c8I5pDrFUq2vNJSnU4dgWi0dy2FTPOqHv04Eg==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr46562839wrn.50.1582298561100; 
 Fri, 21 Feb 2020 07:22:41 -0800 (PST)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id z6sm4367616wrw.36.2020.02.21.07.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 07:22:40 -0800 (PST)
References: <20200220205711.77953-1-martin.blumenstingl@googlemail.com>
 <20200220205711.77953-4-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 broonie@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ASoC: meson: aiu: add support for the Meson8 and
 Meson8b SoC families
In-reply-to: <20200220205711.77953-4-martin.blumenstingl@googlemail.com>
Date: Fri, 21 Feb 2020 16:22:39 +0100
Message-ID: <1jmu9c2ce8.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
 linux-arm-kernel@lists.infradead.org
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


On Thu 20 Feb 2020 at 21:57, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> The AIU audio controller on the Meson8 and Meson8b SoC families is
> compatible with the one found in the later GXBB family. Add compatible
> strings for these two older SoC families so the driver can be loaded for
> them.
>
> Instead of using the I2S divider from the AIU_CLK_CTRL_MORE register we
> need to use the I2S divider from the AIU_CLK_CTRL register. This older
> register is less flexible because it only supports four divider settings
> (1, 2, 4, 8) compared to the AIU_CLK_CTRL_MORE register (which supports
> dividers in the range 0..64).
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  sound/soc/meson/Kconfig           |  2 +-
>  sound/soc/meson/aiu-encoder-i2s.c | 92 +++++++++++++++++++++++--------
>  sound/soc/meson/aiu.c             |  9 +++
>  sound/soc/meson/aiu.h             |  1 +
>  4 files changed, 81 insertions(+), 23 deletions(-)
>
> diff --git a/sound/soc/meson/Kconfig b/sound/soc/meson/Kconfig
> index 897a706dcda0..d27e9180b453 100644
> --- a/sound/soc/meson/Kconfig
> +++ b/sound/soc/meson/Kconfig
> @@ -10,7 +10,7 @@ config SND_MESON_AIU
>  	imply SND_SOC_HDMI_CODEC if DRM_MESON_DW_HDMI
>  	help
>  	  Select Y or M to add support for the Audio output subsystem found
> -	  in the Amlogic GX SoC family
> +	  in the Amlogic Meson8, Meson8b and GX SoC families
>  
>  config SND_MESON_AXG_FIFO
>  	tristate
> diff --git a/sound/soc/meson/aiu-encoder-i2s.c b/sound/soc/meson/aiu-encoder-i2s.c
> index 4900e38e7e49..cc73b5d5c2b7 100644
> --- a/sound/soc/meson/aiu-encoder-i2s.c
> +++ b/sound/soc/meson/aiu-encoder-i2s.c
> @@ -111,34 +111,40 @@ static int aiu_encoder_i2s_setup_desc(struct snd_soc_component *component,
>  	return 0;
>  }
>  
> -static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
> -				      struct snd_pcm_hw_params *params)
> +static int aiu_encoder_i2s_set_legacy_div(struct snd_soc_component *component,
> +					  struct snd_pcm_hw_params *params,
> +					  unsigned int bs)
>  {
> -	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> -	unsigned int srate = params_rate(params);
> -	unsigned int fs, bs;
> -
> -	/* Get the oversampling factor */
> -	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
> +	switch (bs) {
> +	case 1:
> +	case 2:
> +	case 4:
> +	case 8:
> +		/* These are the only valid legacy dividers */
> +		break;
>  
> -	if (fs % 64)
> +	default:
> +		dev_err(component->dev, "Unsupported i2s divider: %u\n", bs);
>  		return -EINVAL;
> +	};

Not major but this semicolon should be removed (Thx coccinelle!)

>  
> -	/* Send data MSB first */
> -	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
> -				      AIU_I2S_DAC_CFG_MSB_FIRST,
> -				      AIU_I2S_DAC_CFG_MSB_FIRST);
> +	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
> +				      AIU_CLK_CTRL_I2S_DIV,
> +				      FIELD_PREP(AIU_CLK_CTRL_I2S_DIV,
> +						 __ffs(bs)));
>  
> -	/* Set bclk to lrlck ratio */
> -	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
> -				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
> -				      FIELD_PREP(AIU_CODEC_DAC_LRCLK_CTRL_DIV,
> -						 64 - 1));
> +	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
> +				      AIU_CLK_CTRL_MORE_I2S_DIV,
> +				      FIELD_PREP(AIU_CLK_CTRL_MORE_I2S_DIV,
> +						 0));
>  
> -	/* Use CLK_MORE for mclk to bclk divider */
> -	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
> -				      AIU_CLK_CTRL_I2S_DIV, 0);
> +	return 0;
> +}
>  
> +static int aiu_encoder_i2s_set_more_div(struct snd_soc_component *component,
> +					struct snd_pcm_hw_params *params,
> +					unsigned int bs)
> +{
>  	/*
>  	 * NOTE: this HW is odd.
>  	 * In most configuration, the i2s divider is 'mclk / blck'.
> @@ -146,7 +152,6 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
>  	 * increased by 50% to get the correct output rate.
>  	 * No idea why !
>  	 */
> -	bs = fs / 64;
>  	if (params_width(params) == 16 && params_channels(params) == 8) {
>  		if (bs % 2) {
>  			dev_err(component->dev,
> @@ -156,11 +161,54 @@ static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
>  		bs += bs / 2;
>  	}
>  
> +	/* Use CLK_MORE for mclk to bclk divider */
> +	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
> +				      AIU_CLK_CTRL_I2S_DIV,
> +				      FIELD_PREP(AIU_CLK_CTRL_I2S_DIV, 0));
> +
>  	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
>  				      AIU_CLK_CTRL_MORE_I2S_DIV,
>  				      FIELD_PREP(AIU_CLK_CTRL_MORE_I2S_DIV,
>  						 bs - 1));
>  
> +	return 0;
> +}
> +
> +static int aiu_encoder_i2s_set_clocks(struct snd_soc_component *component,
> +				      struct snd_pcm_hw_params *params)
> +{
> +	struct aiu *aiu = snd_soc_component_get_drvdata(component);
> +	unsigned int srate = params_rate(params);
> +	unsigned int fs, bs;
> +	int ret;
> +
> +	/* Get the oversampling factor */
> +	fs = DIV_ROUND_CLOSEST(clk_get_rate(aiu->i2s.clks[MCLK].clk), srate);
> +
> +	if (fs % 64)
> +		return -EINVAL;
> +
> +	/* Send data MSB first */
> +	snd_soc_component_update_bits(component, AIU_I2S_DAC_CFG,
> +				      AIU_I2S_DAC_CFG_MSB_FIRST,
> +				      AIU_I2S_DAC_CFG_MSB_FIRST);
> +
> +	/* Set bclk to lrlck ratio */
> +	snd_soc_component_update_bits(component, AIU_CODEC_DAC_LRCLK_CTRL,
> +				      AIU_CODEC_DAC_LRCLK_CTRL_DIV,
> +				      FIELD_PREP(AIU_CODEC_DAC_LRCLK_CTRL_DIV,
> +						 64 - 1));
> +
> +	bs = fs / 64;
> +
> +	if (aiu->platform->has_clk_ctrl_more_i2s_div)
> +		ret = aiu_encoder_i2s_set_more_div(component, params, bs);
> +	else
> +		ret = aiu_encoder_i2s_set_legacy_div(component, params, bs);
> +
> +	if (ret)
> +		return ret;
> +
>  	/* Make sure amclk is used for HDMI i2s as well */
>  	snd_soc_component_update_bits(component, AIU_CLK_CTRL_MORE,
>  				      AIU_CLK_CTRL_MORE_HDMI_AMCLK,
> diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
> index 38209312a8c3..dc35ca79021c 100644
> --- a/sound/soc/meson/aiu.c
> +++ b/sound/soc/meson/aiu.c
> @@ -351,15 +351,24 @@ static int aiu_remove(struct platform_device *pdev)
>  
>  static const struct aiu_platform_data aiu_gxbb_pdata = {
>  	.has_acodec = false,
> +	.has_clk_ctrl_more_i2s_div = true,
>  };
>  
>  static const struct aiu_platform_data aiu_gxl_pdata = {
>  	.has_acodec = true,
> +	.has_clk_ctrl_more_i2s_div = true,
> +};
> +
> +static const struct aiu_platform_data aiu_meson8_pdata = {
> +	.has_acodec = false,
> +	.has_clk_ctrl_more_i2s_div = false,
>  };
>  
>  static const struct of_device_id aiu_of_match[] = {
>  	{ .compatible = "amlogic,aiu-gxbb", .data = &aiu_gxbb_pdata },
>  	{ .compatible = "amlogic,aiu-gxl", .data = &aiu_gxl_pdata },
> +	{ .compatible = "amlogic,aiu-meson8", .data = &aiu_meson8_pdata },
> +	{ .compatible = "amlogic,aiu-meson8b", .data = &aiu_meson8_pdata },
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, aiu_of_match);
> diff --git a/sound/soc/meson/aiu.h b/sound/soc/meson/aiu.h
> index ab003638d5e5..87aa19ac4af3 100644
> --- a/sound/soc/meson/aiu.h
> +++ b/sound/soc/meson/aiu.h
> @@ -29,6 +29,7 @@ struct aiu_interface {
>  
>  struct aiu_platform_data {
>  	bool has_acodec;
> +	bool has_clk_ctrl_more_i2s_div;
>  };
>  
>  struct aiu {

