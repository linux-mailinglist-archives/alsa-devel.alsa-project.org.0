Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5841368A383
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Feb 2023 21:22:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5BE4823;
	Fri,  3 Feb 2023 21:21:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5BE4823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675455759;
	bh=hWnuCkylBvZ2ZCgcBHAkmiGoTfRn5uLBPRGdI5ayX28=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VeAtYTh2C7sx0Upq26WTshDTyzr62/4guiz6JUCKNFTkQXIrSJr5yUCjlEQrwqp5L
	 dT99uYGTkqi08CJEheqaCZUGl4kfweAtPUvhR/aT+V9Q83UKGISi4GfePMS+Rgl6NK
	 MUv+lJmaYoHXAkiKN1A39hYzAdccG8YabxAH1jpg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8452F8001D;
	Fri,  3 Feb 2023 21:21:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF724F80254; Fri,  3 Feb 2023 21:21:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8902BF800E3
 for <alsa-devel@alsa-project.org>; Fri,  3 Feb 2023 21:21:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8902BF800E3
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HLoFOX9M
Received: by mail-wm1-x32c.google.com with SMTP id
 f47-20020a05600c492f00b003dc584a7b7eso6804923wmp.3
 for <alsa-devel@alsa-project.org>; Fri, 03 Feb 2023 12:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m5sLjr7aYK315tj89Xz8yTzw8nhiBSznb+bT5o725x0=;
 b=HLoFOX9M38kF2qyUXFQwXqSnMduKtNxMFBrU5CvSYknJxcduZ84ZUxf/VVFfkk+dwR
 /WLjnjiBsb1y6V6GqLtfXH8j5KJDNyoWTaR76slT+yDk3LZqAJB1XDDj/ITC4vfTaEDc
 qFfA1b2qa/H9ba7GlMKHQAetHgjPTM8d4A5x2BWt0AEtogp1MPI5kISnP7fI+Rk6HQNR
 h71USPCrKliJYX5PoXeGf3p8mOTdD+tGnDRL5uvNeBQpeuYIDUzK7vnKZM0nDi3JChGc
 rML/UuG3wp30vrDrWJF1gFFn9XzjnHdc5MkgTBcQ5cZL/ZP8JUtO3UVYFG8JILgMYRMf
 2gQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m5sLjr7aYK315tj89Xz8yTzw8nhiBSznb+bT5o725x0=;
 b=Rqiq8CLTaadC4VQApzgqo2OtXOnDDyjYH3tmJ5KDj0cTkfUla7S5ds5WmOG7fTjPFD
 ZTH/JS5QsE3J/fSjaNkf+QMldcnB4DY4gWKFCDeqHSWEBFlm3LCA7+0HCCmVznkwswy4
 1Mjgx5Mt2jkCCsVEfuZh7HU7iYN6qXX0oi4jSjA7sNj0gFIkHqhkP7f5XwEqHFnpxGiM
 WuqXQaCBbiSUeHDANclHHBagqshIfjb6Q5Aiy1glRdiSIV8kCDmms2QDgECnEx05GQ82
 mIfIvjKbb56oL9m+Q4OvtSRNoDGAITcd+bNigRwu6zodOFfQjwC8+QANV7yz45/jKQsQ
 MgtQ==
X-Gm-Message-State: AO0yUKU2JeP0Fq4Fab9FBPTK0iLrpbXCkXR0x74nZYr3kdBX/8IQLXp5
 IlVnfqhu04V/RF/1/u3obb3cPA==
X-Google-Smtp-Source: AK7set8Gpfp/Oz+hFP5DrhCusCPg/cotAzMpidE7HBO1Avb+cX25jy40Vo3VZeQupr3Q20OM5Hxk4g==
X-Received: by 2002:a05:600c:444f:b0:3da:c07:c5fe with SMTP id
 v15-20020a05600c444f00b003da0c07c5femr10596494wmn.5.1675455692569; 
 Fri, 03 Feb 2023 12:21:32 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a05600c310a00b003de77597f16sm3803784wmo.21.2023.02.03.12.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Feb 2023 12:21:32 -0800 (PST)
Message-ID: <f9d9bbfc-507d-2092-6ae8-f80ab3d23bd1@linaro.org>
Date: Fri, 3 Feb 2023 21:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 9/9] ASoC: dt-bindings: meson: convert axg sound card
 control to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-10-jbrunet@baylibre.com>
 <f229e181-c56d-6ec7-2a1c-754690f70438@linaro.org>
 <1jfsbmn7ql.fsf@starbuckisacylon.baylibre.com>
 <fede7119-4a9b-76a1-ae1a-7af5dd8d1032@linaro.org>
 <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jbkmamtfg.fsf@starbuckisacylon.baylibre.com>
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

On 03/02/2023 20:34, Jerome Brunet wrote:
> 
> On Fri 03 Feb 2023 at 18:59, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 03/02/2023 15:13, Jerome Brunet wrote:
>>>>> +          Multiplication factor between the frame rate and master clock
>>>>> +          rate
>>>>> +
>>>>> +      sound-dai:
>>>>> +        $ref: /schemas/types.yaml#/definitions/phandle-array
>>>>
>>>> Old binding was saying it is just phandle
>>>
>>> It is just a phandle but the bindings used to have problem with phandle
>>> that had cells.
>>>
>>> See:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml?h=v6.2-rc6&id=d031d99b02eaf7363c33f5b27b38086cc8104082
>>>
>>> Was it wrong or did the situation change since then ?
>>
>> Then define it as having cells:
>>
>> https://elixir.bootlin.com/linux/v5.18-rc1/source/Documentation/devicetree/bindings/soc/samsung/exynos-usi.yaml#L42
>>
> 
> The card is provided with the phandle.
> Whether or not the phandle has cells or not has nothing do with card
> driver. The card just consums sound-dai. I don't understand this comment.

You said this is only a phandle. Then you have just two options - either
this is one phandle without arguments (then change it as I asked
originally) or this is one phandle with arguments (then change it to
define the arguments like in example I gave you).

Best regards,
Krzysztof

