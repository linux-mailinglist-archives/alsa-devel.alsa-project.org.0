Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41873DDEB
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:41:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B634ED6;
	Mon, 26 Jun 2023 13:40:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B634ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779685;
	bh=awPRDg6xs1PZZxJhSmivIY5lEk1cLfu7yd8d0N0q+3Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Kf3ubcymwodBnejQ89JLK5jUasAWs/PM/uHUV4kwbDD0EuW5E6vAJdWFgTsToM6C5
	 FdMH0kttK6T5iQ5g4lkjcM44D5kHhIIx0FVGa1HK7Fib2X1jH9uN5E0jZa+3YId9Ou
	 ointtx2WXtyCxdfVpNJWbfBlK1WD0Uecamn7IDxM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 12656F805D3; Mon, 26 Jun 2023 13:30:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C4E6F805EB;
	Mon, 26 Jun 2023 13:30:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50341F80141; Sat, 24 Jun 2023 10:02:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0EE0EF80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0EE0EF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bL65eKa1
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-51d894b9b6cso14926a12.3
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593775; x=1690185775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Iag/fpvBDJ2RXwvleWT0ikdFf9vbvKuSWx8X7Un5jE=;
        b=bL65eKa13a0Hm/MQeDCju8xFmloMMrsquSTzxhwgWCUXUcWun2nHn0vSc6x7bTfuI8
         T3cr6eRZjgEb4z7lgrSWZ8+sV5BU/fmg9oE5SWx1qgy7BXrGcVNwNMAx8oyZ5G/1mX6y
         biBFZSvfqAOar3HTF8F8YOyBuHrvQtKXCOcwx2eEHbNMsBQWw2SV5EftCW2E8UTvuSgh
         PhApvRgechvpb2xu8BDjP/67MnHUUJnByOEfixy+DqNfzf+xFAmpqQuElR9rsyyZ5Yi9
         //dtU/MCN75LteZeqX6d6Oaw3ZJXBYj0Au3b8dTa2vfcFOPx/eq1YiC5UTVn3SyRtskC
         lAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593775; x=1690185775;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Iag/fpvBDJ2RXwvleWT0ikdFf9vbvKuSWx8X7Un5jE=;
        b=T5/JTtcMXWX6tsWKvFlu103lSBwm3vlep+McPgTYv7j/qElCcZaCCx32tWdM1HgOd4
         zKn/sJ012dEtwDr8HClXiim/oSjC7+o0d/yrjj5SOYykBjPDuukxW1POynj15bEdwf0X
         /t8kIbP190Mh2G7QrttKdrc4EKpAX4WhR8/rMw/cu4NMbMt3Qbjan2hkLyLJVPtYhXag
         NTJDISOqAnO7rUkefVXBFNZJD7MSRnGH5mEA9c81TQIPdNCresLOjCNOfk8U4dOMB2iK
         WABlQVGMExkTj8M8KaMv+rSO57BMOzVDXLi7TcIc9/oJfNT5BnT3kMitjP8Jj1Phr9e2
         gqRA==
X-Gm-Message-State: AC+VfDyNjMgHDNF/+gWcT6Ko3F29S+Nn5nIzzne+8/HYfRWSnW6Ap/8P
	9MARWo87DdIX0P0+9onsEE+eiA==
X-Google-Smtp-Source: 
 ACHHUZ7CKo9kdIl+tQ6Se/8eLHNmDYA9AGuCXJ789LFfXORFWgCt90zprUQSuv47ZiAbLMJtW4DImw==
X-Received: by 2002:a05:6402:4c9:b0:51a:327d:f065 with SMTP id
 n9-20020a05640204c900b0051a327df065mr16466115edw.13.1687593775059;
        Sat, 24 Jun 2023 01:02:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 o8-20020a056402038800b005183673f2fcsm402109edv.69.2023.06.24.01.02.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:02:54 -0700 (PDT)
Message-ID: <0492a8a3-6272-9ef8-07b2-d7d05b2f62e4@linaro.org>
Date: Sat, 24 Jun 2023 10:02:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 32/45] spi: dt-bindings: atmel,at91rm9200-spi: add
 sam9x7 compatible
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
 <20230623203056.689705-33-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-33-varshini.rajendran@microchip.com>
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
Message-ID-Hash: DWJ4V4EF2H3X2LYDXOY4M3JIFTRAV7JJ
X-Message-ID-Hash: DWJ4V4EF2H3X2LYDXOY4M3JIFTRAV7JJ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWJ4V4EF2H3X2LYDXOY4M3JIFTRAV7JJ/>
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
>  Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> index 6c57dd6c3a36..bdc42eeacba4 100644
> --- a/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/atmel,at91rm9200-spi.yaml
> @@ -19,6 +19,7 @@ properties:
>        - const: atmel,at91rm9200-spi
>        - items:
>            - const: microchip,sam9x60-spi
> +          - const: microchip,sam9x7-spi
>            - const: atmel,at91rm9200-spi
>  

Same as in other cases, so just to avoid applying by maintainer: not
tested, broken.

Best regards,
Krzysztof

