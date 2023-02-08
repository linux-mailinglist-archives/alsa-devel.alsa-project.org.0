Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6769468EB98
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:36:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8686DF1;
	Wed,  8 Feb 2023 10:36:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8686DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675849018;
	bh=RZNtDCNXCmIzqNtuS2W5qjG5CizEYKxfsoeFvK8hSsc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XtfSmgk5MXipy7iQ7yiREpXfmJshMp8uFAeMiX/VOlxdetWeCSKfxftk+BVTKuDzn
	 nwuTyHtodwN2DSuDtJmOUfjz3zxtvg4Sj84hQBCHqu43o3m4K7b47FpXY7yykP5sYL
	 biZsna7OqNXbJU/586M0gQo7K2/l/ScL6QEZkCJQ=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53B19F80095;
	Wed,  8 Feb 2023 10:36:07 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45543F8051E; Wed,  8 Feb 2023 10:36:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C736CF80224
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:35:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C736CF80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=GUTgzO7J
Received: by mail-wr1-x429.google.com with SMTP id a2so15819363wrd.6
        for <alsa-devel@alsa-project.org>;
 Wed, 08 Feb 2023 01:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=56TSGq+X87mNDNXqmnjj/4Z47dy4y/8FefoCGUW8Q9o=;
        b=GUTgzO7JMUQ6phAMCR3sRa4e9wCtnjM6ZaBASFzzED7naXdihhzhM1riYVpncUARri
         QrGcXX/A5sO0D8LdqVX1Y0bVIJDqi0jaNqhd+msKqBjgOyPqgvwvg4eL8pZYBGGRbLTI
         x6K4BMys368TiAleKAyzghPk9W/Em5fjFDQ/8SVJuAWY+e5KoZSs/Nv+nTrb5F5GjIoP
         jxcq9/GrzK5Kf7t2u5zAx4tSS/abafWIhFsHNoWiv8rirudmS3P92O41R4dDPNjut5wB
         AEn8HXk4RJvCqxFdhCe4ps6ItUKGzcf/OXCuw8G6NjbvvfuF0zpFTHVIFBRUhTOdIeb/
         38Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=56TSGq+X87mNDNXqmnjj/4Z47dy4y/8FefoCGUW8Q9o=;
        b=OgBjBWy0PHI/6oa6I3aAqbZ3ysW+PwyYd9C88wkjF28VQuYRKExKnRHK9I0G0GIxdO
         DPHSb2Gw62R14uL6jfKBbVB1UYoVHdsMDAiknqdNoY4f2NI3anmAarmDuM2QVi3wS2qS
         s4tLOBi6eOBf8pTjcjE2I9tolv5f7luzf1JxYo5ERL6i/VHIzgtiYFw25cNGJ6m0x0NJ
         lyutOH01dI3pkIkMCZNGnG1vaS8EBEb0GjrrrvC+UdjHadDbOwo3Yg9kt3v889tocRzE
         chYSzOhTN4cdRK869R0s0KBiEzHEb+HqXpBjyHKfHw1e/cOFsaccKtvfTF71khNja7VJ
         mR8g==
X-Gm-Message-State: AO0yUKXigM+V4bPykvVG+ANHiLvGXhWScqngOQQ8cPyGzyoAVO7MYUu9
	l0Kx1d9A/bGwfmejMXZPFkDjoJ5G+yTQCC9W
X-Google-Smtp-Source: 
 AK7set/4Wl7jJXIAEk3PeDp2ftCZdSk8vf0EeScmFmZKpwIp0ueyRofKD9wH6KYHz6XID0qUPzdn1A==
X-Received: by 2002:a5d:4a82:0:b0:2c4:4ab:75e0 with SMTP id
 o2-20020a5d4a82000000b002c404ab75e0mr1119776wrq.25.1675848958047;
        Wed, 08 Feb 2023 01:35:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 d3-20020a056000114300b002c3f9404c45sm2009254wrx.7.2023.02.08.01.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 01:35:57 -0800 (PST)
Message-ID: <c24f9a02-a9b6-2cca-cc50-fff2364d8e52@linaro.org>
Date: Wed, 8 Feb 2023 10:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 3/4] ASoC: SMA1303: Modify the sysclk setting
Content-Language: en-US
To: Kiseok Jo <kiseok.jo@irondevice.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
 <20230208092420.5037-7-kiseok.jo@irondevice.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230208092420.5037-7-kiseok.jo@irondevice.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZXHCT2NNYYMUPOXAS4UUWNBM7PJXE3AG
