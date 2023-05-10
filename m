Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F8E6FD88E
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 09:50:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C38A01056;
	Wed, 10 May 2023 09:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C38A01056
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683705012;
	bh=0iFT0ayBFszJQ345SP80d4p4Ju6hYbv7GIJBWwRxOlo=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A+a3EvB3coxMs82u+QD+b2rE+z8iLyk3ZYBWfVvGtC6cTmuzNZ+W7KVjVI3RqvFiW
	 EiJ9V4K/BqSCfUQq/gesHBpPs97wnCApkLXhLYKtGdmMWwpnNyALdiy1YfJ7poJoqk
	 FZJ0HL7c56T2uSE/wQ9aXOR9GTdUGzTswid2nG4M=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB6AEF80548;
	Wed, 10 May 2023 09:48:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D60EFF80549; Wed, 10 May 2023 09:48:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4B46DF8053D
	for <alsa-devel@alsa-project.org>; Wed, 10 May 2023 09:48:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B46DF8053D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=LjYApUNy
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-965f7bdab6bso1063464266b.3
        for <alsa-devel@alsa-project.org>;
 Wed, 10 May 2023 00:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683704918; x=1686296918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LTnCh6R2977sWOSYvBVeAThbB6LN/VUq0y/VvleozI=;
        b=LjYApUNyA75roTFOe6acev02+XGsgesQAoaeso8F0QC6chQiAfZ70LKS2yBGCgGxkc
         5aasKOej1EL2H6X8FB4+93FS0hf584Q9mdZcnjpwVf4CrMHgwMbMKwRqfQR+vIjDHbod
         f1OPIpGk73zoc/T+e29iAkoNuIg0cYhCzA9IK+6v9MCTRO4g/Mr8qkQ2rm/SAl8efw60
         pHYJ4ThIS/S8JYwOd4vfU6byfN4abLxQcaaVe9g+lTkxxWgnel3VDFf4Ms6/Nn1Vs0vT
         01iIfozNouWjaeRYfc8RdO/J5lUh2gVJupapVgOC98ZtHn/AdTI3wGeJ2Z50rqUOavIx
         ILXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683704918; x=1686296918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/LTnCh6R2977sWOSYvBVeAThbB6LN/VUq0y/VvleozI=;
        b=VnPD15S8ymNvNiY2uAIRIUHm4FJG4LIbwCdJjxycKOIMl2AAeJ5B1aeza0wCfywSCG
         OZYwdHcaMuivQawusszSnht4wwPg8QHNbJLgtv+urqN2AC7d4DogLv/fxg6Z2znB+fA2
         y5z7dJNsir65BDhifcqjFPnv2rMWEt1+KyXUB1wifi3FxHcVPuPJNHT+z/3c6CglbaBl
         Ll1TJ43Ypk5hJwNvm9b32Gimrqu2mVwfWIGd6Zz73GQRks2RNG/jYKfKtEewcPxYfATg
         LyrOdmpGLUdlu+G81X72o+kOEK5/0T2c8TC3XsBiZc39XzuEnLDbg7aqT4PFP/mjqLZX
         kkcw==
X-Gm-Message-State: AC+VfDx4TbLDSUs6ViWfBPa4h4QbUyUi9kWrmr2EcJB6AivjLJgUU0Gl
	5loxG3jTO3SApaDOqKKv7qD6vw==
X-Google-Smtp-Source: 
 ACHHUZ4AlAVb86LVpUgdppiueLOdqvRCP+H8oHIJil8ScCoOiD+gDNEcggxDcVOlHjnm3d6LSJ2lPA==
X-Received: by 2002:a17:907:3e13:b0:94e:5679:d950 with SMTP id
 hp19-20020a1709073e1300b0094e5679d950mr17840182ejc.72.1683704918359;
        Wed, 10 May 2023 00:48:38 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c175:a0f9:6928:8c9d?
 ([2a02:810d:15c0:828:c175:a0f9:6928:8c9d])
        by smtp.gmail.com with ESMTPSA id
 w12-20020aa7da4c000000b0050bc5727507sm1588632eds.73.2023.05.10.00.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 May 2023 00:48:37 -0700 (PDT)
Message-ID: <d82491c5-12e6-abbe-5bb9-87d863454b25@linaro.org>
Date: Wed, 10 May 2023 09:48:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: dt-bindings: nau8825: Convert to dtschema
Content-Language: en-US
To: AS50 CTLin0 <ctlin0@nuvoton.com>, broonie@kernel.org
References: <20230510034409.585800-1-CTLIN0@nuvoton.com>
 <39afb004-5f28-2633-a8be-412cb5e74404@linaro.org>
 <36061fee-5491-e829-2c49-27ab81f0aa57@nuvoton.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <36061fee-5491-e829-2c49-27ab81f0aa57@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2PITKYICBVKHUWICCSUHXPDH364KTHEJ
X-Message-ID-Hash: 2PITKYICBVKHUWICCSUHXPDH364KTHEJ
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, YHCHuang@nuvoton.com, KCHSU0@nuvoton.com,
 WTLI@nuvoton.com, SJLIN0@nuvoton.com, ctlin0.linux@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2PITKYICBVKHUWICCSUHXPDH364KTHEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 10/05/2023 09:42, AS50 CTLin0 wrote:
> On 5/10/2023 3:19 PM, Krzysztof Kozlowski wrote:
>> On 10/05/2023 05:44, David Lin wrote:
>>> Convert the NAU8825 audio CODEC bindings to DT schema.
>>>
>>> Signed-off-by: David Lin <CTLIN0@nuvoton.com>
>>> ---
>> Version your patches and provide changelog after ---.
>>
>> If you just send the same with the same mistakes, that's a NAK.
> 
> I know your meanings is to show change log from v1 to v2, but I see
> previous patch have other missing items.

I don't understand it. It does not matter what else is missing in
previous patch. You always must version them and always provide changelog.

> 
> Therefore, I revise it and included your comments. Anyway, I can back to
> previous patch and re-send v2 patch with changelog.

Paste it here (and in v3 of course).

> 
>>
>>>   .../devicetree/bindings/sound/nau8825.txt     | 111 --------
>>>   .../bindings/sound/nuvoton,nau8825.yaml       | 242 ++++++++++++++++++
>>>   2 files changed, 242 insertions(+), 111 deletions(-)
>>>   delete mode 100644 Documentation/devicetree/bindings/sound/nau8825.txt
>>>   create mode 100644 Documentation/devicetree/bindings/sound/nuvoton,nau8825.yaml
>>>
>>
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/gpio/gpio.h>
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +    i2c {
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        nau8825@1a {
>> This is a friendly reminder during the review process.
>>
>> It seems my previous comments were not fully addressed. Maybe my
>> feedback got lost between the quotes, maybe you just forgot to apply it.
>> Please go back to the previous discussion and either implement all
>> requested changes or keep discussing them.
>>
>> Thank you.
>>
>> Best regards,
>> Krzysztof
> 
> About node item, maybe I misunderstand your meanings.
> 
> When I change from headset: nau8825@1a to audio-codec: nau8825@1a, it
> will have compiler error.

That's label, not nodename. Why would even this create a compile error?

> 
> So I use nau8825@1a to submit.However, when I see your latest comment, I
> seems to understand your point for node name.
> 
> The final result will be codec@1a or audio-codec@1a, right?

Yes.

Best regards,
Krzysztof

