Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2286C7018F2
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 20:06:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56633E8C;
	Sat, 13 May 2023 20:05:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56633E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684001199;
	bh=/EpstFiYFWCtSQtWSXv+kfASyWhRptwHRot9pcrhmVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hvj+f/Padip0gj10NLZX3NX6p+s7N4MHaNd9tazJiDwKM2Zd+D4ShSWPAXRMooQZD
	 HGsJgRifhRsPILibkauNTB2eanEGUvbQPJvkV706bxtvcT2NDGvcHg04tRihzW4NNj
	 YGzxTsBgAFTkdw9z9uwQ1wU/qasGKGUmsPPJybvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BDAA4F802E8; Sat, 13 May 2023 20:05:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48494F8032D;
	Sat, 13 May 2023 20:05:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 123EBF80534; Sat, 13 May 2023 20:05:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 987F6F8014C
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 20:05:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 987F6F8014C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=wEKkAyeW
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-965c3f9af2aso1701879166b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684001137; x=1686593137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VORmC64siVlBa/0lsts3YfZ0fyyp1pGdpaqv6LESwso=;
        b=wEKkAyeWa52ws3iAGnzglLlKlS3zlbpBZ4QgIsfT3pJDn0B03VxbK080SEDVumngKN
         Xdr9wix17dCRN5YoJMGYMo9kqgtQ2fzH6cI3wGX8OqNuDjaNMfijfLhE/b6Dn4BlVtAd
         KBHNxbh78/fNEK4gw7Wme7nVqhR7+9muiraIOzH9ojNzoL6HSTuIpRbK9C+H6ivxaeou
         J2tAWi2B644hS5Pr8BPft2de8uC2ffIWcP7T9KmksbbXtaQ8Q07Ud6vjttKqWNL8V2x1
         8fhBBGRKKjTaegm/1Ns61Ea/dl93XMKRuTunMW/0vUBHFb5DFhnYIWQVu3Nk2Kt0fns+
         4m/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001137; x=1686593137;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VORmC64siVlBa/0lsts3YfZ0fyyp1pGdpaqv6LESwso=;
        b=Feyj+mxVLdzAknx98cfRSweiJipypFO/y8J2gRHZtPO6kVRA4MlVPxKazfQv/a2JjQ
         9cPfoFWbT8aFmMuxjs2c/jnuRT0XQkW0f7sCgqh8wFUaZQV0bevKRAwCXP2J/wr626/a
         i/MXlC9aPvvHr8zpEJZS7wmDf/mcy0P6manx0dE6yrCYIiZuCZuQVQgsY7iqPa5xNBg7
         K5tcPNGRCPl2u35nV1C0iXm4/9578YxWwtudNcYY+8yrxbijqPN9VQ6ciNlvbgHk99HT
         FAkNk5C2aUD6NbNmy0fcoKwLOiCGrqGgz26PjjAHg98RhbiGacm9Icdc0OcsoIQvANqg
         hRYw==
X-Gm-Message-State: AC+VfDzDKaj8H5TcczgOvl0T+TAlyzOcVHaMSoLchDmjwRD9J3aFLfpw
	YCHcWHVgjY612/MLw84IN5q9lg==
X-Google-Smtp-Source: 
 ACHHUZ456NqFDsI+SzfZLKpEWQ+eDqx16S3lEUJwP8MVzdzMH2X2yE1vj8bXjIo/Mqxrqh0ozu1OcA==
X-Received: by 2002:a17:907:6295:b0:94e:cbfb:5fab with SMTP id
 nd21-20020a170907629500b0094ecbfb5fabmr27362822ejc.75.1684001137121;
        Sat, 13 May 2023 11:05:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4?
 ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id
 hx7-20020a170906846700b00965a4350411sm6962208ejc.9.2023.05.13.11.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:05:36 -0700 (PDT)
Message-ID: <015c5208-ac85-8a14-3455-c70781fd92f8@linaro.org>
Date: Sat, 13 May 2023 20:05:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 05/10] dt-bindings: mfd: cirrus,cs42l43: Add initial DT
 binding
Content-Language: en-US
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lee@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, tglx@linutronix.de,
 maz@kernel.org, linus.walleij@linaro.org, vkoul@kernel.org,
 lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
 sanyog.r.kale@intel.com, pierre-louis.bossart@linux.intel.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230512122838.243002-1-ckeepax@opensource.cirrus.com>
 <20230512122838.243002-6-ckeepax@opensource.cirrus.com>
 <25c92476-7bca-90c4-9130-cb765495a783@linaro.org>
 <20230512161545.GL68926@ediswmail.ad.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512161545.GL68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: T5SCBHZRDS2OO6BYXB43TB5SJ7H4Q46N
X-Message-ID-Hash: T5SCBHZRDS2OO6BYXB43TB5SJ7H4Q46N
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/T5SCBHZRDS2OO6BYXB43TB5SJ7H4Q46N/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/05/2023 18:15, Charles Keepax wrote:
> On Fri, May 12, 2023 at 05:23:22PM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2023 14:28, Charles Keepax wrote:
>>> +$id: http://devicetree.org/schemas/mfd/cirrus,cs42l43.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cirrus Logic CS42L43 Audio CODEC
>>
>> That's audio codec, so it should be in sound, not MFD.
>>
> 
> Is this true even despite the device being implemented as an MFD?

Implementation in Linux almost does not matter here. Bindings location
match the device main purpose. We indeed stuff into MFD bindings things
like PMIC, because PMIC is a bit more than just regulators, and we do
not have here subsystem for PMICs. If you call it Audio Codec, then I
vote for sound directory for bindings.

> I am happy to move it, and will do so unless I hear otherwise.
> 
>>> +  - VDD_P-supply
>>> +  - VDD_A-supply
>>> +  - VDD_D-supply
>>> +  - VDD_IO-supply
>>> +  - VDD_CP-supply
>>
>> lowercase, no underscores in all property names.
> 
> I guess we can rename all the regulators to lower case.
> 
>>> +additionalProperties: false
>>
>> This order is quite unexpected... please do not invent your own layout.
>> Use example-schema as your starting point. I suspect there will be many
>> things to fix, so limited review follows (not complete).
>>
>>
>> Missing ref to dai-common
> 
> Apologies for that I was a little hesitant about this but this
> order did make the binding document much more readable, the
> intentation got really hard to follow in the traditional order. I
> guess since I have things working now I can put it back, again I
> will do so unless I hear otherwise.

The additional/unevaluatedProperties from child nodes are indeed moved
then up - following the property:
   pinctrl:
     type: object
     additionalProperties: false

but that's exception and for the rest I don't see any troubles with
indentation. That would be the only binding... so what's here so special?

> 
>>> +  pinctrl:
>>> +    type: object
>>
>> additionalProperties: false
>>
> 
> Can do.
> 
>>> +
>>> +    allOf:
>>> +      - $ref: "../pinctrl/pinctrl.yaml#"
>>
>> No quotes, absolute path, so /schemas/pinctrl/....
>>
> 
> Can do.
> 
>>> +
>>> +    properties:
>>> +      pin-settings:
>>
>> What's this node about? pinctrl/pinctrl/pins? One level too much.
>>
> 
> codec/pinctrl/pins
> 
> The device is a codec, so the main node should be called codec,
> then it has a subnode called pinctrl to satisfy the pinctrl DT
> binding.

Sure, but then you do not need pin-settings. Look at Qualcomm bindings
for example:

Documentation/devicetree/bindings/pinctrl/qcom,sm8550-tlmm.yaml

Best regards,
Krzysztof

