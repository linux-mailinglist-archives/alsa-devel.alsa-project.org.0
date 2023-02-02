Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8901568882E
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Feb 2023 21:21:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D011A100;
	Thu,  2 Feb 2023 21:20:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D011A100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675369286;
	bh=Hefo1EOJdNup9uddZ9QGP6PvOelLvEqIW9QL4gW1sV4=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=hdzUuMvOAwX2Pg9izLxezOmFvMTDf8gRCjN/hIIbGqQFmTt1FBSUHfAYuwNy+TG5+
	 Tz8JXalv6dUWo3J1hGhOWXSoNlsmBJdK1iidXoIdFCwM4NTLis/iWS0nQ/mPewi6pE
	 woVJ64XN7l0zk5SdOlZCsfVjWzC1L4V02pEHh8fg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 42118F800E3;
	Thu,  2 Feb 2023 21:20:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 289BDF804C2; Thu,  2 Feb 2023 21:20:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0AF8AF800E3
 for <alsa-devel@alsa-project.org>; Thu,  2 Feb 2023 21:20:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0AF8AF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YtcfjKeQ
Received: by mail-wm1-x331.google.com with SMTP id
 n28-20020a05600c3b9c00b003ddca7a2bcbso2337553wms.3
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 12:20:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gxuF7ikYyogA9U/SKS/lBdTNIB/rmyK+rN+ghcq+5Gg=;
 b=YtcfjKeQe4R8XxIviX07Q8WBX8Vi0UnVCO48+c//4YAsQV9RQjg6rgRJThl7jIUyr8
 w3UiAFdbUApX6YUAgYwOMLsxRVjN9N5Cjfznr/bUmB89iLPXgzGZ4/FhdNN7CuUy7G4z
 PPLE/jnKsatmlXXizaeFSBnBs4INJjBtmkbM841tUsmceAXwr4P9NIsVITpN3S92aV1a
 qkuzitecsVTc5Y/EjKg2wUs0PQJxxlKE269TmKXxh++Dj84tqD/EnPwksUXs7oocQjE3
 GqY7E9lmK386FA9fOLtztO6WqetOYbXG62+fIM3+xabetyx4hOM2+WEPw1IFdXfD3016
 zcpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gxuF7ikYyogA9U/SKS/lBdTNIB/rmyK+rN+ghcq+5Gg=;
 b=jlK1OyakMxWnC5hHxTHIKwmBuWoPd46xRye9Z2F2yKoLNF081lNXbjsr+NLMYlDC5q
 YYW11mn62wNs/l8Zt2Nyv/ejdYGVZFCHnrPUVlmXb03FYgZ2HyhsLVdTsbeIZhSco6vn
 /loifEPbCeJM030mhc7KcuaE6m7GDUki1IvFd7ivAykNvbMM7s47O/2OevLZpS4ZcGhe
 EcID4zYJ+R/ob2KVngx/gC9gCtpsOhz2+KzJJ5FDbg60T4ETn9+fnnXsXaOsqqHyin7s
 LRfMIPYqJvPxlqiXspuhcnEaXTB4BTlQrAa7Ib+1Yh/az5zEbhH57szWfO4dDEbzYBG/
 7ktQ==
X-Gm-Message-State: AO0yUKX8bE1N8fH8C6t0fYpPd6POvx9TUQtQKlWnIldYQSr5vI9WiULK
 Byi5qmz54RG0V2SloauRJQRo/A==
X-Google-Smtp-Source: AK7set/6HicccIrBPUPcG8gnvN9JgVUga6wXuJJFuLIZEau8lXFbwLo27g+SR7h6J2MzpYOmbv8/Jg==
X-Received: by 2002:a05:600c:46c7:b0:3de:720c:10ff with SMTP id
 q7-20020a05600c46c700b003de720c10ffmr7511935wmo.40.1675369219258; 
 Thu, 02 Feb 2023 12:20:19 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003dc5b59ed7asm837131wmq.11.2023.02.02.12.20.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 12:20:18 -0800 (PST)
