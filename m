Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0264089180A
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Mar 2024 12:43:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 453382CA0;
	Fri, 29 Mar 2024 12:43:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 453382CA0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711712590;
	bh=y/SaY+u1pEgNGCi6MUxKlTpmPE4APyW+ssQJ4Ciw8Tg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pClJc4zgGH1Tmb51ZmXC+uLzIbrO84nnZGYMunQ55U5+zOf3AUdaEmw3MVmIB2WyO
	 zw8VnhXHsK26SAEd6o1EXJMCBKnBC+Vk5KYcli/dA+QGkp4cYb1HbV0FYpnR8LGhwb
	 RnGq9pyz6HMHaT6R/Fs1OYCsrHAforzEtdhytJLM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CBAFF805AE; Fri, 29 Mar 2024 12:42:38 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABE8F80580;
	Fri, 29 Mar 2024 12:42:38 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FF01F802DB; Fri, 29 Mar 2024 12:42:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F5D4F801D5
	for <alsa-devel@alsa-project.org>; Fri, 29 Mar 2024 12:42:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F5D4F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=V92j9+yO
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3416a975840so1451707f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 29 Mar 2024 04:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711712545; x=1712317345;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LUalL55AIOU3mZ2WBYhdqf1hXqkUUSaMPr9AFBYthp0=;
        b=V92j9+yOjTPzT2nk2WdSSIyI9VHuRc0xV52L9SGhtN+asZm+I9FVvP39bhMUtwFrti
         A0zdFPnL2NpnPlcLV8nHOIv3B87oJsmZskE0hUYjHwBt3fHd4OY1EBl/ajHmm/kS4BS/
         vm0wi8yypyrKGKGF2NMjJwBwUtKDYW/WmIFtDS6Sppebwulw8btefL30aDc7H4Je1lbB
         /ysaiv9nLNHDlH9cOs2D+gFGtyY8rlmOqIMjCbnyj8H+UpWGnGA0+IottvJL2BjUe+wC
         rbX60yY1Zane+5N7oueiYMZkw85iDvHB9F3fuCHNwv5uotserpAaGT2mWMZ1XtHH7LUr
         l+tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711712545; x=1712317345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUalL55AIOU3mZ2WBYhdqf1hXqkUUSaMPr9AFBYthp0=;
        b=bhV2v/wnqIGmuYjteUW0Id4oWoThkAJ4Tnjrp6KZ0DqrZ3TkNlSDv05SBYQzsoMVa9
         69UdvVJFACYjcn28/wW4f9tASgW1K3HcMR+ru5yt467xCSRCuM47ks+Q2z3EbdHoNlSt
         PW8IPYlPHgR4pw/kO5USUIipAvyNe9eTrJ1aR+wKFoYkB16xAEBSMCUa6KkjKSfmFlyi
         +XbPnAh/bDNFcCUFSKmJzKEUdpSyKjDB8DMKxsvhD6uXj6lCXXnOPCpbu53p6LRZ7tET
         x7Z5ZBEk0ckNtEu9VxMBGf+jdir1VIYfwgk1a3UbWmRhRuHXmKXrSYGMGXONWqVEZ5kl
         yl2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqC3rxkECad4+u9BR5vwekyXG0c+FRhEUcfsuv9+m+S2LZ6uMR2vtvKBZl6x+lUAkvsK3wqDtjnv3u+C5eGQQg0IEFHn4qKbM/R80=
X-Gm-Message-State: AOJu0YylXYuQkamjCEToe1JmkazUZC6eUBbgl8+JeBL39B0BBxMuaetO
	+px/f1mOi9SudqUE+VG9ze1yo6M51M2UjlRPIV4f5kPm3xOq3Z9vtHUI2QOLKNw=
X-Google-Smtp-Source: 
 AGHT+IGiSqosCnBLAMcTvY/nyHiT3FMi0hle+9O+953imMzmRvuMPiWLGfCeGlXx9/PYkG8xxDuBMQ==
