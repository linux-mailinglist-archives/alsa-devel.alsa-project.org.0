Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3A67AD650
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 12:45:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A807AEA;
	Mon, 25 Sep 2023 12:44:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A807AEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695638740;
	bh=Z7aPqBj7L6QuaIU2uA3rSw/+Mjz7vN3CH2RjwBWNE6Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pkHZbfuIovuUkC3wFBZxvpH7Ad5I2B3vUvrTxBEX2U7AOld2+lGupMSQ/e9+0YoDb
	 NHUk0j3HJG32mCXvvWEPlAflS6FeFwBUx4sy3v3N5OyplcDKkXnxMjJ2e/sy2UccA/
	 GIlYpIEJLvjG716siu5vPRh6Y6SDn6sVg+yQK78U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9A2B1F80166; Mon, 25 Sep 2023 12:44:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C767F80166;
	Mon, 25 Sep 2023 12:44:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 949DBF8016A; Mon, 25 Sep 2023 12:44:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A68F7F8001D
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 12:44:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A68F7F8001D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=P2z6I+B+
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-533c5d10dc7so3670633a12.3
        for <alsa-devel@alsa-project.org>;
 Mon, 25 Sep 2023 03:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695638679; x=1696243479;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPKwu29nswr19PRfxmThaRgCyfVAPPnrF03AJDF6RVE=;
        b=P2z6I+B+wWDAKBfVaj3qD9/uCCLwuJvbNGZJp6uG7yTR2osVO8bBPXLMqrzZ+Cja9i
         IzgFabkira9RI1drqhk9m4d+8abxWAcsAdbJEpyjQiLclGD6t6XjHX7BKOuUJIKYjN+L
         9PPTwq/u1H3Hxr1uRaZ1XNNk8oLq5HwlEjk9qDVsql547J8v09PeE3uEndddjlGa4/6/
         KKlbBgCM++/s4f+/94KhGE046Jq8MO8JaaaOunTdolfFqpPJ6Q/s/JaNkx1C3MQSRmx+
         5O8XUQ1yv7b+7+uraPD7BwbmeQQ4sx2GLQbMVSIdDXeZQZKNJ0m/xoNSp1mEVW09iBKu
         jnWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695638679; x=1696243479;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YPKwu29nswr19PRfxmThaRgCyfVAPPnrF03AJDF6RVE=;
        b=XCaaVOsrel+y0xHkrzzcjRgwTu/XKl25to1R9ugU9INqUDQ1Z7V2PMrFlTuRHMb9CV
         H3XebibHE9a+AhbIdosyf/0WDd4UtzaaA6TaMOS30lDJXOtLi4p8DtAA/xtR0+L6yZi9
         Qclh6mOf8DhbUM5UWH9xcnkqRTABe55mbWX4mNh7FekS5HmC5tRwvnLqAVJHdMLsSuwn
         Em5spluOXhs3sjE/1vXP1+hNDclhElrUJaufWUnP8tsmX4u3LBpBaFlt2iKXb8f51GQz
         josVMPUId2TkgxH2eej2IIdDuG3jJlbE0A24xWfDtjwTUG9xmYC6pIRQeQtOBPUJKB6G
         w8zA==
X-Gm-Message-State: AOJu0Yz7wC/T9yErNZVJQwtG/YmHYzYumtezmZxfCfNdLhwORGvNWp0y
	xbQv0+h0eHcBOXc7Aa8AUdxrMA==
X-Google-Smtp-Source: 
 AGHT+IFdMo5I5c373VJKI1Qiq+6RT/IKdTELM18C3QX5YTHa873Vh8IoMEaubO6qaZj1vsmpa+IZ6Q==
X-Received: by 2002:a05:6402:b5b:b0:533:d1cd:62c5 with SMTP id
 bx27-20020a0564020b5b00b00533d1cd62c5mr3976542edb.17.1695638679365;
        Mon, 25 Sep 2023 03:44:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id
 l14-20020aa7cace000000b0053331f9094dsm5356947edt.52.2023.09.25.03.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Sep 2023 03:44:38 -0700 (PDT)
