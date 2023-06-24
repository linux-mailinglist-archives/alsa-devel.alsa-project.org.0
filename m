Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE9F73DDDF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:39:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3E9D4EB6;
	Mon, 26 Jun 2023 13:38:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3E9D4EB6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779553;
	bh=95C7pQwwFkRI5maoNjxsgmyUieW7BTrUXtCOlAC/em0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fLOlxiibk/bqWDlLurdssD460/CpBSWHUnY/bk2iime+oxxkBrus08aiwWlfezYlu
	 CeFcDEV3So+4AKPx4Z6xiYIPA514NG8z486pA2AMjTfXb74tbEut6kxavXLXPkAdvG
	 Hw6hBtWlMaU4I5ORDLLCe5IwdaMLlmNpnASyoN0o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CFD64F805D6; Mon, 26 Jun 2023 13:29:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9E5DF805B6;
	Mon, 26 Jun 2023 13:29:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A43DF80141; Sat, 24 Jun 2023 09:59:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12403F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12403F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=HEwevcjV
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98df6bc0048so24297066b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593583; x=1690185583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FTjB3MUThuy0fH56tPu8r2SapKpsQyQgWZ4G2iu3Iz8=;
        b=HEwevcjVQu+8yO3NUrkkTGxP0CcIpGsLiEQXCTRo3UkbkAEAAtNC0UlY9ftejwavbS
         WPfQTRQVl1GcrgXT/jwnimlNGGTxk1BasUFrZ0+zaXN90t4zsCJHF8eP/rzPh9y7q75O
         DrmxzN2V5bro/a7Yjn2JaR+shcHxeMnMBPEOsxKHS90sJWabsHm/pELi2kj5UnO7u9RD
         LnX93Xk9EYFZE7c3mDCbNFjt6xfev1h30nRmSxtXhBhzhBmUqIahBD/KcUlZwriKT34w
         oFkzPzPGaxAQxWKiI+DomOOYGd+hKHvLudnuiUccthDx082FzhV3uj+CPG6toFmF8/Bz
         rhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593583; x=1690185583;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FTjB3MUThuy0fH56tPu8r2SapKpsQyQgWZ4G2iu3Iz8=;
        b=WXfJbGAC1wEJVBuCKbDBDMH0p5aIQLQX2E3fXU/RuF/uTQ5PnZphlugjhtS0l9G1r+
         yna38ZaTLWZ/9bw3X4HV3gI6u2OeXpp+GqNtE6hxIeMfFn2cnBsnkaNPYePgVhFrOQvF
         /pUe/rtGTU3w3Hu3NIETV0jX+VizoTwoMRu7Tj9btt3zfujrxDKpJ6FAIJsMyyrEa7ny
         5QaAC640SJMZqFruum5zFQnZgfEm+QY+v4JE739tEO73B0MURBUBX2g4JzF1spK7qEzg
         a0d0WAKElT2cHj52t9M4PaFPw0c/qnpV8GyLGztQLSNAXW0sD2D1d8jJFGkl+YIa9tgk
         42IQ==
X-Gm-Message-State: AC+VfDx0lmpP8sscMrznqiAp4yOT5XO0M8ZjnSNorA3f5m57FgYQoHEU
	JLYY29xlGgzx4Yh8/qikxpbgcg==
X-Google-Smtp-Source: 
 ACHHUZ5pRd8UNSYc52Q0vkUp3nRCIrlMv+cEYLJxjAGxSYuFwmJusDkYkiVv0idqnJteffrCHMZ8Sg==
X-Received: by 2002:a17:907:783:b0:988:dced:f339 with SMTP id
 xd3-20020a170907078300b00988dcedf339mr12750156ejb.31.1687593583035;
        Sat, 24 Jun 2023 00:59:43 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 t23-20020a170906179700b00987f64b84afsm597458eje.39.2023.06.24.00.59.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:59:42 -0700 (PDT)
Message-ID: <7c0025cc-ed36-f4e1-d48d-d09326756d89@linaro.org>
Date: Sat, 24 Jun 2023 09:59:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 16/45] dt-bindings: crypto: add bindings for sam9x7 in
 Atmel TDES
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
 <20230623203056.689705-17-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-17-varshini.rajendran@microchip.com>
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
Message-ID-Hash: CLG26AINDNYAY4Y7DLLYV5HDN4UIN3SB
X-Message-ID-Hash: CLG26AINDNYAY4Y7DLLYV5HDN4UIN3SB
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CLG26AINDNYAY4Y7DLLYV5HDN4UIN3SB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add DT bindings for atmel TDES.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  .../devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml   | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> index 3d6ed24b1b00..0e71bfd32a1c 100644
> --- a/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> +++ b/Documentation/devicetree/bindings/crypto/atmel,at91sam9g46-tdes.yaml
> @@ -12,7 +12,10 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: atmel,at91sam9g46-tdes
> +    oneOf:
> +      - items:
> +          - const: atmel,at91sam9g46-tdes
> +          - const: microchip,sam9x7-tdes

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.


Best regards,
Krzysztof

