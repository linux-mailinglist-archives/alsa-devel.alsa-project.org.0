Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A90CA627B6F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Nov 2022 12:04:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22B2C1666;
	Mon, 14 Nov 2022 12:04:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22B2C1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668423890;
	bh=/4PwbBZONsSSSZ6T303ZWJ2dURqy3RxRASLfy3/91/A=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=imqNzSEUekf161y/gWjWYA9xULY2dOftgEzFheeuiCS3mz8lZuY07dtai6OuzaZyF
	 4qZ3OPfDb1jLXPTLgxYoS+gcHL2ZLYiXDR6ohwAdDBjphcldU/s32CQ8Zosy30S2yB
	 za1tEV6Px2PbrHPoVT++Qa/p4C8W+UFTWusl/wrw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA123F80448;
	Mon, 14 Nov 2022 12:03:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7EB5F80245; Mon, 14 Nov 2022 12:03:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C142CF800B8
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 12:03:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C142CF800B8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="x+H9nqpb"
Received: by mail-lj1-x231.google.com with SMTP id t10so12689735ljj.0
 for <alsa-devel@alsa-project.org>; Mon, 14 Nov 2022 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WrNB6Xj9+aEQvoTkZNUDKBCvNF5d4Z6XoTEhpJTodog=;
 b=x+H9nqpb/dFL2yTX9FmUIZY4TKf+K85BBWalHgPhAE2f++4PE4DbguLfkbuUpeGzLS
 csDSZU0Zat7b8eN+DnkLR2cCclirECVDLj4qbuen4tfFW2FtOCYZWDMVjRCTaD4eT31e
 18gh9Ip/SdC/TB8MsHz58UQr2an6CtvXVbwL8AdMu0TmsuCOz/MTKBaS8V0W9AU8Ibq6
 UuDFGgYMRPw87Ghfjr6rST8UYt9LxqzglPqXCiys6zrJPKX8/SuR+KvCzP3JAwb0SMxN
 EbYcGcXNHmX4ipk3umf58LXw/dUoWiDwhkSS7oS2Xi/ugtNNXLkCYlR6WigJhf09UsH5
 XdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WrNB6Xj9+aEQvoTkZNUDKBCvNF5d4Z6XoTEhpJTodog=;
 b=HH+61ZJf9RNByg28eM8v3HUSiBcLF8FbXDvKLh9q4+c3mxxNuRUFGEn27gjk5W9rlW
 UXTTzjOZBep97MMFa1ERxTFaW5t2cgr8pfcfKPaLo6llfC533mlJRfNpRWhUV6LLao7g
 ob0nuAs4N+xr2xHf9e83Wu4FrhEYLzj9lns0zIY80FMA1WI2WhZg1asMpVvJTNSG/uf3
 kR6s2UtEiFXF1fLC3WOLGNb10aRODe0WDtvaQPAeCWNOQLh7KjOe71ik9zbIpQnSY36z
 FiomDYaA8DvK3pniiq9A2ctDdn8V9UrTZI1dK2D4weX34tRHrYEvWlfajX5LZ6ET43WA
 iwCQ==
X-Gm-Message-State: ANoB5pl+s2UsHm2KQKyi3RHgIacMKm/Vup15DFjrrIFySH0MeIbVd6gp
 ZRzwjrYF7jqU71Yenro14e3l8w==
X-Google-Smtp-Source: AA0mqf4vkOIsrcAzzQ/7IUWD24AGi4w3840gw/J6v3r7MSt2tQudjclNxCaplpbjz4FXUNH1CmHi4w==
X-Received: by 2002:a2e:9048:0:b0:278:a696:2781 with SMTP id
 n8-20020a2e9048000000b00278a6962781mr3788105ljg.401.1668423825163; 
 Mon, 14 Nov 2022 03:03:45 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a056512110a00b00494813c689dsm1777243lfg.219.2022.11.14.03.03.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Nov 2022 03:03:44 -0800 (PST)
Message-ID: <c7d73b1e-053f-21a7-4f4d-632742b4761c@linaro.org>
Date: Mon, 14 Nov 2022 12:03:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 11/12] dt-bindings: sound: Add Cirrus Logic CS48L31/32/33
 codecs
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, lee@kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linus.walleij@linaro.org, broonie@kernel.org, tglx@linutronix.de,
 maz@kernel.org
References: <20221109165331.29332-1-rf@opensource.cirrus.com>
 <20221109165331.29332-12-rf@opensource.cirrus.com>
 <5f012334-1815-2ef6-7dc0-08b4d60f754f@linaro.org>
 <8bd6b864-ca58-022d-220d-328121f7e7dd@opensource.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8bd6b864-ca58-022d-220d-328121f7e7dd@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 14/11/2022 12:00, Richard Fitzgerald wrote:
> On 14/11/2022 08:45, Krzysztof Kozlowski wrote:
>> On 09/11/2022 17:53, Richard Fitzgerald wrote:
>>> Codecs in this family have multiple digital and analog audio I/O that
>>> support a variety of external hardware connections and configurations.
>>>
>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>> ---
>>>   .../bindings/sound/cirrus,cs48l32.yaml        | 96 +++++++++++++++++++
>>>   include/dt-bindings/sound/cs48l32.h           | 25 +++++
>>>   2 files changed, 121 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>>>   create mode 100644 include/dt-bindings/sound/cs48l32.h
>>>
>>> diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>>> new file mode 100644
>>> index 000000000000..70fb294c6dc1
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/sound/cirrus,cs48l32.yaml
>>> @@ -0,0 +1,96 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/sound/cirrus,cs48l32.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Cirrus Logic CS48L31/32/33 audio CODECs
>>> +
>>> +maintainers:
>>> +  - patches@opensource.cirrus.com
>>> +
>>> +description: |
>>> +  This describes audio configuration bindings for these codecs.
>>
>> Don't start with "This". Instead describe the hardware.
>>
>>> +
>>> +  See also the core bindings for the parent MFD driver:
>>> +
>>> +    Documentation/devicetree/bindings/mfd/cirrus,cs48l32.yaml
>>
>> Same comment as for pinctrl patch.
>>
>>> +
>>> +  and defines for values used in these bindings:
>>> +
>>> +    include/dt-bindings/sound/cs48l32.h
>>> +
>>> +  The properties are all contained in the parent MFD node.
>>> +
>>> +properties:
>>
>> Missing compatible. What's the point to organize bindings like that? The
>> schema on its own does nothing - does not match anything.
> 
> Do you mean child drivers should not share the MFD node? Or do you mean
> that if they share the MFD node all the child driver bindings should be
> documented in the MFD schema instead of having a sub-schema for each
> class of hardware functionality?

I mean, that regular binding has a compatible which allows the schema to
be matched.

Splitting parts from top-level properties is used only for re-usable
shared/common schemas, which does not seem the case here.

> 
> I'm certainly willing to collapse all the bindings into a single MFD
> schema yaml. For this driver we followed the same structure that was
> accepted for madera (and there was some discussion when we upstreamed
> madera about how the bindings should be organized which resulted in
> them being changed). We pretty much assumed that the safe bet was to do
> the same that was accepted by the maintainer last time around.

Just merge it with MFD binding.

Best regards,
Krzysztof

