Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 847B373DDE8
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:40:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15913EE7;
	Mon, 26 Jun 2023 13:40:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15913EE7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779650;
	bh=NU7tx/tXJ7slfag5UFGKCtK18Va5rw0Qf6mnTgDF1fM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qlefMZY/dfL7UT1bsUxOPtuiHExEqg0iqrkzCWFuj8DMSClUYNjnMT49bbFZ7r8TV
	 W5YPhDRqb0dNeEjG7oI25eGsiDn+ctqRtD2/ujXd1UGiFv72/YR2MBqxNsVY5WxTTj
	 WPQyQgx06RnoURgSwTc8Yt4UqRpObx5qqxa49DCw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A7D34F8081B; Mon, 26 Jun 2023 13:29:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 14521F805C5;
	Mon, 26 Jun 2023 13:29:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB49BF80141; Sat, 24 Jun 2023 10:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AF1DF80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AF1DF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=IGISLJU8
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51d5569e4d1so403263a12.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593749; x=1690185749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L8LUDdIDqS/S81pzeykwMUjVd54i6Iidt8jcXJziYFU=;
        b=IGISLJU8aL9N8mVg5tva0FYJZ4ypiF8eDRpd6Rn8HPZy48/jSbTIltoLQMlSeM3L7i
         Gej8neMhutSWohQ24tzO80Lpn3kaLt9qqqRwOONjtjD/gRLklgEGqn2uq8r8WCnVjZU/
         0lc99U58ylKcCJEJPP/lfFSYAUX12mhkOhQvyuZPdyou9/jz69f1vvrBPa+sEfa9ZPnr
         OzxyhRY7ALK8r11IHXFwC/0P7k4XIkrn4WIr9sRXhRuL4JMOb+f4XV9bQ2F2Sun3Kdd+
         RFW9JXqw22CUXQ81UiEc3zXhCcs0R+mF6aloRmSsO6/VuzfhI6dXXM3pwXPg/wwzOsi/
         XO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593749; x=1690185749;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L8LUDdIDqS/S81pzeykwMUjVd54i6Iidt8jcXJziYFU=;
        b=FLydR+WNiRmCrtfUFmd+u840AZswNYk06XnoG+g/9bce6Y+l/lTNg4WGEunVd2Zueo
         /wJfFwsurNfjVvFy1tJzT/ivrD0IBf+43irkApy13RkF4nrUsOqDbjdNS4Xt4yJDDM3Y
         Yhu87UZIrfG+IbZzvI0lOkibQ53p0W0AptPf5dpvOcY3Gzd9dZXN5yjnTKze+qO262+I
         yOWJNsjWyaLG5YjDRMQI3JVp27RhgG5PO3ExJ/YXmYaQ/P2tcjDdOwbTuQOyPARKsQ8i
         1uKHGiUG394hLvaHs1UxHpGyY5UeGXWOYu8YI2vIhesruIySkpBtAXVGR9B2lMJZVEIn
         f6+A==
X-Gm-Message-State: AC+VfDx1EbxhPqS8KbX63hZr/bjE5TaEWRHZujUegaOzOQ9gKYqQSXK1
	CPfk26f+HOzZoJqp1iraMTsurg==
X-Google-Smtp-Source: 
 ACHHUZ4K2H7+wCUg6ioqFCkyucKiFbP5cpiH1/A295WcgwuRd8qHBW0eTaeYJOTsq1BbRpdDIU7d9Q==
X-Received: by 2002:aa7:d88c:0:b0:51b:e9a1:8831 with SMTP id
 u12-20020aa7d88c000000b0051be9a18831mr4249258edq.34.1687593749577;
        Sat, 24 Jun 2023 01:02:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 w15-20020a50fa8f000000b0051bfa07af4asm401283edr.93.2023.06.24.01.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:28 -0700 (PDT)
Message-ID: <b49ec52f-094e-fe83-ba9f-cf03c01b782c@linaro.org>
Date: Sat, 24 Jun 2023 10:02:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 30/45] dt-bindings: serial: atmel,at91-usart: add
 compatible for sam9x7
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
 <20230623203056.689705-31-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-31-varshini.rajendran@microchip.com>
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
Message-ID-Hash: OICM24D4WAPCMSJKXIIJZQX2YMTWGWQX
X-Message-ID-Hash: OICM24D4WAPCMSJKXIIJZQX2YMTWGWQX
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:46 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OICM24D4WAPCMSJKXIIJZQX2YMTWGWQX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add sam9x7 compatible to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> index 30b2131b5860..d836224f99c6 100644
> --- a/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> +++ b/Documentation/devicetree/bindings/serial/atmel,at91-usart.yaml
> @@ -17,6 +17,7 @@ properties:
>            - atmel,at91rm9200-usart
>            - atmel,at91sam9260-usart
>            - microchip,sam9x60-usart
> +          - microchip,sam9x7-usart
>        - items:
>            - const: atmel,at91rm9200-dbgu
>            - const: atmel,at91rm9200-usart
> @@ -26,6 +27,8 @@ properties:
>        - items:
>            - const: microchip,sam9x60-dbgu
>            - const: microchip,sam9x60-usart
> +          - const: microchip,sam9x7-dbgu
> +          - const: microchip,sam9x7-usart

Same as in other cases, so just to avoid applying by submaintainer: not
tested, broken.

Best regards,
Krzysztof

