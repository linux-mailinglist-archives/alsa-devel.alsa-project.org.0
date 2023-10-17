Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB167CC405
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Oct 2023 15:09:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8FFFA1F1;
	Tue, 17 Oct 2023 15:08:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8FFFA1F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697548169;
	bh=8joyC6pGw9d6EvJ9iIkNVR+enKkDPxZngFInI3S2ZHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cVRISJxGwtAxqEkykPIWUH00AwGwwHmcFx6qLZqjWPdzzYc+lUr8yUwBSn4O5+ajH
	 EU7qYXWm1qlDjWMkPBe2WZN03n1UsxJlafqwJe4Xkqek1zR7tgv67kg3s5SqJdfIKn
	 VGEomdMjeBPLdtw8dmVNZAfQ+P47WChhelDvAGEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71419F80557; Tue, 17 Oct 2023 15:08:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 77E9DF8024E;
	Tue, 17 Oct 2023 15:08:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF257F8025F; Tue, 17 Oct 2023 15:08:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 724A7F80236
	for <alsa-devel@alsa-project.org>; Tue, 17 Oct 2023 15:08:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 724A7F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=QVsiqViT
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40566f8a093so54591355e9.3
        for <alsa-devel@alsa-project.org>;
 Tue, 17 Oct 2023 06:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697548098; x=1698152898;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JZoA1Ego1HM4HIX412AargOJWZVAL/5W3iCMJBbaTKc=;
        b=QVsiqViT6h74pEEKFWB83LmeB8QwxzqEu7bKDrQNwwhFFc1Ku/ExAAbJi/P7wQmx/4
         F21npwBRUWkNoQwuYXZKb2bknkYQa3WlI/y+uRwgbMZptpcPNWZbZF7K3pGnBO41obFi
         b/p8UknemddFecEy3kwGapw2VJSMiX2tBEyvrgZTKO4Ol/No38b2eDxIyjZJmPQZ6EAO
         MCGH9Y2CtfePXnanX+wfm2Teeo9JY4jh4HFC2bEVwGTEaFCSgwdniSH60S1JW9ulWbKG
         3PxOs4R/FoBJ/dSDA4yvaciffZRC3qhY78eLpL0yER4mIpK3uHr0e496UR6mtV5WO27u
         e0SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697548098; x=1698152898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JZoA1Ego1HM4HIX412AargOJWZVAL/5W3iCMJBbaTKc=;
        b=CZE2jBpGaaGfp48h0zI9sW5FWQkpazMA67l1h6WfMat9BPdkzqHw8NVqSQKWWBJZKA
         7qeYMvXvrXcIcFqWzmwx3ezhlo4NeHK1Liz33JFlwcVEki98WhBgw3Cfci4RtWcfNTE4
         WJu0CriOouwgqsA5DPUqkkGPfFXbqVp+HeeO5N2PNGqvqTpFDltut398Qvc5/qsYuslB
         4WMQMwrE5UiE5Mz8rjgUIGip7eqGVUwJ4OrPGVBtxDe6N/xLoL16sTH+313//wi5iQH4
         hBB+kL02bp0Fbp8y2re72H8GxKAcTYtEpbHmY3hanecR1kbf47RpDG/fLirBBE7bZdBT
         UwPg==
X-Gm-Message-State: AOJu0YxAAl+O7XyPVdXfD7b2MwtnAdxjQuTija0yuDI+RLsa601kvh6F
	7J9oNRvE37ue6QbEqAU4w9hZqA==
X-Google-Smtp-Source: 
 AGHT+IHQQcRJ2l2z5ACeKhLx0EU5+tkVqbX7z2FlB8ExzyQZVxwqvYP3UbLI5+TaHSg9F2rN0eHPvw==
X-Received: by 2002:a05:600c:1906:b0:401:aa8f:7562 with SMTP id
 j6-20020a05600c190600b00401aa8f7562mr1731260wmq.11.1697548098235;
        Tue, 17 Oct 2023 06:08:18 -0700 (PDT)
Received: from [192.168.86.24] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 v20-20020a05600c429400b00402d34ea099sm9718777wmc.29.2023.10.17.06.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 06:08:17 -0700 (PDT)
Message-ID: <7aca4eff-edb9-2ae5-1146-68e4530f76be@linaro.org>
Date: Tue, 17 Oct 2023 14:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 2/3] ASoC: qcom: q6afe: check ADSP version when setting
 clocks
