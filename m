Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AD86FF90E
	for <lists+alsa-devel@lfdr.de>; Thu, 11 May 2023 19:58:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52A05F13;
	Thu, 11 May 2023 19:57:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52A05F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683827928;
	bh=av340JZ5JioK7TqcWU0tTGWniTMgazdLrB5pq7aWaLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qTOJNYIaDncpfoWmzNqJL4T4PejwqjZ9walr0ugGSlXB88ImSEd9tdQCzA47fiurD
	 QzGL9RWefC9cqhN54aUE5myr4S5JjWjWrxRp7tW+vLMJvmgy1xFg6wMgYhQMebK7FJ
	 j76HX5JYLWoStJcQlgI6LQp1zyw+dyaE4TgcqpQw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8AF9F80548; Thu, 11 May 2023 19:57:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 17774F8032D;
	Thu, 11 May 2023 19:57:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1518AF8052E; Thu, 11 May 2023 19:57:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5B9FAF8014C
	for <alsa-devel@alsa-project.org>; Thu, 11 May 2023 19:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B9FAF8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=dxc9baUC
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-965fc25f009so1337841066b.3
        for <alsa-devel@alsa-project.org>;
 Thu, 11 May 2023 10:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683827862; x=1686419862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KKEWKy4QsgEP6Phxafvcaa/nk7o4U4bQeym+7fv4t84=;
        b=dxc9baUC6WhtT9/YH80Q5hWdOF98PVdFTsDiFwUaP4ZAZECOdsk4dUleu/VKs7W+rU
         cGzxrfVHuxZCfHjNv59oXotQ1x1X+SZE1i4CdPll9Ct+0J6YHP+r/gVSf2SVWEDbw2PI
         VDmHW8kvLjURCuVuitM5NAlb7BKLhsd3jUZPkG70RO28Q+fCCYG3ioGD4XU2XZozrQ2T
         ZwrF+tW2r5n0xAgYIkBrsU0ylfqkdH9JgxKsWa8gwE9SdICFTHBQJ/YmJTYTQDmwbEiv
         hN3XRYNVxP9XVTH1qLPAKSBH2UB697r1x9zPDA97RunKTDawO4CqAxS0mcE/Qc03K6tF
         y1gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683827862; x=1686419862;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KKEWKy4QsgEP6Phxafvcaa/nk7o4U4bQeym+7fv4t84=;
        b=a8wvH46Tu2NK4gwHBhwqdTQeSKll1+BU/JdZ+1QM5OF76sCoj5Pt/Q/wcdxYYc1j5j
         mQ2B2uH1aiqTZE/rsDvkqgXI0xuEXxzOcCU4gxeeNmImaAXI97HblJQuVctzfGtkhf67
         xhQS7QEy0Y4UdV759E7aJLZUV6F7TAOLsuPzWrJKRDC6BQk2tm/x27BhERfRKOxVcRoW
         zBf8jCjafY0qulouvnBOJQrl25TSiX7LjZncLltVNbSLzbt0aM7XahIKKBNuxn0afOoY
         0+pazndGAbhKUSsGCtoqHBO5qNjNb3i9sTD/JqkijP2YcWjPIiQPhKHoiZO8uNyMZ7LZ
         p09g==
X-Gm-Message-State: AC+VfDznqV8AH1+D73otNMovAe71De6s7/Y7EP6MS5C05bYSiyN+z3vy
	eceOow/1MMpGti1gGM9Qc3/buA==
X-Google-Smtp-Source: 
 ACHHUZ6ZNYNy8A+C05L0Pkvx8jTChxFxNF9aHHsbShC3/zp+v6BL8/lv3zW1fvRU9umtfIqfzDbPsA==
X-Received: by 2002:a17:907:7b9c:b0:966:7a0a:28c0 with SMTP id
 ne28-20020a1709077b9c00b009667a0a28c0mr15820879ejc.58.1683827862247;
        Thu, 11 May 2023 10:57:42 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:d7cd:1be6:f89d:7218?
 ([2a02:810d:15c0:828:d7cd:1be6:f89d:7218])
        by smtp.gmail.com with ESMTPSA id
 nr1-20020a1709068b8100b0094f1b8901e1sm4351538ejc.68.2023.05.11.10.57.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 May 2023 10:57:41 -0700 (PDT)
Message-ID: <3c131132-35ce-e5da-2608-36d53abc6c83@linaro.org>
Date: Thu, 11 May 2023 19:57:40 +0200
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
 <8e98b31a-ef4d-a8bd-32f3-e6f496f2b138@linaro.org>
 <zfuvar6MiqIaW9nvjgvUIhA1t3DkZ9tE@localhost>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <zfuvar6MiqIaW9nvjgvUIhA1t3DkZ9tE@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 5VQXIXF7S2F5SBAO2GROJ5XW3K2UUOFO
X-Message-ID-Hash: 5VQXIXF7S2F5SBAO2GROJ5XW3K2UUOFO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5VQXIXF7S2F5SBAO2GROJ5XW3K2UUOFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/05/2023 13:26, Aidan MacDonald wrote:
> 
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> On 11/05/2023 12:15, Aidan MacDonald wrote:
>>>
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
>>>
>>>> On 10/05/2023 13:23, Aidan MacDonald wrote:
>>>>> ...
>>>>> +  ess,max-clock-div:
>>>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>>>> +    description:
>>>>> +      Sets the maximum MCLK divider for generating the internal CLK.
>>>>> +      CLK must be at least 20x the I2C bus speed or I2C transactions
>>>>> +      will fail. The maximum divider should be chosen to ensure that
>>>>> +      CLK will not fall below the limit.
>>>>> +    enum:
>>>>> +      - 1
>>>>> +      - 2
>>>>> +      - 4
>>>>> +      - 8
>>>>> +    default: 1
>>>>
>>>> Why do you need to customize it per board?
>>>>
>>>
>>> There's no generic API to read or change the bus speed (SCL frequency)
>>> for I2C adapters, so it's impossible to calculate a limit on the MCLK
>>> divider automatically.
>>>
>>> Defaulting to 1 is always safe, but means wasting power at lower sample
>>> rates. If you know what the bus speed is you can use a higher divider
>>> limit to save power, and it has to be done at the board/firmware level
>>> because that's the only place where the bus speed is known.
>>
>> If I understand correctly, you only miss a way to get bus_freq_hz from
>> i2c_timings to calculate the divider by yourself? This looks like Linux
>> limitation, so we shouldn't push it into DT, but rather fix Linux. The
>> I2C bus rate is known, the MCLK rate as well, so divider is possible to
>> deduce.
>>
>> I am actually surprised that I2C core does not store the timings
>> anywhere and each bus host has to deal with it on its own.
>>
>> Best regards,
>> Krzysztof
> 
> I agree it'd be better if Linux provided access the bus frequency, but
> even if that API was added it will take time for every I2C adapter to
> support it. So in that case we would still need a DT property to provide
> a safe limit or use a safe default, and miss potential power savings.
> 
> I'd prefer to add the DT property to allow power savings to be had now,
> and drop it if/when the kernel gets an API for bus frequency. That will
> be safe from a compatibility point of view -- the property won't be
> providing any useful information so it won't matter if old DTs have it.

OK, sounds good.

Best regards,
Krzysztof

