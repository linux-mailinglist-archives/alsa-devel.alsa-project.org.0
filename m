Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C27073DDF4
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:44:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B113ED6;
	Mon, 26 Jun 2023 13:43:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B113ED6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779853;
	bh=zz0iKoAtl1q1k0MYgb6lCNzwbNmZTFCon9jfDHK1rgc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=DtCa2tqRmsIHCXkCWnQGkRAMtu12YYY/fqq6cyTcvO+mB2nC6TOdY8nH3PvSy1wsa
	 VCoFmhPsnirMENbhrPwSyD4suCCwFV4IOmpqrzkr4l2iPAlqcOW6+7wgFc4KBIZZ6O
	 5JMl1uWRVkQh2SZo3nCTpTHXaEXAo1QJj8/+cCgY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D8070F80535; Mon, 26 Jun 2023 13:43:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7735CF80169;
	Mon, 26 Jun 2023 13:43:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 79E5EF80141; Sat, 24 Jun 2023 10:23:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 805D0F8003A
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:23:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 805D0F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ec6K00Eu
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9741caaf9d4so134852266b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687594995; x=1690186995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jOoygUb7kSHIpN5lybNjJ7pb4+07CvDFGFSEAWg/P0=;
        b=ec6K00Eu52RtxLZxjW0JYHaWOW05eAsNVQa3fbURmfvLxhhHUsL/vo+XD7IxNtRePh
         JohCb25+mAcVfKb/YN+guqWWxbVhqnLzklgOO9uFtKw0RFBC9yJxxzNgOi64QyaM424F
         RmiT8u2UwuPuUSUhHwPnSkycYDe+tBDbBvQp175h0ZlO4sGNgoJ9Sm36oSmG+y+1oCJq
         Ugd5MdJ3J7yzVkB1/2PMhMutGJmMM9irNZzcvCrhMFIsCDDstLxTvOX/LT/6WMSzis7L
         OQQHj9eqbdo2ie5+OJ+eMrmXU3Nh/xq85pZkXhCa41L8Y3noqh8aZ2h4igPYT3ZoBtgo
         n7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687594995; x=1690186995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jOoygUb7kSHIpN5lybNjJ7pb4+07CvDFGFSEAWg/P0=;
        b=KJiHa3XCqH3wpoAzUDZS9oayh63mUOPQspQMXmSpTB8V1jRq7fWtSN2FEPzS+VxIqX
         3NEpooKQDOF6eD7cjZ8QaKEREBNVwI8RFmAG4/XzvXy8dgxClIwSn1kxNxByeKWpivWy
         6BHTzxWhTK4AAavw6jiFlC0PWRySQTu106ulvRmOT3l29Tsa/Guragz9SG5pztTRzp51
         YE62TdOfgVfpGCJt80NYiXDAuz2HgkT+GkrPkwUUbm9Tdda6JDQ3u753/5TBS9r7G8d7
         s5XxTSs8nVaAda6+jWV5ipPxNpRlXXu9H5IQw9fhFuXVi/BaOIQgk8/GMNxNZXzkb0gZ
         wt3g==
X-Gm-Message-State: AC+VfDx5dCrqj0RHJ3c6agDZRAUKhmqjs7Gjt320wqrqaBTPMsRury5E
	en46fwu66UFkz4Q5kf6+f6m2yQ==
X-Google-Smtp-Source: 
 ACHHUZ7wgj4gsi8hg4wR0wtrFMRanc+m7UZMBoLi+JkS2EAGQsWnYXwufugaxa43LtT20lkJlSWblw==
X-Received: by 2002:a17:907:72c7:b0:98c:e72c:6b8a with SMTP id
 du7-20020a17090772c700b0098ce72c6b8amr7272419ejc.10.1687594995603;
        Sat, 24 Jun 2023 01:23:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 qo5-20020a170907212500b00988c93c85a5sm599842ejb.183.2023.06.24.01.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:23:15 -0700 (PDT)
Message-ID: <6e95fe03-9e35-a237-0392-8eef9c7e4cec@linaro.org>
Date: Sat, 24 Jun 2023 10:23:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 33/45] dt-bindings: usb: atmel: Update DT bindings
 documentation for sam9x7
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
 <20230623203056.689705-34-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-34-varshini.rajendran@microchip.com>
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
Message-ID-Hash: PRR76QVFBJOKIFMYU2MMRWZUQK3NWFDJ
X-Message-ID-Hash: PRR76QVFBJOKIFMYU2MMRWZUQK3NWFDJ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRR76QVFBJOKIFMYU2MMRWZUQK3NWFDJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add sam9x7 bindings.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/atmel-usb.txt | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> index 12183ef47ee4..6359af0123bf 100644
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> @@ -3,8 +3,8 @@ Atmel SOC USB controllers
>  OHCI
>  
>  Required properties:
> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers
> -   used in host mode.
> + - compatible: Should be "atmel,at91rm9200-ohci" or "microchip,sam9x7-ohci"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

