Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F41DC88BAB6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Mar 2024 07:47:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B10D22C8;
	Tue, 26 Mar 2024 07:46:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B10D22C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711435627;
	bh=wy+qyXverh7nieHFb0hqrqF24NYE5GQnRrosS8PFLgA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kkhj81U6rzqQguefMbYdmSFR5br/rf92GMZbx9tPJziSys7MFqPDtGuyWOqRDh39j
	 njcD4PvgWBlrpWRVz+/UP5RuwnGw/7HqHiFCe8lJ9jJDMQ19J2y4qAoI+vHXMYoWDH
	 GnrkHDU1u3i3l+opFwqQvIWGlVmSp+bAnBhWeg8s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B3B03F80589; Tue, 26 Mar 2024 07:46:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 110F8F802DB;
	Tue, 26 Mar 2024 07:46:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A37E7F8025F; Tue, 26 Mar 2024 07:46:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7DB49F801D5
	for <alsa-devel@alsa-project.org>; Tue, 26 Mar 2024 07:46:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DB49F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qn4M9U2X
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-56c29599e0cso394730a12.0
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Mar 2024 23:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711435562; x=1712040362;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BqkpkBz51uO0Tg187W87yjDd9hVH6SR23SGC1N0DFeQ=;
        b=Qn4M9U2XQy7//WQVDF0h5mOgSsv2vmPAtsMGKS/j0piLGZrs2mKRFZeszT5fcIpEBm
         j6cMmZ1kBBSq6Wkxnrhv7tr3x02ANw2ex5UnPvwqp9IAWblQDNa4jfwzTGxeJHtB/Wrc
         SNomPF9WpmhH1oKUeOSO/yFr/gmtM1mKpfiV0E8cqGMXqCaRASs4wIeXjIjtfmhRMKKy
         vfN0xacwI3mxHBsusJnemrHadWTepVcp18ZGRWn2AxSEuNuuKTYK70YnSFv/16x/csiP
         urYHYdUM3A4HcjDtMfeoyUyMZAaTwqHbKnFQgih96UHzWuFz2MifH7hQB3Bl4/2hnpsx
         HdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711435562; x=1712040362;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqkpkBz51uO0Tg187W87yjDd9hVH6SR23SGC1N0DFeQ=;
        b=PZ2diyB/3cDcMXdbHble6SDIJCYqg5hn8oeNfMwEwHc2TJA4K2gk/nsSNoQfVUhSan
         jSZquyZ4uDg8Z5QKA6l5tJCVHpJuHJ25FjUC2hMsyho2jGuerENKuf0GlcOrikwWwxgJ
         wCRkoMD4KuaDUbA0SJGt9xnq2v5YP7dMWu/JBZeSaeCHNnkcWNIgSFGJ9VaDBpNL8kP7
         +zzpQp5mZj7dShsngefwAVfO2Mv3FUeyQl/d4t+v7O3KnT8Mn+zwkf8RNy4sPOzQaWDb
         sFVoei81PTB19gOsKCfnSiTuDJZYmrCN0kK4rD6MmLZDg+roew19MorfN6ELrEw54Uv6
         Nqpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3GcpeOWC9Cqz50q+gsF+3U9cRbVtnx79wACq/9bMC+IqV7xrjHfOIUGgJsmeN5zwXmGln0aTzmWxmeUj/2EpPFAbJAEb6dVOSg7I=
X-Gm-Message-State: AOJu0YylX8oKAF20jwZiw0rpKmZ4V+ZxaxpzO3fj1pvVC9tStQeSQWBh
	RRhpffOYuP+FZF72Cj42f6UtIRmyfVzKIxm6c24HZJGqEhFbrvvopCJ7RKIj0ao=
X-Google-Smtp-Source: 
 AGHT+IFYH3K+0oaZNzgvZCZBD0SnYiC/s7JItomLcijD+Xhmot7Z1YK+O39UP7P5ARcxq70+D9xC2A==
X-Received: by 2002:a17:906:1194:b0:a46:ac10:1cde with SMTP id
 n20-20020a170906119400b00a46ac101cdemr1114377eja.45.1711435562385;
        Mon, 25 Mar 2024 23:46:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id
 c22-20020a1709060fd600b00a4dacd6b8b3sm947334ejk.68.2024.03.25.23.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Mar 2024 23:46:01 -0700 (PDT)
Message-ID: <9b1a5100-8536-4b59-b2e7-d6ebd2ba9e66@linaro.org>
Date: Tue, 26 Mar 2024 07:46:00 +0100
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <NTZPR01MB0956BD6189974378958562D99F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: REOUPE66KT3KUP6F5LFVKB2LKRGO2YGV
X-Message-ID-Hash: REOUPE66KT3KUP6F5LFVKB2LKRGO2YGV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/REOUPE66KT3KUP6F5LFVKB2LKRGO2YGV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/03/2024 07:29, Xingyu Wu wrote:
>>
>> On 20/03/2024 10:02, Xingyu Wu wrote:
>>> Add bindings for the Multi-Channel I2S controller of Cadence.

Your email app responds very weird. You bypassed all possible filters
and it is simply not visible that you answer to me. You Reply to
everyone, not to me with Cc to others. There is no standard header whom
do you quote, e.g. "On 26/03/2024 07:29, Xingyu Wu wrote:"

Please use some decent email system, otherwise I will miss all replies
from you.

>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - cdns,i2s-mc
>>
>> Why did this appear? Who asked for this? Usually these blocks are not usable on their
>> own.
> 
> I wonder if I should keep the original IP compatible. Do I not need it?

As I said, it is not usable on its own, so unless you have other
arguments then no. But my point was that no one asked for this.

> 
>>
>>> +      - starfive,jh8100-i2s
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    description:
>>> +      The interrupt line number for the I2S controller. Add this
>>> +      parameter if the I2S controller that you are using does not
>>> +      using DMA.
>>
>> That's still wrong. You already got comment on this. Either you have interrupt or not.
>> You do not add interrupts, based on your choice or not of having DMA. Drop the
>> comment.
> 
> Do I keep this property and drop this description?

Drop description. Keep property, if your hardware has interrupts.

...

>>
>>> +  - compatible
>>> +  - reg
>>> +  - clocks
>>> +  - clock-names
>>> +  - resets
>>> +
>>> +oneOf:
>>> +  - required:
>>> +      - dmas
>>> +      - dma-names
>>> +  - required:
>>> +      - interrupts
>>
>> This won't work. Provide both interrupts and dmas, and then test your DTS.
> 
> I provided both properties in the DTS and test by dtbs_check. Then it printed that:
> 'More than one condition true in one of shema: ...'

Exactly. Having both properties is a correct DTS. Interrupts do not
disappear just because you decide to describe DMA. It is OS choice what
to use if both are provided.



Best regards,
Krzysztof

