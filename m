Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DB286B161
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Feb 2024 15:13:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 35755DF8;
	Wed, 28 Feb 2024 15:12:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 35755DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709129585;
	bh=aEWeFJ2eAgzcvr+OaHdaIiM7TBOw2JHpdO912FAxBrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EL1BLJuzrjS2FoLCx9nWt/364f8uYvHsP6X78KQr/s2llxx2AAsF21ggYkkGcMsyD
	 vKES1VTFCtPfrFKOs5ag9LVdkews844dmrqftsXC5L7f8Yg32D0nkayBfDlCLC430u
	 W2yQY6OUbRqwyfKPleewoytzkr5Vy6yz1T5sVHuw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B5147F805E7; Wed, 28 Feb 2024 15:12:14 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15736F805C2;
	Wed, 28 Feb 2024 15:12:13 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DC95F801C0; Tue, 27 Feb 2024 04:20:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF26CF800F0
	for <alsa-devel@alsa-project.org>; Tue, 27 Feb 2024 04:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF26CF800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=GGZalQiN
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3AD38CE1B58;
	Tue, 27 Feb 2024 03:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64851C43390;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709004030;
	bh=aEWeFJ2eAgzcvr+OaHdaIiM7TBOw2JHpdO912FAxBrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GGZalQiNOWNgvr31MEFJ81Scx/q8IuKaZAqiPFZE+SD8pSdQWwG3CioqZpDlRQUAD
	 jKvVifURv7BOpc25WdOU3fYy6BfTMtetonGpoamgfDO3hXxtvjNyuDx94vkioJxfvV
	 MubNjVgf5u85jr4mrAuCzosl1CeEkeDYgrDKshVma4vowdYyZfX9/uNolq5oS00HY6
	 VdQ/8vtg8n+7bDwLjb5y8Yg2i9Qutge32EjMjVf5A2q9l0zWeu9yL5HgzRZ4UWdsvX
	 1U/1FgMqGQhy/VrktEoQPhkUCFsQrCXfoN9l9KW3KzU1jxRXAX9mECe7VQa53IR0gn
	 sUUzlKI2AvVrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 3DB28D88FB2;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/39] Add support for sam9x7 SoC family
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170900403024.25082.9031028983461362329.git-patchwork-notify@kernel.org>
Date: Tue, 27 Feb 2024 03:20:30 +0000
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, andi.shyti@kernel.org, tglx@linutronix.de,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de,
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, linux@armlinux.org.uk, andrei.simion@microchip.com,
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org,
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be,
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com,
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-watchdog@vger.kernel.org
X-MailFrom: patchwork-bot+netdevbpf@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: EDMC5QFWPS5XYMYVHTQKIPUGPKN3RDTV
X-Message-ID-Hash: EDMC5QFWPS5XYMYVHTQKIPUGPKN3RDTV
X-Mailman-Approved-At: Wed, 28 Feb 2024 14:12:07 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NKW3LVNAE7CU7GXL7Q47VEVTUBBCJUHX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Feb 2024 22:43:42 +0530 you wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
> 
> [...]

Here is the summary with links:
  - [v4,01/39] dt-bindings: net: cdns,macb: add sam9x7 ethernet interface
    https://git.kernel.org/netdev/net-next/c/5c237967e632

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


