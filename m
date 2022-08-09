Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBE158D2F7
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Aug 2022 06:35:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F27F83B;
	Tue,  9 Aug 2022 06:34:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F27F83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660019728;
	bh=lRQ2Z6/UY/bpVJ+rCjff0BhCEN6e3UPG7nKzypJrX2c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ztb5//jl9NYc808HrAVlSvxA1UKxHYoMkFCC7UF5IQn5EloUhxi73iTBcIMvzsfWq
	 4FimgohZTRv0Mt6aZCYwpIWND9cUuD0u+oXy4CvBGue6XvehKMrUVsxeKhvD6EvS25
	 5Qid44RSBWZKPguPXo4GK5lz0BBGeiL3MEtAKpTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1319DF801F7;
	Tue,  9 Aug 2022 06:34:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DAA0BF8016C; Tue,  9 Aug 2022 06:34:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5248DF800E8
 for <alsa-devel@alsa-project.org>; Tue,  9 Aug 2022 06:34:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5248DF800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Jj76Z/jK"
Received: by mail-lf1-x12f.google.com with SMTP id e15so15518932lfs.0
 for <alsa-devel@alsa-project.org>; Mon, 08 Aug 2022 21:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=A2cJx4TzfVfLcjEZf5Am6QDuHfwBw6Iwol89LnoU7nc=;
 b=Jj76Z/jKDUcmTCulxZCqo/LuRjfbdQf1qvEHt1HWkgnmwQAefjhDHIaaiCqEFvEYTN
 LIRqrtBLpyDQ8XmzpE1wcv+p+OKdW6SOW/w9GO5PylbeCuI0ZpiUAHUNJLq5Gkzmwhv/
 6n1C7kFTUqpWcEJ8OAyQ+Ang5aSyQJE6G0fB1tWDKiErdTS3TLHiMS4avkS+93E8vxaW
 aqjdfDBBywZwi8o2eJWlhThCoJNNrrRzb4W5HfyWBg3IquciIg+hMO42TV9o6XKvXVys
 s32eXG5huF8fXFNYFtyZcqyKdwWUDqkztx7dK4X0ml/kis8bFJll6EFESaMA9Q3vxNBi
 GiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=A2cJx4TzfVfLcjEZf5Am6QDuHfwBw6Iwol89LnoU7nc=;
 b=8I/wVGSWRD/duPUV8ayc9htZYTH7VcVUHkAhmM1v7cwXDyu4F16hdCkx0BWdq/aWnr
 W6cahHKeNCE37zLc8P1OyKZd+Ihpla/4SuVgfBPENYTv/zbRxYEseLT4wrJnYw3kCI5r
 xgUkAtEKz/Od9VOoL6FqC+WprOMk7QnUIDKq78VZZ1OAyBJCw9KMERy+cdHQVJ6vFias
 74JceLZtjBdHkvYHQ+C4Nb7IlZgB2yDaG8PnUTtC9K8P+sF08SA1C6NA93oNxOAqw/SU
 qqnskxBK9/FA8gp+fOwTMGatep9uGLcblowEzaKf7DFAAOcaWlJs4xxsRgXTNULMJQ2c
 P7SQ==
X-Gm-Message-State: ACgBeo0Z/i1dOYDtX4fBS/o2TD1onG//KiL+TfuiC+4XHvoI+LmcRZGL
 0VpdaydDf7ep8qHLIKjugVABNA==
X-Google-Smtp-Source: AA6agR4BZyPN7vBEUxb+Ezny+n+osGnBvWSa4FG9wknX3U75cx2BkOZ/jdDmNcMZm3gyQUiR3bv27A==
X-Received: by 2002:a05:6512:ac5:b0:48c:ecd1:4f14 with SMTP id
 n5-20020a0565120ac500b0048cecd14f14mr2407443lfu.287.1660019659041; 
 Mon, 08 Aug 2022 21:34:19 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
 by smtp.gmail.com with ESMTPSA id
 s30-20020a05651c201e00b0025e778f6f13sm1431364ljo.4.2022.08.08.21.34.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Aug 2022 21:34:18 -0700 (PDT)
Message-ID: <a2136b83-2c96-27c4-c262-d4e75614f9a7@linaro.org>
Date: Tue, 9 Aug 2022 07:34:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 5/5] dt-bindings: Drop Dan Murphy
Content-Language: en-US
To: Andrew Davis <afd@ti.com>,
 Michael Hennerich <Michael.Hennerich@analog.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
 Pavel Machek <pavel@ucw.cz>, Tim Harvey <tharvey@gateworks.com>,
 Robert Jones <rjones@gateworks.com>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-leds@vger.kernel.org, netdev@vger.kernel.org,
 linux-pm@vger.kernel.org, alsa-devel@alsa-project.org
References: <20220808104712.54315-1-krzysztof.kozlowski@linaro.org>
 <20220808104712.54315-6-krzysztof.kozlowski@linaro.org>
 <43b3c497-97fd-29aa-a07b-bcd6413802c4@linaro.org>
 <6ae15e00-36a4-09a8-112e-553ed8c5f4da@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <6ae15e00-36a4-09a8-112e-553ed8c5f4da@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 08/08/2022 18:04, Andrew Davis wrote:
> On 8/8/22 6:08 AM, Krzysztof Kozlowski wrote:
>> On 08/08/2022 13:47, Krzysztof Kozlowski wrote:
>>> Emails to Dan Murphy bounce ("550 Invalid recipient <dmurphy@ti.com>
>>> (#5.1.1)").
>>
>>
>> (...)
>>
>>>   description: |
>>> diff --git a/Documentation/devicetree/bindings/power/supply/bq25980.yaml b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
>>> index 4883527ab5c7..509a0667b04e 100644
>>> --- a/Documentation/devicetree/bindings/power/supply/bq25980.yaml
>>> +++ b/Documentation/devicetree/bindings/power/supply/bq25980.yaml
>>> @@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>>>   title: TI BQ25980 Flash Charger
>>>   
>>>   maintainers:
>>> -  - Dan Murphy <dmurphy@ti.com>
>>>     - Ricardo Rivera-Matos <r-rivera-matos@ti.com>
>>
>> Ricardo's also bounces... Does it mean TI is not interested in
>> maintaining mainline support for its drivers?
>>
> 
> TI is still interested in maintaining support here. But as we know folks
> come and go, so giving specific emails might not be the best option.
> Doesn't look like the schema here allows free-form strings, but if it did
> I'd recommend the TI E2E Power-Management support forum[0] added. Any
> questions on Linux/DT for these parts posted there would land on my desk
> just the same, or to whomever is assigned in the future with maintaining
> these drivers.

Currently an email address is required. I am not sure if there is
intention to change it, because similarly to MAINTAINERS file email is
the way of our communication. Also in MAINTAINERS we expect to have
person's address (with M:) and for the lists there is a separate entry.

> Either way, I have several of these parts and can support these. Feel free
> to replace Dan's email with my email if that works better.

Yes, that would be great, thanks!

Best regards,
Krzysztof
