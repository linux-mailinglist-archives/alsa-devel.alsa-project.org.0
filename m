Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 686DA70246A
	for <lists+alsa-devel@lfdr.de>; Mon, 15 May 2023 08:21:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 43F66822;
	Mon, 15 May 2023 08:20:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 43F66822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684131675;
	bh=kOZ9P/+5dvCN4lNZJWAk2XxlQDF+Vjo8xCm5mk1Zn+s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nUj5XvZVLRmZ/XhO2/Zir8rR1d0zlxGdaPpvwFxCPs4gJ6zl/+25LiscytHDLxphn
	 zebegn7TiOSMhTvwwt3qTST8Au5znxYKeIihi/rXTwX9fEPlVfrtIPksbINJecoTMv
	 w4A7LJvkSCqQ6Ejo7LOhvwCOQfyYid40it2EKUNU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B20DDF80544; Mon, 15 May 2023 08:20:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B1FBF8025A;
	Mon, 15 May 2023 08:20:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DF92F80272; Mon, 15 May 2023 08:20:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69A50F8016D
	for <alsa-devel@alsa-project.org>; Mon, 15 May 2023 08:20:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69A50F8016D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eT0zT+xS
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-50bc5197d33so22505982a12.1
        for <alsa-devel@alsa-project.org>;
 Sun, 14 May 2023 23:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684131613; x=1686723613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QQk+upFNjcsFg1sTfIoyMrAZ0ApZ4GLo1P0y6xEnNys=;
        b=eT0zT+xSEQfDoDpnMzqokrZq7gA0Mk4Nl7GfodQ7lqZ4h3G6ka03Cbiveo8IwiPO+b
         T0VQkylmmVv2AJT5dTNUqMIxGe4DyF3NY7PdPFchGkaYDprgHSqoXIEsUNtkpkM4atpq
         qC42V8fC4L3TfJT0uKK6DfchiSkdR5T1mXw4ps7hdgoKYW/rCcK91I2HYLSTkiO8c5FF
         rwwoDlXNR7R7lwAhTa2KIh+zYg4GB4Pb5/ADnSpRV+5zNDfyYKwdCdWo72TMC4faz6xm
         zjBzHFxbrGpMMfVdRU5378K6p/bo8wRO4P7lTIRQzf5Dor3g3vA5eSERa3n55lA3pF50
         My2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684131613; x=1686723613;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQk+upFNjcsFg1sTfIoyMrAZ0ApZ4GLo1P0y6xEnNys=;
        b=YJea3XcSn2J5bEsfwFQTcG+kpTYps3nUysg2DW2Xa4Cp0ZbDWKOPfGqQ9BG5x+iBm0
         /7NvLHALovElCNb88HRd9mdh8kTL/Od7FOW6PM170ZI+KUAs9pCHOnQmIOWujv7RLtY3
         /O87HmAUkJxopY3h9r5cp2pLvaptiW/QOjMM/R2oO19XGcuqs8pd/mtDUpyGM6z8pVk2
         cevmLyNPqztsjmRsUfd2reFGroPbzSapgaQHtB2Ly7F8nP7/iVFjEWo+KlCxgyUvyuPR
         yEnq+9rCvsZIHT+fmXSSigX8Gd8tP7/pLZXVCqZ5wEc5TrFRTbefa3tzg0/wuO5mqIws
         p5ig==
X-Gm-Message-State: AC+VfDx9w9gkmzgaNvVAyhE80Ei+f4fmjwzW17uYhD/XnnEC2wBcXCdp
	SwmuZlEjYm8aLkLuZe5JAoC/TQ==
X-Google-Smtp-Source: 
 ACHHUZ4d3vzQJ1tsE9pjK4Ao9lH+3iqMv3T57c0i5bYRSlbvDcF9FXiWrVuPBq1Ny5XbBiLytc4Yeg==
X-Received: by 2002:a17:906:dc8c:b0:96a:6723:da48 with SMTP id
 cs12-20020a170906dc8c00b0096a6723da48mr14316989ejc.75.1684131613237;
        Sun, 14 May 2023 23:20:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992?
 ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id
 jl4-20020a17090775c400b009658475919csm9072367ejc.188.2023.05.14.23.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 May 2023 23:20:12 -0700 (PDT)
Message-ID: <21488506-9e91-e7b4-a995-645b70c720bf@linaro.org>
Date: Mon, 15 May 2023 08:20:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8824: Convert to dtschema
Content-Language: en-US
To: AS50 CTLin0 <ctlin0@nuvoton.com>, broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
References: <20230512120146.600128-1-CTLIN0@nuvoton.com>
 <877338f8-d157-0f91-33a3-fdb03566aa57@linaro.org>
 <a1afe69d-2bb1-02d8-3573-dec370cc1a9b@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a1afe69d-2bb1-02d8-3573-dec370cc1a9b@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 76IC5JP7WO5VBXIAM2CK2BAKPY2Y636N
X-Message-ID-Hash: 76IC5JP7WO5VBXIAM2CK2BAKPY2Y636N
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/76IC5JP7WO5VBXIAM2CK2BAKPY2Y636N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 15/05/2023 04:47, AS50 CTLin0 wrote:
> On 5/14/2023 2:38 AM, Krzysztof Kozlowski wrote:
>> On 12/05/2023 14:01, David Lin wrote:
>>> Convert the NAU8824 audio CODEC bindings to DT schema.
>>>
>>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>>> ---
>> Thank you for your patch. There is something to discuss/improve.
>>
>>> +
>>> +  nuvoton,sar-threshold-num:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Number of buttons supported.
>>> +    minimum: 1
>>> +    maximum: 4
>>> +    default: 4
>>> +
>>> +  nuvoton,sar-threshold:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>>> +    description:
>>> +      Impedance threshold for each button. Array that contains up to 8 buttons
>>> +      configuration. SAR value is calculated as
>>> +      SAR = 255 * MICBIAS / SAR_VOLTAGE * R / (2000 + R) where MICBIAS is
>>> +      configured by 'nuvoton,micbias-voltage', SAR_VOLTAGE is configured by
>>> +      'nuvoton,sar-voltage', R - button impedance.
>>> +      Refer datasheet section 10.2 for more information about threshold
>>> +      calculation.
>>> +    minItems: 1
>>> +    maxItems: 4
>> Your description mentions 8 buttons, so maybe it should be 8 here? Or
>> description needs a fix?
> Driver just handle maxima 4 buttons for general application, but the the
> above description is truly hardware capability with 8 buttons support.

Then it should be 8.

Best regards,
Krzysztof

