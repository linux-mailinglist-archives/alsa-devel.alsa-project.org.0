Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2D29059A5
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 19:10:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D791E69;
	Wed, 12 Jun 2024 19:10:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D791E69
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718212223;
	bh=APRCpEbcPVzVX5FRd/J5uFNU7G8xET1wqhsXQzfeSxA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OxUKdYCTlIc1bCC0yXXKF1Ko30ZpxTShETRiRgMHrVYajnJDb5TmEig1afu92B77v
	 NhirrUFhjhsxRDaInE9sR1eCz/W2VulzsWBW+QuVGKA2oyeGfW4EzbcGl8f3l6jFlL
	 b4dto37xoZdtuxAI2cvdjtkWAiqYsc+p4ZjaTKwA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 51498F805BD; Wed, 12 Jun 2024 19:09:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9292CF805B2;
	Wed, 12 Jun 2024 19:09:50 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EBBADF8057A; Wed, 12 Jun 2024 19:09:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=no
	autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38B3FF80496
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 19:09:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38B3FF80496
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DHcPPtYy
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-57c6afa1839so3158482a12.2
        for <alsa-devel@alsa-project.org>;
 Wed, 12 Jun 2024 10:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718212183; x=1718816983;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ahQlEzrfJdhiFn9OIYrhMiyVBnesYeffSvKfXGQvn6E=;
        b=DHcPPtYyQGcxlGRi0XJ/fpewEyR9g2yhGZkFbePrZ5uhJj1UMmsjxyncQ1KMJh3QGw
         5rWn/f4dM3PiqDpsdZPI6Ar6GxE+1xhYW9DqbEabOOidhHamRWxPMlnRkWkF9biMcQQf
         xit/guua3sXlCvf1JnBCxN6w/eTHOEVAthJX0IS0L2/r517MDgL9+HZlIj21kGy4dC0m
         OjT18fJwFp56q7fQD2MwNM32UTSpbgDpQhJi3BgbzjTtDCFReaY+qGNBcb8fShybZuBK
         8RO2jpNHvjnDNoh6XRuN1ZlY4FXBEc5zoJv1vz8ewm2WwcpeDjb0NbMPP4PsZ0NprHVb
         nGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718212183; x=1718816983;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ahQlEzrfJdhiFn9OIYrhMiyVBnesYeffSvKfXGQvn6E=;
        b=k1Wqdxj5m5rDZ8PpadFMpta67/ieio8QotHPHT5Le20OhEYdwd3VDD88IPNRTTBmkn
         Tj2357uOMO8ypiqyqKpOND2Xd7fcPIsQXkAEwCaeTvUKP/n1v/XO0gQyjMWDrGJdZohi
         x4govde1vCYOgqdlINsbg+gNpBuHwb5GNuvHWqFwyPiSQfckSHR8aN7ju4ggwytWAoSY
         pKFHJf9u6qEllYCsP/nB9V5Pdxg6chxecXSoDYdFGy4Q7t6dRE99kPKqy1bharJW5V1v
         e0O1yt10HfASdN2blgJEkurb9+vuCCrbOdwP/0jfNBk2CjgFH7eojWi8hhorui3Hh/cl
         ojaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVb0qWZaPdJ47q62RMS0ZFn8akmIJ2EXvGa5C2+pYqVTpMD5C6wiyHeYwABG8s8F6BpsSzgQweEGiTZ+tSSNomtgWtRJR1oOUzEyTM=
X-Gm-Message-State: AOJu0YyQKn8MIaCF8rbF9FmvjjH22d2TEQuv0Bzc3V9wjKNKt2YDySLw
	RUBSmIa2tcO8d+JZ4UOo9angB7E4KkCA2YOW1qIoev7eC/2LviWagNM2ktNmHV8=
X-Google-Smtp-Source: 
 AGHT+IGjbcYcIlqz5xpwvHlCgTeNzmT7XcU2BZbyl54Q86rVmVK+MD5/8wFrHjsg4H01yc1UrsqH2g==
X-Received: by 2002:a50:cd1b:0:b0:56e:3293:3777 with SMTP id
 4fb4d7f45d1cf-57caaabd1f3mr1875774a12.17.1718212182970;
        Wed, 12 Jun 2024 10:09:42 -0700 (PDT)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 4fb4d7f45d1cf-57cae50adc2sm824764a12.75.2024.06.12.10.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 10:09:42 -0700 (PDT)
Message-ID: <171afc10-b69b-4c76-be34-7e93ec03355c@linaro.org>
Date: Wed, 12 Jun 2024 18:09:41 +0100
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
 <5bf5ee5e-d24f-476f-9500-9d1b7adcfc72@linaro.org>
 <mpm4pmt5ieofmpxmq5putvytyuiepbmnv5flsfqiwbtc54sb6k@jpoeaeojzzis>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <mpm4pmt5ieofmpxmq5putvytyuiepbmnv5flsfqiwbtc54sb6k@jpoeaeojzzis>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V4IGAPJ5GMG7J4O36ZUDPMQ3K66I5RFE
