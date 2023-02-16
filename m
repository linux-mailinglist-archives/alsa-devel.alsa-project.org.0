Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04150699206
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Feb 2023 11:45:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 613E9832;
	Thu, 16 Feb 2023 11:44:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 613E9832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676544299;
	bh=XnG2qJa5yivJBzXgKIOQM3DPARFcArqQ7EHB7q0CaI0=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EBzrQ4pzmFiQBdicyIORVJh1WG590jDWXKaUhO3y6kDcXK8gdc1Q9M5LdIGpr3B8j
	 wu1P8SRi/UPuBzYjOd+JiLpuQKtZDsfQZApTyAk0+GdenokC4An40RDLgkzLyGOrId
	 88KsgguEoU854yUGt1pwD4e8T9Mq7K0bwWkgmTFI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DDA4F800E4;
	Thu, 16 Feb 2023 11:44:09 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B5CEF80171; Thu, 16 Feb 2023 11:44:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57335F80083
	for <alsa-devel@alsa-project.org>; Thu, 16 Feb 2023 11:44:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57335F80083
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=vHKPZZc7
Received: by mail-ej1-x632.google.com with SMTP id gs13so1521008ejc.1
        for <alsa-devel@alsa-project.org>;
 Thu, 16 Feb 2023 02:44:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kAeO7LNS/haa+vteM/1xuDnjwbcezFgkB2yPBvYuG9o=;
        b=vHKPZZc7dMt/oZ8Hyn8CnfnRp+oaHTGdYYztfha3aB5aZdfeqo6epo7Kw+XANzQaiK
         998cuNeJwYorM0k7lszHb28JbPoGJjQGARIxy+n4cYE02TJft12LwrPNAQC9z2A37aUI
         s4TT9ggLIC4vSDrSq2cVamnijQ+wRD9qDglCTVukpSsbEDJbF4IGBzFO45/wl3IyFZVp
         dFQObj0jkA4gkklKtP8rD8CtZV1kpZK2xlJlfvR3FCIl6aV6g2nkVr/BOfdN/ktJLUnJ
         au323gu7WhODBH3PK5w2JzJMJQS+Q3oTkQf7oTwUHQGMVTyGrc0UP9piJZuk7O2J2Azr
         TZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kAeO7LNS/haa+vteM/1xuDnjwbcezFgkB2yPBvYuG9o=;
        b=zxl7UnI7wLMNIw7oTGTSkARg4Z+gRBymPTxp+5kj4Pj3ZmdLbHXrUr59dDrYrmEhr5
         VyusDsQ8v8hWG6e3wub3RbQA/fYi2nVHbJvCmbiQB2GayENlynCqljrkIicoU1ArVN3H
         rwGzcO/eLpzSL/e8Y6KNDm7xtz0qOSWWDlYyezcQnX+HQm7bbnXm2h92+DSrbbc5Rbqp
         FBeZmWf3sSeye8dCs3ShwVLK1FA71Uw05RD4shMqeAmb266E5arRnbEkK00IO7UfXB3x
         yL39bar9V/I9JmsvpnNDr9RMYTsjVPRkyUdWDwWqYJcoHFoy0glwbwi7JmiYk6eRSHEJ
         S/5Q==
X-Gm-Message-State: AO0yUKVIoswp/6RgWTu5DtlgO1Oyglec1ZX/Xl6gB4fmufii/oIrG6wM
	rMK1BCe9AzoT+40QNcViGVAn/A==
X-Google-Smtp-Source: 
 AK7set+Dcr4QIHZy7seJx+QjQB2BainiaUbPbSnQo765nWKDQHrz3UG8xsMgAuo4fKOCIiC3KFgjxA==
X-Received: by 2002:a17:907:8c89:b0:8b1:781d:f9a4 with SMTP id
 td9-20020a1709078c8900b008b1781df9a4mr172717ejc.21.1676544238957;
        Thu, 16 Feb 2023 02:43:58 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 oq15-20020a170906cc8f00b008b165948da6sm490473ejb.101.2023.02.16.02.43.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Feb 2023 02:43:47 -0800 (PST)
Message-ID: <a235fecf-bfda-6d9d-f16f-31e1b2e3bf8f@linaro.org>
Date: Thu, 16 Feb 2023 11:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Content-Language: en-US
To: Claudiu.Beznea@microchip.com, lgirdwood@gmail.com, broonie@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, lars@metafoo.de,
 perex@perex.cz, tiwai@suse.com, Nicolas.Ferre@microchip.com,
 alexandre.belloni@bootlin.com
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
 <20230214161435.1088246-3-claudiu.beznea@microchip.com>
 <485d74fe-bfb5-c55e-724f-304476624abd@linaro.org>
 <954cdf90-c41a-4e21-31e0-88a0baf26065@microchip.com>
 <fd2f372f-4a1c-72c0-574d-1d5ef99dbdbc@linaro.org>
 <8a2132f6-9745-5ef2-724e-14e76fc456f0@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8a2132f6-9745-5ef2-724e-14e76fc456f0@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CFU6UEMML4R3HRHG2D45RS37SMFSHYYC
X-Message-ID-Hash: CFU6UEMML4R3HRHG2D45RS37SMFSHYYC
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CFU6UEMML4R3HRHG2D45RS37SMFSHYYC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 16/02/2023 11:41, Claudiu.Beznea@microchip.com wrote:
> On 16.02.2023 12:18, Krzysztof Kozlowski wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>
>> On 16/02/2023 11:15, Claudiu.Beznea@microchip.com wrote:
>>> On 16.02.2023 12:04, Krzysztof Kozlowski wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
>>>>
>>>> On 14/02/2023 17:14, Claudiu Beznea wrote:
>>>>> Add microchip,startup-delay-us binding to let PDMC users to specify
>>>>> startup delay.
>>>>>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
>>>>> ---
>>>>>  .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml   | 6 ++++++
>>>>>  1 file changed, 6 insertions(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
>>>>> index c4cf1e5ab84b..9b40268537cb 100644
>>>>> --- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
>>>>> +++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
>>>>> @@ -67,6 +67,12 @@ properties:
>>>>>      maxItems: 4
>>>>>      uniqueItems: true
>>>>>
>>>>> +  microchip,startup-delay-us:
>>>>> +    description: |
>>>>> +      Specifies the delay in microseconds that needs to be applied after
>>>>> +      enabling the PDMC microphones to avoid unwanted noise due to microphones
>>>>> +      not being ready.
>>>>
>>>> Is this some hardware delay? Or OS? If OS, why Linux specific delay is
>>>> put into DT?
>>>
>>> It's the delay used in software workaround that IP needs to filter noises.
>>
>> Then this sounds like OS? Linux related properties usually do not belong
>> to DT.
>>
>>> The IP is not fully featured to do this kind of filtering on its own thus
>>> this software workaround. This delay may depend on used microphones thus
>>> for different kind of setups (PDMC + different microphones) I introduced
>>> this in DT.
>>
>> I understand your driver needs delay and I am not questioning this. I am
>> questioning why this is suitable for DT?
> 
> Because that delay may depend on the microphones that are used with PDMC.
> Different boards may come with different microphones, thus the default
> delay may not fit to fully filter the noise. Due to this I chose to add it
> in DT.

Ah, ok, that's good explanation. Thank you.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