X-Message-ID-Hash: ZXHCT2NNYYMUPOXAS4UUWNBM7PJXE3AG
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZXHCT2NNYYMUPOXAS4UUWNBM7PJXE3AG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 08/02/2023 10:24, Kiseok Jo wrote:
> Previously, sysclk was configured using devicetree and sysclk-id.
> Change the method to obtain and use clock information using clk_get.
> 
> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
> ---
>  sound/soc/codecs/sma1303.c | 124 ++++++++++++++++++-------------------
>  sound/soc/codecs/sma1303.h |   5 --
>  2 files changed, 59 insertions(+), 70 deletions(-)
> 
> diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
> index 9ae4e3cba3ae..a21cde126906 100644
> --- a/sound/soc/codecs/sma1303.c
> +++ b/sound/soc/codecs/sma1303.c
> @@ -7,6 +7,7 @@
>  // Auther: Gyuhwa Park <gyuhwa.park@irondevice.com>
>  //         Kiseok Jo <kiseok.jo@irondevice.com>
>  
> +#include <linux/clk.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
>  #include <linux/kernel.h>
> @@ -59,6 +60,7 @@ struct sma1303_pll_match {
>  struct sma1303_priv {
>  	enum sma1303_type devtype;
>  	struct attribute_group *attr_grp;
> +	struct clk *mclk;
>  	struct delayed_work check_fault_work;
>  	struct device *dev;
>  	struct kobject *kobj;
> @@ -936,27 +938,23 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
>  	dev_dbg(component->dev, "%s : BCLK = %dHz\n",
>  		__func__, bclk);
>  
> -	if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK) {
> -		dev_dbg(component->dev, "%s : MCLK is not supported\n",
> -		__func__);
> -	} else if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
> -		for (i = 0; i < sma1303->num_of_pll_matches; i++) {
> -			if (sma1303->pll_matches[i].input_clk == bclk)
> -				break;
> -		}
> -		if (i == sma1303->num_of_pll_matches) {
> -			dev_dbg(component->dev, "%s : No matching value between pll table and SCK\n",
> +	for (i = 0; i < sma1303->num_of_pll_matches; i++) {
> +		if (sma1303->pll_matches[i].input_clk == bclk)
> +			break;
> +	}
> +	if (i == sma1303->num_of_pll_matches) {
> +		dev_dbg(component->dev,
> +			"%s : No matching value between pll table and SCK\n",
>  					__func__);
> -			return -EINVAL;
> -		}
> -
> -		ret += sma1303_regmap_update_bits(sma1303,
> -				SMA1303_A2_TOP_MAN1,
> -				SMA1303_PLL_PD_MASK|SMA1303_PLL_REF_CLK_MASK,
> -				SMA1303_PLL_OPERATION|SMA1303_PLL_SCK,
> -				NULL);
> +		return -EINVAL;
>  	}
>  
> +	ret += sma1303_regmap_update_bits(sma1303,
> +			SMA1303_A2_TOP_MAN1,
> +			SMA1303_PLL_PD_MASK|SMA1303_PLL_REF_CLK_MASK,
> +			SMA1303_PLL_OPERATION|SMA1303_PLL_SCK,
> +			NULL);
> +
>  	ret += sma1303_regmap_write(sma1303,
>  			SMA1303_8B_PLL_POST_N,
>  			sma1303->pll_matches[i].post_n);
> @@ -999,13 +997,14 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
>  
>  	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
>  
> -		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
> -			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
> -
> +		if (IS_ERR(sma1303->mclk)) {
>  			if (sma1303->last_bclk != bclk) {
>  				sma1303_setup_pll(component, bclk);
>  				sma1303->last_bclk = bclk;
>  			}
> +		} else {
> +			dev_dbg(component->dev,
> +				"%s : MCLK is not supported\n", __func__);
>  		}
>  
>  		switch (params_rate(params)) {
> @@ -1175,19 +1174,6 @@ static int sma1303_dai_set_sysclk_amp(struct snd_soc_dai *dai,
>  	struct snd_soc_component *component = dai->component;
>  	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
>  
> -	switch (clk_id) {
> -	case SMA1303_EXTERNAL_CLOCK_19_2:
> -		break;
> -	case SMA1303_EXTERNAL_CLOCK_24_576:
> -		break;
> -	case SMA1303_PLL_CLKIN_MCLK:
> -		break;
> -	case SMA1303_PLL_CLKIN_BCLK:
> -		break;
> -	default:
> -		dev_err(component->dev, "Invalid clk id: %d\n", clk_id);
> -		return -EINVAL;
> -	}
>  	sma1303->sys_clk_id = clk_id;
>  	return 0;
>  }
> @@ -1570,8 +1556,12 @@ static int sma1303_probe(struct snd_soc_component *component)
>  {
>  	struct snd_soc_dapm_context *dapm =
>  		snd_soc_component_get_dapm(component);
> +	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
>  
>  	snd_soc_dapm_sync(dapm);
> +	sma1303->mclk = devm_clk_get(sma1303->dev, "mclk");

One undocumented property is replaced with another undocumented
property. Can't you test your DTS?

Best regards,
Krzysztof

