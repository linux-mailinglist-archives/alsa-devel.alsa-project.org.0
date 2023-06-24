Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 710F773DDF7
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:45:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 234C4F12;
	Mon, 26 Jun 2023 13:44:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 234C4F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779904;
	bh=RvLayKqn2LwTU8mYfVSc9kDtNPmES4bnP2MmRDvCMw4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DHc6RPbNM/IO8ZBD4/5haXMoqRQadCoC37Ap2QoC4dbjFo7aP61wGt5Lh9AG9IIwX
	 zCb1M2GAcGpqoAeencjqt+OLohIjUD86dG8DtX3OuO15PIKPmtcRIvIGby20icwu29
	 laXbbusMV+t4+Mth6DWsYbgQ5Yz06gtvA/+c/1mo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B79FF80567; Mon, 26 Jun 2023 13:43:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 654E2F80558;
	Mon, 26 Jun 2023 13:43:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BEA0F80141; Sat, 24 Jun 2023 10:23:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 38292F8003A
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:23:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38292F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IsOfPPAL
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-51cb40f13f6so838215a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595015; x=1690187015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iw/ywJG51HUTwkPghusRkjWUXteVCmP/Fv5gaFgQqkU=;
        b=IsOfPPALsc6kgiSVlUoR59ZJkgFCtFF5TGUwt1sbTFoWRMQOqCvWPTIR5S4VBZ7wwO
         U+Tfcj6D2UZWfSg6R9maL5SVaczzgRsCGFn3w3hx97Rmn0RbCb+dz8mN7fo1OhBYO1YQ
         54oNjUFMACNKqmgtbF97PqAckUG/2az/K+ImnC3CequpWgOAVohV3SkCnVPNu1hfXpIY
         qSBKOgbw6rHxDUkAQDvMik5GXkFpd4yw9FALSXz9sR/ZAgWV+QM0FhTv8QIuM4SSMc+2
         /nbK/R/EUUxlTLqExeuaZfJ7NLx2+2g0GulfxjKCtNGXlBg5sxnH4072KmidxffszrB8
         88VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595015; x=1690187015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iw/ywJG51HUTwkPghusRkjWUXteVCmP/Fv5gaFgQqkU=;
        b=cfQg5HqTu9a9zowUvZhfuHb0BFM1XVQyMUWY9eVx1NGIDN+eDmBt23Sd6RiLVbmw/D
         TZIXdWVhlgIe2pswBWlV4lSsetsbgSnMSdUa8JOQGfjaD6zR76kdP4pIXfNrDflWTE6h
         ktQusHfRwQcKiv+0KiewQSruSApIXqWC7ez4vF6x3ZQwi05++8q2DhmYudvcBU4EjVhk
         Drvbv7jcLfetY/PYtWtih8VMxm9tlzTi2ucNPaVHhVivqH8rD1sB5odVvRJ1R6oiN4t3
         9F5tHR7lB+p/doPxjo4eoKVBBxA0+MxCwlu3+SRp8ls+mkR834S5oMrOqime18OOZoFQ
         MM1g==
X-Gm-Message-State: AC+VfDy4ZVmEba/hb5gV8U2rLxdsWYC9v+m+5TNMZfG9yA400QDmSCla
	rMPAoqkvAbow/dxnf65IbOTZDg==
X-Google-Smtp-Source: 
 ACHHUZ43qIJ7DSZr3vq3pOJ8EpVNA3z/s2kop3/I0gBWTVNNyPwlCA/pGa/4aeeS2b9dek8ZmCoz3A==
X-Received: by 2002:a05:6402:550:b0:51a:543b:2c8c with SMTP id
 i16-20020a056402055000b0051a543b2c8cmr11889190edx.35.1687595015160;
        Sat, 24 Jun 2023 01:23:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 m16-20020aa7c490000000b005187d2ba7c1sm419224edq.91.2023.06.24.01.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:34 -0700 (PDT)
Message-ID: <e7f7eab2-7fbc-99ae-641b-075ff0610127@linaro.org>
Date: Sat, 24 Jun 2023 10:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/45] dt-bindings: mfd: at91: Add SAM9X7 compatible
 string
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
 <20230623203056.689705-20-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-20-varshini.rajendran@microchip.com>
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
Message-ID-Hash: IFGKOSUPDJIU67GAOBBAGMQTVBZPTTCI
X-Message-ID-Hash: IFGKOSUPDJIU67GAOBBAGMQTVBZPTTCI
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:01 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IFGKOSUPDJIU67GAOBBAGMQTVBZPTTCI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Document sam9x7 DT for flexcom.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-flexcom.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> index 9d837535637b..449e0af93a13 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-flexcom.txt
> @@ -5,7 +5,7 @@ controller and an USART. Only one function can be used at a time and is chosen
>  at boot time according to the device tree.
>  
>  Required properties:
> -- compatible:		Should be "atmel,sama5d2-flexcom"
> +- compatible:		Should be "atmel,sama5d2-flexcom" or "microchip,sam9x7-flexcom"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

