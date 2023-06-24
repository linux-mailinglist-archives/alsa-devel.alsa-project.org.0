Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3C73DDCD
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:37:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45F9EEA3;
	Mon, 26 Jun 2023 13:36:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45F9EEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779438;
	bh=Lu7nkCYQRBx5qShB7UFWYrrYxK0nTYLDVOexPDYZ8VY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=IbJe5HjMWlFxYFNehRknhehENfcpxL7zhhwLNxseEcQxR86RTL7eJ2DylyF5iqzv8
	 ou9mz5h3ytr0Bv/mWAtVhwOGGtcf9X5YNVgGL610iPIkdiSXOjuoVqoZJnB5fNlu5E
	 O4Ek7SCu/wAcUGikgnat57hHo5yHre0fPyy60bps=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0422F806FA; Mon, 26 Jun 2023 13:29:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A58D0F806F1;
	Mon, 26 Jun 2023 13:29:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13DF2F80141; Sat, 24 Jun 2023 09:53:39 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 99862F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:53:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99862F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qL+14ZF0
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98de21518fbso46528466b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593213; x=1690185213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d0dU3KHDoF8oZzutBDKpvFK9O6jXuVzZS7UeXmnvOCk=;
        b=qL+14ZF0SFDS92k57he/MqJcbZWj42LI8iTDe5f6UYIF6jj69Jgr0nJO9ZKFef0TUo
         97WraEyayeMo+lJuOUrJK7R4eJVDqCzjfRmhLG3P8cyutMpOzOWG/lQIHosPAX4ha2E9
         zMU/72ZWCKk3PZdPbJDC10ZHfV68fkWiuDOPnvDrzAWl4ttHZ/GP3O4Ox1Q1s9xdYpYS
         2KSNZFsLSyFMd/9XzPC8BdcOaV+EvQg7dZxPuDxO7s3T8cuSuKYXpGtE7vaH7AQxM9f4
         bJAsKHAKvYjav2XjXHTrmIboFnd594b8tp61wr6olfTnGaBDiPapYgy5Df8wNpjx/XnY
         9F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593213; x=1690185213;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d0dU3KHDoF8oZzutBDKpvFK9O6jXuVzZS7UeXmnvOCk=;
        b=PupLB9lDBizQUds6WyhnI4dJUCnWwYXBeE4rrJfn06fbHuCOBr4JSbrMY9VwctF39f
         qTtr8b1oDUq7UlWdml9DGRBwLw9yuP0n9ETizyMyJV+DXFKbB75DftAum1eSA+Ns9/P5
         uz6pyizK78J+XB6IALzRS4LC7K3eory2D9SZ2Th0Jl1didyJUR7rhoX07oS80ObOREPt
         Ap/lEG4t7gNY/XQKPB2aeBW+1NVha8yzbR0Vl+BvlyA6sCSB0cpdQXWZVJl0YAHIwd0P
         X/WDLhg6hg5pZWeEY9oygPMeIVe396vm76XMn8wQT+T5cwEJpfszZsmJXpXPdEKUtmA3
         oZcw==
X-Gm-Message-State: AC+VfDywXFKkiy8/FKw5AWjyAt9wHMdcrNZPkCdLNyHa61YrwDtoADkw
	vf1qjtJl81K39yb93WgwcXjojg==
X-Google-Smtp-Source: 
 ACHHUZ6rxF9D2gin1FtwSBjnqHQU40ChmXYOoZkfDSe/Nou9AC2VX7R26o19SB77+MsKurZ8l61ESw==
X-Received: by 2002:a17:906:7a19:b0:98d:b73b:b5f2 with SMTP id
 d25-20020a1709067a1900b0098db73bb5f2mr1706603ejo.71.1687593213726;
        Sat, 24 Jun 2023 00:53:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 g25-20020a1709064e5900b00987e76827b2sm602028ejw.53.2023.06.24.00.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:53:33 -0700 (PDT)
Message-ID: <8574bbcc-2dfd-3fed-ff4c-cab1f6e79f7b@linaro.org>
Date: Sat, 24 Jun 2023 09:53:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 02/45] dt-bindings: usb: ehci: Add atmel
 at91sam9g45-ehci compatible
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
 <20230623203056.689705-3-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-3-varshini.rajendran@microchip.com>
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
Message-ID-Hash: JIEXZ2UZCM5UYACPCFBP2HY5K3XQUIIG
X-Message-ID-Hash: JIEXZ2UZCM5UYACPCFBP2HY5K3XQUIIG
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:28:40 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JIEXZ2UZCM5UYACPCFBP2HY5K3XQUIIG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Document at91sam9g45-ehci compatible for usb-ehci.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 1 +

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

