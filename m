Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2076906C2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Feb 2023 12:20:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6D7D86F;
	Thu,  9 Feb 2023 12:19:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6D7D86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675941625;
	bh=WTdYBwDL0Wj9Sz63qCp2BOp+reBM4RPuZDbqr1F//WQ=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D4s++PgGBoyHzReAYzjOoX8i2gC6Y3LIwhSvdUhOWbv1fP/F6ZF13joKoiZ3NdE6s
	 cTOnHXMQggiqF8hcv4uy/g1k+YRKuSx6oP6zhzFc4TL+mah1rbPZIhr2gMeTle5A97
	 eDti68TYAxffKDTJIvT0Rn4q/9YUgnNry4VJP9Ts=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 141C7F80534;
	Thu,  9 Feb 2023 12:18:28 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 927C4F8055C; Thu,  9 Feb 2023 12:18:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C3E8F8052D
	for <alsa-devel@alsa-project.org>; Thu,  9 Feb 2023 12:18:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C3E8F8052D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wtVAF4LZ
Received: by mail-wm1-x32f.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so3619320wma.1
        for <alsa-devel@alsa-project.org>;
 Thu, 09 Feb 2023 03:18:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6WkQCGOYg2/oFJRssqJajHpycUbCD5BF/LqSCnmYp44=;
        b=wtVAF4LZJLCK9dFxUHUoEPo5p1ulRBt4nln4QEwt4Sd0bnB3BdHApbyH5rbEg+IURD
         vSKYH/ZAaWqP01G3NcrEXcdwXUhthSzq/GOPpThtSAopRv4mi0+rvrkUY5D2f6GDc0Pb
         5Tq/TFRLpC5efo4ypbiPFj3SA+5zLkXS6nMLgaATijQQemfm6+1XuqYf9vP/ufgHF/ka
         dNHYblP/5yT9zZXRGXF6GyehEXnMGZhHbSjG3Xn0vSgrfEIIoUbc18X9NWvaqTVjcxJ+
         qDXKQ7rhTWaJN23rGZlzpAJYM4Xl++/Cn9wLXtdsxXtGTXKjuSfrdzKoVm74kUGtxoah
         QhCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6WkQCGOYg2/oFJRssqJajHpycUbCD5BF/LqSCnmYp44=;
        b=G7AWtiDnt4FcuhYGZOqj2VlIfEQ6Q8sbibaJMtpgJpLV/KMUYT1ASyyOHonv5oLP8k
         3CjKud+sWzFjsek8Zr6p5eYtnC9gjbnoKrLdjPQ+NcD1SOOONncEjWZOxUpUFgEHb74P
         Wis7gi9HF2+JqUGTxMicEVKW96KlaQIZusBavRksjCTQfuP0Z+6kJz1iPuhC3TouEiBg
         kZSgCLSC20cPBHQvKxfsWMqRuq3/33knjyFZMzGLA8iVlWiajLp5RujN6GIihSSaG0CX
         GEZN1SjaKSCURhhg3BVKjm6bisZ4dpF79rqHYAXqiHgFtKrWefmXGQqZo/weV1GwTwZu
         EVhw==
X-Gm-Message-State: AO0yUKVPPj8L5jdeLrkBmSBl74TjZt0np4WtsrM2Dmd8ljk55AYvVMAE
	k6qbfzXwdOCxdz5pFaMjr2vUYQ==
X-Google-Smtp-Source: 
 AK7set9ZKkkw5h25z1fC/a9kDFoULrGDfxLU4eN2dDrEas3gNVgRLAi7qti2dNI+PNNLWkACPsevpw==
X-Received: by 2002:a05:600c:1819:b0:3dc:58a2:3900 with SMTP id
 n25-20020a05600c181900b003dc58a23900mr9441776wmp.29.1675941494275;
        Thu, 09 Feb 2023 03:18:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 bd6-20020a05600c1f0600b003e0015c8618sm4701668wmb.6.2023.02.09.03.18.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 03:18:13 -0800 (PST)
Message-ID: <251b6ada-7c18-ba82-411f-f633ad7f09ff@linaro.org>
Date: Thu, 9 Feb 2023 12:18:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3] ASoC: SMA1303: Remove the sysclk setting in devicetree
Content-Language: en-US
To: Ki-Seok Jo <kiseok.jo@irondevice.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20230209084903.13000-2-kiseok.jo@irondevice.com>
 <da3e7391-ee89-3089-8501-91e9411161a7@linaro.org>
 <SLXP216MB00777BF2377ECE2366F694228CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <e5bcad37-c7d3-9c3c-4947-d3f2f6d9fc60@linaro.org>
 <SLXP216MB0077E5E2FC4A8CAA3B9D8A4F8CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
 <SLXP216MB007705EA280A2C5D344F25338CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <SLXP216MB007705EA280A2C5D344F25338CD99@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PBFYMDIPSQERYUHDOETRQKY4T5OQY4EW
X-Message-ID-Hash: PBFYMDIPSQERYUHDOETRQKY4T5OQY4EW
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PBFYMDIPSQERYUHDOETRQKY4T5OQY4EW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 09/02/2023 10:34, Ki-Seok Jo wrote:
>>
>>> On 09/02/2023 10:01, Ki-Seok Jo wrote:
>>>>
>>>>>> In SMA1303, this device does not support MCLK.
>>>>>> So it need to remove sysclk setting in devicetree.
>>>>>> v2: Modify the sysclk setting - using devm_clk_get for mclk.
>>>>>>
>>>>>> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
>>>>>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>
>>>>> Where? Where did you get this tag?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>>
>>>> I'm sorry, I don’t' know what you're talking about.
>>>> What tag are you talking about?
>>>> Sorry, could you please elaborate?
>>>
>>> From where the tag "Reviewed-by: Krzysztof..." appear?
>>>
>>> Best regards,
>>> Krzysztof
>>
>> I'm sorry I misunderstood the word. :(
>> Originally, I was going to use reported-by.
>> I shoud have reviewed it one more time, I'm really sorry.
>>
>> Thank you for telling me.
>>
>> Best regards,
>> Kiseok Jo
> 
> I'm sorry. It's my mistake..
> 
> Can I just change the tag and send it back again to v4?
> Reviewd-by -> Reported-by

There is no bug to report, so reported-by also does not fit. Just drop
the tag.

Best regards,
Krzysztof

