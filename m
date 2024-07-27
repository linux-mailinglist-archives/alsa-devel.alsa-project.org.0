Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799593E157
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jul 2024 00:23:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3F66E8E;
	Sun, 28 Jul 2024 00:23:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3F66E8E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722119029;
	bh=fDjNUHr6dA8rOXDlgnigy+h72KTsuiW6mnnOcpO2mks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EtV8/LHy+uOccT70ztZaU7g37h9b+UNFxHjJ7s9XJh+P6meYL4Ihtf0IBRouNrJu5
	 370mrV5sqAu+yuWuyf7OruQHfFsqXd+7moBPGPHKMkULJE9pCkXORqcxHa1VN/rljN
	 ctEuMnNand+ctLkY3X7um0pQNFjW3oZ/yaerp8p0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62426F805B0; Sun, 28 Jul 2024 00:23:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DC380F805B0;
	Sun, 28 Jul 2024 00:23:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB868F802DB; Sun, 28 Jul 2024 00:23:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85152F8007E
	for <alsa-devel@alsa-project.org>; Sun, 28 Jul 2024 00:22:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85152F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=agJM8uac
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-52efd855adbso3469899e87.2
        for <alsa-devel@alsa-project.org>;
 Sat, 27 Jul 2024 15:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722118954; x=1722723754;
 darn=alsa-project.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SmqlrirUFtzyURY6qK3fyfdNBiwmBrDBIWtbVFCj68k=;
        b=agJM8uacN4XbN7j28DrxSjRYR8rW6UTPzG6gtt4ebE+DAjm99zyMsh8fonydVYd4SW
         wkv4GCtDxYQoMqodF3FhOm7ES+fOHAGxCV7ZXuYD0tLAXuBgB1kiKhePnTNm+5DUfROB
         dbSacsRsX6dLY5yhwqCLDzFiyrCYKkRRvlIdfNwrmnQ0VNPEyENMWdE32g8WFn1ZySqs
         1dPQ+otjDK0KwnncBgjH4RaSKopgoxKlw/lPmEwGCANM3wbpUZrXdo8WMKYxwaJaZVeg
         KcFNzM/+34d3LMXasslBZuC8S8x9ByjfONmzTUCtr0Exf+5weU8S84SVDsblRxn4UdbM
         M2Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722118954; x=1722723754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmqlrirUFtzyURY6qK3fyfdNBiwmBrDBIWtbVFCj68k=;
        b=cwGzO7j29aRBcSfz9g1QGIno2kfrUj8yUX68jGQb64R6VoCpHBELVzopz2wYf1ZFgF
         HL7T9RqncfqmLcJGYdMkj5ILwkPqxFQpHvrbH5CyamGlC1WRMRNli9OD6qR7wQsAEqtN
         dUN3e8nr2FcZRyfXvwBf/XDEA11KGAP6G41sudYS0BSYByq31JNaX8OaFG2mZD1Xe13b
         sTegbURI+ylJr/LuNcgm6YCr5LOLLwW4Y69hPmmRornA8vU7NXKGBSPwC2A25fVWaXWA
         0iWqNXS0RTW+P2dLdLY6NrMmnaS3BKd6FIFUXfJJpu+zdVyqYe4QSwb3+9mDZ+PC3VEU
         uOaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqnpzut5lBDkDrghO4WvXbun5+I0BbxfyySntSI4IiWMOu7jeKISXH6+QtAuUR62qzgkyOHP0DwmrTvUn7iAjU1JTIGQ2QraWWAv4=
X-Gm-Message-State: AOJu0YzhZR4QBgXLvyXCM/5Nb2sXc1/oJ9T1YfCmvKNg6S3PPTazv+RO
	6OyqAdf/8ShUk0XbEu5VDm3y3sUEjCdqTAHg6weOtOy79q4UFKM9gaJMDgEYZX4=
X-Google-Smtp-Source: 
 AGHT+IF/s11CSBZC1Ioc8fNTDjjnGQIm4OyRZiAH0axmuM5wcvd3DkIFT4ZzI5q6QFp25Q1zWlz7ZA==
