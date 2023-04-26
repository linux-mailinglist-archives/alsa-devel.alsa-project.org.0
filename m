Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E7EC6EF551
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Apr 2023 15:16:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDFFE1047;
	Wed, 26 Apr 2023 15:15:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDFFE1047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682515000;
	bh=JD6znwoHMlImf7/h2z11jrYVAcOrvYzP9gw6gBzxeoE=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=G2ar8uCpE9cHrwmloxGDN5LZhRCKnNC6gp4GT8Cbnm5FHXdFFruh/vDq+Lr8I280t
	 b8Bf45gQ5mqlyAyFRcDJba7sWNti+4wrrr58Q6JoexcBkJQDUUvNzlnbEm/ArgD6k2
	 FYwAyFakl22MjFh9UG71H3nhobMwWHk3mHICtvNg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D98D8F8018A;
	Wed, 26 Apr 2023 15:15:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD96AF80236; Wed, 26 Apr 2023 15:15:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC747F800AC
	for <alsa-devel@alsa-project.org>; Wed, 26 Apr 2023 15:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC747F800AC
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=csEP7fZd
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-506bdf29712so53323276a12.0
        for <alsa-devel@alsa-project.org>;
 Wed, 26 Apr 2023 06:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682514932; x=1685106932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5X6XbY4GDs1zBv4u666H8NBc+gIaLqZ5jMZDYOgtIiE=;
        b=csEP7fZdTmBKFMSHuwcvXsv4i9NMYXACDayZgOM4X9kux+rwqi6nmitioNzmZg/a28
         OUKwei1asmNDrQK9gRNOeSeB4Ey5TY8SihiXJHDiq4+9WeeGm46XbVILUiAuPmTuhtav
         uqIh3573N7omTVGYjYiKMIbAOkFTe03G7vtsd2i88+IuS+zsVbLhfzZJnipA/D6tstNF
         zwjFSL50ti7B7jzvO3m4DaXFc8M4apafaGJ0w0zwz9Ur0Y1x/WVzy3ImHD7RgQvY2LF2
         Gogo+Ckj8cg69f9DfBtLUN8USsA7xsHHLo16l+ca9aikh8Jefe0K3ik5ajQYQfc5XVDr
         4fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682514932; x=1685106932;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5X6XbY4GDs1zBv4u666H8NBc+gIaLqZ5jMZDYOgtIiE=;
        b=Q9S80CoBqfKcgE9+5Qg0z7avnb7LYT83Mwn7pvSM4Yt42y2Lr9yt+7qRZs+k3vIz8y
         fFghaRRt3EOPC82kNjiRjyFwjcA86YDuo00X8Mc2RE8439fxfpq2yQExtj/HWjKKxZX9
         OVOtNq3srvsWhGBNNES3Svn5O0M2rTIX7mBJc3lqc6sLpyp+MfWOZjGUu9BEGrk4jLH0
         FUGi9djvD6F5aH6ELpyNVvzI6irFV9w+GyJCX4MhPgabOO3u+5KlnvV4mcYx0J619JCS
         Z4tTsFKW4bEJ1FMircBkgp7si3bq0qBbpHeNan8VyTRHbvGcpBzO3zf+WySIl/X46AFH
         sQeA==
X-Gm-Message-State: AC+VfDxC468YVzw5wu3N13qkU74MqzF26D9ZAhI7ummI3+j6VkRubfIL
	nWV2DGS96ncgUA9ZOth/dpC4wJDUetmWFJrsXWU=
X-Google-Smtp-Source: 
 ACHHUZ7nSlGKXPcRIffgSkm2iBxwOkyGHDmgNxJTloG4BcBShfBKk6j6RPxDVvXpOivjiadIjs89+g==
X-Received: by 2002:a17:906:4898:b0:94f:2020:b5dd with SMTP id
 v24-20020a170906489800b0094f2020b5ddmr2399230ejq.24.1682514931969;
        Wed, 26 Apr 2023 06:15:31 -0700 (PDT)
