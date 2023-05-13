Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 890BA7018FC
	for <lists+alsa-devel@lfdr.de>; Sat, 13 May 2023 20:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 92539E93;
	Sat, 13 May 2023 20:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 92539E93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684001345;
	bh=bUfpAFSsgu9MAnC+Eor+H0TMVwSaMcvvmOCuYiHrpII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j3JrvzFCxF3lF0Zv6GZ7+QyfAnlndZ7Ahipb8t3XeYbFW1q5GT5u5Ii/Jqrvqws4E
	 z/YHUeiBspkLZAfw+m7pBO1sSyVmJmOcajUwnisxsIgDE1wJN+mwHCZOdLmq3k9G1J
	 0T+KVPLFNdqpscQyKxtolKyctkyUaYwc/RkxA+J8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53547F8014C; Sat, 13 May 2023 20:08:15 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14911F8032D;
	Sat, 13 May 2023 20:08:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4CCFF8052E; Sat, 13 May 2023 20:08:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C30EDF802E8
	for <alsa-devel@alsa-project.org>; Sat, 13 May 2023 20:08:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C30EDF802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EVBWjh+d
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-50bc0117683so19778813a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 13 May 2023 11:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684001287; x=1686593287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pz3pC3oD+mRQD2yh5jV0jp+d2wnh2+HWJqx/JQaPzB0=;
        b=EVBWjh+d6IhLcfQHvnPqNtgl2kB1ZPchXw0HXjFU2qSUtuwNy0q6Sp0YZggQOXxfjz
         oEcw/2Tl/2G+fh5jken5DOv1L2V0oQGBznQKAHYXr5FEYY+2rEcvHxbvLt9IC6T7d2pm
         j+JUVuj+iQUbkEXes1F1CBctgEWYrWPuR7xLWrMjBF263X4+bzOn/pWNhcqVAypZKXAx
         ikR1LxkTi5RNV8l0ufwPRld9j5r5vXg8+d6nfVq3ozPse6EdauUgXDDiXX8GGkzWphAd
         OXs/uwKHfMDIkh+2EG5f+tVdc5Zs9rGtQ8K5jD4iljzDntk+BUytG4wJjg7lSp4gpCJp
         o9CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684001287; x=1686593287;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pz3pC3oD+mRQD2yh5jV0jp+d2wnh2+HWJqx/JQaPzB0=;
        b=TrXKG0RgR2wtRLcByxPTSd1sY9bMt72/Ok9akcR+CK2o24uRgjYh5QHlERIL+0Q2zI
         RTA+NH39FeF3TflN8S1wpr4KCcwHAsPjyFNzNE1Cv+qWZ/Pr2KBBKaJGDBiWkanEtbXR
         tOl8lrpKQwAQ5u1z2CpiK+ABiYzEUe7dhsBRig5ralLB4R421hYhruM4jQcA550jMSJj
         3Ulo3wPwZUWa4TwYFQ7ifKPCLMwxu0IUuwG7WIRo2fb75h8Fpp4X8odml2nxIrOLNMeM
         6SYnF3h07XyDoELN7sQf+7psgezk5T1xXHeCStNL8B77ZCxb4ryoDKJrCA9PO4gn14+Z
         zL2Q==
X-Gm-Message-State: AC+VfDzVeUGq7omjmbILQhRUWLfp170YOmhbNNuuquzf8j+JReOKJyBx
	+x1w7FM+EYJoIZlA3DMSyFyQtQ==
X-Google-Smtp-Source: 
 ACHHUZ7ZC5ghgGrfBuRI4KprxyOU5k85ez2jlpAKSpf+r5Q8qvL256LVhRrTCK365P5OAJhDuRHo/g==
X-Received: by 2002:a17:907:9405:b0:957:12a6:a00f with SMTP id
 dk5-20020a170907940500b0095712a6a00fmr25591950ejc.21.1684001286843;
        Sat, 13 May 2023 11:08:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ba68:e5c9:694e:c6e4?
 ([2a02:810d:15c0:828:ba68:e5c9:694e:c6e4])
        by smtp.gmail.com with ESMTPSA id
 ib10-20020a1709072c6a00b009531d9efcc4sm7023439ejc.133.2023.05.13.11.08.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 May 2023 11:08:06 -0700 (PDT)
Message-ID: <db2dcafb-db14-96ab-87cc-88408f3bab4b@linaro.org>
Date: Sat, 13 May 2023 20:08:05 +0200
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
 <5969fe82-69cd-34d6-edd1-d16ea741d9cb@linaro.org>
 <20230512161803.GM68926@ediswmail.ad.cirrus.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230512161803.GM68926@ediswmail.ad.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 57TFQQVLWCPS6ASNBZOSIDXSY254W26W
X-Message-ID-Hash: 57TFQQVLWCPS6ASNBZOSIDXSY254W26W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57TFQQVLWCPS6ASNBZOSIDXSY254W26W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 12/05/2023 18:18, Charles Keepax wrote:
> On Fri, May 12, 2023 at 05:25:52PM +0200, Krzysztof Kozlowski wrote:
>> On 12/05/2023 14:28, Charles Keepax wrote:
>>> The CS42L43 is an audio CODEC with integrated MIPI SoundWire interface
>>> (Version 1.2.1 compliant), I2C, SPI, and I2S/TDM interfaces designed
>>> for portable applications. It provides a high dynamic range, stereo
>>> DAC for headphone output, two integrated Class D amplifiers for
>>
>> ...
>>
>>> +
>>> +  interrupt-controller: true
>>> +
>>> +  '#interrupt-cells':
>>> +    const: 2
>>
>> Hm, are you sure? Who is the consumer/user of this interrupt controller?
>>
> 
> Anyone who wants the device has GPIOs that can signal IRQs. Some
> of the other IRQs could be more generally useful, such as some of
> the jack detection ones.


OK, makes sense, but it is a bit odd then to have:
codec {
  which is GPIO and interrupt controller, but not pin controller
  pinctrl {
    pin controller, which is not GPIO and not interrupt controller
  }
}
Maybe all the GPIO/pin/related interrupt properties should be moved to
pinctrl node?

Best regards,
Krzysztof