X-Received: by 2002:ac2:511c:0:b0:52e:6d71:e8f1 with SMTP id
 2adb3069b0e04-5309b2ce524mr2179378e87.53.1722118953841;
        Sat, 27 Jul 2024 15:22:33 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52fd5bc40cesm871534e87.28.2024.07.27.15.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jul 2024 15:22:33 -0700 (PDT)
Date: Sun, 28 Jul 2024 01:22:31 +0300
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
Subject: Re: [PATCH v2 4/4] ASoC: qcom: apq8016_sbc: Add support for
 msm8953/msm8976 SoC
Message-ID: <4ncs2zopzh2qnf4cgb7wnq2ai3vw2zjyhnv4tsgdhu3zqqnvug@63ypk324n3mr>
References: <20240727182031.35069-1-a39.skl@gmail.com>
 <20240727182031.35069-5-a39.skl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727182031.35069-5-a39.skl@gmail.com>
Message-ID-Hash: DHCWJYPM7HUP7GLIEPD5MVQMPGOM5K2G
X-Message-ID-Hash: DHCWJYPM7HUP7GLIEPD5MVQMPGOM5K2G
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHCWJYPM7HUP7GLIEPD5MVQMPGOM5K2G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, Jul 27, 2024 at 08:20:27PM GMT, Adam Skladowski wrote:
> From: Vladimir Lypak <vladimir.lypak@gmail.com>
> 
> Introduce support for audio card on MSM8953/MSM8976 platform.
> Main difference between those two is Q6AFE CLK API supported by firmware
> which influence way we enable digital codec clock.
> Either inside machine driver or outside via q6afe-clocks driver.
> 
> Signed-off-by: Vladimir Lypak <vladimir.lypak@gmail.com>
> [Adam: Add MSM8976, rename functions, add mclk setting,add msg]
> Co-developed-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---
>  sound/soc/qcom/apq8016_sbc.c | 68 ++++++++++++++++++++++++++++++++++--
>  1 file changed, 66 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8016_sbc.c b/sound/soc/qcom/apq8016_sbc.c
> index 303dd88206b1..453ca4795603 100644
> --- a/sound/soc/qcom/apq8016_sbc.c
> +++ b/sound/soc/qcom/apq8016_sbc.c
> @@ -22,6 +22,11 @@
>  
>  #define MI2S_COUNT  (MI2S_QUINARY + 1)
>  
> +enum afe_clk_api {
> +	Q6AFE_CLK_V1,
> +	Q6AFE_CLK_V2
> +};

Are these v1/v2 coming from some msm-N.M kernel? It's not obvious from
the patch, but msm8916 also falls into v1 category. Is that expected?

