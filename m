Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45E73DDD4
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:38:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4B05EB6;
	Mon, 26 Jun 2023 13:37:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4B05EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779494;
	bh=YrUO8a/L+Bx8DwsUw5aG+qWR78pIeEUf5a1gZKUp9lY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IF1w2ZmDouPh4HA/bukMnxPkQInC8Ohdp0VMw3qz09Rxmz3c7a0GszxI3I65AIydY
	 EFHPT/vbtbgfRWxM0yjwNDHWgc9R6Y5H44ujDK1Xi4L9CuR9CT4aoZNRW6oF5zlVjy
	 MpRb5h9/TekozRYFPt6mdPM2//79rAQ6OnVeD0Jo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FEAFF805D2; Mon, 26 Jun 2023 13:29:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 66F32F805A0;
	Mon, 26 Jun 2023 13:29:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C5675F80141; Sat, 24 Jun 2023 09:56:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84943F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84943F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tp25xMDk
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98746d7f35dso188520366b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593372; x=1690185372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tSt2AtZZh3GZpsNl8QTQCKxlNBUmkNMW7h6B51q0Fvg=;
        b=tp25xMDkznV75JI3vdiNAJWl65hzOtE1vIYxwwqhJlEy8/uxyjJc8gmF/4BpROZwMT
         So8ags5GA1qeqt4Tvv428U9zTD3AyFOt9eJl17rkpG9KAF+5CO4JrNvHK7RXC/XAuRr+
         JcopiYDZa1WusC6EfjHKdyFc3XbT1M/q56rklAdlCGENZH4tkQV/QG/JZVau6sqLBXB0
         2dRHekqT/OoGYzPBegRHXQEZ3vSChxxWz73Vul9JkPlhE3sg97lUxnYzd8hlJPIBh9re
         Ua5gz1poF3bWk4vsdRhFLrh3EuQLyNSezyG9xckHLFn7241Ta+EO82c3g+jtHwkNHVWO
         bPSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593372; x=1690185372;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tSt2AtZZh3GZpsNl8QTQCKxlNBUmkNMW7h6B51q0Fvg=;
        b=UPAsI3G2v5k3Ca/zijPGcc2SmHQWqSEMhUPBIMVxtfZUGW4vW7INQuyxbZ5snjydAh
         Pm5I350GFnYEwFUflkRmRmoNDlwx3uWSafCJwrwQ7Sp1yIvScWi7wW992mpyRcc6Ca0V
         utVDv3JvQvq/PKNiB5VWC5h2REUXUSRUDZhoyYxjZbgl4DCu0X8AkM5lYWYyfGyfXVHj
         Zao/bzmyZ+hgSyZcLHBePOvHKPk5ySc12gN03b/PceC8c4N1kUKvKPdJEwUtZ1wsGrqB
         KIiu5+NU3hn8JkORvBeFCxnapUgOvJePBHrKcoUJavF0BNzaO+nNBBRCpYGF1W4NZjv0
         Xv9g==
X-Gm-Message-State: AC+VfDxBujwTkmBaKn020cDVpoGbZlpxncqy/Fa61o2iTF1QPixBIK0v
	SNb8031ZKBroXSmnuENGddc4Wg==
X-Google-Smtp-Source: 
 ACHHUZ6NF60BoiHF1787mu6pGM6EiBURQ9TKeKNqM6q3ihuvMLTZrjMfALGAKYzmSFnyF+q8mSD8Pw==
X-Received: by 2002:a17:907:970e:b0:98d:470d:6c7e with SMTP id
 jg14-20020a170907970e00b0098d470d6c7emr5868847ejc.16.1687593371873;
        Sat, 24 Jun 2023 00:56:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 fy23-20020a170906b7d700b0098d4ac60c20sm577426ejb.190.2023.06.24.00.56.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:56:11 -0700 (PDT)
Message-ID: <f2f8cabf-ca4d-c6f3-5561-b24334be89d1@linaro.org>
Date: Sat, 24 Jun 2023 09:56:05 +0200
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
Message-ID-Hash: W4SDXMOTFEM7IQDH3VZALMVOOE6G6CMC
X-Message-ID-Hash: W4SDXMOTFEM7IQDH3VZALMVOOE6G6CMC
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/W4SDXMOTFEM7IQDH3VZALMVOOE6G6CMC/>
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

Your CC list is enormous and causes multiple bounces/rejections.

Organize your patchset properly to avoid this.

Best regards,
Krzysztof

