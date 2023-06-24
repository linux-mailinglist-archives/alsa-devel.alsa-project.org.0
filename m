Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D92373DDF9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:45:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 942281060;
	Mon, 26 Jun 2023 13:44:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 942281060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779927;
	bh=Bfiz6rp5bKD/MbvKIlp++2wIe6s5kep7cQn62tuSyZM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nHB6CejyJn1BYZeAKxVaFPOeGNF1GGut6cxQn86YZMP6KEhJro3nJ06G0us1HNZBF
	 YNj1j6A3tkrZX3Vk+9FDiVDOqZ4ShUba7pM3RJmrWaniiN7GFIwZik0/CL/libNb/i
	 LodWAoH3vf1u88keuLZKsGdJWjP/uKcc7V8NKUJ4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05BF3F805AA; Mon, 26 Jun 2023 13:43:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 48F69F80579;
	Mon, 26 Jun 2023 13:43:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6D34F80141; Sat, 24 Jun 2023 10:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 81583F8003A
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:24:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81583F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TvwuTD1h
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-514ab6cb529so4552779a12.1
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595042; x=1690187042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3rmdMg6KqyfM4vHKUpwecy9214du+qFl2Fy/UDsrrm4=;
        b=TvwuTD1hCQ3nAnAEpHE885dBBw4DHnfj7ey5fw+Ut93n/UtCNrwY7zyxy+yJ2oyrMH
         sxHwRJzUJSZ/bSL6g42Wlt6bH+FNB8GXTMRXJHp2yIWUR3vuJAEuFs0XV22u+npYhezV
         jM6N9NOBgpVT757Eu0gl5uSwDlFQwyf3Imb1S4hpCRDhP7KHj8DryeuHFasi+M2hQwlP
         5tELy8f7cVXULLPBAh3GxkbkHFgiBasCTU9Sp/mcHqEe+UyaSC/SKiyqCadgZmZ40bFK
         +/vlZw/erX6ARWTIiHOAF0g1NYYIdeZ3hT6m6rnlSB70vaJkO/1E/y4zDlLiBzNmi4nw
         heww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595042; x=1690187042;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3rmdMg6KqyfM4vHKUpwecy9214du+qFl2Fy/UDsrrm4=;
        b=dKgBz8oyFlQhcyyuXSyZimFhAG99vctlbVGznfZNHHQoQ56fmwW/eOoq65L0nWa5+w
         RRO7BgMqhZkowlr+xWcq4wUFSwIO/tjd4Q2utGUGsIj3r14N/YpcMHFglnEGvjQXj4W+
         798UNlkow1v52g4lTTwBIteCkhX0YQluNy6Hj31zcP+mX+rWA3x4OY05vog3I5uSScCl
         Ts4LlcY9lcy/MkjkGx1/nxVcPEotMsYmK/t7GyEl2icXrHG2ULKdGy8fvkMfZlFR0d+b
         VrgEddIAzg5++Ab/D0MYfAtlKHYtWySvp5vRIvRrlmD31KAv8bqHe6ngS4VM4N/4sH3E
         /xEw==
X-Gm-Message-State: AC+VfDyp3VJY+fd00Zrt2//GRukAM3RLJ/ZHZ48M42GTeoG1hhh9x+NX
	Mr2mqmrHc78vJsvowLJ5A1tCpA==
X-Google-Smtp-Source: 
 ACHHUZ5uBeAmtj/QzF2pyScKZoEXKfoalX1DGZidPH3H+lFnKKTjF/iE5DlV5Gq3MvXs8SEHiYbmvg==
X-Received: by 2002:a05:6402:1d49:b0:51b:d59f:8518 with SMTP id
 dz9-20020a0564021d4900b0051bd59f8518mr12391317edb.16.1687595042718;
        Sat, 24 Jun 2023 01:24:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 y11-20020a50e60b000000b0051bdd068492sm423197edm.52.2023.06.24.01.23.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:02 -0700 (PDT)
Message-ID: <c2dfaa33-3d37-75b6-3035-cd6b70d87b07@linaro.org>
Date: Sat, 24 Jun 2023 10:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 20/45] dt-bindings: atmel-gpbr: add
 microchip,sam9x7-gpbr
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
 <20230623203056.689705-21-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-21-varshini.rajendran@microchip.com>
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
Message-ID-Hash: Q2IOMPZS4E2G7WQBFHX3S7DAQLAZLIFD
X-Message-ID-Hash: Q2IOMPZS4E2G7WQBFHX3S7DAQLAZLIFD
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:13 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q2IOMPZS4E2G7WQBFHX3S7DAQLAZLIFD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add microchip,sam9x7-gpbr to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-gpbr.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt b/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
> index e8c525569f10..2cc39524af8c 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-gpbr.txt
> @@ -6,6 +6,7 @@ Required properties:
>  - compatible:		Should be one of the following:
>  			"atmel,at91sam9260-gpbr", "syscon"
>  			"microchip,sam9x60-gpbr", "syscon"
> +			"microchip,sam9x7-gpbr", "syscon"

That's not what your DTS is saying. Srsly, just open the DTS and compare
the list.

Best regards,
Krzysztof

