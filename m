Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1FA75DDA2
	for <lists+alsa-devel@lfdr.de>; Sat, 22 Jul 2023 19:10:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 84FF31D9;
	Sat, 22 Jul 2023 19:09:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 84FF31D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690045823;
	bh=7dziFjCtztxNjCNE813qmiRCOaFOcSiZTpR/1AZBP/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=D6xYLOqHCjoGqR2KV+2UnZSu+rakUEVTU0TN6YVMoSbC733VRjxAa1xMDZatyL3MH
	 WdGWnSRk+BGA0MQyFgSUs2fWhmSy57dKD0e5l4Aw/qKHXk3G7Dgnv4JPol2pBalMqc
	 efTklFkDyl+C5qDMEoKnPJ0QYUaNLhLpgUs+76bQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 729E1F80608; Sat, 22 Jul 2023 19:06:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7BA9F80609;
	Sat, 22 Jul 2023 19:06:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FE46F8047D; Fri, 21 Jul 2023 16:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE39EF8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 16:25:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE39EF8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=qIJ3m7pu
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fbef8ad9bbso17815565e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 21 Jul 2023 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689949510; x=1690554310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nsB9IpIa7yRoJhopQrOjvBc0s3b3yy++co3a2B1PcYw=;
        b=qIJ3m7pumTVMjEg+kn7UzsmtHcvDLZMe1tywd8h4kIEFsV1IUMrLWSP7L1Gefi6ja3
         JBnA+rcRqypgsH7goHOUSHZMKZ550EJ6VKVD5dUqYgKEkPNc0iL/P3ucMWjqHbEFD/T0
         wpz6/3MqeieB5gRPCUiu4XZk3Zcu+o+NiGcka0anh/l9hHDrOL+VgYR/KE3ZF2zZOnUD
         MAb1XtMCn/3lpC4gapmNe+wJJXmYQVNJ5+2pOFPrvODAU/4zuO7v13RiM6wLSxsILcjv
         9HuP4O5p+Mpx4YbyqytkaZCphFp9jaYoEi2g4JOc8CmYsngHzwdRUEDe9eA+ql9xnfQE
         Ybww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689949510; x=1690554310;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nsB9IpIa7yRoJhopQrOjvBc0s3b3yy++co3a2B1PcYw=;
        b=fUFeQjFQWC58Ctlqo0BcaG0tuImy+LSfiymW1OeBIlxvl4JaCoxg1Qn+8uoZ1thyCn
         vmQNWl4rd3ZQMkuzG4751WewESa27twyWnAj8wboy0Tb94BAG5hUjyNKOpjGW5tcl2Y3
         thDz93fQ4/onUDi+2DDGY0JvB1x6yYbxwnH0LmQK0zEi4Ra3vlUZFb+WidJxYFG9W3Je
         cryuo1Vi07rnxzjrY+XD+81T4+PRUsY6W5TpCI3X5P/Tn2eZI5CaK0o7hdKfjlmHSfht
         qbsBiGEbwQa+Rkg0MQsD5qFzgm6fLBjh/jMxhBNFmXyJsW8D3P7gnXyQIMMz/guuzu95
         2smw==
X-Gm-Message-State: ABy/qLY1WInNslY6/M8Uf9ttng7/c6C25HfZ4lZvScVeirKF79nGTGg5
	vyrg7sBtbShRb/2s7azOEH6wQg==
X-Google-Smtp-Source: 
 APBJJlHgaQ/Hte4XJbr1gx4ukptPaEvJZwQtCDry0efXozCJTjG5+/5hX3FKNFwXVDpSO/L62wwYsQ==
X-Received: by 2002:a1c:4b0e:0:b0:3fb:a576:3212 with SMTP id
 y14-20020a1c4b0e000000b003fba5763212mr1443887wma.39.1689949509998;
        Fri, 21 Jul 2023 07:25:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id
 q9-20020adff789000000b003142439c7bcsm4349281wrp.80.2023.07.21.07.25.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 07:25:09 -0700 (PDT)
Message-ID: <4313820e-9ddf-0a34-0cca-e356a4314c61@linaro.org>
Date: Fri, 21 Jul 2023 16:25:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 00/42] ep93xx device tree conversion
Content-Language: en-US
To: nikita.shubin@maquefel.me, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Sebastian Reichel <sre@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>,
 Michael Peters <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
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
Message-ID-Hash: K42CF5JV5YVADHESQYSOZHSBZDWXOPYY
X-Message-ID-Hash: K42CF5JV5YVADHESQYSOZHSBZDWXOPYY
X-Mailman-Approved-At: Sat, 22 Jul 2023 17:04:41 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K42CF5JV5YVADHESQYSOZHSBZDWXOPYY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 20/07/2023 13:29, Nikita Shubin via B4 Relay wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 

This approach makes patchset trickier to review with absolutely huge
Cc-list and inter-dependencies. I don't think this is correct approach.
This should be split per subsystem whenever possible.

Expect more grunts and complains from 50-other people you Cc-ed.

Best regards,
Krzysztof

