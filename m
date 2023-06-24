Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6B973DDD2
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:37:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FE4E9C;
	Mon, 26 Jun 2023 13:36:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FE4E9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779469;
	bh=EaK6hmijAEMUIzOAcSiixptl7drDhk43LpjakO7MwCc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byxacmGKf5ex/KSJu4363ys0za7JG7wM4LMeJt9cfChVlVXipx5JY7fjDJmyf7v66
	 1o+e2vwc8DFBz0ddVN5I9AISPgb+3dMiDNHc+hQnHhQ93PowF2AOQX4+XQgvzYB7ti
	 2PSa7TEHJp8+NGl1uQMcyiM4MUXEflNzRusq4XIg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80404F805AA; Mon, 26 Jun 2023 13:29:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 30EA9F805AB;
	Mon, 26 Jun 2023 13:29:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EC6C6F80141; Sat, 24 Jun 2023 09:55:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2D69F80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:54:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2D69F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=eD/q9ISs
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-986d8332f50so163843366b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593297; x=1690185297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=soj7fUfKLSUMfNJRhcGNetkgOh1MYDCQh05RlBdkeN4=;
        b=eD/q9ISsMCL47wOXs6De7fuRpet/07x40xn71+pyopNmpfC/leMOmohtiJNK9d+/0e
         ILxksxb1fX6rwaa0PNl4dIKNWKQ0JE0p+6mC8Npy2RJ92zmvNc++lXF1Evombv7lLOhq
         j0dEkeCidthf58IY6B/xewKh7UeXN34mH4Tn/G+1iZuhgJY19SkmNAEXnRUl+6Hr2Pkf
         cSz2zRZiOrOsv0eavcQnSNRSp9hvrs6WsSE1JlocSaWw+8h6/lYnvjc7aqnaDQHYXfi2
         MGVSEIum3iSzoq+S0mokQ5a3djEQN7ISokIkliin4UzR1LuGSZT4+Gyjp384W6jbO4Hx
         53EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593297; x=1690185297;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=soj7fUfKLSUMfNJRhcGNetkgOh1MYDCQh05RlBdkeN4=;
        b=Z3buP70LbDUkvcateswCEeNCnFmW5JH9Z+kIsfg3EywsTZ5JTPfrrz/epso1Gc/Lgb
         NydoxRuG8YmTSY4Lr/df5A9blfH8gFK63HM8xvuCquYQLMoovF2XZujAB3ZS9dFbKQnL
         hTjgRMIScES8xoflRgXblnZIi/b87v07WuPY3LqHdJ+BavehM2zt/GSKChGq3brfoPYO
         oB82MrrT28h2kSQqO+LTOQI6PBHrNae3pNAwYoQHoNsW2W8LIFvU+sPbAC0UsjIfE+U/
         caIwwfr/vi1pyKbgHiIdoPTa5aq+ghqmuCfsz5jBRouXNkYF7IrrQCVt7KQ414X6l/Ou
         TLuQ==
X-Gm-Message-State: AC+VfDwrihsX+NSRONyI+e0xTgJC/OHRdFTBO4ZzNLKEuIScm9sgxNd/
	vHadDU2L7MNSA+eJxjWQXiWDqg==
X-Google-Smtp-Source: 
 ACHHUZ5vmH/wKISmL4HMBTOHg32GmJjKiHm7OZvesTfDEOfAm6Koe4Xv//vNxQvMZ5IiPxQ9Ro3PoQ==
X-Received: by 2002:a17:907:320e:b0:96f:912e:5ec4 with SMTP id
 xg14-20020a170907320e00b0096f912e5ec4mr19710575ejb.16.1687593296802;
        Sat, 24 Jun 2023 00:54:56 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 o6-20020aa7d3c6000000b0051a5177adeasm400813edr.21.2023.06.24.00.54.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:54:56 -0700 (PDT)
Message-ID: <428a655e-8664-0e68-7eda-8edd47a4eee7@linaro.org>
Date: Sat, 24 Jun 2023 09:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 04/45] dt-bindings: net: cdns,macb: add documentation
 for sam9x7 ethernet interface
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
 <20230623203056.689705-5-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-5-varshini.rajendran@microchip.com>
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
Message-ID-Hash: 6UV232REL7YKEYNNQS3BPFAVUZJCCOKV
X-Message-ID-Hash: 6UV232REL7YKEYNNQS3BPFAVUZJCCOKV
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:28:42 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6UV232REL7YKEYNNQS3BPFAVUZJCCOKV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add documentation for sam9x7 ethernet interface.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/net/cdns,macb.yaml | 1 +

So you ignored the comments and tags everywhere?

Best regards,
Krzysztof

