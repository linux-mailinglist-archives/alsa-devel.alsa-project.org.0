Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C3805637
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Dec 2023 14:37:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29F00843;
	Tue,  5 Dec 2023 14:37:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29F00843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701783468;
	bh=B3nZBknU27tEdGgxtYaJT/oN07HiHkVgmUtnwSlLfgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AWjbVDKqQ094B7nDuyHcozCtUhP7Exu3mqWuMMxk4sAnNOOK3AqB/Sdu1EucbvR5I
	 /JKUoZTS70DGbluJjvUN5WfZTzSyfOkZ8Nw6+YX8OUF4BthLF8hM9lWbQROoJd85/U
	 cDL3H+yCcVa6cJ0xMnAlZRXQlMvRhEhBi9sJuI40=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C12CEF80571; Tue,  5 Dec 2023 14:37:17 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 053C1F80571;
	Tue,  5 Dec 2023 14:37:17 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DC5CF8024E; Tue,  5 Dec 2023 14:37:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F3F72F800AC
	for <alsa-devel@alsa-project.org>; Tue,  5 Dec 2023 14:37:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F72F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=RKRSbuOi
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3332fc9b9b2so3773636f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 05 Dec 2023 05:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701783422; x=1702388222;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oLSuOmRjAtk0widOr8UJa+VLNrEGSCdiHADZ6tJoQBU=;
        b=RKRSbuOiPujT6JFWyVWkmdUSueimO6vWYQ8Ehblu3YUeUW7CXjRWxAf+LCZ/1zrihc
         6Au9l+zb9DhSwC7BY7AB/JWiBmU9c4faJlMA87p3FYTeTou2vX/EYYIj2MxpUhLNEOMa
         APP+DGnp+Vp2BO+3MqkRQtKssM5YCIf8gAbyYFJavmJRtpuo+hd9wbWbsuOBXNiVWgIp
         zxMMLdWCfv57apcmdpUEg06saJ+BH3COIFU93Get+nCsao24ESI+lmQefCKTvneCvL3k
         hBiOnFai/x5PHbpDWbSxUzfr9Yw0XG/sKStevmu4L7O5f9VHaAoMM/+JVXoTdPuFtOHt
         NyBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701783422; x=1702388222;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oLSuOmRjAtk0widOr8UJa+VLNrEGSCdiHADZ6tJoQBU=;
        b=H4pw1xWEZUi9tK6EpE83Dqveod9QCOGDrVgI2dZkjqmPDkrGZj+kjKRDBxIDlGTSf1
         bv/d/VviMDu1tBnQ9O1L7mhSWuo/WFsvbUvOBhp+Zdxb4uFbuR/jto4oy4G5RCjf7yTA
         8RcHQTo16JHslkDpf1MZOdCNoQWHe9FMxY5RFnqfu2GkYWt+FK96bMYFvg43mkvZkDwF
         S42UYTMwilOtxesZ+nTDYvr02Ml7RRHIZ54E4M2/LepBQ+UgoFvjsqt5JwrGc/Axq1Hv
         nw/EU0NTna1sR4JkdCDng+U5xJHWzr4dfFzgCJABcT0Q68vDqh/aClHRm7E8bgte4JSS
         w1mw==
X-Gm-Message-State: AOJu0YzGnG4N1NJIvyRI9X7w8CY7+RLRxN+zv+eMeCgcdwF9ViOTHXOW
	zNFUkL9Z6HfjtByUWlOA4U5yTg==
X-Google-Smtp-Source: 
 AGHT+IFVV4akvFc/uvXiqR3LuUsTlQJhs8NQRXqbqIuIo4UZw+qOsmo3nN09PAdnJCee9v1ZN9NhVA==
X-Received: by 2002:a05:600c:1c12:b0:40b:5e22:2e1 with SMTP id
 j18-20020a05600c1c1200b0040b5e2202e1mr1529515wms.77.1701783422471;
        Tue, 05 Dec 2023 05:37:02 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b003fefaf299b6sm18687584wmn.38.2023.12.05.05.37.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 05:37:02 -0800 (PST)
