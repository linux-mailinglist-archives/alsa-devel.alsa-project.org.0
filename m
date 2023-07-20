Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 157EF75C249
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 10:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D2D2EA3;
	Fri, 21 Jul 2023 10:58:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D2D2EA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689929935;
	bh=LEysQCPOjkIGVkLgbEHtp05RCrkbKmho1Jnuua4nkos=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BRW0wdu/pIGJYWyfTnzMWtPByR6/Zqkroo89r0HOV+i+/Cm1nBBFaFynd0SHdlQA0
	 LGH+7fP1pQy3RO9fTGqIFxiWrlY/hChTpgv8YimDuoVhVrleOjCkGaVmq3t3hg3TYb
	 1n5u5vktzb3Zn9lofvTwfvlwCXsUA8y0y4fDmznA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA386F80631; Fri, 21 Jul 2023 10:54:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7D97BF80621;
	Fri, 21 Jul 2023 10:54:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2C218F8047D; Thu, 20 Jul 2023 18:44:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2CD0AF800D2
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 18:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2CD0AF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NIyQ8SUk
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DFE8D61B75;
	Thu, 20 Jul 2023 16:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB08C433C8;
	Thu, 20 Jul 2023 16:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689871480;
	bh=LEysQCPOjkIGVkLgbEHtp05RCrkbKmho1Jnuua4nkos=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=NIyQ8SUkYcWyM9yLSgzx8MPNG0P8iiUExldPhZmRD5Ln3HJahN0rsWbXbDDcQrjAt
	 VBvdgCqp6zZQ0+jJVsALdzwoL+YSCAAzocpGkenN5ghkusUj63+Xwhyj38k+70D/Gg
	 z6bBpkDRiv2mGjW2JLcyl7HMjXlcHgo2YqKbTLmsVmvE3YzgRup93sAhZgFi3k4J+1
	 LSpFfd0vstfSeAOCi2WJX1xWMCIMjIWhrLRbRmk5mJ1C5TS3BMZjD/3iS33PV7H8sb
	 OS5xE0YGwFXfh/Kt3qp8afiRo9pAjHE2AAtBXJzPzzpbQ8lbu4hRZqVLLZCrsjsz7j
	 NiEhb9Kgm24vw==
Date: Thu, 20 Jul 2023 09:44:37 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Nikita Shubin via B4 Relay
 <devnull+nikita.shubin.maquefel.me@kernel.org>
Cc: <nikita.shubin@maquefel.me>, Hartley Sweeten
 <hsweeten@visionengravers.com>, Lennert Buytenhek <kernel@wantstofly.org>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas
 Gleixner <tglx@linutronix.de>, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, Sebastian
 Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, Mark
 Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul
 <vkoul@kernel.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Richard
 Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Damien
 Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof
 Johansson <olof@lixom.net>, soc@kernel.org, Liam Girdwood
 <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Andy Shevchenko <andy@kernel.org>, Michael Peters
 <mpeters@embeddedTS.com>, Kris Bahnsen <kris@embeddedTS.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
 linux-input@vger.kernel.org, alsa-devel@alsa-project.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko
 <andy.shevchenko@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Subject: Re: [PATCH v3 00/42] ep93xx device tree conversion
Message-ID: <20230720094437.0e378fb8@kernel.org>
In-Reply-To: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MailFrom: kuba@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BZPI4D75YOY5XH5KLGXFRMKZW5RQEQEZ
X-Message-ID-Hash: BZPI4D75YOY5XH5KLGXFRMKZW5RQEQEZ
X-Mailman-Approved-At: Fri, 21 Jul 2023 08:54:07 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 20 Jul 2023 14:29:00 +0300 Nikita Shubin via B4 Relay wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 
> I've moved to b4, tricking it to consider v0 as v1, so it consider's
> this version to be v3, this exactly the third version.

Split this per subsystem, please.
You shouldn't spam everyone with 40+ patches.
-- 
pw-bot: cr
