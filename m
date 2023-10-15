Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D1A7CFC0C
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Oct 2023 16:06:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 02C5C826;
	Thu, 19 Oct 2023 16:05:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 02C5C826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697724396;
	bh=vBDwkoSj7tiD2Va8t7RkVWL9b/lOMaaFCJ1U17oGJKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ngH21/zfhRPa0T+4ke2CdhafnLUMpkyJ3qrF2Jk6hzMFy9AFIj5RfZw3+uWQKcD6L
	 u4IzSpb1ZzHN48QkXpvpGxnXmRJDMb0NcI5goI8/iMIFHaHLf4I6hZaEaKdA3iDc2p
	 lC/DxkphQFi6IHyGM59YM3HpYJrjfDBontOZwZZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5A2AF80553; Thu, 19 Oct 2023 16:05:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E082F8024E;
	Thu, 19 Oct 2023 16:05:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 313EAF8025F; Sun, 15 Oct 2023 23:18:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 27C7FF80166
	for <alsa-devel@alsa-project.org>; Sun, 15 Oct 2023 23:18:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 27C7FF80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=G5I8ztJv
Received: by mail.gandi.net (Postfix) with ESMTPSA id 80B0EC0004;
	Sun, 15 Oct 2023 21:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697404689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QyLwk8RWeHwb+iTYV4j14/CAsO9UnmgTLhIoR7pcM84=;
	b=G5I8ztJvdFI8tTwSCy0AWY+6MRhNlKLte1yNV4fIGQl6O23J6Xdoh0CefROrNByOpZhwE7
	P/dmdthsO5WAs8rqcbBfrDUN9cugU7l4OxjWmfddhyL0LuZ/a6CfmZiXNmu06TC7W2khE9
	NDZu0i9NIxBjr696iBip4sRRM3d0VMBYV0oc5glex8E5b5g9pnVjfW5fIkCPQERxPzL1Jd
	mjqglreUfQeV1UDlGgRG/+b2MG2/c1Vo/UDOnu2p9/qVGfq8Q3Iz2g50VMtUD0J76grZyh
	DkuCxT22BotwyKZelbq33dd3q4OFLHJ92smEnKVwc5a4qUfDVLMQmLsddUpmAw==
Date: Sun, 15 Oct 2023 23:17:56 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Mark Brown <broonie@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org,
	Arnd Bergmann <arnd@arndb.de>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>
Subject: Re: (subset) [PATCH v4 00/42] ep93xx device tree conversion
Message-ID: <169740466288.180093.13375010968334465004.b4-ty@bootlin.com>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-MailFrom: alexandre.belloni@bootlin.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: TVMCWV3FL74MQJMW42T4FGKTA25IX4KU
X-Message-ID-Hash: TVMCWV3FL74MQJMW42T4FGKTA25IX4KU
X-Mailman-Approved-At: Thu, 19 Oct 2023 14:05:21 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TVMCWV3FL74MQJMW42T4FGKTA25IX4KU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>


On Fri, 15 Sep 2023 11:10:42 +0300, Nikita Shubin wrote:
> This series aims to convert ep93xx from platform to full device tree support.
> 
> The main goal is to receive ACK's to take it via Arnd's arm-soc branch.
> 
> Major changes:
> - drop newline at the end from each YAML files
> - rename dma and clk bindings headers to match first compatible
> - shrink SoC exported functions number to only 2
> - dropped some ep93xx_pata fixes from these series
> - dropped m48t86 stuff from these series
> 
> [...]

Applied, thanks!

[13/42] dt-bindings: rtc: Add Cirrus EP93xx
        commit: 207bddd97881913bcb8bef84737c0971e712fbee
[14/42] rtc: ep93xx: add DT support for Cirrus EP93xx
        commit: 1d70f9fe5f1c8fbd5d838223b8aec27c69a7e609

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
