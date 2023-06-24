Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6B273DDCF
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:37:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271D7E7B;
	Mon, 26 Jun 2023 13:36:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271D7E7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779457;
	bh=0RUfnGA3/Fmg78DBN14CSMdMSWyUvCzKob5BNXXbQDA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U1A8E+UfzI38AlNz7TquF0HBilXbtLsNUf076z1QRZrWflaNtcY1zdE8s5eKxU4sp
	 tmecRbp/qMYsKMleJdBwAJpp5iKxbJ7dbjUCxIrCNs0tmMbZH+E+S3he0bqxE+8TvA
	 eZrArPqS5x4pmcpBGDitObZCO0wXvzWlZqmlDw+w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6EA5F805C6; Mon, 26 Jun 2023 13:29:06 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C540BF80715;
	Mon, 26 Jun 2023 13:29:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 413DEF80141; Sat, 24 Jun 2023 09:54:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D72BF80124
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 09:54:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D72BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=DjI6EnIt
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9881b9d8cbdso461683966b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 00:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593246; x=1690185246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ItoFIh/55aB/e70WP466UAh+90Zeto+YBld1GOUDlc=;
        b=DjI6EnIt0I30aO4+HTDU2Bee7J4vBxnKRd9UupAVeWwpXVR+/r44DC0Asz08Bbuogp
         A3Aatz82DO8yHVMwWhn1gZCqEe6a2rWXkuiA6GfBUfoZTs2e6cwPHLJ+YuaeHPEUIAQJ
         DJhwVAmDzSax0DlG6oJFsEy6UVQ/dIS8cQ+3QCTL9/CI0CL0ZoRWS02I2uBuEAJJk09M
         Og5/SFPOzVmyQO9aVPrw3zuNNqm8+pzstsdw5EMvXLcY8o+3wfyYcS7e8fj+IvyDLk8l
         BV2H6dDfJXmnGhqVtns8T1Mm5OFcAqbapX7uBCu2Qe31+yaUBaZBymo/wMUBAVDBKbPz
         XF9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593246; x=1690185246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ItoFIh/55aB/e70WP466UAh+90Zeto+YBld1GOUDlc=;
        b=Q4eLGByzxqYdsKg25E1Z6GJ3fB70F5vHL4B2h4R8+Si6RShs/25fNNgdUKM+dRzszR
         EHfsWAMt/NtzGBWmciothByBEO7xWvJi3w6GBDtAAHShDJ8RyCxXwTrngGXxJmSdVTDX
         oDYL7v6c2N2HXXsM3afvMqoa/ytW/1hlDRhg8iSVzOHtn1Hqjol9/oqgaLG++/i/hixs
         yQQj4/NITVZ7zZxyUKcy0wtqQNXWiiKNvHcbe1VUr8DwU88CuwbFWIfWKzlChJa7lLd/
         P/G/9tFJqxLPwn4+ttnf4cGgvISwg44zddnkeGyIRyIOlLxT+qYMgMksJHAWZSXB0Rgq
         3IpA==
X-Gm-Message-State: AC+VfDyPjEihV63cwHt44rBpjx29i6mX2+ujVJMp337AycOsTQ+R2iWc
	8owFSMIch2pHMiGSGoC6iZ04YQ==
X-Google-Smtp-Source: 
 ACHHUZ49jFwiXxqnSCSn4kNoVnnSW/YdtiArnK3FxalPv2kaFMQNSvBgECWFO9OcGbSuOPMw0UOLPA==
X-Received: by 2002:a17:906:58d2:b0:988:77f0:b671 with SMTP id
 e18-20020a17090658d200b0098877f0b671mr14792178ejs.38.1687593246753;
        Sat, 24 Jun 2023 00:54:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 u12-20020a170906068c00b0098856d1470csm592132ejb.75.2023.06.24.00.54.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 00:54:06 -0700 (PDT)
Message-ID: <4f1015bb-50d3-84c9-ca32-564a0fe204e1@linaro.org>
Date: Sat, 24 Jun 2023 09:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/45] dt-bindings: usb: generic-ehci: Document
 clock-names property
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
 <20230623203056.689705-4-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-4-varshini.rajendran@microchip.com>
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
Message-ID-Hash: 2SMJA6L5BS3JT7CLHNY6OZ2XYCOVRYH5
X-Message-ID-Hash: 2SMJA6L5BS3JT7CLHNY6OZ2XYCOVRYH5
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:28:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2SMJA6L5BS3JT7CLHNY6OZ2XYCOVRYH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Document the property clock-names in the schema.
> 
> It fixes the dtbs_check warning,
> 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> ---
>  Documentation/devicetree/bindings/usb/generic-ehci.yaml | 4 ++++

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.

Best regards,
Krzysztof

