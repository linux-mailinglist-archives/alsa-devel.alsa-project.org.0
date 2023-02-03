Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E66890F5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 08:36:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8BDC82A;
	Fri,  3 Feb 2023 08:35:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8BDC82A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675409774;
	bh=vtgHs20RYHaPFo6z8sgw5yOQwRuoTFBP60/fqVmysN8=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NyH02L8nUmikp6DcP2eTLsr/KTCzdiX2YYrmxNVs0ilFLOEefPks0z85rwapQarHP
	 fZev2BAx89nupC9jpV9bRY43gvF/N4IUtdCJIFIvQAm/joTiomkFLrlz9O2L7ugY+Y
	 nKkX2t3+KO0vEDusqW3HciJ0LuCd1yrN1fcv5w8A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B39F80423;
	Fri,  3 Feb 2023 08:35:13 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5C619F8032B; Fri,  3 Feb 2023 08:35:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8D7EF80169
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 08:35:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8D7EF80169
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uvHAkCKK
Received: by mail-wm1-x330.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso5368380wms.5
 for <alsa-devel@alsa-project.org>; Thu, 02 Feb 2023 23:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9gvQASbJh6yblI9HLyL9BA1AkxK02X0X1bUuLfHjS6Y=;
 b=uvHAkCKKv9jaLTrqclc+YVwEWVbeYCsDqBz5CikpYJdSmwzrCleQR62GK7K0D37bNP
 fmkOAhkd8wqfq9PwXnM6BD9S9VCCX/B2KjvMtxnQMB79KwGzHfl+fyv45gqf+0YkuJXD
 jD1CRBgqm24LZfS5q1DDLSr6KqrPZTQfUrb5kTm0aGFMeq5G5kTlKf71CQEuWnOC651g
 mojiFDvUpnYjnbMosKrLsbFFoYJQevpLHYCI48lQlq0HqN3YapZ3ekn5v9yYMiijh2Mb
 jId3jJaz/grbRiGMbHEm8k8F00U4fjqYfxbuK6ddJXHgvhJtEgJxzppUVE1dMuD7uOWy
 jnNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9gvQASbJh6yblI9HLyL9BA1AkxK02X0X1bUuLfHjS6Y=;
 b=pwOxYanKbV+V49v696cHhb+CQKqIwwX1KSrS7XcCvg+JiWxHkZ3h6huTy8LQtmHVHc
 ftDSmV/DeQLEnxDhr5oypHXqNfge9ZGUQcOqCxaODFMJ5NDqHEfnrk77q+MErVi6Do+i
 Enu/qs3SbycB/e56U6bENlCYHtdPrCIiJvKyPoR/skpzlRlnovmP2n39oHg9rJTAMTsQ
 3UUkQc/xG3HTsRjA7TeLfD+BnA0kCOnHgGBSxr39jA4sZJlGD5Pacf3R9IFwAKuW9aRn
 RKiMrlj6p0cgVrYBHxgOjXTks2MfZ9YxX41v/FYsKdYtIp08eBHs+2ln1U2Ssz2tKLWV
 0tGw==
X-Gm-Message-State: AO0yUKVGQzwcME/jSZ4EytpRe4EiC7lgpXKVc63Wm2lY2HClUyuG2Aud
 hW5oX8gEbRYPfcSPwRupmEjECA==
X-Google-Smtp-Source: AK7set+7EQCDSY4lF1NxTlzO55C4gJXKZ5UPoTpj3TVQyOoTlojUpxEF5Vu/3xdr8QIeYTz6cspCPQ==
X-Received: by 2002:a05:600c:198b:b0:3df:3bd6:63e5 with SMTP id
 t11-20020a05600c198b00b003df3bd663e5mr6822647wmq.12.1675409703874; 
 Thu, 02 Feb 2023 23:35:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b003dc5b59ed7asm2021121wmq.11.2023.02.02.23.35.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Feb 2023 23:35:03 -0800 (PST)
Message-ID: <1b2e69f2-a527-2db9-d45a-3b493b6bad5e@linaro.org>
Date: Fri, 3 Feb 2023 08:35:01 +0100
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
 <4111d645-478a-e55f-60bd-4ecbef077183@linaro.org>
 <SLXP216MB00777901D3E60C271FB54E3E8CD79@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <SLXP216MB00777901D3E60C271FB54E3E8CD79@SLXP216MB0077.KORP216.PROD.OUTLOOK.COM>
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

On 03/02/2023 06:06, Ki-Seok Jo wrote:
>>>>> +  sys-clk-id:
>>>>> +    description: select the using system clock.
>>>>
>>>> What does it mean? Why do you need such property instead of clocks?
>>>
>>> This can receive an external clock, but it can use internal clock.
>>> Should I write all the clock descriptions in case?
>>
>> How do you configure and enable external clock with this property? I don't
>> see it. If the device has clock input, this should be "clocks". If it is
>> omitted, then internal clock is used.
>>
> 
> Basically, this value is set with set_sysclk in the dai operations.
> So, I also get the clk_id from this function and set it.
> From the point of view of the codec driver, there are case where the machine
> driver does not give this value(clk_id).

It's entirely different discussion. You did not document the
clocks/values for it and just wrote "select the using", so like a "bool"
property.

You need bindings documenting the clocks. Use the same name as here:
https://lore.kernel.org/all/20221022162742.21671-2-aidanmacdonald.0x0@gmail.com/


Best regards,
Krzysztof

