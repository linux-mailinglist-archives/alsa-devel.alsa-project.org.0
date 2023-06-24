Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A47FB73DDF2
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:42:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAA9CFF9;
	Mon, 26 Jun 2023 13:41:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAA9CFF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779759;
	bh=9JIaczO3+aw8ifoijaNlgwUz+GmKiyQB4/HMmjSao6E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XUjgl3M5ymjaLB8Mrc+SseLULWtER5L9uEGwIJ8wyFDrPLlFGpdA6bw/5OFnkeyLK
	 gvk7cUzAWrO5D4e9DNPwDYbI1uag/pmtW6KTmQGW++3mIMftnDSQX0HzNK3GFMU1CW
	 xwz6wTOLT2NiJeq0eYgqcxYk7qwCoZZeTKObmwWo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99573F80534; Mon, 26 Jun 2023 13:41:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1034EF80246;
	Mon, 26 Jun 2023 13:41:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E613BF80141; Sat, 24 Jun 2023 10:13:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 514CBF80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 10:13:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 514CBF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=N0yNkrka
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-51a2de3385fso1748381a12.0
        for <alsa-devel@alsa-project.org>;
 Sat, 24 Jun 2023 01:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687594424; x=1690186424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyAf4G6q0n2PHJw+sVmsc0zJMisJVlzy4zrXB7BC4qU=;
        b=N0yNkrkaT0lZJJHQd249mGSUFugRidA55UQNPww7mymm7YUmhpvez15APqWj7OLck3
         hPwQ/UOAcui6M0O0eeHCd4xYbhuGQ+uNSZOCntw+XSdoLr+NX0cNmKVOin0VdSbdpbm0
         +RsTrfTZE3dyr0wo9SHYXCWmP5sIXXDm2c1cwj+JSyCjxigs+BY/L3t+XmlZ0ttz3yEC
         /ziR1lP5xnUU0Pxtoq2zNlMoviD0AJw/nthnsuy6A8LQZ+y3K3inFsTOmyC8SQZ6g8Oh
         dlMluCNpkomg8vcjslDbSWDIF9FB2LYaA84QpUVxh03DOYngbIJ1Vu0vc+as/2oBCX0x
         P3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687594424; x=1690186424;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyAf4G6q0n2PHJw+sVmsc0zJMisJVlzy4zrXB7BC4qU=;
        b=IbmI5Hr5HO0vDwJ9On8RypYDDrSPCCYWgO/Yj6HOvkMl7ldXxNNhwDwRggWfhmxxK4
         hEtzkkTPtcy4F+IaJ0UUUhOGOOmIPovahgNNwhRaJrQR24UjSLZcyaY0kt/uydD4bWpN
         MJoAELOQmypGJGuBTFSqLLSov12TeZJih6noCIPk9WYPcJJkcg/QwbErmnROl4diyMO1
         uAEY+Hfbx6qEt5p7zP1faw2bTOl5JBzP9sZvO4JY8WCEgmGKqG1MHnW9Ilw7NwYS+gKZ
         Qss9mcuhrVaWzFEnAmx79mFs/FH3rsZhEZEWXrroI5Ryn7j/2vxJfhtJhhiAkHLx7tpl
         9F8g==
X-Gm-Message-State: AC+VfDzUsFZeQsT4oOxelAG3zfU+SLy+V+rL8fnmQAVFnmJQvLdZh98E
	gna6GPDp/5ONc9Qb/wWByBk07A==
X-Google-Smtp-Source: 
 ACHHUZ7wIqMMYojMdNZ6XP81cXPipjYpeXBH/sJM48dNAapcZZL8Dl9TPX7i+V2Yl3xKdgGD7yihlg==
X-Received: by 2002:a17:907:1c95:b0:987:15ee:4399 with SMTP id
 nb21-20020a1709071c9500b0098715ee4399mr21156322ejc.29.1687594424242;
        Sat, 24 Jun 2023 01:13:44 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id
 jo21-20020a170906f6d500b0098cc0eee805sm617235ejb.57.2023.06.24.01.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 01:13:43 -0700 (PDT)
Message-ID: <04c7e2f3-dd76-2e07-99cd-d77038f8124d@linaro.org>
Date: Sat, 24 Jun 2023 10:13:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: (subset) [PATCH v2 00/45] Add support for sam9x7 SoC family
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
 tglx@linutronix.de, maz@kernel.org, lee@kernel.org, ulf.hansson@linaro.org,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, p.zabel@pengutronix.de, olivia@selenic.com,
 a.zummo@towertech.it, radu_nicolae.pirea@upb.ro, richard.genoud@gmail.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, wim@linux-watchdog.org,
 linux@roeck-us.net, arnd@arndb.de, olof@lixom.net, soc@kernel.org,
 linux@armlinux.org.uk, sre@kernel.org, jerry.ray@microchip.com,
 horatiu.vultur@microchip.com, durai.manickamkr@microchip.com,
 andrew@lunn.ch, alain.volmat@foss.st.com, neil.armstrong@linaro.org,
 mihai.sain@microchip.com, eugen.hristev@collabora.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: Hari.PrasathGE@microchip.com, cristian.birsan@microchip.com,
 balamanikandan.gunasundar@microchip.com, manikandan.m@microchip.com,
 dharma.b@microchip.com, nayabbasha.sayed@microchip.com,
 balakrishnan.s@microchip.com
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
 <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
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
Message-ID-Hash: XI4QYBZAATBNKUKH5P62FVBZH67C5Z2I
X-Message-ID-Hash: XI4QYBZAATBNKUKH5P62FVBZH67C5Z2I
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:41:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XI4QYBZAATBNKUKH5P62FVBZH67C5Z2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 24/06/2023 02:52, Mark Brown wrote:
> On Sat, 24 Jun 2023 02:00:11 +0530, Varshini Rajendran wrote:
>> This patch series adds support for the new SoC family - sam9x7.
>>  - The device tree, configs and drivers are added
>>  - Clock driver for sam9x7 is added
>>  - Support for basic peripherals is added
>>  - Target board SAM9X75 Curiosity is added
>>
>>  Changes in v2:
>>  --------------
>>
>> [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next
> 
> Thanks!
> 
> [32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
>         commit: a3eb95484f276488e3d59cffa8eec29f79be416e

Eh... the patch - like all the bindings patches in this patchset - is
utterly broken. I don't even get its intention, but I will try to fix it
with a followup based on DTS.

Best regards,
Krzysztof

