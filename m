Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F22F7F8A61
	for <lists+alsa-devel@lfdr.de>; Sat, 25 Nov 2023 12:55:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 879B8E79;
	Sat, 25 Nov 2023 12:55:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 879B8E79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700913352;
	bh=ehjJCRuVdxxxNToqQVNezgPqgQJNGvhFNT7XEz8yZlw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KltCKZAxLqcIxpLYdM632muz2yW9e6fWy5uRtJtB1ltr5QVE+a/ecZp05Pzv9QRsG
	 LqhbZxrsi1XFFwgefO45+pKa8+ERAqnEdPxwwNNYCuegc2q9OKVRreVUF0Vgg3lZs7
	 UgHCys8czHTZi00MIuO/iNK6G/7GHkJ/J9m9qP+Q=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0B8B2F8055B; Sat, 25 Nov 2023 12:55:20 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D00DF8057A;
	Sat, 25 Nov 2023 12:55:20 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93FFBF802E8; Sat, 25 Nov 2023 12:55:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 51CEAF80249
	for <alsa-devel@alsa-project.org>; Sat, 25 Nov 2023 12:55:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51CEAF80249
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=SxG46TS1
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50aabfa1b75so3798020e87.3
        for <alsa-devel@alsa-project.org>;
 Sat, 25 Nov 2023 03:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700913310; x=1701518110;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjoAQdrJlyucZgCB5XwzbgMabrtPSPnwCcmkjxg9epU=;
        b=SxG46TS1VFaXPlYD7pCdAdCDu4yAVzsAPzh4USTZJvapcDDBFIonSKUlfR3IPEGc7Q
         GvkPfkWWC6+PdZkupLk8ghGOSEtwsdZtwYnAdu3YM/kvV1RsVObTxPx45Y8GwOlkX+GJ
         VEY/rmM+vBzXoNUwB46eT6QdT7KkIAk8Bp43UEw7NSSv6+y0axDl/4CQG6oEmn/jDzct
         3yZidgHQHSxRxWzAk/afCo8EGfVd70l2XnsYXU4SJoRfUb7sarwkrdlCSLxQB3Av6qS1
         yPOiiN0KrZ8ynZsU7YeVvfE1K0ZNXqHJbSaTpLs9qZAmMu1tZSQ2Y0X0PgnKMA4w6GS7
         ahHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700913310; x=1701518110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjoAQdrJlyucZgCB5XwzbgMabrtPSPnwCcmkjxg9epU=;
        b=GHaXKhs6/4afpxRIrJNT9J6YmMSLX4+slNLo6QksBLPV9asP5owbgRZTn9EqYKjOK9
         SYEhglEUDEaAUVCFtcAutCGw2DJWwjAEHJbDdDFPcMdqbFyZ+ShiF83vC5RxDSVAnXre
         w1FXKWiIa+8n2Cdzbo/LX4/tqAcNqDhg13WesiuHouyPVakUWu9pOli09z1z5ye/HvsB
         ynubvVcwcoXypYvlHfLG7KP6SXXy2YD/R/ReFEMXPguXrxhCRAkXJ7lkEih244gwszje
         g4jP3CBjpumCJCIcfx6tw8vGo05+IRjYv8ok43/veY2QZWu5jssGUhc6cmEwdOpnSgpc
         QbgA==
X-Gm-Message-State: AOJu0Yx8JAIM6270ifBXW4VKHpRi7JD0353AxQZhROEHuvK064AdJ3kW
	1i/t/js6uK/owYHDaSDib3qbrw==
X-Google-Smtp-Source: 
 AGHT+IEpfEUF2H5QKFf1d+Y7GHXr1irfgb4HzPwZHkRk2yxzLqSU/f+XmRCfwxuxa/YfvKLZt9GCWA==
X-Received: by 2002:a05:6512:3a85:b0:50b:a6c7:e8b0 with SMTP id
 q5-20020a0565123a8500b0050ba6c7e8b0mr1102022lfu.26.1700913309934;
        Sat, 25 Nov 2023 03:55:09 -0800 (PST)
Received: from [192.168.201.100]
 (178235187180.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.180])
        by smtp.gmail.com with ESMTPSA id
 a18-20020a170906191200b009e6cedc8bf5sm3348915eje.29.2023.11.25.03.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Nov 2023 03:55:09 -0800 (PST)
Message-ID: <a7725504-89fd-4f62-b8d0-6ec863bd059a@linaro.org>
Date: Sat, 25 Nov 2023 12:55:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] ASoC: codecs: Add WCD939x Soundwire slave driver
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-4-21d4ad9276de@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UZFCCLKF5OP3EABKP6BTJJGIC4NPTE5G
X-Message-ID-Hash: UZFCCLKF5OP3EABKP6BTJJGIC4NPTE5G
X-MailFrom: konrad.dybcio@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZFCCLKF5OP3EABKP6BTJJGIC4NPTE5G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23.11.2023 15:49, Neil Armstrong wrote:
> Add Soundwire Slave driver for the WCD9390/WCD9395 Audio Codec.
> 
> The WCD9390/WCD9395 Soundwire Slaves will be used by the
> main WCD9390/WCD9395 Audio Codec driver to access registers
> and configure Soundwire RX and TX ports.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
[...]


