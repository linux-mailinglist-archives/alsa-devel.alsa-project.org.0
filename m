Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9F186CBB4
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 15:37:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1639B20C;
	Thu, 29 Feb 2024 15:37:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1639B20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709217465;
	bh=vxRLRVprDDB/c/3M41BNMbhxG1UwYXmCdbjUbmB3KKE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=oEcmFkmyIbtMnJxzf88fwmoDuj+L73+xnvRg3mCt9ACgEXYWyG8Wje8SmuBOmjbEy
	 BeT2Eq2YGRZDjHkcshJplXD6te9frjIxtsgkg4K8xrF9hLUlqMtOE2gpptPUAVOzZk
	 tRAFuEJdJAQCDUfNrsY3QA17dUn18+s8xoVydYOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DE983F8028B; Thu, 29 Feb 2024 15:37:12 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DB193F805A0;
	Thu, 29 Feb 2024 15:37:11 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 310B0F801C0; Wed, 28 Feb 2024 16:54:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EF8BBF80087
	for <alsa-devel@alsa-project.org>; Wed, 28 Feb 2024 16:53:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF8BBF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=fH/VpNsC
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 070C3CE1A33;
	Wed, 28 Feb 2024 15:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C4CC433F1;
	Wed, 28 Feb 2024 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709135629;
	bh=vxRLRVprDDB/c/3M41BNMbhxG1UwYXmCdbjUbmB3KKE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fH/VpNsCC6yrehn5cwmf2mjsgU1Ga7kLFvddPlrtSi5Jr4CqpQYnnimGO6HSWNh3O
	 P1sksEi+taf0EXpKgvTWOTnRbkQja9l+bSOOMPcaOGxOgSq88KAUk6A8OE94ZgekUk
	 PKdQLGs/2dsH+cPT3ecRVpohSJXMsiWDkMudBu1wj0oL9BuvtO87S4FKrMnmaXAGxp
	 SG4Uzyv1B5O67FmVmHVGx4IRrSCy5EQ9LvQB1aqs1ZQfSHMSBrY3mVj+nFOJNScIHn
	 h/H6FZUVqL4iXcGgFr9D757QehRG1OTvDYME//d5Zi8AqSrdF6Nofkun3/EW0W2f+w
	 hJcYB3olR0OOg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, andi.shyti@kernel.org, tglx@linutronix.de,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de,
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net,
 linux@armlinux.org.uk, andrei.simion@microchip.com,
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org,
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be,
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com,
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v4 00/39] Add support for sam9x7 SoC family
Message-Id: <170913561744.333382.15677696645878162142.b4-ty@kernel.org>
Date: Wed, 28 Feb 2024 15:53:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: PK4VZ3C3T7PUEOTKLJUKSFHKFYGJWAUM
X-Message-ID-Hash: PK4VZ3C3T7PUEOTKLJUKSFHKFYGJWAUM
X-Mailman-Approved-At: Thu, 29 Feb 2024 14:37:06 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PK4VZ3C3T7PUEOTKLJUKSFHKFYGJWAUM/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 23 Feb 2024 22:43:42 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
>  --------------
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[16/39] spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 compatible from list
        commit: 666db8fd4265f938795004838d2a9335ce7b9da1

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

