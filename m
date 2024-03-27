Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C2988D5C3
	for <lists+alsa-devel@lfdr.de>; Wed, 27 Mar 2024 06:13:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 975322BE8;
	Wed, 27 Mar 2024 06:13:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 975322BE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1711516392;
	bh=IJHWOnTINFpZXZ9g/2/P87Myf9jBqm+cXzXz94G2KlE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ly8E/Z5+YWf8mY+mNEVSWiUQPtXYgK6fyveBfhb4EMmii/vqPXQLOSWujt2FIPx2d
	 t1U5SOSgcy5j93NisOEvTiTWhA8SGt/DeNz7CRFVp+Nv2uuAitaok8iPVz2gGqn6kP
	 qU29uoI+9RGk4U0ZpuuM5phFFQrFBikfcgT4S7Xk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4355FF80589; Wed, 27 Mar 2024 06:12:41 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3FF6F805A0;
	Wed, 27 Mar 2024 06:12:40 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71AD8F8025F; Wed, 27 Mar 2024 06:12:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6329DF80074
	for <alsa-devel@alsa-project.org>; Wed, 27 Mar 2024 06:12:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6329DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=yY1kjnlI
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a470d7f77eeso796415766b.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Mar 2024 22:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711516341; x=1712121141;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwtti/peMihUTMyAzlCIGMLulrpmjqLQzU4QpF2mNKU=;
        b=yY1kjnlIOR+gvGnEAFjTwVqkPwIEqISUXUVBgjjFFLpy46K6qjz6NPu9+egQbfjpM/
         HSypx9UCa8tqCYfoVvzfX7XPfZE76hLv2a6+E++rBSp48XfsKqJ9KKQ8t6na7vtiq4/E
         WB7ySZJycJq9sf71R5U4TGLOdahvElpgCFyfX/ZK7Fie+Jm1VFyUmysKwMYsZv0lwbxA
         HrvlyGj+o6p9pQnNjKwGzAxOV1Xi1NClqboV+JnEFSYs1pvWkOC9kf8tH/+u1ikrmrSS
         Y3jTSEX/urB2LVUbdCyW3+MsqNvGyTV/bLOOR7WBbJhvsrN4e/i9GSElDxfdbIwPg4S1
         bOJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711516341; x=1712121141;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dwtti/peMihUTMyAzlCIGMLulrpmjqLQzU4QpF2mNKU=;
        b=o/8p9jeF0/EdweGZh+KbFQ8qLGAAhxTo0cCkGgn//WbkfXErd3C67yfvc9B56ray0D
         ZTphxK7WoHcvGdJ02Th0bzNgrv51PXgTNn3HPsYGRx5d1LJFRsbicBKW9vD067tDxV8z
         jowEhMvrdzz7LmuKeQpY1A34qlryfX+Zyy/xadLpu7joMw1ydvzeFmWXHDW3hMohxTjK
         VMBfLTRXEWkZlNLG/L9iFoYxNZYZt7eLW3iu84QacVWBcAnqJjGj67l0fJUEq0XcR9w8
         wHDYQGEsRJmM6Go2JVvHenN3YwdcNtIAfvQSjLHfJR22kkOTig3/uQZZL6fAehgslCCk
         H8KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWgVPD0wmgLZjvaHdEd15QMfCmXg3Bj8HphG4+2geYiXuMTKaYmI6/V0NBYK/fA1GKeyDtCVKmczLfQuvdHgERYvzKwKyUUSN/PQY=
X-Gm-Message-State: AOJu0Yzink1duoCC1AD9MBJ1x0JNiArU6DgtQFfHq5kv+qvgp/8SYGmy
	qvh2JAP4xNYLi0VF2WNQLVr5RjjbPPBoAR02xbWexibLcMt/3Lx4F3eX7SWNsQVUqK5DpRaghdi
	R
X-Google-Smtp-Source: 
 AGHT+IElJpw3yCm9S4l81YiCAYTFbqQcMEaxlCe/Y/vun3hBezNkXoQkI96UNC8LRjTdHliw/4EueA==