X-Received: by 2002:adf:e8c8:0:b0:342:37da:30ab with SMTP id
 k8-20020adfe8c8000000b0034237da30abmr1132186wrn.3.1711712544978;
        Fri, 29 Mar 2024 04:42:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.50])
        by smtp.gmail.com with ESMTPSA id
 e1-20020adff341000000b0033dd2a7167fsm3992730wrp.29.2024.03.29.04.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Mar 2024 04:42:24 -0700 (PDT)
Message-ID: <7b4a35d0-6764-4c6a-9f1d-57481324c680@linaro.org>
Date: Fri, 29 Mar 2024 12:42:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOWbnuWkjTogW1BBVENIIHYyIDEvMl0gQVNvQzogZHQtYmluZGlu?=
 =?UTF-8?Q?gs=3A_Add_bindings_for_Cadence_I2S-MC_controller?=
To: Xingyu Wu <xingyu.wu@starfivetech.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>
References: <20240320090239.168743-1-xingyu.wu@starfivetech.com>
 <20240320090239.168743-2-xingyu.wu@starfivetech.com>
 <9d9efb8a-0b3c-4e7a-8673-07cd3b1f5f87@linaro.org>
 <NTZPR01MB0956BD6189974378958562D99F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <9b1a5100-8536-4b59-b2e7-d6ebd2ba9e66@linaro.org>
 <NTZPR01MB0956230296D881F112F92D119F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
 <16f72b4a-2aa9-49d5-a4aa-ed94eea1f32a@linaro.org>
 <NTZPR01MB09563633F5C3B5FBC95D61289F3AA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <NTZPR01MB09563633F5C3B5FBC95D61289F3AA@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: VKOSYHLEAZRE6TZBGHNENULPRHP5GM24
X-Message-ID-Hash: VKOSYHLEAZRE6TZBGHNENULPRHP5GM24
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VKOSYHLEAZRE6TZBGHNENULPRHP5GM24/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 29/03/2024 04:56, Xingyu Wu wrote:
>>> I want to keep the original IP compatible which can distinguish from the JH8100
>> SoC.
>>> Can I write it like this:
>>> compatible:
>>>    enum:
>>>           - starfive,jh8100-i2s
>>>    const: cdns,i2s-mc
>>>
>>> and I write this in the DTS:
>>> compatible = "starfive,jh8100-i2s", "cdns,i2s-mc";
>>
>> Can you provide any rationale for this? I asked "unless you have other
>> arguments", so where are the arguments?
>>
>> Nothing was explained in patch changelog. Nothing was provided in this email
>> thread.
> 
> I don't know if I understood what mark said[1]. Is it to keep the original IP and
> add other compatible?
> 
> [1] https://lore.kernel.org/all/27155281-573c-493d-96fe-1f28ebb0ce5e@sirena.org.uk/
> 

I stated and I keep my statement that such block is usually not usable
on its own and always needs some sort of quirks or SoC-specific
implementation. At least this is what I saw in other similar cases, but
not exactly I2S.

Therefore I think fallback is not usable here, thus please use only
starfive compatible. Drop the fallback. It could be added in the future
if I am proven wrong. If you think that fallback is usable alone, please
bring some real life case.

> Or should I only keep the compatible 'starfive,jh8110-i2s' and change the
> bindings name to same to this compatible?

Filename could be cdns,i2s-mc.yaml, assuming that's the name of original
IP block.

...

>>>>
>>>
>>> But this I2S can only use either DMA or interrupts.
>>
>> Just like many other components. DTS should reflect hardware. Hardware has
>> interrupts and DMA, right?
> 
> Yes. The hardware can use interrupts and provide the handshake interface of
> DMA to DMA controller. In software, we can choose only one between them.
> Do I keep them both in the bindings and provide the selection in the driver?

Yes.

Best regards,
Krzysztof

