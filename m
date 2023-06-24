Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA72273DDFA
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEAF91497;
	Mon, 26 Jun 2023 13:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEAF91497
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779932;
	bh=i91BWZKAJdrVaGdz9t9TPUkXGhTvkqrtXFhYhyykev4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S37rqYzThYYSwkuG2Ug0h77QE9bMnuDpUnEpm5i+X0BIVA7nvBZiHvk1wjhlg2+nm
	 qRNMVyffjPf70f8jHRl/X1hkwBIKmpWphXfCz3NjGdsyMZmqDe5sRJdHOuEVbNkeU9
	 2OCRfNoRTKa5PnLNPL3dcC2vp3q+zUEUYzfV3r5o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9658BF805A1; Mon, 26 Jun 2023 13:43:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7461F8057F;
	Mon, 26 Jun 2023 13:43:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3C47BF801D5; Sat, 24 Jun 2023 10:24:12 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A7A2F80141
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A7A2F80141
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jhYOBsx3
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-98e0c1d5289so3826566b.2
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687595048; x=1690187048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jNp0SuVUZqVVXCRqHhi3K5MkR/+Yy6bkXmBLVP0jnFg=;
        b=jhYOBsx3HADGCmeOqC6OjCZWNkO5/KTJfDVpw9J6lmEYmzL5HiXwDoc239Cv1lfpAf
         jZ1XFPIoeL3qlalJCxA0FhaGi7vzgisq9Z8HOrSMSOCtij2l1Vf8wC622ZWBSEI6w9Bv
         tb/zKAvq6RYZE0HuVOvxnBDwjvM9Co7tSVBLYpcHDPpAVMhQKB/QyiaZKtzCg35YId42
         690WWPFxeJmJW8HpMj1yM1JCQEfATMKKorKORK21ugqiPL/Y7AYQYIQA3iuYHH2rG9hn
         wKyxDMr3m+KLB5VpzAfFpv9YauEKhIHvu67lLHXen5m4ofDu7Y0eX56xxmPGhBa8yEhc
         WSyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687595048; x=1690187048;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jNp0SuVUZqVVXCRqHhi3K5MkR/+Yy6bkXmBLVP0jnFg=;
        b=MjfXuJDjoN7wFclYYbA81nC/GhFoEia1OY9jk+vAYg0PV6581FUVDDkVHttimOo/e3
         gAQRbqlPIe+UK/mvsiAB7s62qh8Bo+Rkr6pGrMMxped8Yf2La3HIAjpB0/ZsOQJAp52j
         sg3uYqrQcSojxKhFwgU1Eif6deT4BHRWSsIPjZoJ9zmYwtVqOqpVMxz5sAO/ofeyNhLf
         GLX/h+nVGu/1PlZnniETy5vMbzj1GDZLRyI5NNauUSzbZJwzu8/idcEIh06IPSaJ7vuf
         WE4WGYNu5ajMELo/CddZ6Es30CZzpZ/tF3Sjhwn5w7I5Qay/dJleMfloN84K34goNJrx
         D2wQ==
X-Gm-Message-State: AC+VfDyu9q8iUGuF43AEOvsJUMnoF/Edv/j7WIvXHCKR2qFpFvkmrVTs
	Ni9ziN2pqXHelEJmMHC9Uh1/vQ==
X-Google-Smtp-Source: 
 ACHHUZ4gGdNTR0CSjAVHFIlEksa5SJdwiZGS08Kq1pYOdg+zg0I6klkaiPnVTZufYDi7QamMvR/5Yg==
X-Received: by 2002:a17:907:9706:b0:988:bad4:e403 with SMTP id
 jg6-20020a170907970600b00988bad4e403mr14932362ejc.55.1687595047903;
        Sat, 24 Jun 2023 01:24:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 qp7-20020a170907206700b0098d0c01d9aasm621791ejb.87.2023.06.24.01.24.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:24:07 -0700 (PDT)
Message-ID: <f1a8a04b-4620-5bea-1542-0e425a95182e@linaro.org>
Date: Sat, 24 Jun 2023 10:24:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 21/45] dt-bindings: atmel-matrix: add
 microchip,sam9x7-matrix
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
 <20230623203056.689705-22-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-22-varshini.rajendran@microchip.com>
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
Message-ID-Hash: GFT7GD56UL6DQCPW3WG4TDPLKL4WP5ZG
X-Message-ID-Hash: GFT7GD56UL6DQCPW3WG4TDPLKL4WP5ZG
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:13 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GFT7GD56UL6DQCPW3WG4TDPLKL4WP5ZG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add microchip,sam9x7-matrix to DT bindings documentation.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/mfd/atmel-matrix.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> index 89d05c64fb01..75378839fc7f 100644
> --- a/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> +++ b/Documentation/devicetree/bindings/mfd/atmel-matrix.txt
> @@ -14,6 +14,7 @@ Required properties:
>  			"atmel,at91sam9x5-matrix", "syscon"
>  			"atmel,sama5d3-matrix", "syscon"
>  			"microchip,sam9x60-matrix", "syscon"
> +			"microchip,sam9x7-matrix", "syscon"

That's not what your DTS is saying. NAK.

Best regards,
Krzysztof

