Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC4673DDF6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:44:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5DE96EEA;
	Mon, 26 Jun 2023 13:43:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5DE96EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779878;
	bh=hBDUaaRe57oRW6+P76hfP2Cm9/V3CZ19WH0I9XGGE4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T4/1SxtkKpH0XQj2FnK/YD/Gq+fqccMHoKFqjoAzhBjSFmxierzRep7BpCBvHQ52l
	 9KeqCw9XI/+t8iGYpC7ezP/BQsYD/T31GDIvObbKjMvXTUK2cdkGe6bz4P47fAEoPe
	 Zl8OzUaToP/z6LvGNsaSZpP5eyW52QMZsNNjTHKI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 524A0F80093; Mon, 26 Jun 2023 13:43:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CEADBF8027B;
	Mon, 26 Jun 2023 13:43:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA807F80141; Sat, 24 Jun 2023 10:23:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A7204F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:23:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7204F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=xFKigBdV
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51d894b9b6cso26803a12.3
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595008; x=1690187008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGCuLOrcQg1CRlpQSfVcmvKebFGyaZsdxYX9CXcfLZM=;
        b=xFKigBdV83Jd1qUsH05hPiIU1P7h6ll6on3yqFhMjrYPwiCXFC0e303zASaD1ZqqKd
         Ndiy0iOYjUF8YhQxuAkR8Nx1s9PjpApJ0TyNtB1b5gwgsCvZs0iajX45ENiiPCQcPY96
         g4S9zr1214rNmDdio/oKh2DCVClan9uYvQlB4qQl0yjuKnXTLTRyO6dOXqyvfX0Ge8of
         8DruxxWJt1OJ2iHb05QqWeR0WDztLvfZd6ajx/RAVn5knbq8nIzSWIixJylIR/D0BwLR
         irpLdb/TPiW3i6BbsRoMZNvBM8AZ4+ztRJOKNPudJyzZ1WNXldj3Z+N3OczkwWUKt0K3
         5mrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595008; x=1690187008;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGCuLOrcQg1CRlpQSfVcmvKebFGyaZsdxYX9CXcfLZM=;
        b=mEmIMV7iGn3AjD758vmtHUkpu6O42KTJy1yxW/oZ8d+WoGmqYd68sytxjRKqfHGHsQ
         ixC6mEukwnLx5pB2DeZEL7spSog9EGebaJyn7TL6RrZC1GM6odvv/bE0hsfgP0FmeQnM
         k3uhkipFo+389+soQmOQqPpkZK3jXaKXM7DfAzADWYXbKRe81xKMtisJWVYzC2/nm0Zu
         HS9ioXchonXT8N0/VQaoB0l+bJXlGKJbLTkQL5/zMnXeE/2lGj3uuc2luT1aEM1yiB1H
         kr5VxbHJq1CneFMKBsYJsUb0WILkt+y1+vjXksmxVgr8FhKR0dKq25MbbPQycpsywv3A
         q1rg==
X-Gm-Message-State: AC+VfDy9TfMaKs4P5U52yEhjQdK2oRGiyE14T0xuPtmEC2kiUti/+1Mk
	VJkpsZLf/w2Kfw59LaHBR0xWLg==
X-Google-Smtp-Source: 
 ACHHUZ5rxUhuZrDxVobS5SDmzvY5J2k9KNpHXKQzE6cA0gPVXDKAPA/JRUBn5KncILCak4yP/Iurig==
X-Received: by 2002:aa7:d281:0:b0:51b:e89e:a848 with SMTP id
 w1-20020aa7d281000000b0051be89ea848mr4981862edq.17.1687595007953;
        Sat, 24 Jun 2023 01:23:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 g19-20020a056402115300b0051873c201a0sm436026edw.26.2023.06.24.01.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:27 -0700 (PDT)
Message-ID: <2b6ee66b-b2d1-23c3-9b26-d44fce7fd6bd@linaro.org>
Date: Sat, 24 Jun 2023 10:23:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 35/45] dt-bindings: irqchip/atmel-aic5: Add support for
 sam9x7 aic
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
 <20230623203056.689705-36-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-36-varshini.rajendran@microchip.com>
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
Message-ID-Hash: UEBK4YWJWQU6ZJXB4ZTWZIT3HZA4PN2Y
X-Message-ID-Hash: UEBK4YWJWQU6ZJXB4ZTWZIT3HZA4PN2Y
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UEBK4YWJWQU6ZJXB4ZTWZIT3HZA4PN2Y/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Document the support added for the Advanced interrupt controller(AIC)
> chip in the sam9x7 SoC family.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/interrupt-controller/atmel,aic.txt      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> index 7079d44bf3ba..2c267a66a3ea 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> +++ b/Documentation/devicetree/bindings/interrupt-controller/atmel,aic.txt
> @@ -4,7 +4,7 @@ Required properties:
>  - compatible: Should be:
>      - "atmel,<chip>-aic" where  <chip> can be "at91rm9200", "sama5d2",
>        "sama5d3" or "sama5d4"
> -    - "microchip,<chip>-aic" where <chip> can be "sam9x60"
> +    - "microchip,<chip>-aic" where <chip> can be "sam9x60", "sam9x7"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