X-Message-ID-Hash: V4IGAPJ5GMG7J4O36ZUDPMQ3K66I5RFE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V4IGAPJ5GMG7J4O36ZUDPMQ3K66I5RFE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 12/06/2024 17:52, Dmitry Baryshkov wrote:
> On Wed, Jun 12, 2024 at 03:37:56PM +0100, Srinivas Kandagatla wrote:
>>
>>
>> On 07/06/2024 12:03, Dmitry Baryshkov wrote:
>>> On Thu, Jun 06, 2024 at 01:25:59PM +0100, srinivas.kandagatla@linaro.org wrote:
>>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>>
>>>> LPASS Codec v2.5 has significant changes in the rx register offsets.
>>>> Due to this headset playback on SM8550, SM8650, x1e80100 and all SoCs
>>>> after SM8450 have only Left working.
>>>>
>>>> This patch adjusts the registers to accomdate 2.5 changes. With this
>>>> fixed now L and R are functional on Headset playback.
>>>>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>> ---
>>>>    sound/soc/codecs/lpass-rx-macro.c | 565 ++++++++++++++++++++++--------
>>>>    1 file changed, 410 insertions(+), 155 deletions(-)
>>>>
>>>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>>>> index f35187d69cac..bb8ede0e7076 100644
>>>> --- a/sound/soc/codecs/lpass-rx-macro.c
>>>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>>>>    static int rx_macro_probe(struct platform_device *pdev)
>>>>    {
>>>> +	struct reg_default *reg_defaults;
>>>>    	struct device *dev = &pdev->dev;
>>>>    	kernel_ulong_t flags;
>>>>    	struct rx_macro *rx;
>>>>    	void __iomem *base;
>>>> -	int ret;
>>>> +	int ret, def_count;
>>>>    	flags = (kernel_ulong_t)device_get_match_data(dev);
>>>> @@ -3567,6 +3793,33 @@ static int rx_macro_probe(struct platform_device *pdev)
>>>>    		goto err;
>>>>    	}
>>>> +	rx->codec_version = lpass_macro_get_codec_version();
>>>
>>> What guarantees that VA macro has been probed already? If I'm not
>>> mistaken, we might easily get a default '0' here instead of a correct
>>> version.
>>
>> fsgen(Frame sync gen) clk is derived from VA macro, so if we are here that
>> means the va macro is probed.
> 
> Is this written in stone or is it just a current way how these codecs
> are connected?

LPASS Codec IP which encompasses 5 other codec macros blocks (wsa, wsa2, 
tx, rx, va) all the codec macros receive framesync from VA codec block, 
this is the hw design.

Not sure what do you mean by written in stone, but this is LPASS Codec 
design, at-least to the codec versions that this driver supports.

> 
>>>> +	switch (rx->codec_version) {
>>>> +	case LPASS_CODEC_VERSION_2_5 ... LPASS_CODEC_VERSION_2_8:
>>>> +		rx->rxn_reg_offset = 0xc0;
>>>> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>>>> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
>>>> +		if (!reg_defaults)
>>>> +			return -ENOMEM;
>>>> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>>>> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>>>> +				rx_2_5_defaults, sizeof(rx_2_5_defaults));
>>>> +		break;
>>>> +	default:
>>>> +		rx->rxn_reg_offset = 0x80;
>>>> +		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_pre_2_5_defaults);
>>>> +		reg_defaults = kmalloc_array(def_count, sizeof(struct reg_default), GFP_KERNEL);
>>>> +		if (!reg_defaults)
>>>> +			return -ENOMEM;
>>>> +		memcpy(&reg_defaults[0], rx_defaults, sizeof(rx_defaults));
>>>> +		memcpy(&reg_defaults[ARRAY_SIZE(rx_defaults)],
>>>> +				rx_pre_2_5_defaults, sizeof(rx_pre_2_5_defaults));
>>>> +		break;
>>>> +	}
>>>> +
>>>> +	rx_regmap_config.reg_defaults = reg_defaults,
>>>> +	rx_regmap_config.num_reg_defaults = def_count;
>>>> +
>>>>    	rx->regmap = devm_regmap_init_mmio(dev, base, &rx_regmap_config);
>>>>    	if (IS_ERR(rx->regmap)) {
>>>>    		ret = PTR_ERR(rx->regmap);
>>>> @@ -3629,6 +3882,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>>>    	if (ret)
>>>>    		goto err_clkout;
>>>> +	kfree(reg_defaults);
>>>>    	return 0;
>>>>    err_clkout:
>>>> @@ -3642,6 +3896,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>>>    err_dcodec:
>>>>    	clk_disable_unprepare(rx->macro);
>>>>    err:
>>>> +	kfree(reg_defaults);
>>>>    	lpass_macro_pds_exit(rx->pds);
>>>>    	return ret;
>>>> -- 
>>>> 2.21.0
>>>>
>>>
> 
