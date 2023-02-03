Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D63C68A10E
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 18:59:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3841E9;
	Fri,  3 Feb 2023 18:58:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3841E9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675447167;
	bh=C37YToh+nZg/PE4t02AwlQu75zO3U2UYvOHm8qQJl5c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gGc77/Yy6Kllyf73kqrdG/wV0CixJ1ayxoia1+veDTu1+WcXORddhlJsCDCPjQjRN
	 rJlB3dYbK302drE6PTe9+hGuQFHc87kZRWXWNVUnRVD6QTEtIpO3ns/IrLhWSeKqpb
	 Dtc7lGGt8NXt01pw/n6bb2CjihbHZrqjbglOR/nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 519FDF802E8;
	Fri,  3 Feb 2023 18:58:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C809FF80254; Fri,  3 Feb 2023 18:58:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 67939F80022
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 18:58:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67939F80022
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=S1EjWXdz
Received: by mail-wm1-x32e.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso6557453wmp.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 09:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=lN+M6aiUbCqF46CC1crDFxdVf7hLTQ+IRNqaZ978vd8=;
 b=S1EjWXdz//eVBIiu80y0i58Nwfp/vPB6JlRYf2vOiL5xiefMP2zINH+qTlJJbRKItY
 WPrNVD0VpVMglADIzRh8Ojmkhb+O/yZ6DvaCEfVRF7ZEnrTYtwIF13YFx5XNMFgIj8rE
 uWSA5IlhAOYI0mTPHGzK+xv/oXOiRT/JZGYpW3WMtyFcdn+ofmFkqIFIURJEvwE7FM7Q
 2TMKBxnxWIbBXDhy/h1s540I8b9ylHqaLRjlafMhockTDHZP+qIiT44NeP9mnh4zsA0s
 Xclq547eR3BpKU4H5GOz04EFZ1KWSUjYUabfKn1PAQqCB0mIirpl0MmXm/DFU5UC11ms
 1l5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lN+M6aiUbCqF46CC1crDFxdVf7hLTQ+IRNqaZ978vd8=;
 b=0Osyd/pGZ866akWF0mJl2729wHiGPSem7QN5JtCyUrMsBC2B7Kva7nY8AZwQDDa9qR
 B3n0q9mbwAGaY8HQlzma2DS7/stU9A5flHUmKfR5J5DVo76c/ja9NYgjyL+dK7js/alt
 Top+egIBIFdAHUYEnd5azfSg4yxFfDodxxUoIMAYrcL6IwVGJ4KsI1H195itsjwrAa7a
 tK8H5cIjRL7RKoZvq0Q2shL08n1h0Nsn/f0YdhF6KZ125Z8IgwlxVYquYoCyuCI2hg7P
 PxfJ4+ekJkQiM19vr+LnzHWz/Q142JH79aNBbNlLfJmlzmL12bPbSLQmiNQOuHlrb4Rl
 nT2g==
X-Gm-Message-State: AO0yUKVtMlxQja1Lyjls0ADfzBHhZdObMeYZgjRMXX2bsDEYaIWsSG7+
 bnD5gZWiAtNv0vC6Yc4FpJBMnA==
X-Google-Smtp-Source: AK7set/XQawmCDWrVyjPwzNZBBNVKsO+g4KUQAE8B9uS3eeB81KjPN+ttS8KXCXrBfkXJpYejKU66Q==
X-Received: by 2002:a05:600c:510e:b0:3dc:59e9:9285 with SMTP id
 o14-20020a05600c510e00b003dc59e99285mr11539024wms.18.1675447094889; 
 Fri, 03 Feb 2023 09:58:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a05600c358200b003dc4ecfc4d7sm3609686wmq.29.2023.02.03.09.58.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 09:58:14 -0800 (PST)
Message-ID: <d72f2c93-934c-67fe-0afd-96bc52b12a9f@linaro.org>
Date: Fri, 3 Feb 2023 18:58:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 6/9] ASoC: dt-bindings: meson: convert axg fifo to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-7-jbrunet@baylibre.com>
 <6e6ed493-4748-46ca-7a26-fe9cf6e2377a@linaro.org>
 <1jmt5un9u4.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jmt5un9u4.fsf@starbuckisacylon.baylibre.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-amlogic@lists.infradead.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 03/02/2023 14:27, Jerome Brunet wrote:
> 

>>> +  resets:
>>> +    items:
>>> +      - description: Memory ARB line
>>> +      - description: Dedicated device reset line
>>
>> This won't work without minItems and you should see errors on your DTS
>> or in dt_binding_check
>>
> 
> The example provided here worked but there is indeed a warning with the
> axg-frddr variant.
> 
> I'm adding a 2nd example so it does not happen again.

If the difference is only in one property, no need. If the difference is
in more properties - then could be. We do not keep examples for every
trivial change, because the assumption is that submitter tests DTS as well.

> 
>>> +
>>> +  reset-names: true
>>
>> minItems
>> maxItems
> 
> Adding this causes troubles with the reset-names definitions in the 'if'
> clause. If I put min: 1, max: 2 and min: 2 in the 'then' clause I get:
> 
>> Documentation/devicetree/bindings/sound/amlogic,axg-fifo.yaml: allOf:1:then:properties:reset-names: 'oneOf' conditional failed, one must be fixed:
>>        [{'const': 'arb'}, {'const': 'rst'}] is too long
>>        [{'const': 'arb'}, {'const': 'rst'}] is too short
>>        False schema does not allow 2
>>        1 was expected
>>        hint: "minItems" is only needed if less than the "items" list length
>>        from schema $id: http://devicetree.org/meta-schemas/items.yaml#

Probably because rest of binding does not match. One way is like this:

https://elixir.bootlin.com/linux/v5.19-rc6/source/Documentation/devicetree/bindings/clock/samsung,exynos7-clock.yaml#L57

> 
> The older devices just have the 'arb' reset.
> Newer devices have a 2nd reset line (called rst here)
> 
> If I just restrict the min and max, it would be valid for the older
> devices to have 'rst' only - but it is not valid.

How? Why would you define for old devices "rst" as one name if this is
not correct?

> 
> With just 'true', it works as expected (throw errors if an incorrect
> name or number of names is passed). Min and Max comes from the items list.

Because the rest is not in recommended way. Once you implement it in
recommended way, there will be no such...

> 
> Any suggestions ?

Implement rest of comments.


Best regards,
Krzysztof