Message-ID: <95aae292-976b-4725-b506-769418d7d534@linaro.org>
Date: Tue, 5 Dec 2023 14:37:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] ASoC: codecs: wcd937x: Add wcd937x codec driver
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
 srinivas.kandagatla@linaro.org, broonie@kernel.org, agross@kernel.org,
 andersson@kernel.org, quic_plai@quicinc.com, quic_rohkumar@quicinc.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 quic_phaniu@quicinc.com, quic_avangala@quicinc.com
Cc: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231205123400.6353-1-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UURF4AQUMNW6TBSYKFF3HSZLRNGH4VDI
X-Message-ID-Hash: UURF4AQUMNW6TBSYKFF3HSZLRNGH4VDI
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UURF4AQUMNW6TBSYKFF3HSZLRNGH4VDI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 05/12/2023 13:34, Prasad Kumpatla wrote:
> Add wcd937x codec and wcd937x-sdw soundwire drivers.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  sound/soc/codecs/Kconfig       |   20 +
>  sound/soc/codecs/Makefile      |    7 +
>  sound/soc/codecs/wcd937x-sdw.c | 1147 ++++++++++++
>  sound/soc/codecs/wcd937x.c     | 3047 ++++++++++++++++++++++++++++++++
>  sound/soc/codecs/wcd937x.h     |  654 +++++++


Please run scripts/checkpatch.pl and fix reported warnings. Some
warnings can be ignored, but the code here looks like it needs a fix.
Feel free to get in touch if the warning is not clear.

The warning about undocumented ABI is important. You cannot just ignore it.

>  5 files changed, 4875 insertions(+)
>  create mode 100644 sound/soc/codecs/wcd937x-sdw.c
>  create mode 100644 sound/soc/codecs/wcd937x.c
>  create mode 100644 sound/soc/codecs/wcd937x.h
> 
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 3429419ca694..b89118e8c391 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -275,6 +275,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_UDA1380
>  	imply SND_SOC_WCD9335
>  	imply SND_SOC_WCD934X
> +	imply SND_SOC_WCD937X_SDW
>  	imply SND_SOC_WCD938X_SDW
>  	imply SND_SOC_LPASS_MACRO_COMMON
>  	imply SND_SOC_LPASS_RX_MACRO
> @@ -2038,6 +2039,25 @@ config SND_SOC_WCD934X
>  	  The WCD9340/9341 is a audio codec IC Integrated in
>  	  Qualcomm SoCs like SDM845.
>  
> +config SND_SOC_WCD937X
> +	depends on SND_SOC_WCD937X_SDW
> +	tristate
> +	depends on SOUNDWIRE || !SOUNDWIRE
> +	select SND_SOC_WCD_CLASSH
> +
> +config SND_SOC_WCD937X_SDW

That's one big patch. How about splitting the patch per driver for
easier review?

> +	tristate "WCD9370/WCD9375 Codec - SDW"
> +	select SND_SOC_WCD937X
> +	select SND_SOC_WCD_MBHC
> +	select REGMAP_IRQ
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	help
> +	  The WCD9370/9375 is an audio codec IC used with SoCs
> +	  like SC7280 or QCM6490 chipsets, and it connected
> +	  via soundwire.
> +	  To compile this codec driver say Y or m.

...


