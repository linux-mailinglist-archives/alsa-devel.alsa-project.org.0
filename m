Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3344773DDE3
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:39:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89756ECE;
	Mon, 26 Jun 2023 13:38:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89756ECE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779572;
	bh=plRq9uRX7lb7dTEBq+/7uDl8MLqphJlYEezgY+W1p9o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KMjBH/Rathed39hny3Z6Bn3na4rbx+p2H89SRCOPeqpxh5M/ePXrS9rcBCHS7cAIH
	 8YscZYfokt5ml0+jXoiBf86RKME5yGvt/6DMSGbyMOWNHpxTs2/HKUwp7ABnQRl5Se
	 KQfhR4gB9XM5mOYk8ySgoh4OYUfgheC6TMn1xQ0k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E497DF80771; Mon, 26 Jun 2023 13:29:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9411CF805E6;
	Mon, 26 Jun 2023 13:29:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1476F80141; Sat, 24 Jun 2023 10:00:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABFB2F80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:00:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABFB2F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=a43pJHJ0
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-51cff235226so990018a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687593616; x=1690185616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=plRq9uRX7lb7dTEBq+/7uDl8MLqphJlYEezgY+W1p9o=;
        b=a43pJHJ0/i79GK0sVllmNDFxmLRvG6mdn29k3MDLUJpDO/vAzPg3YyQ818IBbmxC/u
         1gtZ48SyfAQ5B6l0nPXN+iauyWfgfXlbH0dfibAQKneNTKdjh2/VHLoEKzIxurh9DBP5
         ygKyuWkrfxIEeg0x0Ulo13gCWxCoWUMToLkqHYl6h6s3s4qa1bsqQQrA6iOgzlG7pLl+
         dIYVYidPvnGoTN3V2N4aRfUTueCnlqRpbuIYXLGn2MIJJvK807soiNVOfavxJ/gbhjQH
         difhgo70gZBHNBdb4AvayK2zERp3uN7fHKNQxbBPF+9B6cl2sxkR8NHUfutycTaQtmog
         Ussw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687593616; x=1690185616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=plRq9uRX7lb7dTEBq+/7uDl8MLqphJlYEezgY+W1p9o=;
        b=VpfmunB9IIWHxb0HSqMjPoRwecwpt+gUHa+6oswkn2rF6z/ks+Ze+1Cg08ILfC7uvu
         IOYhK7QjhEaluK6OUbqhMgndwiPvJjIAhz4EdU7SXz3hIxsUZe5+neperoQUYaGlBFa0
         Ay+ouzSCaSpqcQi18y2gu+Llx8hWuCLGSTx2+Q2+l09c1g2Z+p/1Pp4oP6q9rtmkLKRh
         bkc5Lp8Ndojp3iDKTewFPEdhfpgr8Py/m2hi7PVnrkFDuBiTSt5pFm2arg3h9XLTzQqj
         I9ekur8T9ClTGItqig3VUZeYfLCHPUGynlkkx7PEZNoFeEbeSCIMDBZuYSQ+grJHSbUZ
         kWpQ==
X-Gm-Message-State: AC+VfDyA7oKbAEonitJyz+iCCLxCdP43ndOqSsd+QgGJK3OSbyeM4nyn
	f1CcQIVretgLB4RI429FvihpZg==
X-Google-Smtp-Source: 
 ACHHUZ6M3mY16cNIWWFFSaJhLerF0OTUcHm2JKoX1SNGPbnrXFGF7T+AVx68dGzEKp0F0dxMjJC17w==
X-Received: by 2002:aa7:da90:0:b0:51b:de6f:2182 with SMTP id
 q16-20020aa7da90000000b0051bde6f2182mr9641369eds.8.1687593615898;
        Sat, 24 Jun 2023 01:00:15 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 p18-20020aa7d312000000b0051a2d2f82fdsm422074edq.6.2023.06.24.01.00.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:00:15 -0700 (PDT)
Message-ID: <b837784a-50f0-7cab-a535-e699688640e5@linaro.org>
Date: Sat, 24 Jun 2023 10:00:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 13/45] dt-bindings: atmel-sysreg: add bindings for
 sam9x7
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
 <20230623203056.689705-14-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230623203056.689705-14-varshini.rajendran@microchip.com>
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
Message-ID-Hash: M43GW5BO6ACSN3FPHGGKOA3TPZJ6GVGZ
X-Message-ID-Hash: M43GW5BO6ACSN3FPHGGKOA3TPZJ6GVGZ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:29:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M43GW5BO6ACSN3FPHGGKOA3TPZJ6GVGZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 23/06/2023 22:30, Varshini Rajendran wrote:
> Add RAM controller, shutdown controller & SFR DT bindings.

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.

Applies to every patch, since there will be a v3.


Best regards,
Krzysztof