Message-ID: <e02ebde7-f208-40a4-bb10-aa5962ee9864@linaro.org>
Date: Mon, 25 Sep 2023 12:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Add
 support for QMC HDLC
Content-Language: en-US
To: Herve Codina <herve.codina@bootlin.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Qiang Zhao <qiang.zhao@nxp.com>,
 Li Yang <leoyang.li@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Simon Horman <horms@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20230922075913.422435-1-herve.codina@bootlin.com>
 <20230922075913.422435-9-herve.codina@bootlin.com>
 <5efae150-3d92-81b8-5c25-68846d27132e@linaro.org>
 <20230925101703.1bf083f1@bootlin.com>
 <5b804a1a-6bfd-429d-ad84-696b7ecef72d@linaro.org>
 <20230925122758.43963736@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20230925122758.43963736@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UOKZICQ3HNSXPKANCJJQMJBU3HL2QA4T
X-Message-ID-Hash: UOKZICQ3HNSXPKANCJJQMJBU3HL2QA4T
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UOKZICQ3HNSXPKANCJJQMJBU3HL2QA4T/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/09/2023 12:27, Herve Codina wrote:
> On Mon, 25 Sep 2023 10:21:15 +0200
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 25/09/2023 10:17, Herve Codina wrote:
>>> Hi Krzysztof,
>>>
>>> On Sat, 23 Sep 2023 19:39:49 +0200
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>   
>>>> On 22/09/2023 09:58, Herve Codina wrote:  
>>>>> The QMC (QUICC mutichannel controller) is a controller present in some
>>>>> PowerQUICC SoC such as MPC885.
>>>>> The QMC HDLC uses the QMC controller to transfer HDLC data.
>>>>>
>>>>> Additionally, a framer can be connected to the QMC HDLC.
>>>>> If present, this framer is the interface between the TDM bus used by the
>>>>> QMC HDLC and the E1/T1 line.
>>>>> The QMC HDLC can use this framer to get information about the E1/T1 line
>>>>> and configure the E1/T1 line.
>>>>>
>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>> ---
>>>>>  .../soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml      | 24 +++++++++++++++++++
>>>>>  1 file changed, 24 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>>>>> index 82d9beb48e00..61dfd5ef7407 100644
>>>>> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
>>>>> @@ -101,6 +101,27 @@ patternProperties:
>>>>>            Channel assigned Rx time-slots within the Rx time-slots routed by the
>>>>>            TSA to this cell.
>>>>>  
>>>>> +      compatible:
>>>>> +        const: fsl,qmc-hdlc    
>>>>
>>>> Why this is not a device/SoC specific compatible?  
>>>
>>> This compatible is present in a QMC channel.
>>> The parent node (the QMC itself) contains a compatible with device/SoC:
>>> --- 8< ---
>>>   compatible:
>>>     items:
>>>       - enum:
>>>           - fsl,mpc885-scc-qmc
>>>           - fsl,mpc866-scc-qmc
>>>       - const: fsl,cpm1-scc-qmc
>>> --- 8< ---
>>>
>>> At the child level (ie QMC channel), I am not sure that adding device/SoC
>>> makes sense. This compatible indicates that the QMC channel is handled by
>>> the QMC HDLC driver.
>>> At this level, whatever the device/SoC, we have to be QMC compliant.
>>>
>>> With these details, do you still think I need to change the child (channel)
>>> compatible ?  
>>
>> From OS point of view, you have a driver binding to this child-level
>> compatible. How do you enforce Linux driver binding based on parent
>> compatible? I looked at your next patch and I did not see it.
> 
> We do not need to have the child driver binding based on parent.

Exactly, that's what I said.

> We have to ensure that the child handles a QMC channel and the parent provides
> a QMC channel.
> 
> A QMC controller (parent) has to implement the QMC API (include/soc/fsl/qe/qmc.h)
> and a QMC channel driver (child) has to use the QMC API.

How does this solve my concerns? Sorry, I do not understand. Your driver
is a platform driver and binds to the generic compatible. How do you
solve regular compatibility issues (need for quirks) if parent
compatible is not used?

How does being QMC compliant affects driver binding and
compatibility/quirks?

We are back to my original question and I don't think you answered to
any of the concerns.

Best regards,
Krzysztof