> +
> +static int wcd937x_probe(struct platform_device *pdev)
> +{
> +	struct component_match *match = NULL;
> +	struct device *dev = &pdev->dev;
> +	struct wcd937x_priv *wcd937x;
> +	struct wcd_mbhc_config *cfg;
> +	int ret;
> +
> +	wcd937x = devm_kzalloc(dev, sizeof(*wcd937x), GFP_KERNEL);
> +	if (!wcd937x)
> +		return -ENOMEM;
> +
> +	dev_set_drvdata(dev, wcd937x);
> +	mutex_init(&wcd937x->micb_lock);
> +
> +	wcd937x->reset_gpio = of_get_named_gpio(dev->of_node, "reset-gpios", 0);

Why not devm API?

> +	if (wcd937x->reset_gpio < 0)
> +		return dev_err_probe(dev, wcd937x->reset_gpio,
> +				     "Failed to get reset gpio\n");
> +
> +	wcd937x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
> +	if (IS_ERR(wcd937x->us_euro_gpio))
> +		return dev_err_probe(dev, PTR_ERR(wcd937x->us_euro_gpio),
> +				"us-euro swap Control GPIO not found\n");
> +
> +	cfg = &wcd937x->mbhc_cfg;
> +	cfg->swap_gnd_mic = wcd937x_swap_gnd_mic;
> +
> +	wcd937x->supplies[0].supply = "vdd-rxtx";
> +	wcd937x->supplies[1].supply = "vdd-px";
> +	wcd937x->supplies[2].supply = "vdd-mic-bias";
> +
> +	ret = devm_regulator_bulk_get(dev, WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get supplies\n");
> +
> +	ret = regulator_bulk_enable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
> +
> +	/* Get the buck separately, as it needs special handling */
> +	wcd937x->buck_supply = devm_regulator_get(dev, "vdd-buck");
> +	if (IS_ERR(wcd937x->buck_supply))
> +		return dev_err_probe(dev, PTR_ERR(wcd937x->buck_supply),
> +				     "Failed to get buck supply\n");
> +
> +	ret = regulator_enable(wcd937x->buck_supply);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable buck supply\n");
> +
> +	wcd937x_dt_parse_micbias_info(dev, wcd937x);
> +
> +	cfg->mbhc_micbias = MIC_BIAS_2;
> +	cfg->anc_micbias = MIC_BIAS_2;
> +	cfg->v_hs_max = WCD_MBHC_HS_V_MAX;
> +	cfg->num_btn = WCD937X_MBHC_MAX_BUTTONS;
> +	cfg->micb_mv = wcd937x->micb2_mv;
> +	cfg->linein_th = 5000;
> +	cfg->hs_thr = 1700;
> +	cfg->hph_thr = 50;
> +
> +	wcd_dt_parse_mbhc_data(dev, &wcd937x->mbhc_cfg);
> +
> +	ret = wcd937x_add_slave_components(wcd937x, dev, &match);
> +	if (ret)
> +		return ret;
> +
> +	wcd937x_reset(wcd937x);
> +
> +	ret = component_master_add_with_match(dev, &wcd937x_comp_ops, match);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_set_autosuspend_delay(dev, 1000);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +	pm_runtime_idle(dev);
> +
> +	return ret;
> +}
> +
> +static void wcd937x_remove(struct platform_device *pdev)
> +{
> +	component_master_del(&pdev->dev, &wcd937x_comp_ops);
> +	dev_set_drvdata(&pdev->dev, NULL);
> +}
> +
> +static struct platform_driver wcd937x_codec_driver = {
> +	.probe = wcd937x_probe,
> +	.remove_new = wcd937x_remove,
> +	.driver = {
> +		.name = "wcd937x_codec",
> +		.of_match_table = of_match_ptr(wcd937x_of_match),

Drop of_match_ptr. You have warnings in your code.

> +		.suppress_bind_attrs = true,

Why?

> +	},
> +};


...

> +
> +#if IS_ENABLED(CONFIG_SND_SOC_WCD937X_SDW)
> +int wcd937x_sdw_free(struct wcd937x_sdw_priv *wcd,
> +		     struct snd_pcm_substream *substream,
> +		     struct snd_soc_dai *dai);

I don't think this driver makes sense on its own, without the SDW part.
Why not using dependency in Kconfig?

Best regards,
Krzysztof