Content-Language: en-US
To: =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
 linux-arm-msm@vger.kernel.org
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20231014172624.75301-1-otto.pflueger@abscue.de>
 <20231014172624.75301-3-otto.pflueger@abscue.de>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20231014172624.75301-3-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7VUCXFZSBP773HJ7ULXQ5GS5IIATQ4EK
X-Message-ID-Hash: 7VUCXFZSBP773HJ7ULXQ5GS5IIATQ4EK
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VUCXFZSBP773HJ7ULXQ5GS5IIATQ4EK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Otto for the patch,
some comments below

On 14/10/2023 18:26, Otto Pflüger wrote:
> There are two APIs for setting clocks: the old one that uses
> AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG and AFE_PARAM_ID_LPAIF_CLK_CONFIG,
> and the new one which uses AFE_PARAM_ID_CLOCK_SET.
> 
> ADSP firmware version 2.6 only provides the old API, while newer
> firmware versions only provide the new API.
> 
> Implement LPAIF_BIT_CLK and LPAIF_DIG_CLK for both APIs so that users
> don't have to care about the firmware version. Also fall back to
> setting AFE_PARAM_ID_INT_DIGITAL_CDC_CLK_CONFIG in q6afe_set_lpass_clock
> when setting the new Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE
> clock is requested to allow specifying it in the device tree on older
> platforms too.
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>   sound/soc/qcom/qdsp6/q6afe.c | 81 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 81 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 91d39f6ad0bd..87bdf741e5f6 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -1111,6 +1111,32 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
>   	struct q6afe *afe = dev_get_drvdata(dev->parent);
>   	struct afe_clk_set cset = {0,};
>   
> +	/*
> +	 * v2 clocks specified in the device tree may not be supported by the
> +	 * firmware. If this is the digital codec core clock, fall back to the
> +	 * old method for setting it.
> +	 */
> +	if (q6core_get_adsp_version() < Q6_ADSP_VERSION_2_7) {
> +		struct q6afe_port *port;
> +		struct afe_digital_clk_cfg dcfg = {0,};
> +		int ret;
> +
> +		if (clk_id != Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE)
> +			return -EINVAL;
> +

<---
> +		port = q6afe_port_get_from_id(dev, PRIMARY_MI2S_RX);
> +		if (IS_ERR(port))
> +			return PTR_ERR(port);
> +
> +		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
> +		dcfg.clk_val = freq;
> +		dcfg.clk_root = 5;
> +		ret = q6afe_set_digital_codec_core_clock(port, &dcfg);
> +
> +		q6afe_port_put(port);
--->

Could you pl explain what are we doing in this snippet?

Isn't this what is exactly done in q6afe_mi2s_set_sysclk(LPAIF_DIG_CLK...)




> +		return ret;
> +	}
> +
>   	cset.clk_set_minor_version = AFE_API_VERSION_CLOCK_SET;
>   	cset.clk_id = clk_id;
>   	cset.clk_freq_in_hz = freq;
> @@ -1124,6 +1150,41 @@ int q6afe_set_lpass_clock(struct device *dev, int clk_id, int attri,
>   }
>   EXPORT_SYMBOL_GPL(q6afe_set_lpass_clock);
>   
...

>   int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   			  int clk_src, int clk_root,
>   			  unsigned int freq, int dir)
> @@ -1133,6 +1194,26 @@ int q6afe_port_set_sysclk(struct q6afe_port *port, int clk_id,
>   	struct afe_digital_clk_cfg dcfg = {0,};
>   	int ret;
>   
> +	if (q6core_get_adsp_version() >= Q6_ADSP_VERSION_2_7) {
> +		/* Always use the new clock API on newer platforms. */
> +		switch (clk_id) {
> +		case LPAIF_DIG_CLK:
> +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +			clk_id = Q6AFE_LPASS_CLK_ID_INTERNAL_DIGITAL_CODEC_CORE;
> +			break;
> +		case LPAIF_BIT_CLK:
> +			clk_src = Q6AFE_LPASS_CLK_ATTRIBUTE_COUPLE_NO;
> +			clk_root = Q6AFE_LPASS_CLK_ROOT_DEFAULT;
> +			clk_id = q6afe_get_v2_bit_clk_id(port);
> +			if (clk_id < 0)
> +				return clk_id;
> +			break;
> +		default:
> +			break;
> +		}
> +	}

This should be probably done in machine driver or q6afe-dai, not in q6afe.


> +
>   	switch (clk_id) {
>   	case LPAIF_DIG_CLK:
>   		dcfg.i2s_cfg_minor_version = AFE_API_VERSION_I2S_CONFIG;
