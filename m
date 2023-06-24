Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FCE173DDDE
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:39:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2FF9EC5;
	Mon, 26 Jun 2023 13:38:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2FF9EC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779537;
	bh=OmKBxrhzbRwPXQfpciWQAxKcd7jOXR4ph/Add604AHo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y45aUWZOvevULIZU3L5O0Nx/ZfaEW0JP2ZQeRetry3qBMacogTLj/WXJn1XQUIQxz
	 qz31A9fKP9IVsTCUyNz+Nh5zLYgASq0gvf2aVJp2LOYFG0KwHi1QPdBEkiZpePwe8s
	 Thm8g93Sm+G84lZOyFj2xw2CcGoX4Da884TGI8HI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 059BAF8075E; Mon, 26 Jun 2023 13:29:30 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3EDD6F805B1;
	Mon, 26 Jun 2023 13:29:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0411F80141; Sat, 24 Jun 2023 09:59:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B2BAEF80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:59:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2BAEF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=R3QjgEeu
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-977e0fbd742so158186166b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593579; x=1690185579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JmZczCbpOdE83RS1Jg0IHZhGZBw+0h6TxJ0xSKGXpQ=;
        b=R3QjgEeu0SyVI2lDD0gF/mGGjC5l0xnsrF0U9MS0AWWSj8UlJYzroCkC1cYsnjqZdl
         BzpLsrAuOKn29IaswtTcZdkJNSfWnQleG3C6ZdH9XWhRbB/SKyi8sCQGlFDwD6xsXGuP
         kmXmMzlN1dUYqxzKx8uwQEcphW3mVPAWM6Ex6Zk41Y1+4AHsy17OsciQHWMC5iqsCIQp
         xgEjDKsBw0XHepXwvs0wO7a1D5N7PoR7VcNjyQ3ZY2nJoTGH/Q/E8I2tlEh4XuPggliv
         39av2i6EtrySSSH4jPALRV1rB4Pltm1L//Y2Dkb6C7rR0iojQsrFOeIKnevRsMXfqE8t
         p0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593579; x=1690185579;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JmZczCbpOdE83RS1Jg0IHZhGZBw+0h6TxJ0xSKGXpQ=;
        b=PQmZReuWn5hyCGfj61puQA3Vd29NDWAWUuyAjhV1KAMbixwyOut5OesvyGlVYW8Dgf
         N5fWdXrkFmdeBZQ/zkv5BYbPNcP4XMt3vPx3yjh+b4/VC6m7nZkbnfqcj7rVKhHC0A0d
         xzrAGUzRVYrO/krCEWJpprKHOB0gbeGbkMqwyerJ7hL6qX0eHlYoZ33QmRsx6imZpwqA
         Uu0Ev2atqoDBd+Tf5zXrwZcKe3I0IJXrny9NlyF4GEKzO5WWMhH6UOGCQ4rAOxOB/AeD
         Ajw0q3o29O2BYzuhbKWGJV/pW7UbzRlz0cO4hzbvoES+X3EQJMUmlyCcOuwbf3JIgBs5
         ZHAg==
X-Gm-Message-State: AC+VfDzzWQCDxXKhDi1rZ31Av1zANCVB/8aqHqnlxEh+MREe/lRNQmZt
	mIbOmNmDx6tZRrCpdhAvqPZ34A==
X-Google-Smtp-Source: 
 ACHHUZ7suzN5/2BEJw/pDsP2JF0ZtjamK/L1/904JX+bl8LiLRiewrvSQqyW/+nam/ghVhSAGJ3L/A==
X-Received: by 2002:a17:907:84c:b0:987:783f:449a with SMTP id
 ww12-20020a170907084c00b00987783f449amr14721000ejb.11.1687593579095;
        Sat, 24 Jun 2023 00:59:39 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 pg10-20020a170907204a00b0096f67b55b0csm598213ejb.115.2023.06.24.00.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:59:38 -0700 (PDT)
Message-ID: <efec9572-f717-ec26-0f26-a79fcfee27cf@linaro.org>
Date: Sat, 24 Jun 2023 09:59:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 15/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel SHA
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
 <20230623203056.689705-16-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-16-varshini.rajendran@microchip.com>
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
Message-ID-Hash: H32TFZBIV4RQF36KKE3ZTB2WCGZKFITM
X-Message-ID-Hash: H32TFZBIV4RQF36KKE3ZTB2WCGZKFITM
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add DT bindings for atmel SHA.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml    | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> index ee2ffb034325..6a54cb79b6e2 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-sha.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-sha
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9g46-sha
> +          - const: microchip,sam9x7-sha

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.


Best regards,
Krzysztof

