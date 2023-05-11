Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2765A6FF065
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 13:11:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FF5F82C;
	Thu, 11 May 2023 13:10:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FF5F82C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683803500;
	bh=RBd0bfiBBIOjKLxhgZDCGV5Ss1Je9DwNwCSdInkxEYk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rBEgZQmiCMQD6+YUqqk88hMReyue7ibrZLAOzHso2IptUZ8NJR/pJ03tFz4y3mzaS
	 tl5h8rFt/rGvMw0sYMav/mtqyzkg4Xu95CtQyca5kZQiCWB/mN2vfNtOx+7tZ18HZ5
	 Sd3luleGoEFmCIFjWGXZ9vrRX3qdf4x7OTHyzL9w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E894F80310;
	Thu, 11 May 2023 13:10:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00EFEF8032D; Thu, 11 May 2023 13:10:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6844CF80217
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 13:10:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6844CF80217
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Dyi8ve2u
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bc25f0c7dso15342590a12.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683803437; x=1686395437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q7KxdBG/NeF6sWMIRS2EQ/HmjBGOWua4oCF2RfFjnYc=;
        b=Dyi8ve2u1kiMIWDo8UAn+si7P3sNVvuq0CApWRjlvwBj6ZP4dK29ykmg1GNZ8cX4GN
         HZpNyBjusvuWiJMFksx5I6awxewE+5LnKfpUMIm0iyGrhMLx/Y82PIcsp/u+5VXW8RBm
         WsLCfujGqUrUAKmQYf8vL9SryPdGqj2+4WZb7yxegaaxUeFfELEY/GQQxzzc8rGBvSlV
         AlODw0ga1I5pwhKcfjzsqpopLfIVIcaFeRS/SxTDtyMW7b/vuRUbwmGVUQr7eZ0ulQPC
         veSXvM2/O2gECUGy7KrcaJeHcXgaTjh33oRwi6DrMrD+XjcM2zgBKyG5yfYNcV1CdZAL
         xgOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683803437; x=1686395437;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q7KxdBG/NeF6sWMIRS2EQ/HmjBGOWua4oCF2RfFjnYc=;
        b=MlHmhvgmS6HdZyqIZ4S/LpmURMM2J8uJ+sotjaWMrN3+V7xXVI5hy/iQoP0S4Yplc3
         pA1qnXySqmoqBjsaX920c4RBQ4II65P3aKAZjaIrr+6s4NicadS2AtMnU4Qdeg25DH8i
         yD7qrxgfPInp++PTZb1sBM3g1gdne2a+H1Eow+M1AfQ8G6PICtIAslvW8Ub3BGtBdKIP
         GEFxiOpKkQ0XHKBzS8dLPLHpYTM2Tv37XQvfCzRO9vPRzgzbnwfcHuVmmxbU4dXWzhlD
         YGt4zRCipz/Wq4MoX8qx2w3njQZxy+f0GiQSsK5BuRVj/8l8hwHFXt1KeQZoe9xR56WG
         tpxg==
X-Gm-Message-State: AC+VfDxUGmj262nkLFStoaLo+g1QTEg7NF+gumEgs9C/B8RkSVSzBlAr
	mXbUV4Y6OGGTE0jnz5AaHa27fQ==
X-Google-Smtp-Source: 
 ACHHUZ5nKsEhAnsseBCGuUqg/8Vzj4ZcA5NvGpLmygmAm9j0zZJqO7fOoh4aJ+42swdqT33rFR9mcw==
X-Received: by 2002:a17:907:3d90:b0:968:236:eb17 with SMTP id
 he16-20020a1709073d9000b009680236eb17mr12046696ejc.24.1683803436971;
        Thu, 11 May 2023 04:10:36 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:41e7:1b68:d38e:1348?
 ([2a02:810d:15c0:828:41e7:1b68:d38e:1348])
        by smtp.gmail.com with ESMTPSA id
 ze12-20020a170906ef8c00b009659fa6eeddsm3870844ejb.196.2023.05.11.04.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 04:10:36 -0700 (PDT)
Message-ID: <8e98b31a-ef4d-a8bd-32f3-e6f496f2b138@linaro.org>
Date: Thu, 11 May 2023 13:10:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v1 3/3] dt-bindings: ASoC: Add ESS ES9218P codec bindings
Content-Language: en-US
To: Aidan MacDonald <aidanmacdonald.0x0@gmail.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20230510112349.939991-1-aidanmacdonald.0x0@gmail.com>
 <20230510112349.939991-3-aidanmacdonald.0x0@gmail.com>
 <7b3a37e8-0210-c539-5b5b-bf8e587707ea@linaro.org>
 <7Zga7RBqLNcaG5ylTIY4Qn7CUdE1IJsW@localhost>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <7Zga7RBqLNcaG5ylTIY4Qn7CUdE1IJsW@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MTVKNWCVUIV5PDBNYFA5SFUQ4ZHT3IKN
X-Message-ID-Hash: MTVKNWCVUIV5PDBNYFA5SFUQ4ZHT3IKN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MTVKNWCVUIV5PDBNYFA5SFUQ4ZHT3IKN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/05/2023 12:15, Aidan MacDonald wrote:
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> On 10/05/2023 13:23, Aidan MacDonald wrote:
>>> ...
>>> +  ess,max-clock-div:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Sets the maximum MCLK divider for generating the internal CLK.
>>> +      CLK must be at least 20x the I2C bus speed or I2C transactions
>>> +      will fail. The maximum divider should be chosen to ensure that
>>> +      CLK will not fall below the limit.
>>> +    enum:
>>> +      - 1
>>> +      - 2
>>> +      - 4
>>> +      - 8
>>> +    default: 1
>>
>> Why do you need to customize it per board?
>>
> 
> There's no generic API to read or change the bus speed (SCL frequency)
> for I2C adapters, so it's impossible to calculate a limit on the MCLK
> divider automatically.
> 
> Defaulting to 1 is always safe, but means wasting power at lower sample
> rates. If you know what the bus speed is you can use a higher divider
> limit to save power, and it has to be done at the board/firmware level
> because that's the only place where the bus speed is known.

If I understand correctly, you only miss a way to get bus_freq_hz from
i2c_timings to calculate the divider by yourself? This looks like Linux
limitation, so we shouldn't push it into DT, but rather fix Linux. The
I2C bus rate is known, the MCLK rate as well, so divider is possible to
deduce.

I am actually surprised that I2C core does not store the timings
anywhere and each bus host has to deal with it on its own.

Best regards,
Krzysztof