> +static struct wcd939x_sdw_ch_info wcd939x_sdw_tx_ch_info[] = {
> +	WCD_SDW_CH(WCD939X_ADC1, WCD939X_ADC_1_4_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_ADC2, WCD939X_ADC_1_4_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_1_4_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_1_4_PORT, BIT(3)),
> +	// TOFIX support ADC3/4 & DMIC0/1 on port 2
Well, fix it or drop it :D

> +	//WCD_SDW_CH(WCD939X_ADC3, WCD939X_ADC_DMIC_1_2_PORT, BIT(0)),
> +	//WCD_SDW_CH(WCD939X_ADC4, WCD939X_ADC_DMIC_1_2_PORT, BIT(1)),
> +	//WCD_SDW_CH(WCD939X_DMIC0, WCD939X_ADC_DMIC_1_2_PORT, BIT(2)),
> +	//WCD_SDW_CH(WCD939X_DMIC1, WCD939X_ADC_DMIC_1_2_PORT, BIT(3)),
> +	WCD_SDW_CH(WCD939X_DMIC0, WCD939X_DMIC_0_3_MBHC_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_DMIC1, WCD939X_DMIC_0_3_MBHC_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_MBHC, WCD939X_DMIC_0_3_MBHC_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_DMIC2, WCD939X_DMIC_0_3_MBHC_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_DMIC3, WCD939X_DMIC_0_3_MBHC_PORT, BIT(3)),
> +	WCD_SDW_CH(WCD939X_DMIC4, WCD939X_DMIC_3_7_PORT, BIT(0)),
> +	WCD_SDW_CH(WCD939X_DMIC5, WCD939X_DMIC_3_7_PORT, BIT(1)),
> +	WCD_SDW_CH(WCD939X_DMIC6, WCD939X_DMIC_3_7_PORT, BIT(2)),
> +	WCD_SDW_CH(WCD939X_DMIC7, WCD939X_DMIC_3_7_PORT, BIT(3)),
> +};
[...]

> +
> +int wcd939x_swr_get_current_bank(struct sdw_slave *sdev)
> +{
> +	int bank;
> +
> +	bank = sdw_read(sdev, SDW_SCP_CTRL);
> +
> +	return ((bank & 0x40) ? 1 : 0);
bool conversion?

Also, 0x40 == BIT(6), can you look up what it means and #define it?

[...]

> +
> +static int wcd9390_bus_config(struct sdw_slave *slave,
> +			      struct sdw_bus_params *params)
> +{
> +	sdw_write(slave, SWRS_SCP_HOST_CLK_DIV2_CTL_BANK(params->next_bank),
> +		  0x01);
similar, BIT(0)
[...]

> +	{ WCD939X_EAR_STATUS_REG_2, 0x08 },
> +	{ WCD939X_FLYBACK_NEW_CTRL_2, 0x00 }, //??
> +	{ WCD939X_FLYBACK_NEW_CTRL_3, 0x00 }, //??
> +	{ WCD939X_FLYBACK_NEW_CTRL_4, 0x44 }, //??
drop //s
[...]

> +static bool wcd939x_volatile_register(struct device *dev, unsigned int reg)
> +{
> +	if (reg <= WCD939X_BASE)
> +		return false;
Maybe move this check to readonly_register
> +
> +	if (wcd939x_readonly_register(dev, reg))
> +		return true;
and call readonly for .volatile_reg as well?
[...]

> +	/**
> +	 * Port map index starts with 0, however the data port for this codec
> +	 * are from index 1
> +	 */
This is not kerneldoc

> +	if (of_property_read_bool(dev->of_node, "qcom,tx-port-mapping")) {
> +		wcd->is_tx = true;
> +		ret = of_property_read_u32_array(dev->of_node,
> +						 "qcom,tx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD939X_MAX_TX_SWR_PORTS);
> +	} else {
> +		ret = of_property_read_u32_array(dev->of_node,
> +						 "qcom,rx-port-mapping",
> +						 &pdev->m_port_map[1],
> +						 WCD939X_MAX_RX_SWR_PORTS);
> +	}
This is used in wcd9380 and will be used in wcd9370 when that happens some
day, maybe it'd be worth to commonize it as qcom_{rx/tx}_portmap_get?
[...]

> +static const struct sdw_device_id wcd9390_slave_id[] = {
> +	SDW_SLAVE_ENTRY(0x0217, 0x10e, 0),
0x10e - WCD9380 or 9385 slave? an inline comment at the end of the line
would be cool!

Konrad
