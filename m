Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF83469662E
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 15:12:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 014C783D;
	Tue, 14 Feb 2023 15:11:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 014C783D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676383947;
	bh=UrJ04Ot3W6tiq1ksGddJ+7+stg/F8VTbdG40OgU4oMc=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KbLmAAShbhHCA7IALbwFAsrBzQ9LLrrwi/XDB2sMlb6PpsldMBmHVPmn9wqDeUKPt
	 2MSNjsd5XdpYcaY4QkVwgbxAbKqh8HF/+/qW18eIUF+ND1hWY9T3K8GIURiTSp9R0z
	 HuH8OPfJo3nCOaQKq5sX/641xquwb2BhoP6DrH8c=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 61799F800F0;
	Tue, 14 Feb 2023 15:11:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D91DCF801C0; Tue, 14 Feb 2023 15:11:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39DCBF800E4
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 15:11:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39DCBF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KYN2KNBt
Received: by mail-wr1-x42f.google.com with SMTP id a2so15794014wrd.6
        for <alsa-devel@alsa-project.org>;
 Tue, 14 Feb 2023 06:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sajY9FZqzLSzPCMgEW1O4rOAxb6+m9fSt/2pxwQfCgA=;
        b=KYN2KNBt/LUIs+pRXfiBIhd/D5Y0d6QQMZapeeEZxBTtLLDQB8eHH6gjL7OMbcpjJ0
         af8h8yk+z5i0VAC4tH0sZO3KZp3pzU3XgdWHomenan+1KMCxTZ3slNKl/boEsZ3PM48v
         Uyg754ozbjXseD4iExTg9NwaYGhgZ21LCl/UZLsmRsg6guWmmrN2YlD5HJOkqvCHO1id
         dKDBGxVQFkhnfA35f57rvQ/o786k5mUaRfOu9jDdYRnjPIHgfDK1qLc534OD/m4eXzyb
         OZZ3naeTcjxCuyoRP1cOle3uF2eWFxHTKi1pCtITbzFQjxcuJoD2vQDsitBYmK0Lesjg
         bswg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sajY9FZqzLSzPCMgEW1O4rOAxb6+m9fSt/2pxwQfCgA=;
        b=Bhu4WYJo5FlUt/qsRJWzcTosIfVLnIQ2Ffyz5EoMGwaq77VKPUsqDsQ5scpDmC4CNP
         eq2KHE0QouG8yCkNQ2nduzbukHbeKc2uEmiIzk8X/6nosENbWWLRI0QMPypPmKO4HRg5
         7wcbnZdPJc+6Iq/moylMQ7wIbBw5aDAo72liW+mSsIr6gFLkYwBUV+iZdflsfG2hyX0B
         7gRYfCF5DVpKlSHztqH2UQUgvDakiKmXztLCOOW2i9GhbV+SZ3KhVTsYwvSl3Cms0Hna
         /B4EZRmpyAQobanWi5hoYpicdo8Am5P/X0q5ybN+GWZLazENsOJEjL6+rrvGPAsNK6TS
         Z/Ww==
X-Gm-Message-State: AO0yUKUrCc1ZooEc/LdXqSVFNKnm7Sem6QPvrwFfTmPdHyVB1nlCs84Y
	Lu74mH0AT9gVIvlUC2vwpXQdYw==
X-Google-Smtp-Source: 
 AK7set+VunAbU+8jTt1a3+RSvSh5K+lG8vL3bzD2/u6nRlzbf02orxzROeLQG7OY/r3nSu2beWuaAA==
X-Received: by 2002:a05:6000:1244:b0:2c5:4cd0:4b86 with SMTP id
 j4-20020a056000124400b002c54cd04b86mr2277820wrx.68.1676383885424;
        Tue, 14 Feb 2023 06:11:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id
 p11-20020a5d4e0b000000b002c56179d39esm2587308wrt.44.2023.02.14.06.11.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 06:11:24 -0800 (PST)
Message-ID: <c4f5f733-ce22-2dfa-30f7-cde309eadaf9@linaro.org>
Date: Tue, 14 Feb 2023 15:11:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] dt-bindings: sound: ep93xx: Add I2S and AC'97
 descriptions
Content-Language: en-US
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 devicetree@vger.kernel.org
References: <20230212232137.299005-1-alexander.sverdlin@gmail.com>
 <46d5b6af-23e1-4178-83bc-b4a435b1426e@linaro.org>
 <109868b9492aecaca0a7170cba9fb51e62de7116.camel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <109868b9492aecaca0a7170cba9fb51e62de7116.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YMMEZY3ZRG5B63JJ6CHFCU5SR2ZQX5DB
X-Message-ID-Hash: YMMEZY3ZRG5B63JJ6CHFCU5SR2ZQX5DB
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Hartley Sweeten <hsweeten@visionengravers.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YMMEZY3ZRG5B63JJ6CHFCU5SR2ZQX5DB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 14/02/2023 14:02, Alexander Sverdlin wrote:
> Hello Krzysztof,
> 
> thank you for the quick review!
> 
> On Tue, 2023-02-14 at 11:58 +0100, Krzysztof Kozlowski wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: cirrus,ep9301-i2s
>>> +
>>> +  '#sound-dai-cells':
>>> +    const: 0
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    minItems: 3
>>
>> maxItems instead
> 
> reg and clocks are required, I suppose I should include both minItems
> and maxItems for both of them?

No. minItems is implied.

> 
>>> +
>>> +  clock-names:
>>> +    items:
>>> +      - const: mclk
>>> +      - const: sclk
>>> +      - const: lrclk
>>
>>
>> The clk suffixes are quite redundant. Don't these inputs have some
>> meaningful name?
> 
> They are actually meaningful, as they are usually named in I2S, please
> refer to the EP93xx User's Guide:
> https://cdn.embeddedts.com/resource-attachments/ts-7000_ep9301-ug.pdf
> page 71, for instance.

OK, but then I like the example - if datasheet would use name
"clk_clk_this_is_clk" would you still find it meaningful?

Every clock input in clocks is a clock. There is usually no need to say
that a clock is a clock...

> 

Best regards,
Krzysztof

