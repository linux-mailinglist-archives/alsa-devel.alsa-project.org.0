Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B8593E152
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 00:19:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A22CE9A;
	Sun, 28 Jul 2024 00:19:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A22CE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722118770;
	bh=xTufxf82ZcI8yph5qtryfWMk73NHkLewGz4Mh0eSR9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ONCULK7Jq3bYjBKP68c9w4rVj5ofZddgrVyFnQuY205mbOndf6nj4gLpZUcmeU3ju
	 q91sZM5z2mjJsupDBIZ6WhCmklLFss1lTREL5RGXIUiuwcUuxHKMcK4nCzvOGv/Jah
	 QABuq9OiA17nIvvs+bEYUaUt7sTMwrHVZAh0TgRk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05043F80269; Sun, 28 Jul 2024 00:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6B7BF805AF;
	Sun, 28 Jul 2024 00:18:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B82E7F802DB; Sun, 28 Jul 2024 00:13:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9BF4EF80269
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 00:13:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9BF4EF80269
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=O44iuogH
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eeb1ba0481so36626631fa.2
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 15:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722118423; x=1722723223;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QXKci/NSkTkc7j5F8GcMlz5bnFyJnE5pZB5gvn3Nv7g=;
        b=O44iuogHA+xt5wWX6p3QCXrNxQQlv+idwUKxHSkGYKcFbENd2kuoj1Im66HHS2vNPm
         Xfq0dxQvJ5SSjKgrbTiXfpZ6mFheFKv7m4zSB3OOSulllDpW5d1qadNia4+YYJWGbwxj
         kWiCqpmQ325F9wnBMeHg0BDwoXTq/DHGEYRn8yBu2qwGKXxIqF6NCrWK3msTL7wvq7Ti
         PEzT/c5O0xGlja1vFNEhJ/iqyKxO4RXKNzNDJvols6Wj4A+ESJJihl/K1VoKT+gTSdRB
         XWK0usBrjfpFo5nheoD6zxGkXEzy1JUT9IdwaaHE46qDgVpaI0276W5Ahqv4Gj9NL0h9
         qcUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722118423; x=1722723223;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXKci/NSkTkc7j5F8GcMlz5bnFyJnE5pZB5gvn3Nv7g=;
        b=g+ET4JksnTgJ2TYP7wfHxFQgG1xQwPnPX+RxZREQRUEABuAnOnTMrtTLghKDHW54Yn
         pfxbxuLqippVeTKmE2T1T+gwUvK/x3gUTJbtYWo00P89mA5RniFCfhBXhQjMDp7buaZX
         FpYXROzjMJBjy7e5ajvpgBSrYLE1Uek83p9uOAkkho0N/CwEX7KthYKBLOXT8RcO36Rt
         K0x7m5XTB+YaG+dSsF283+rDxzAQqxRj0AIOAI/BH1vXy8wDr74qwo6MqmHN858E/yEt
         0wMJZrWa6LrvLe3S7PRjxxrKTXEKQED2yADyxdsaYC3b3GCHUw+ZABVOznikZ6hcANNr
         Oslw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXO1PACNtn5gD72Df7LXj3BZruYqkmV/pfqMEBk1bAb+Vmu2Dc/jYQuFDiriSHTxepMkczTMsi6pOxGJnbL9Hn3VZD/3VQgN1ChBTA=
X-Gm-Message-State: AOJu0YzdFcbiChBBTGEISGD5Rw6dA20iDrylYuodu4sYeQjk8K8JQM3K
	ykvO6muab1Y7zNzsb2BfhXUZBdWOOoLrapP9IWvktLNuXoEniBYUk+vjSm+BH5M=
X-Google-Smtp-Source: 
 AGHT+IHkNunJs80mXYRHwnrzwHYeTT7dYtIIdvFSJvbxhJtb1sB6ciAg8z3hcjNebhQgLpPjAhVO2Q==