Received: from [172.23.2.142] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id
 l20-20020a170906645400b0095342bfb701sm8407935ejn.16.2023.04.26.06.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 06:15:31 -0700 (PDT)
Message-ID: <d30cb539-d5de-94c3-237a-fb27c97e7c5e@linaro.org>
Date: Wed, 26 Apr 2023 15:15:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 2/9] dt-bindings: ASoC: Add chv3-i2s
Content-Language: en-US
To: =?UTF-8?Q?Pawe=c5=82_Anikiel?= <pan@semihalf.com>
References: <20230414140203.707729-1-pan@semihalf.com>
 <20230414140203.707729-3-pan@semihalf.com>
 <5544de12-396c-29d4-859c-a6e17b2e2de4@linaro.org>
 <CAF9_jYRXsdQX22bOVG5Dp20GnC7JniqGC6popTS5dSxmiqjizQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: 
 <CAF9_jYRXsdQX22bOVG5Dp20GnC7JniqGC6popTS5dSxmiqjizQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EHEDARMIK4GXSNLO7NR5LKM5NRRPOIHC
X-Message-ID-Hash: EHEDARMIK4GXSNLO7NR5LKM5NRRPOIHC
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
 tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHEDARMIK4GXSNLO7NR5LKM5NRRPOIHC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 25/04/2023 18:01, Paweł Anikiel wrote:
> On Fri, Apr 14, 2023 at 7:00 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 14/04/2023 16:01, Paweł Anikiel wrote:
>>> Add binding for chv3-i2s device.
>>
>> Your subject needs improvements:
>> 1. ASoC goes before bindings
>> 2. You miss some meaningful title of device. "chv3-i2s" can be anything,
>> so add Google or Google Chameleon. Or use entire compatible.
> 
> Would "ASoC: dt-bindings: Add Google Chameleon v3 I2S device" be better?

Yes, thanks.

> 
>>
>>
>>>
>>> Signed-off-by: Paweł Anikiel <pan@semihalf.com>
>>> ---
>>>  .../bindings/sound/google,chv3-i2s.yaml       | 42 +++++++++++++++++++
>>>  1 file changed, 42 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
>>> new file mode 100644
>>> index 000000000000..6f49cf059ac5
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/google,chv3-i2s.yaml
>>> @@ -0,0 +1,42 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/google,chv3-i2s.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Google Chameleon v3 I2S device
>>> +
>>> +maintainers:
>>> +  - Paweł Anikiel <pan@semihalf.com>
>>> +
>>> +description: |
>>> +  I2S device for the Google Chameleon v3. The device handles both RX
>>> +  and TX using a producer/consumer ring buffer design.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: google,chv3-i2s
>>
>> Missing blank line.
>>
>> Is chv3 the name of your SoC? Where are the SoC bindings? What's exactly
>> the versioning scheme for it (compatibles must be specific, not generic).
> 
> The Chameleon v3 is based around an Intel Arria 10 SoC FPGA. The i2s
> device is implemented inside the FPGA. Does this case require SoC
> bindings?

No, I was mistaken. I somehow get impression that's for Pixel... Sorry
for the noise.

> 
>>
>>> +  reg:
>>> +    items:
>>> +      - description: core registers
>>> +      - description: irq registers
>>
>> As well...
>>
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/interrupt-controller/irq.h>
>>> +
>>> +    i2s0: i2s@c0060300 {
>>> +        compatible = "google,chv3-i2s";
>>> +        reg = <0xc0060300 0x100>,
>>> +              <0xc0060f00 0x10>;
>>> +        interrupts = <0 20 IRQ_TYPE_LEVEL_HIGH>;
>>
>> Isn't 0 also a known define?
> 
> Do you mean this?
> interrupts = <GIC_SPI 20 IRQ_TYPE_LEVEL_HIGH>;


Yes, please.

Best regards,
Krzysztof

