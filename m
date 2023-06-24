Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0900073DDE4
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:39:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 514B3ED2;
	Mon, 26 Jun 2023 13:38:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 514B3ED2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779588;
	bh=yiv/7Zzi7EZ0PLmUjljvkZN40SBfkzS0sV2Eyw1i0m0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hsoF1+6QA9+6hjZzAFEv0cL29HxFpwGOg0iBKTgkVdhC+MvZTLlp1GonS2C/FYVvY
	 1nIE0gGmlnghesiBqklJceuQjX8PttjQVlGJ802lrm02jYGB9plBphVzHeDn/OzQIM
	 1dDygn0ro29k0JnjbdPntAmRR22Yo3Pw/lvXT6BU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 549B8F80772; Mon, 26 Jun 2023 13:29:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F5EF805E6;
	Mon, 26 Jun 2023 13:29:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08F37F80141; Sat, 24 Jun 2023 10:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B1B19F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:00:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1B19F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=f5y83YDj
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-519c0ad1223so1569620a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593647; x=1690185647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VmzapWDzimsSs6oDauhmY7EwCGGpNbBGYW0zDq7Y0g0=;
        b=f5y83YDj2ZiTfv4GVL6XxhbaBiZOx8b2Dlce2BicSyjaKrg3kDy5bYdkvq4WYHDMz1
         Ux3eFKLU2XtW4NjNZu+3nofzPI6tApMEkrFij9agnP/0hLWMMo+HXTmVe4fIFHF7hTae
         SrSbgYuAOfTU+0JPddM5gmK/zaeXnm72JG7Uipl4neBtSGAQLTKpx5MCjVYgls6+G4NE
         H1Ec0eBTsmzlMz3qMbR91RzwyYZWUEUywL/5K07LC2PXw/FMwvaX6+z0Y8njTfC252LU
         Mec49oeKqIlgUkZU2Gfp86uWtTbkzHTzl1xyRp6Iv4f0UPBejvrofeBtdZUrrjTWxCdp
         0zgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593647; x=1690185647;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmzapWDzimsSs6oDauhmY7EwCGGpNbBGYW0zDq7Y0g0=;
        b=gfcS09eivXVOWSKCxBp2NuWuASd9omBfVczyKOVUzjFAtP030Y+7EOW+B822ky+Ox6
         YAmf7dJdFea7kif3IRwbaaAKuhxqAeQ9kKtFFYxhlZuziZbpALhVO/+fRYVypHpJ+B2g
         NcTsPXd9bQt/EUWg3HHg7Jk7D3oPjlu7fvz6w+qA7tJdkxh0MmSxnb/fZIxnpFTMaAhy
         sVWHUtXOmHRxJhJmSiASS4NFQ9XL2i0Qzsx5/zxRk7XAzgEvj7XTV6egLz7MJTYCltlS
         rwcvaNuRhKB+Swpx1LhQb4ZKIXE+1cl+mgoXJ8h5O5EB8tUcOnBwBGXyN6tQLnLmd0em
         uJMQ==
X-Gm-Message-State: AC+VfDy1esWD3tmVOYnNLKosdK0b3awmlbjS/PRreA3ddNiYr1a1wgdn
	9ilgAbNgT2y5zDxCMr+Ot8EVkw==
X-Google-Smtp-Source: 
 ACHHUZ7m+A1bOO2g0Q0gWubK6hkpG4u9CftsH8A5UeM6HKS2e7gJgZ9D0w88xvVVqU6mCdiqpCRT2Q==
X-Received: by 2002:aa7:d892:0:b0:51b:fc05:a6aa with SMTP id
 u18-20020aa7d892000000b0051bfc05a6aamr1674326edq.42.1687593646698;
        Sat, 24 Jun 2023 01:00:46 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 b10-20020a05640202ca00b0051a4ab66d92sm410131edx.11.2023.06.24.01.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:00:46 -0700 (PDT)
Message-ID: <f2ba9ca6-ce6e-b012-d43c-f192a6043a42@linaro.org>
Date: Sat, 24 Jun 2023 10:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 18/45] dt-bindings: i2c: at91: Add SAM9X7 compatible
 string
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
 <20230623203056.689705-19-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-19-varshini.rajendran@microchip.com>
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
Message-ID-Hash: FPXJU5XKXEP6DQBYPI2AFW7G3NCGALZC
X-Message-ID-Hash: FPXJU5XKXEP6DQBYPI2AFW7G3NCGALZC
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FPXJU5XKXEP6DQBYPI2AFW7G3NCGALZC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add compatible string for sam9x7.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index 6adedd3ec399..440f890e209f 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -24,9 +24,11 @@ properties:
>                - atmel,sama5d4-i2c
>                - atmel,sama5d2-i2c
>                - microchip,sam9x60-i2c
> +              - microchip,sam9x7-i2c

Same as in other cases, so just to avoid applying by submaintainer:
looks not tested and not working.


Best regards,
Krzysztof