X-Received: by 2002:a2e:9608:0:b0:2ef:2f17:9edd with SMTP id
 38308e7fff4ca-2f12ee2f188mr21770451fa.44.1722118422335;
        Sat, 27 Jul 2024 15:13:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f03cf0dc4bsm7945261fa.18.2024.07.27.15.13.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 15:13:41 -0700 (PDT)
Date: Sun, 28 Jul 2024 01:13:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
	Stephan Gerhold <stephan@gerhold.net>, alsa-devel@alsa-project.org,
 linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Vladimir Lypak <vladimir.lypak@gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: msm8916-wcd-analog: add cajon and cajon v2
 support
Message-ID: <g2aj4z3t54esit6u63i2pwovyujqg45orhpcnp5zad6l3dhvyr@5qgpcbcghg77>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-3-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-3-a39.skl@gmail.com>
Message-ID-Hash: 7EGZ54NP65OLJY7QYBXZBIIVJM2WH3NE
X-Message-ID-Hash: 7EGZ54NP65OLJY7QYBXZBIIVJM2WH3NE
X-MailFrom: dmitry.baryshkov@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7EGZ54NP65OLJY7QYBXZBIIVJM2WH3NE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 27, 2024 at 08:20:25PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Add regs overrides for Cajon(PM8952) and Cajon v2(PM8953) codecs.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Add Cajon support,add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/codecs/msm8916-wcd-analog.c | 63 +++++++++++++++++++++++++--
>  1 file changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/msm8916-wcd-analog.c b/sound/soc/codecs/msm8916-wcd-analog.c
> index 9ca381812975..daf65f5d4e99 100644
> --- a/sound/soc/codecs/msm8916-wcd-analog.c
> +++ b/sound/soc/codecs/msm8916-wcd-analog.c
> @@ -250,6 +250,7 @@
>  		SPKR_DRV_CAL_EN | SPKR_DRV_SETTLE_EN | \
>  		SPKR_DRV_FW_EN | SPKR_DRV_BOOST_SET | \
>  		SPKR_DRV_CMFB_SET | SPKR_DRV_GAIN_SET)
> +#define CDC_A_SPKR_ANA_BIAS_SET		(0xf1B3)
>  #define CDC_A_SPKR_OCP_CTL		(0xf1B4)
>  #define CDC_A_SPKR_PWRSTG_CTL		(0xf1B5)
>  #define SPKR_PWRSTG_CTL_DAC_EN_MASK	BIT(0)
> @@ -264,12 +265,15 @@
>  
>  #define CDC_A_SPKR_DRV_DBG		(0xf1B7)
>  #define CDC_A_CURRENT_LIMIT		(0xf1C0)
> +#define CDC_A_BYPASS_MODE		(0xf1C2)
>  #define CDC_A_BOOST_EN_CTL		(0xf1C3)
>  #define CDC_A_SLOPE_COMP_IP_ZERO	(0xf1C4)
>  #define CDC_A_SEC_ACCESS		(0xf1D0)
>  #define CDC_A_PERPH_RESET_CTL3		(0xf1DA)
>  #define CDC_A_PERPH_RESET_CTL4		(0xf1DB)
>  
> +#define CDC_A_RX_EAR_STATUS		(0xf1A1)

This one should go before CDC_A_SPKR_DAC_CTL