> +
>  struct apq8016_sbc_data {
>  	struct snd_soc_card card;
>  	void __iomem *mic_iomux;
> @@ -29,6 +34,8 @@ struct apq8016_sbc_data {
>  	void __iomem *quin_iomux;
>  	struct snd_soc_jack jack;
>  	bool jack_setup;
> +	enum afe_clk_api q6afe_clk_ver;
> +	bool dig_cdc_mclk_en;
>  	int mi2s_clk_count[MI2S_COUNT];
>  };
>  
> @@ -192,6 +199,28 @@ static int qdsp6_dai_get_lpass_id(struct snd_soc_dai *cpu_dai)
>  	}
>  }
>  
> +static int qdsp6_get_clk_id(struct apq8016_sbc_data *data, int mi2s_id)
> +{
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V2) {
> +		switch (mi2s_id) {
> +		case MI2S_PRIMARY:
> +			return Q6AFE_LPASS_CLK_ID_PRI_MI2S_IBIT;
> +		case MI2S_SECONDARY:
> +			return Q6AFE_LPASS_CLK_ID_SEC_MI2S_IBIT;
> +		case MI2S_TERTIARY:
> +			return Q6AFE_LPASS_CLK_ID_TER_MI2S_IBIT;
> +		case MI2S_QUATERNARY:
> +			return Q6AFE_LPASS_CLK_ID_QUAD_MI2S_IBIT;
> +		case MI2S_QUINARY:
> +			return Q6AFE_LPASS_CLK_ID_QUI_MI2S_IBIT;
> +		default:
> +			break;
> +		}
> +	}
> +	/* If AFE CLK isn't V2 return V1 */
> +	return LPAIF_BIT_CLK;
> +}
> +
>  static int msm8916_qdsp6_dai_init(struct snd_soc_pcm_runtime *rtd)
>  {
>  	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> @@ -214,8 +243,17 @@ static int msm8916_qdsp6_startup(struct snd_pcm_substream *substream)
>  
>  	if (++data->mi2s_clk_count[mi2s] > 1)
>  		return 0;
> +	/*
> +	 * On newer legacy SoC (MSM8976) lpass codec clocks are not available in gcc region
> +	 * so we have to request clock from machine driver using V1 API)
> +	 */
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {

Nit: line feed after &&

> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, DEFAULT_MCLK_RATE, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to enable LPAIF dig clk: %d\n", ret);
> +	}
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, MI2S_BCLK_RATE, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), MI2S_BCLK_RATE, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to enable LPAIF bit clk: %d\n", ret);
>  	return ret;
> @@ -236,9 +274,16 @@ static void msm8916_qdsp6_shutdown(struct snd_pcm_substream *substream)
>  	if (--data->mi2s_clk_count[mi2s] > 0)
>  		return;
>  
> -	ret = snd_soc_dai_set_sysclk(cpu_dai, LPAIF_BIT_CLK, 0, 0);
> +	ret = snd_soc_dai_set_sysclk(cpu_dai, qdsp6_get_clk_id(data, mi2s), 0, 0);
>  	if (ret)
>  		dev_err(card->dev, "Failed to disable LPAIF bit clk: %d\n", ret);
> +
> +	if (data->q6afe_clk_ver == Q6AFE_CLK_V1 && data->dig_cdc_mclk_en == true) {

Nit: And here too, please.

> +		ret = snd_soc_dai_set_sysclk(cpu_dai,  LPAIF_DIG_CLK, 0, 0);
> +		if (ret)
> +			dev_err(card->dev, "Failed to disable LPAIF dig clk: %d\n", ret);
> +	}
> +
>  }
>  
>  static const struct snd_soc_ops msm8916_qdsp6_be_ops = {
> @@ -279,6 +324,23 @@ static void msm8916_qdsp6_add_ops(struct snd_soc_card *card)
>  	}
>  }
>  
> +static void msm8953_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V2;
> +	msm8916_qdsp6_add_ops(card);
> +}
> +
> +static void msm8976_qdsp6_add_ops(struct snd_soc_card *card)
> +{
> +	struct apq8016_sbc_data *pdata = snd_soc_card_get_drvdata(card);
> +
> +	pdata->q6afe_clk_ver = Q6AFE_CLK_V1;
> +	pdata->dig_cdc_mclk_en = true;
> +	msm8916_qdsp6_add_ops(card);
> +}
> +
>  static const struct snd_kcontrol_new apq8016_sbc_snd_controls[] = {
>  	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
>  	SOC_DAPM_PIN_SWITCH("Mic Jack"),
> @@ -343,6 +405,8 @@ static int apq8016_sbc_platform_probe(struct platform_device *pdev)
>  static const struct of_device_id apq8016_sbc_device_id[] __maybe_unused = {
>  	{ .compatible = "qcom,apq8016-sbc-sndcard", .data = apq8016_sbc_add_ops },
>  	{ .compatible = "qcom,msm8916-qdsp6-sndcard", .data = msm8916_qdsp6_add_ops },
> +	{ .compatible = "qcom,msm8953-qdsp6-sndcard", .data = msm8953_qdsp6_add_ops },
> +	{ .compatible = "qcom,msm8976-qdsp6-sndcard", .data = msm8976_qdsp6_add_ops },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, apq8016_sbc_device_id);
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry
