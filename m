Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FAB76918A
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Jul 2023 11:22:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 25B4F845;
	Mon, 31 Jul 2023 11:21:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 25B4F845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690795323;
	bh=zPG4Qt6VuQfR3v7rK7emO9iGxhMFJxqELpMfRZzV99Y=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=acM4RY4gLuxSYjPLOQ283fvy+o6hUQIG194KxoLoGQNMr3bz3REPMqgbY2lYt+nEo
	 lKOfkOKp/NwY7CirfeaM3MCwReGrPtLazUjqsEaS8T+dSnJg6YtXWhcExJf7zjwZf7
	 Duoj4/yaAiBn50YRDZaL9Kxhkx6ixUTH8AuFby74=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 167C3F80603; Mon, 31 Jul 2023 11:18:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C359BF801D5;
	Mon, 31 Jul 2023 11:18:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1B19F8019B; Fri, 28 Jul 2023 13:32:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 701DCF800C7
	for <alsa-devel@alsa-project.org>; Fri, 28 Jul 2023 13:32:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 701DCF800C7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AMnkE9Wu
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fc02a92dcfso20729955e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 28 Jul 2023 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690543937; x=1691148737;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+F++azjWGXR/zzwHylDS5zKIIkHfazjhU13uoVBCItI=;
        b=AMnkE9WuW7Szt2FbkP+Jy7gImGXicajY9/8nwcsWkrUwhvEUvP7ntHlB4esXk3K8U4
         0i6OvKn+5MRV/VvX72hQyI3+TxZnb6cRN+AlFwW7eoAEroux8iHcBnUojCtWchKA78jl
         SY5zsDpCGe7jFTiAVJefedCk62+1uRl1DCOGCwjHw3AcI7lBvwuS6yZmpan72Z124GkA
         HzuwDVmYWrxvejLrwD5DxuP7Te8Jagm+rkOkbxUiWNpEVTWGGoMyhL+3cuwlWbXGDr0B
         nKgA+tN0Fx8WjnGsZEpQTGxaPoJXDju/pS2BVUhj93heIIMcoWmwxaaXx1t90HNC7HAh
         LaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690543937; x=1691148737;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+F++azjWGXR/zzwHylDS5zKIIkHfazjhU13uoVBCItI=;
        b=IG51taGzu3fSQ7l0Qb59ukcGhHZUX12m/ekfM7v1/SlG/z6doU1+msjTQsVOVa+90q
         RFLnwvgKG3kev+0vE/pVtsB7fQijgbDJcvNLvyeJFsu7oiB4IqG1ozNjc+GPiHiBJ/Q7
         6QLE3mwuGOaa/0t18nCecqWTZ8L5IKebsgVkvpBO2PUOeKfQkVDB9+Jfz9B8YrdAvcqs
         zC7quCTxkU/kDFRssA3jnl9Q2F7KQAYz0V8WRKOXl49DBT8EfvYXbWRCIP5kRZA5LPp+
         kgfn46tReuzLS2fZ2BLbuhbjf7NIcypO/3aYObVtjzVa3FN9SR3HwnVSfmHMwo38E/CO
         zwBQ==
X-Gm-Message-State: ABy/qLaynnbqLpXJEFxx9iMu2spw6t9Azp0jAkyXczQ4lnf+0jK9kfPC
	WuHEObq3/n4NAlYZnlO+yCJqeA==
X-Google-Smtp-Source: 
 APBJJlGEkskLn7KheQI/2hh6B8RIJum6fk3h7Nk91C/s4cct7x2FxIqw26uj1lGmelJK6ucVYjt8Ng==
X-Received: by 2002:adf:e94f:0:b0:314:3611:3e54 with SMTP id
 m15-20020adfe94f000000b0031436113e54mr1907446wrn.9.1690543937250;
        Fri, 28 Jul 2023 04:32:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 m14-20020adffa0e000000b003177e9b2e64sm4508524wrr.90.2023.07.28.04.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jul 2023 04:32:16 -0700 (PDT)
Message-ID: <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
Date: Fri, 28 Jul 2023 13:32:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Content-Language: en-US
To: Varshini Rajendran <varshini.rajendran@microchip.com>,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org, lee@kernel.org,
 ulf.hansson@linaro.org, tudor.ambarus@linaro.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linus.walleij@linaro.org, sre@kernel.org,
 p.zabel@pengutronix.de, olivia@selenic.com, a.zummo@towertech.it,
 radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 wim@linux-watchdog.org, linux@roeck-us.net, linux@armlinux.org.uk,
 durai.manickamkr@microchip.com, andrew@lunn.ch, jerry.ray@microchip.com,
 andre.przywara@arm.com, mani@kernel.org, alexandre.torgue@st.com,
 gregory.clement@bootlin.com, arnd@arndb.de, rientjes@google.com,
 deller@gmx.de, 42.hyeyoo@gmail.com, vbabka@suse.cz, mripard@kernel.org,
 mihai.sain@microchip.com, codrin.ciubotariu@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230728102223.265216-1-varshini.rajendran@microchip.com>
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
Message-ID-Hash: RUFQ4OQIGHRM5I7P7MQ2GTDJJEBQTDO7
X-Message-ID-Hash: RUFQ4OQIGHRM5I7P7MQ2GTDJJEBQTDO7
X-Mailman-Approved-At: Mon, 31 Jul 2023 09:18:12 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RUFQ4OQIGHRM5I7P7MQ2GTDJJEBQTDO7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 28/07/2023 12:22, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 

Your threading is absolutely broken making it difficult to review and apply.

Best regards,
Krzysztof

