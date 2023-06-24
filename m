Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53C73DDC9
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Jun 2023 13:36:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728E0DF9;
	Mon, 26 Jun 2023 13:36:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728E0DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687779411;
	bh=r/EW6obxSAVNNGjwUGkGRU+SWh5nEHChw4jIkdrVMyk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OQDY02CnbUyBgHTY1e1uJ3ERweRfllmFZ74f9Qr6MJ8vkHxTqktAosbQwJWydxhBl
	 9oI4QUeoaiw2hyO5qhRnhLoQcnfNuk7ZeubmPE/9lOqX47NeOGK1yzVlNwe3YZM23P
	 fwCLRG01Z6rlmh+1S7VODUVEDTa7pfyItQJtqjGc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E2515F806E2; Mon, 26 Jun 2023 13:28:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D153AF806DA;
	Mon, 26 Jun 2023 13:28:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A2BEF80141; Sat, 24 Jun 2023 02:53:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B3CBFF80130
	for <alsa-devel@alsa-project.org>; Sat, 24 Jun 2023 02:52:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3CBFF80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dSOKhy79
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2B1E961230;
	Sat, 24 Jun 2023 00:52:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728B1C433C0;
	Sat, 24 Jun 2023 00:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687567970;
	bh=r/EW6obxSAVNNGjwUGkGRU+SWh5nEHChw4jIkdrVMyk=;
	h=From:List-Id:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dSOKhy79sEB2zIN2c8ajaVofGMArO0Go+fWumUQL9gmmkAU3QnfwbPH7w9WAaAOOZ
	 w2GYaOr0xjKNeW8QA4o905lF5G9oX5k83Z7NVNVK0BRDZOe0gr7KK1bn3S+/TZ4fA2
	 utNavE4sqCzZkKo0lfmhyMQzNQjXWTcX5MAmp82m8t11shclN2Cy3B6Il2KRsjJqa1
	 L6tvmcwX8j5bfsy21mp78UvjksdnPTlXaMUpDMhWKk+uAqGmyUEFF2mtf7Z8p2Q1XR
	 bRoAQou336boKyaD+3RQxZDzBKli+QkQJk1AGEeapc1CUwRC7l8k9a+I5g79sPTr29
	 PSjHxExxu4Q+w==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, vkoul@kernel.org, tglx@linutronix.de, maz@kernel.org,
 lee@kernel.org, ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
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
In-Reply-To: <20230623203056.689705-1-varshini.rajendran@microchip.com>
References: <20230623203056.689705-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v2 00/45] Add support for sam9x7 SoC family
Message-Id: <168756794811.1155588.11719780333735420720.b4-ty@kernel.org>
Date: Sat, 24 Jun 2023 01:52:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LNW72W3XFFQ7WDZW3MO4FICPLUDNWKYQ
X-Message-ID-Hash: LNW72W3XFFQ7WDZW3MO4FICPLUDNWKYQ
X-Mailman-Approved-At: Mon, 26 Jun 2023 11:28:39 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNW72W3XFFQ7WDZW3MO4FICPLUDNWKYQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 24 Jun 2023 02:00:11 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v2:
>  --------------
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[32/45] spi: dt-bindings: atmel,at91rm9200-spi: add sam9x7 compatible
        commit: a3eb95484f276488e3d59cffa8eec29f79be416e

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

