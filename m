Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AD590555E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 16:40:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48F6B86E;
	Wed, 12 Jun 2024 16:40:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48F6B86E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718203244;
	bh=CTYOhhQlTsoO4oIyaYO/EgA0AeZ/eZ/nx2RqqUkiaGA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IM0Sz6oDnB2VuigpTCXWVqzeLf5JKvAXXCpCwtfgdBslPHxijfqQslX1e6xJMmuyY
	 cGbDxLb72/Hs6x5+Cijt1SCOT2muCHeDB/HC0jNqOTdruCY+NS7AOr4DI/zkpzYbln
	 h0y6fiJnc9cD1F4rFRBjLXWMqi37tFZOk2izBfhA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E842DF805A8; Wed, 12 Jun 2024 16:40:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A384F80580;
	Wed, 12 Jun 2024 16:40:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6780F8057A; Wed, 12 Jun 2024 16:38:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2ACE7F80448
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 16:37:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2ACE7F80448
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=aycQT83m
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6f1da33826so317337266b.0
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 07:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718203078; x=1718807878;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8fjaZfrJZ3QIeFP/iVn+xJccYn+xXruLly+6B31t6tg=;
        b=aycQT83mY/BLZxmKW+kmR57yxJMIrTaQnG8bPq4tQam+KwQVIA9/L9ZhV1v4zTlw6N
         QcmfQkjVVv8UDzE9wLdjLhqOnOLsU2cI3JKHl/Uoduk5LMSG6TiCK0LdtrWoTiv7Is9w
         bPTneAL/OACmNEC8LjOVRKSpnOhqfHiZBSykpYZhY5e4HFTmZ+e753ToHekAT7r0dsfB
         AEdLmLRC3p3cQy/737K57/CfYB/MP5gD7gWW19spkjLUTCZnUdR1pcIWnuph6sGIC6ib
         9LoP1v+PuIS1/EhUBF8T8wcBlkZVC25Vcq0T8ZELuTKIEts4/CozY0kkFqGELztkLPu0
         zy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718203078; x=1718807878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8fjaZfrJZ3QIeFP/iVn+xJccYn+xXruLly+6B31t6tg=;
        b=Vbux7Bj8GdJqFhFZYWCg2ClhezxXnsZ2pKMmojzn3B7hqUjWBq71cx52wzQuW7H+Uo
         N0anC9Enf7cpWgK7M7BwmXMNdJtxnUUFrXE90/NB7fcHvF0C2gRnf/mU5z1V0cOKhKwQ
         zL1oaS4Gjq+bMNruz4DpvsD91UkI45ivNxzOc1h0x/sHrTKc5YZkED5TQfgilw7U5hTj
         t70SSj84z08jBIq7sl5brg+2ZHq+ANx4IIJ/O4InBj4oLYSdMeMOp6OGcmON2zH5HS6q
         RPvKwbf9pdL5+4cyvf8t7qj4WCCQk5e5uOs1zagSe2RgkVXv9xtYZreIheUcl/Cf7A/g
         3kQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoBkujA+nTIRfMIh9mlDZILVQbE40TDItIb0sSuFJw0J4R2TwnaXMlhu2YenZ8o0b5dXhFKAvkPuXxunojdG96NfpBbOtsopc57To=
X-Gm-Message-State: AOJu0YzNl+XPGZRhGCPtZpT38xGodaGVY62+gD9OdhEjV0kz1AlCsyDT
	t4BkA9ZymhrMyhJwQRVDJlQFYNMQMPUrVN+MJVmbp7gOXrzGpSWws++CGTyOg0c=
X-Google-Smtp-Source: 
 AGHT+IFaoHUQSMxx6j+MTMcufV4ec8ectABjdUjrL9TYkcI9tXI2C/BHxmQlOwnr29Szys5kmNlntw==
X-Received: by 2002:a17:906:c9c7:b0:a6e:139b:996d with SMTP id
 a640c23a62f3a-a6f47f5a03emr169143166b.32.1718203077766;
        Wed, 12 Jun 2024 07:37:57 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 a640c23a62f3a-a6f34591542sm248835366b.55.2024.06.12.07.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 07:37:57 -0700 (PDT)
Message-ID: <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
Date: Wed, 12 Jun 2024 15:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] ASoC: codec: lpass-rx-macro: add suppor for 2.5
 codec version
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: broonie@kernel.org, perex@perex.cz, lgirdwood@gmail.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, krzk+dt@kernel.org,
 neil.armstrong@linaro.org, krzysztof.kozlowski@linaro.org
References: <20240606122559.116698-1-srinivas.kandagatla@linaro.org>
 <20240606122559.116698-3-srinivas.kandagatla@linaro.org>
 <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <qjyuvejxvjfanhqi3xpgobqjuugh52okxiutdprprx43emee7t@gzh7go6yc77z>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CG3ICOU44TRZ33QZP74H7YPZ4URCJXP7
X-Message-ID-Hash: CG3ICOU44TRZ33QZP74H7YPZ4URCJXP7
X-MailFrom: srinivas.kandagatla@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CG3ICOU44TRZ33QZP74H7YPZ4URCJXP7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 07/06/2024 12:03, Dmitry Baryshkov wrote:
> On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> LPASS Codec v2.5 has significant changes in the rx register offsets.
>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>> after SM8450 have only Left working.
>>
>> This patch adjusts the registers to accomdate 2.5 changes. With this
>> fixed now L and R are functional on Headset playback.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
>>   1 file changed, 410 insertions(+), 155 deletions(-)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index f35187d69cac..bb8ede0e7076 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>>   
>>   static int rx_macro_probe(struct platform_device *pdev)
>>   {
>> +	struct reg_default *reg_defaults;
>>   	struct device *dev = &pdev->dev;
>>   	kernel_ulong_t flags;
>>   	struct rx_macro *rx;
>>   	void __iomem *base;
>> -	int ret;
>> +	int ret, def_count;
>>   
>>   	flags = (kernel_ulong_t)device_get_match_data(dev);
>>   
>> @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   		goto err;
>>   	}
>>   
>> +	rx->codec_version = lpass_macro_get_codec_version();
> 
> What guarantees that VA macro has been probed already? If I'm not
> mistaken, we might easily get a default '0' here instead of a correct
> version.

fsgen(Frame sync gen) clk is derived from VA macro, so if we are here 
that means the va macro is probed.

> 
>> +	switch (rx->codec_version) {
>> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
>> +		rx->rxn_reg_offset = 0xc0;
>> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
>> +		if (!reg_defaults)
>> +			return -ENOMEM;
>> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>> +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
>> +		break;
>> +	default:
>> +		rx->rxn_reg_offset = 0x80;
>> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
>> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
>> +		if (!reg_defaults)
>> +			return -ENOMEM;
>> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>> +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
>> +		break;
>> +	}
>> +
>> +	rx_regmap_config.reg_defaults = reg_defaults,
>> +	rx_regmap_config.num_reg_defaults = def_count;
>> +
>>   	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
>>   	if (IS_ERR(rx->regmap)) {
>>   		ret = PTR_ERR(rx->regmap);
>> @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	if (ret)
>>   		goto err_clkout;
>>   
>> +	kfree(reg_defaults);
>>   	return 0;
>>   
>>   err_clkout:
>> @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   err_dcodec:
>>   	clk_disable_unprepare(rx->macro);
>>   err:
>> +	kfree(reg_defaults);
>>   	lpass_macro_pds_exit(rx->pds);
>>   
>>   	return ret;
>> -- 
>> 2.21.0
>>
> 
