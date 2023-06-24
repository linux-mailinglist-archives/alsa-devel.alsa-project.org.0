Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A564273DDFC
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:46:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 021AD14FA;
	Mon, 26 Jun 2023 13:45:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 021AD14FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779980;
	bh=6EFHSMKL4YQ7EGU8g8k7x6SZgXlJgPaE9aA3srmjPY4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A51EG5Wmx4RfqE4kRX27KcVhYmDlYi+M3u7yey1j2ypgzYN2p8B40EA+zOPYhFVZi
	 EvzixhwK0ganOo8lNhy4AofItyFEV141E6X+K5pgzgzNcuHA+DYbEBtXO/7HsW3DHY
	 jDgM9p0zqwK7O9kHLluP+fXAWo2wKF2CeKq33fUk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7C22F805D3; Mon, 26 Jun 2023 13:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A692EF805C1;
	Mon, 26 Jun 2023 13:43:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BEF2F80141; Sat, 24 Jun 2023 10:24:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 07C5BF8003A
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:24:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07C5BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ma3NfE6b
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-98bcc5338d8so159930866b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595058; x=1690187058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dPneVN2rCFPZCWtN2Y3Y7VAYQxdyjaJ8jbh3KeTpdLs=;
        b=ma3NfE6b0iuczvDz33OkA/uVJrxAQ0MAFGHk9u7v1nR8D47ZBhw+gjIKtoDzcuY8wB
         5Pvy2qhRvcmPuwpH6Rnrell8MA5C7ERsiEZcNrkTdp2enRRGz9YPH87CceUiDv5qwK75
         d896yHgKdfHQUS9Eg9eIhEqyw4B9mE251eGpuz04MVFGWKdUuNcFeBoHnIh0QuUcthnS
         eJBnB3dNkPlBOU9M585Rs+CiS0CIFL/3ZSHm5w9+0Ssxpjw/anOhPvtredgrXIbeUSj1
         r9EbwEOwv+nT8pNTwsJJO4EB/ZoVNvunu6EeU/OOohiECV7HuhxnULraB/RzV8f3YdkX
         65nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595058; x=1690187058;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dPneVN2rCFPZCWtN2Y3Y7VAYQxdyjaJ8jbh3KeTpdLs=;
        b=L5DvM/g8nhjfm27TP7LTdC4HSGPPZRxI97XCPAtTKiBuwjXSzufXS8huUdwUoLmS05
         IcnwYgbaRyb4EVutN9GyYaF/U1T+CgU7aepAGcXl+xw2USw1/4zMiPtvpxLoRGujxbKy
         9oECbLpbq2fOKorQNB0UpM0ZmwCbQRfY5uv544n/ETgfRXiVkLBBQd/VWnb0ZZ+MvIWY
         TniAU8f2A9HCNVVR4k9Vbha/ocGwRBIsBGkvJ4ccxF4Bjx8f9wJXHJ7XrbT/zQIBmV5n
         i15XYHQ5Ghg9wO2rrCqn78i2YU+4E3S7L2Kgrz8EfS0CIHHgd4DzIUu78TTflWfLycjG
         pNpw==
X-Gm-Message-State: AC+VfDyTypGh9yO0S0NS3hwNmStDVKMaFqR8pd0f7oxfu5svQFmA44tr
	kN5INszjBqdwxnxO23bWpawRtQ==
X-Google-Smtp-Source: 
 ACHHUZ6AtPijKbF7bGoaGRTgUD1LMM3LYmmo8YnqmXKrV8jF1gHofaeMAnYGyMfoMbRKzIjPK+/0tw==
X-Received: by 2002:a17:907:980c:b0:988:c24d:3d33 with SMTP id
 ji12-20020a170907980c00b00988c24d3d33mr13654323ejc.12.1687595057964;
        Sat, 24 Jun 2023 01:24:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 i23-20020a50fc17000000b0051c7b5692easm435291edr.7.2023.06.24.01.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:17 -0700 (PDT)
Message-ID: <fb79e3d6-7164-2dc6-0d73-c32ff8a1c7f9@linaro.org>
Date: Sat, 24 Jun 2023 10:24:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 23/45] dt-bindings: atmel-ssc: add microchip,sam9x7-ssc
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
 <20230623203056.689705-24-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-24-varshini.rajendran@microchip.com>
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
Message-ID-Hash: LSY623Z2HRP2JT5OKJEUJ7ZFRNXAJQVU
X-Message-ID-Hash: LSY623Z2HRP2JT5OKJEUJ7ZFRNXAJQVU
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LSY623Z2HRP2JT5OKJEUJ7ZFRNXAJQVU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add microchip,sam9x7-ssc to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/misc/atmel-ssc.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/misc/atmel-ssc.txt b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> index f9fb412642fe..67c1227a01bd 100644
> --- a/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> +++ b/Documentation/devicetree/bindings/misc/atmel-ssc.txt
> @@ -2,6 +2,7 @@
>  
>  Required properties:
>  - compatible: "atmel,at91rm9200-ssc" or "atmel,at91sam9g45-ssc"
> +	       or "microchip,sam9x7-ssc"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