> +
>  #define MSM8916_WCD_ANALOG_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
>  			SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_48000)
>  #define MSM8916_WCD_ANALOG_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> @@ -715,6 +719,50 @@ static const struct reg_default wcd_reg_defaults_2_0[] = {
>  	{CDC_A_MASTER_BIAS_CTL, 0x30},
>  };
>  
> +static const struct reg_default wcd_reg_defaults_cajon[] = {
> +	{CDC_A_RX_COM_OCP_CTL, 0xD1},
> +	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
> +	{CDC_D_SEC_ACCESS, 0xA5},
> +	{CDC_D_PERPH_RESET_CTL3, 0x0F},
> +	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
> +	{CDC_A_NCP_FBCTRL, 0xA8},
> +	{CDC_A_NCP_VCTRL, 0xA4},
> +	{CDC_A_SPKR_DRV_CTL, 0x69},
> +	{CDC_A_SPKR_DRV_DBG, 0x01},
> +	{CDC_A_SEC_ACCESS, 0xA5},
> +	{CDC_A_PERPH_RESET_CTL3, 0x0F},
> +	{CDC_A_CURRENT_LIMIT, 0x82},
> +	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
> +	{CDC_A_SPKR_DAC_CTL, 0x03},
> +	{CDC_A_SPKR_OCP_CTL, 0xE1},
> +	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
> +	{CDC_A_MASTER_BIAS_CTL, 0x30},
> +	{CDC_A_MICB_1_INT_RBIAS, 0x00},
> +};
> +
> +static const struct reg_default wcd_reg_defaults_cajon_2_0[] = {
> +	{CDC_A_RX_COM_OCP_CTL, 0xD1},
> +	{CDC_A_RX_COM_OCP_COUNT, 0xFF},
> +	{CDC_D_SEC_ACCESS, 0xA5},
> +	{CDC_D_PERPH_RESET_CTL3, 0x0F},
> +	{CDC_A_TX_1_2_OPAMP_BIAS, 0x4C},
> +	{CDC_A_NCP_FBCTRL, 0xA8},
> +	{CDC_A_NCP_VCTRL, 0xA4},
> +	{CDC_A_SPKR_DRV_CTL, 0x69},
> +	{CDC_A_SPKR_DRV_DBG, 0x01},
> +	{CDC_A_SEC_ACCESS, 0xA5},
> +	{CDC_A_PERPH_RESET_CTL3, 0x0F},
> +	{CDC_A_CURRENT_LIMIT, 0xA2},
> +	{CDC_A_BYPASS_MODE, 0x18},
> +	{CDC_A_SPKR_ANA_BIAS_SET, 0x41},
> +	{CDC_A_SPKR_DAC_CTL, 0x03},
> +	{CDC_A_SPKR_OCP_CTL, 0xE1},
> +	{CDC_A_RX_HPH_BIAS_PA, 0xFA},
> +	{CDC_A_RX_EAR_STATUS, 0x10},
> +	{CDC_A_MASTER_BIAS_CTL, 0x30},
> +	{CDC_A_MICB_1_INT_RBIAS, 0x00},
> +};
> +
>  static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
>  {
>  	struct pm8916_wcd_analog_priv *priv = dev_get_drvdata(component->dev);
> @@ -738,9 +786,18 @@ static int pm8916_wcd_analog_probe(struct snd_soc_component *component)
>  	snd_soc_component_write(component, CDC_D_PERPH_RESET_CTL4, 0x01);
>  	snd_soc_component_write(component, CDC_A_PERPH_RESET_CTL4, 0x01);
>  
> -	for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
> -		snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
> -			      wcd_reg_defaults_2_0[reg].def);
> +	if (priv->codec_version == 4)
> +		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon_2_0); reg++)
> +			snd_soc_component_write(component, wcd_reg_defaults_cajon_2_0[reg].reg,
> +					wcd_reg_defaults_cajon_2_0[reg].def);
> +	else if (priv->codec_version == 3)
> +		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_cajon); reg++)
> +			snd_soc_component_write(component, wcd_reg_defaults_cajon[reg].reg,
> +					wcd_reg_defaults_cajon[reg].def);
> +	else
> +		for (reg = 0; reg < ARRAY_SIZE(wcd_reg_defaults_2_0); reg++)
> +			snd_soc_component_write(component, wcd_reg_defaults_2_0[reg].reg,
> +					wcd_reg_defaults_2_0[reg].def);

I have mixed feelings towards this. Would it be better to use
PMIC-specific compatibles and pass register init as match data instead?

>  
>  	priv->component = component;
>  
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
