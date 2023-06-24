Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AB673DDD6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:38:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CE25CEBF;
	Mon, 26 Jun 2023 13:37:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CE25CEBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779521;
	bh=KBiSxinfVVdmfXoRUMqv3qh0ThMU8sfC9DN0VTSV0iA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Z/42stl6R2QEN+YONQFNrSac3CXoxZxIGrC4Mla82aSAgMGQu4ny4KTr10s0BlERj
	 uSKYxhnO77jypI9F2E1pQyMYIsQLXZl/Cz1fa52jPOjxyZ3G/DSOvEsj1nRmMQXEzi
	 0iEl+E3BeG2c37HJI38v2pJnxkqdJCeHkmSMZkw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1203F80737; Mon, 26 Jun 2023 13:29:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0B353F806DA;
	Mon, 26 Jun 2023 13:29:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1E5C1F80141; Sat, 24 Jun 2023 09:59:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9066AF80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9066AF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=biIFt0+5
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9889952ed18so178687966b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593540; x=1690185540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2RPXidMTrzBctnlI68UKYA3FxvKEi+gyM/+eAniSxHU=;
        b=biIFt0+5HLIeQJNObq9fw50IfGs4F5DFXzw8WQaXnv6Hdp3USYZJNL8PssYy6o2vEe
         uTNazxcXxlW9nYoOgc1ECAXqLXI0Fy6OTpXxKHrO5KBGlvJvfFS0T1Yy1tTOfdnYqT7s
         cMkaa3hPEAmXD6ANC4ih3z1UVMiivHFKHKNCNhNRtq9hQ7bMkaNVdI+n4Hlx2BE7yzQO
         jx50D2lQ67d60SVIUDBnCbxdMAAwJOdFf8iKs6wYFG3VWtA2pwPKLl5H6eldXBBdXINm
         rY7xzFgOPvVvf6qqwYEsEXTKFvEIRltIXoBmYft7pQBxV4w1cue28E4Voq0fdjydEvEn
         MpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593540; x=1690185540;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RPXidMTrzBctnlI68UKYA3FxvKEi+gyM/+eAniSxHU=;
        b=XmQllkGNu6Iq+3MW9RG49R39gpnhpxRvQ8w7uY8S0su2Erky31uIU979ChqAPRpufC
         E1YEp2ekqoEZM9izKf+KMhN2kkFSCZmu5YcxgFQoYF6AlycZijU/qBqpoZjVsTNeAQQO
         j/oC0abiG2Weh7n3queHPIY7xh0GanPBooiHX7+ABXbY80+KVc7vZuYxD1G/SWsIHFrT
         BNKb5+nI/ts06ZzsK4MQjN0BWlXj3rCxWnfx/kLXfi3qB4CkLsrX17AlXhPmFU0xk46a
         io8nbTqlDhQ8WDFUSEq1kbmu2SDP0v/qIDZ66N3SEvxWL32jntQIAwCAuTXpyN/CLyQL
         NvDA==
X-Gm-Message-State: AC+VfDwEhI2yallEalay/2niJgXlKsf/CKTPvOrWEEmmZnPyDEoVlgWV
	a/Pnl3SmgSTSkDWizo+e7wbfVw==
X-Google-Smtp-Source: 
 ACHHUZ6KTEX3PoU0t4AzSkFJrRvYcc7s1C5vvyEb440YGE+szTSoYCbadoq/cw/0a/YYcc9DpVEdLg==
X-Received: by 2002:a17:907:a06:b0:974:1e0e:9bd4 with SMTP id
 bb6-20020a1709070a0600b009741e0e9bd4mr20928031ejc.16.1687593539714;
        Sat, 24 Jun 2023 00:58:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 l24-20020a1709060e1800b009783791b1a1sm592525eji.121.2023.06.24.00.58.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:58:59 -0700 (PDT)
Message-ID: <28a5d2e7-d3bf-d373-10ad-73c7590924c4@linaro.org>
Date: Sat, 24 Jun 2023 09:58:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 14/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel AES
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, linux@armlinux.org.uk, sre@kernel.org,
 jerry.ray@microchip.com, horatiu.vultur@microchip.com,
 durai.manickamkr@microchip.com, andrew@lunn.ch, alain.volmat@foss.st.com,
 neil.armstrong@linaro.org, mihai.sain@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <20230623203056.689705-15-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-15-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: Z65WK5LTBH64IKBO55D7KOAHOQZCNEEJ
X-Message-ID-Hash: Z65WK5LTBH64IKBO55D7KOAHOQZCNEEJ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:24 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z65WK5LTBH64IKBO55D7KOAHOQZCNEEJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add DT bindings for atmel AES.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> index 0b7383b3106b..f0736696c883 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-aes.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-aes
> +    oneOf:

This is not oneOf.

> +      - items:

And these are not items. You just broke existing users, which points to
the fact that you did not test the bindings nor the DTS. You didn't test
anything here.

This comment applies for entire patchset - please test everything. I
expect v3, after testing.


Best regards,
Krzysztof

