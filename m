Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B49A073DE01
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:46:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4723ED1;
	Mon, 26 Jun 2023 13:46:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4723ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780011;
	bh=6lhzwyi7n/Jxvn1Z7b/slMEplNaXbHNIWimdfEAbEsU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XSCUG7dCz1193JrkT3i9xGFQjuW41rjv9jc193A60iT4MWmW5ouEBTk36BrZebpH5
	 8rmda7rRP7nwNeH6LD0ieUjip0WMnjSdX4Y9CVCxV0UfrDi1l0AD/ahIPZnVfMrwEp
	 PNlze4dvjEG5F/0pDqa4XfR0brGM+LwUT0n2bKqo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C411FF805E2; Mon, 26 Jun 2023 13:43:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2CBEBF805C6;
	Mon, 26 Jun 2023 13:43:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FA5FF80141; Sat, 24 Jun 2023 10:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7400F8003A
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7400F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=YvJo2eOg
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51d7e8dd118so544544a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595064; x=1690187064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yae1xwiE1cf9aPKATRkJstBDOT3q8TFXp4hszvxUyq4=;
        b=YvJo2eOgRjp7Nu6HhZ0Ly7NiVzudeerZDZdvpLCxauEGIQLTSmWoGvQYvBao1wZScz
         DwypTBLhATAp1xYtmvvzrbepVybavA2kDJIZ6OTCfaeU2DqzJhIi0sDHRrUf9mgIi7vt
         SNMmUaSx0RBVeYcEjuVRwUWagYFtzUOCiEnkVCXkQZdFMgK62kOMU0thxzRYXOfOKFUA
         N+AFT++jOCSod/PyCezzloQ+RuTZWKMUi+cvqeAa/1dHRMe+yc1Co/n21k/VpmGf3OMy
         4qgUMaYkuVxnOjNeBetr+cQ8NtkB6O7vMGVqjD2g2tS9xyBdAaGervXpA6OT+7fSJbe0
         eyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595064; x=1690187064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yae1xwiE1cf9aPKATRkJstBDOT3q8TFXp4hszvxUyq4=;
        b=L188GVfLIsGs04qz+hpAoFwMSNMoffw3/q566wnweQbuLe2YkxqSNqoQbGfEAhL862
         N4EhcbdSKpjjdmxuEj2aNPkai8IqFsQa/5MLY2lEZMWIh1nU+tOIEKpHJFRs1XBmTnMK
         uMce/KDJPXEL2cpb4C03PA+2IWf8jzEdxvoXnTszB5WNMsdqGXahProPpFtm/+ZQAVK3
         RmccMqvAYdVzr3YIHpPn9s5dzqrjWaIDxXzYE2PMO1WLW83q1ArfWayuRJCX0Pz5UYsa
         wMubJZohTfhbBVGA+ErSrhtXy+rB4IgIUb9fBFZPp/49WYKKuh8nLvaaDBzfDjHNdxDK
         7aaA==
X-Gm-Message-State: AC+VfDwblCRfXZmIGfWYxFci473K3SoBaacENyYdW/nCh8P6sxcVkd71
	oNCcx5ySIboyXTZskVjMWD5Xlw==
X-Google-Smtp-Source: 
 ACHHUZ4jx/P2g1ir+gWmRrIWZy7IcsqiuMUVodKxODs+k03Uhx0DKtj4fioGTzgljiuR+pyFa4GrWg==
X-Received: by 2002:a17:906:da84:b0:988:9856:9bef with SMTP id
 xh4-20020a170906da8400b0098898569befmr16424749ejb.30.1687595064307;
        Sat, 24 Jun 2023 01:24:24 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 bu2-20020a170906a14200b009829dc0f2a0sm617775ejb.111.2023.06.24.01.24.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:23 -0700 (PDT)
Message-ID: <b8dbe86a-7b95-6839-a1d7-069d0dfa6a45@linaro.org>
Date: Sat, 24 Jun 2023 10:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 24/45] dt-bindings: sdhci-of-at91: add
 microchip,sam9x7-sdhci
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
 <20230623203056.689705-25-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-25-varshini.rajendran@microchip.com>
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
Message-ID-Hash: 6WAXLC2I3IRRUXFME4DTQX7URTMZDTGW
X-Message-ID-Hash: 6WAXLC2I3IRRUXFME4DTQX7URTMZDTGW
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:14 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6WAXLC2I3IRRUXFME4DTQX7URTMZDTGW/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add microchip,sam9x7-sdhci to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mmc/sdhci-atmel.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> index 69edfd4d3922..b8df78fbc00f 100644
> --- a/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> +++ b/Documentation/devicetree/bindings/mmc/sdhci-atmel.txt
> @@ -5,11 +5,13 @@ Documentation/devicetree/bindings/mmc/mmc.txt and the properties used by the
>  sdhci-of-at91 driver.
>  
>  Required properties:
> -- compatible:		Must be "atmel,sama5d2-sdhci" or "microchip,sam9x60-sdhci".
> +- compatible:		Must be "atmel,sama5d2-sdhci" or "microchip,sam9x60-sdhci"
> +			or "microchip,sam9x7-sdhci"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

