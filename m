Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5031C73DDD5
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:38:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CB807EAF;
	Mon, 26 Jun 2023 13:37:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CB807EAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779504;
	bh=RmyYR0VAWFIX05QBwakiY83xZ1t3jRWLSzVNFfuGBMA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gRDRkrwRE8+Un/sTNjQFdS7Gk4oVJElGdtTiMdVWqCvC6BgX/tkeuYRLy9UskUXoQ
	 2sCvvkR9xF0yzMJApB+DXZfQ5GYIBvqxvr+erkhYs6R7rKxLRbVFosCLwt7Xdl0GMG
	 f46dS/EtFcTWA7OOU/ypBrIlEwmv51rOlUXJRYdI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 63B7AF805DA; Mon, 26 Jun 2023 13:29:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A8625F8072A;
	Mon, 26 Jun 2023 13:29:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8A691F80141; Sat, 24 Jun 2023 09:57:31 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C5806F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5806F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HnqNx/Eb
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-988aefaa44eso178970466b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593447; x=1690185447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i6/OKE3tdUs5NzQDJgtLHSJJGNPHgdjozA0WirJWwVM=;
        b=HnqNx/Ebwlv7O4a+MO53LVK8hUXaO2CscKgFVOdXu2ycnMg2hOS0E0CzugfJ3w99Sw
         NTpfcO8m4fcFu7MQn1RVPozmqJTrSYnumv9XZ//sHZFfnfQn38R8rBKcX9/41fMUm++e
         SMm77XYsnipU3YNETrH2NcLRyssL3zI6YmQzliflkWOFkjuhDWQKpw9oHLzSF4yxj1Zb
         0WHuZofFw0RlYyr3v57UovyHHwgejt7TDVz8L41/QVTNC3ruqQIFr/BZIHDOI2RPurVq
         m+m4zKhmQGGpjsiHNqKQ41IzwPemcQfTXtF/FSAXgnXXsxI/R+pb7QaK/NRZMzPQLBf8
         wzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593447; x=1690185447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i6/OKE3tdUs5NzQDJgtLHSJJGNPHgdjozA0WirJWwVM=;
        b=UIJEvAN9YwNT28QNNoDV8Q7CE6J4sEKqiYJlNNUwUXnGwy24L20xhNndA2OfvrJC7k
         d6oos9DmFGwDz49xCkXrpwOhsqwCSWq1yqT/LAYK8bBWBK1G9DcveNspkdpqKUyCG+VS
         casi1Vt82OtnE8C8dwjWSZQNh2VB0AGD0v/oYDm4wgf/Sfsa+nIeoqG7SM2Ajr4uqD8a
         4Fv3RpQBYpi1sL+3X8627NFNA9wTB+PzJB2iVxI0D+/3CIBYNVNPFO5unnjmDCoLCFjL
         vusbXyn8aCQ+RHe+z/kNtMHwmWPVPcdrgTOX9Uy2/tCUR/eT7+WgoTW6KclUM3BGbWEf
         ggsg==
X-Gm-Message-State: AC+VfDydCKoqNERYlkQCxbpYstcCcTjr39tcw9Bo/USk/aULAcb1SgvN
	KOpx6l6GmixutTb2MjxrUguUqA==
X-Google-Smtp-Source: 
 ACHHUZ7hGHGwi7ptFp7dDRS6Z6+2UNRDyiR5qq+R0zKm3LPTmxEiM/1iXpaTmu/76o0ziH1heFA4BQ==
X-Received: by 2002:a17:906:44c:b0:98e:a54:42e6 with SMTP id
 e12-20020a170906044c00b0098e0a5442e6mr75957eja.5.1687593447021;
        Sat, 24 Jun 2023 00:57:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 q16-20020a170906361000b009893f268b92sm600124ejb.28.2023.06.24.00.57.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:57:26 -0700 (PDT)
Message-ID: <703ed392-5607-446e-e59a-8b51b6cd0007@linaro.org>
Date: Sat, 24 Jun 2023 09:57:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 12/45] dt-bindings: reset: atmel,at91sam9260-reset: add
 sam9x7 binding
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
 <20230623203056.689705-13-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-13-varshini.rajendran@microchip.com>
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
Message-ID-Hash: LM566MXURQJFZEQKJD4FGSBPRKYPZFD2
X-Message-ID-Hash: LM566MXURQJFZEQKJD4FGSBPRKYPZFD2
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:10 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add documentation for SAM9X7 reset controller.
> 


A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.

> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/reset/atmel,at91sam9260-reset.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> index 98465d26949e..593a13c277ab 100644
> --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> @@ -22,6 +22,7 @@ properties:
>                - atmel,at91sam9g45-rstc
>                - atmel,sama5d3-rstc
>                - microchip,sam9x60-rstc
> +              - microchip,sam9x7-rstc

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).


Best regards,
Krzysztof