X-Received: by 2002:a17:906:dfd7:b0:a46:f6fc:1fda with SMTP id
 jt23-20020a170906dfd700b00a46f6fc1fdamr92944ejc.20.1711516340821;
        Tue, 26 Mar 2024 22:12:20 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.44])
        by smtp.gmail.com with ESMTPSA id
 kq1-20020a170906abc100b00a46a04d7dc4sm4957769ejb.61.2024.03.26.22.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 22:12:20 -0700 (PDT)
Message-ID: <16f72b4a-2aa9-49d5-a4aa-ed94eea1f32a@linaro.org>
Date: Wed, 27 Mar 2024 06:12:18 +0100
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
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: 
 <NTZPR01MB0956230296D881F112F92D119F35A@NTZPR01MB0956.CHNPR01.prod.partner.outlook.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 6ZMFRXKA4O44CR44NH4H2WUGOBESIAUA
X-Message-ID-Hash: 6ZMFRXKA4O44CR44NH4H2WUGOBESIAUA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6ZMFRXKA4O44CR44NH4H2WUGOBESIAUA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 26/03/2024 14:43, Xingyu Wu wrote:
>>>>> +
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    enum:
>>>>> +      - cdns,i2s-mc
>>>>
>>>> Why did this appear? Who asked for this? Usually these blocks are not
>>>> usable on their own.
>>>
>>> I wonder if I should keep the original IP compatible. Do I not need it?
>>
>> As I said, it is not usable on its own, so unless you have other arguments then no.
>> But my point was that no one asked for this.
> 
> I want to keep the original IP compatible which can distinguish from the JH8100 SoC.
> Can I write it like this:
> compatible:
>    enum:
>           - starfive,jh8100-i2s
>    const: cdns,i2s-mc
> 
> and I write this in the DTS:
> compatible = "starfive,jh8100-i2s", "cdns,i2s-mc";

Can you provide any rationale for this? I asked "unless you have other
arguments", so where are the arguments?

Nothing was explained in patch changelog. Nothing was provided in this
email thread.

> 
>>
>>>
>>>>
>>>>> +      - starfive,jh8100-i2s
>>>>> +
>>>>> +  reg:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interrupts:
>>>>> +    description:
>>>>> +      The interrupt line number for the I2S controller. Add this
>>>>> +      parameter if the I2S controller that you are using does not
>>>>> +      using DMA.
>>>>
>>>> That's still wrong. You already got comment on this. Either you have interrupt
>> or not.
>>>> You do not add interrupts, based on your choice or not of having DMA.
>>>> Drop the comment.
>>>
>>> Do I keep this property and drop this description?
>>
>> Drop description. Keep property, if your hardware has interrupts.
>>
> 
> Will drop.
> 
>> ...
>>
>>>>
>>>>> +  - compatible
>>>>> +  - reg
>>>>> +  - clocks
>>>>> +  - clock-names
>>>>> +  - resets
>>>>> +
>>>>> +oneOf:
>>>>> +  - required:
>>>>> +      - dmas
>>>>> +      - dma-names
>>>>> +  - required:
>>>>> +      - interrupts
>>>>
>>>> This won't work. Provide both interrupts and dmas, and then test your DTS.
>>>
>>> I provided both properties in the DTS and test by dtbs_check. Then it printed
>> that:
>>> 'More than one condition true in one of shema: ...'
>>
>> Exactly. Having both properties is a correct DTS. Interrupts do not disappear just
>> because you decide to describe DMA. It is OS choice what to use if both are
>> provided.
>>
> 
> But this I2S can only use either DMA or interrupts.

Just like many other components. DTS should reflect hardware. Hardware
has interrupts and DMA, right?

> 
> Can I use the config (like SND_SOC_CADENCE_I2S_MC_PCM)  to choose DMA or
> interrupt if having both them in DTS?

Don't know, I tend to focus here on bindings.

Best regards,
Krzysztof

