Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E9A73DE06
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:47:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3666114FD;
	Mon, 26 Jun 2023 13:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3666114FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687780050;
	bh=/77C/Gcp1X3tbtDglFPGY1NxWBpzQduYgDP+tYJ0DI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TzdEjO9Q4PbpvY+s7nnzdT4QSNUzaon7J9NmnQvomNOHAvlbHYkqGd6O1IB0mdfdM
	 gLNyRAHGiimcPrVtgqH1XrRcrqPTAoG6k6R1gRQ0AifeQQZVgyjh/La9d4DDKHvdMH
	 HdAGi2NoXtoEF8j9AuhSvTfLhbnKINL4EB7WtZnc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67054F80600; Mon, 26 Jun 2023 13:43:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 733ABF805F1;
	Mon, 26 Jun 2023 13:43:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 31896F80141; Sat, 24 Jun 2023 10:28:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6C0C6F8003A
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C0C6F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DkiglpMj
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-98df3dea907so28576566b.3
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595293; x=1690187293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/GIkG+tRxlPhRtm7YOpXeJRcJeLkXqLt09OeZ1Nh1Q4=;
        b=DkiglpMjfjZCyxhWBqFcrR4RkmF6xYeIJhZq2bOE8/tpFTboyhHRBzqMweLVJwZdse
         Po5v9VUAlVpzETIWlBeTSQ/MOOvNBADP10/6rUf8cTK/xsSxgq1hO5ZM9vc4292Kwd83
         VTdWBdvUwwEOS+VqFVyBMZUM6hlNddUzTKFQc1w5NukZTFWumAXPj6zYaXxUMWoU/DSy
         XQel7bucUiZ+Ngsaptd6xqTY94Y066kVJS9WhWDC0jZ5rzUsfBkGryZ36kc7qmVLWyeh
         wthERO5PoF7uGlAF2OMarb6r+LyNXoKbb+5cj2mZ36KhHU2OJG0uneADkVzgtHgvzaZM
         aiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595293; x=1690187293;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/GIkG+tRxlPhRtm7YOpXeJRcJeLkXqLt09OeZ1Nh1Q4=;
        b=ZdnP3OQHK6T/9j/4VqabugZoTz80OzdTR31JZrhXsk5ka01kZHLQB3RSKVDKZ5xPsN
         e8ALYqDS/eAXyMsw9bIjdvn5ca3jX9XVGWP+OGJFJnMhHwcxEKZizYTcbAPmKI/RHxUn
         DLuFJXE6XfAEvaoworB2qQt/Iw1o+WEFGiQ9aIhjlWDAE+WgbJ5+zZBRMTOtPgxWzcE5
         lmqAIuLVx4oYacTOFj9It3i5dr6xFFMNvtknT1lZ7dWUIKuNq1g02JRP8GJE26JzRKy+
         CCj/AiJAib6DpW4PDI95XKUpsf2pmt1m1WSgnI4nFrUrSlJHszUSS1WUBHNwNagtpBM0
         nenQ==
X-Gm-Message-State: AC+VfDynlYwtPaddCZpK+lgY8NnSnmILNQwxb6f7G37Kipj91NlxM4a4
	6taDmwf4SQ6VG9XlVeUtzqMZ3A==
X-Google-Smtp-Source: 
 ACHHUZ4ujAlY65iLeyuRh50Ps6Pp7ng1jowk6gt0zzaeZKnGL1gJBg6GDgqsvIKWUupAOCVYBEqBCQ==
X-Received: by 2002:a17:907:3e8e:b0:987:88eb:2416 with SMTP id
 hs14-20020a1709073e8e00b0098788eb2416mr19943130ejc.61.1687595293178;
        Sat, 24 Jun 2023 01:28:13 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 kq2-20020a170906abc200b009887bb956e0sm620186ejb.103.2023.06.24.01.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:28:12 -0700 (PDT)
Message-ID: <36a6ba38-d01e-96ad-c89f-7e2c860e0a88@linaro.org>
Date: Sat, 24 Jun 2023 10:28:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 00/45] Add support for sam9x7 SoC family
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
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
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
Message-ID-Hash: KRRA26P37HBX2ANCLDHTTB6JILTGKJ7F
X-Message-ID-Hash: KRRA26P37HBX2ANCLDHTTB6JILTGKJ7F
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:15 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KRRA26P37HBX2ANCLDHTTB6JILTGKJ7F/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v2:
>  --------------
> 
>  - Added sam9x7 specific compatibles in DT with fallbacks
>  - Documented all the newly added DT compatible strings
>  - Added device tree for the target board sam9x75 curiosity and
>    documented the same in the DT bindings documentation
>  - Removed the dt nodes that are not supported at the moment
>  - Removed the configs added by previous version that are not supported
>    at the moment
>  - Fixed all the corrections in the commit message
>  - Changed all the instances of copyright year to 2023
>  - Added sam9x7 flag in PIT64B configuration
>  - Moved macro definitions to header file
>  - Added another divider in mck characteristics in the pmc driver
>  - Fixed the memory leak in the pmc driver
>  - Dropped patches that are no longer needed
>  - Picked up Acked-by and Reviewed-by tags

Where did you pick them up? Can you point me to the patches?

Best regards,
Krzysztof