Message-ID: <4111d645-478a-e55f-60bd-4ecbef077183@linaro.org>
Date: Thu, 2 Feb 2023 21:20:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] Fixed the schema binding according to test
Content-Language: en-US
To: Ki-Seok Jo <kiseok.jo@irondevice.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230202090715.18384-1-kiseok.jo@irondevice.com>
 <ac140660-0df0-8b43-3585-17511a280830@linaro.org>
 <SLXP216MB0077A1B1F744D74A5B338F0C8CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SLXP216MB0077A1B1F744D74A5B338F0C8CD69@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 02/02/2023 10:55, Ki-Seok Jo wrote:
>> Thank you for your patch. There is something to discuss/improve.
>>
>> On 02/02/2023 10:07, Kiseok Jo wrote:
>>> Modified according to the writing-schema.rst file and tested.
>>
>> Use imperative, not past tense (Fixed->Fix, Modified->Modify).
> 
> Okay. I got it. I'll do that when I rewrite it. Thanks.
> 
>>>
>>> Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
>>
>> Use subject prefixes matching the subsystem (which you can get for example
>> with `git log --oneline -- DIRECTORY_OR_FILE` on the directory your patch
>> is touching). Therefore it should be:
>> "ASoC: dt-bindings: irondevice,sma1303: Rework binding and add missing
>> properties"
>>
> 
> Oh, thank you for good information. I feel like I still lack a lot.
> I'll apply it. Thanks!
> 
>>
>>> ---
>>>  .../bindings/sound/irondevice,sma1303.yaml    | 46 +++++++++++++++++--
>>>  1 file changed, 43 insertions(+), 3 deletions(-)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
>>> b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
>>> index 162c52606635..35d9a046ef75 100644
>>> --- a/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
>>> +++ b/Documentation/devicetree/bindings/sound/irondevice,sma1303.yaml
>>> @@ -10,22 +10,62 @@ maintainers:
>>>    - Kiseok Jo <kiseok.jo@irondevice.com>
>>>
>>>  description:
>>> -  SMA1303 digital class-D audio amplifier with an integrated boost
>> converter.
>>> +  SMA1303 digital class-D audio amplifier  with an integrated boost
>>> + converter.
>>>
>>>  allOf:
>>> -  - $ref: name-prefix.yaml#
>>> +  - $ref: dai-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - irondevice,sma1303
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  '#sound-dai-cells':
>>> +    const: 1
>>> +
>>> +  i2c-retry:
>>> +    description: number of retries for I2C regmap.
>>
>> Why do you need this? Why this fits the purpose of DT (or IOW why this
>> differs between boards)?
> 
> When working with drivers on mulitiple platforms, there were cases where
> I2C did not work properly dpending on the AP or setting.
> So I made it possible to set a few retry settings, and then check or do
> other actions. Retry is performed only when I2C fails.
> 
> And each device may have a different pull-up resisor or strength,
> so there may be differences between boards.

None of I2C drivers need it (except SBS battery), so it should not be
needed here. If you have wrong pin setup, this one should be corrected
instead.

> 
> Could that property be a problem?
> 
>>> +    maximum: 49
>>> +    default: 3
>>> +
>>> +  tdm-slot-rx:
>>> +    description: set the tdm rx start slot.
>>
>> Aren't you now re-writing dai-tdm-slot-rx-mask property? Same for tx below.
>>
> 
> It can be the same as audio DAI's tdm slot, I think but there are cases
> where it is set differently, so I omitted it separately.

Unfortunately I still do not understand why do you need it. Use generic
DAI/TDM properties.

> 
>>> +    maximum: 7
>>> +    default: 0
>>> +
>>> +  tdm-slot-tx:
>>> +    description: set the tdm tx start slot.
>>> +    maximum: 7
>>> +    default: 0
>>> +
>>> +  sys-clk-id:
>>> +    description: select the using system clock.
>>
>> What does it mean? Why do you need such property instead of clocks?
> 
> This can receive an external clock, but it can use internal clock.
> Should I write all the clock descriptions in case?

How do you configure and enable external clock with this property? I
don't see it. If the device has clock input, this should be "clocks". If
it is omitted, then internal clock is used.



Best regards,
Krzysztof

