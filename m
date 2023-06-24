Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 526F273DDE6
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:40:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B7F157F4;
	Mon, 26 Jun 2023 13:39:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B7F157F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779618;
	bh=7XAEUY6q/F84BrecGtRuDRu8GYTt+kFsjgKKlzF/iII=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cxpTQLMcfjLiK/iC0XVsX1AqCFUTmcBsiqU6tBBlcyVbKChGQ6wQhEoGDAwj0H/lN
	 zsusFyfwgnIB3XRagGTkec5zZILEV3+P+X6ijS4gg5DfPuT4gZIbiu6bRRe0if+9kc
	 ivQVPOOFb1rYOh8aNKVhnorLh7wd2BQV/Y/gfnSk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9B9E4F805EE; Mon, 26 Jun 2023 13:29:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF9DEF805EE;
	Mon, 26 Jun 2023 13:29:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E670F80141; Sat, 24 Jun 2023 10:02:04 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D45F5F80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:02:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D45F5F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=D9tJ/Sfp
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-51bdca52424so1557675a12.3
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593720; x=1690185720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=evwXLshiChnPPoFaOHbuHqZ762vCCjuGEyQDNCOD67s=;
        b=D9tJ/SfpPzuEgx6VkFAna6q37GPvy140Mp1+3AL4FalYGKRecNq4J5+7jqN3/okS8O
         6VCYYFjRmknfk1Pc6cmV5km+eu6S8+dNsd/6ZxlJHnuwXBsHrGYlDYPQc+5f6+k6+IuB
         GQ2i6ZzaDPj3eVQfF+ha5N+EegiRLR6qQUSP7YQmJByxynUIP9FFNPV1KvaIldisXyYf
         CEC0Kmvo9lFLJYFbPpu7qy9Q8Xiyb4NJqbwsjDnHHtgoqGqOd9Th0k19ifx675SrSoj/
         Q0oNeP6rMCMHk685HjSqRhDPeDMfnhCGrCr0QzKvt4/28ajDuSinwy8LILhi/tqkhGoC
         s1TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593720; x=1690185720;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evwXLshiChnPPoFaOHbuHqZ762vCCjuGEyQDNCOD67s=;
        b=DumQ8bquW86/XwTwgvGYTjhJYasUXG8j+mVJ0VJv8H/VEZ+xbUjzqPr61QBYnuqtQe
         UJ07nsuaVl9hNvSVp4jOBuFMbKUpES35bWUH3BIniv4OVbMtRQ5nrubSha69TIVdRaK1
         WDOtncXdCaCPnInA4UsxQFR1ZyHcpNUkN27MO/SqR1bcbVPgzjbFlwID4MVd1xca3ZU8
         6x8d3sIegw85L3GQWVVCU9fvSZrJRvBCPmdS5M0gTYZ0X6KZLTHyYkbvmY/1VseoyFr8
         2C9XRrsHvZt4KHNuOh0JZMW2Pfp5cksCtDMGh3ELFIAWPSkC7jStYfAlejqbmWr6O1H6
         NCpg==
X-Gm-Message-State: AC+VfDxw4Kpf78A6YucDW997GBw32oDKqRwjVi6EEh8BDSlDHihTDWRV
	wlhfEGid+gxex08StYKs5tmkzg==
X-Google-Smtp-Source: 
 ACHHUZ6WVqK97+L/rLsxsj0TIcEtyCmujOvKdKn3w1rntsMk+nGINy7dJc6MjB9ynUGuEpDSVTkQsA==
X-Received: by 2002:a17:907:3da6:b0:98c:b942:dc7d with SMTP id
 he38-20020a1709073da600b0098cb942dc7dmr8195232ejc.64.1687593719652;
        Sat, 24 Jun 2023 01:01:59 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 lo6-20020a170906fa0600b00982bf866f9esm607015ejb.66.2023.06.24.01.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:01:58 -0700 (PDT)
Message-ID: <fb91791c-760f-45f5-12db-04f2ff1be8c1@linaro.org>
Date: Sat, 24 Jun 2023 10:01:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 28/45] dt-bindings: rtc: at91rm9200: add sam9x7
 compatible
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
 <20230623203056.689705-29-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-29-varshini.rajendran@microchip.com>
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
Message-ID-Hash: C4DC3G4FLACLLXJVG4YLLWWV4IXAI2QR
X-Message-ID-Hash: C4DC3G4FLACLLXJVG4YLLWWV4IXAI2QR
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:45 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/C4DC3G4FLACLLXJVG4YLLWWV4IXAI2QR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatible for SAM9X7 RTC.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> index 4d2bef15fb7a..e15872bbdd7e 100644
> --- a/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/atmel,at91rm9200-rtc.yaml
> @@ -20,6 +20,7 @@ properties:
>        - atmel,sama5d4-rtc
>        - atmel,sama5d2-rtc
>        - microchip,sam9x60-rtc
> +      - microchip,sam9x7-rtc
>        - microchip,sama7g5-rtc

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.

Best regards,
Krzysztof

