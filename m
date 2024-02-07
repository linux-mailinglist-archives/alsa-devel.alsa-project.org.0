Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1845E84D0C4
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Feb 2024 19:10:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 047D286F;
	Wed,  7 Feb 2024 19:09:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 047D286F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1707329403;
	bh=Iw2OhQ4vRHvcS/H+wxcRu+ckAc5Xk3cTSuO2GCfdZWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rrv9ocUdTghtb/TSduGL1LQ4S9xLnfrh5vTw8NCsmmcrNc//cFnsYO55OmE5ri3zC
	 ZfhqNWAxem9JWdyL8NZAB3QulD498+n8p5gGg9UUFJy9xfTUa9QHFM5abxhxaREpDy
	 9zNvuxxqcSbeWpkpxapQ5aifKJQjiolLDPJHwmYU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 738FDF8058C; Wed,  7 Feb 2024 19:09:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D3A1F805A0;
	Wed,  7 Feb 2024 19:09:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E95CEF801EB; Wed,  7 Feb 2024 19:09:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4AF05F800EE
	for <alsa-devel@alsa-project.org>; Wed,  7 Feb 2024 19:09:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4AF05F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DPbfB17t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1D24619F7;
	Wed,  7 Feb 2024 18:09:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95800C433C7;
	Wed,  7 Feb 2024 18:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707329356;
	bh=Iw2OhQ4vRHvcS/H+wxcRu+ckAc5Xk3cTSuO2GCfdZWg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DPbfB17t7tMrqCOZ/LA3JzUSyjBvuCWHEgm1GoG6ueWeX/R/M/OP9/DOyEN8sUyLu
	 B/UimGa2VdwUiCWX01e3jtyn2sHU0SPHM8ZkdkCES2IOClKb6ww84+ZUX6G9l8ClkQ
	 VXAzFKfAAJye0kzAJ4vlKu9WQUPKmv2uZDUGC25dVlufbqWkOuZ43adojlOWpnirQe
	 Q8PdLCLnNaIzeTlTyOCODFk4Byp9hKLI1iMmOn3PEaCNOqCwOdkkwUJmceo6I48TeK
	 LQtO4716Rg7Ybk3Q7nn2Mi5xj/JZHsme22VoakEineyDAwRK3qQMcg9ScJZ8NO/5u7
	 jc63jc9rimLkw==
From: Mark Brown <broonie@kernel.org>
To: claudiu.beznea@tuxon.dev, lgirdwood@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Dharma Balasubiramani <dharma.b@microchip.com>
Cc: hari.prasathge@microchip.com
In-Reply-To: <20240207094144.195397-1-dharma.b@microchip.com>
References: <20240207094144.195397-1-dharma.b@microchip.com>
Subject: Re: [PATCH] ASoC: dt-bindings: atmel,asoc-wm8904: Convert to
 json-schema
Message-Id: <170732935198.1089483.14612569471427120930.b4-ty@kernel.org>
Date: Wed, 07 Feb 2024 18:09:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: BT5QPF33NIBCNEMMKK32VE62QEPF4L6Q
X-Message-ID-Hash: BT5QPF33NIBCNEMMKK32VE62QEPF4L6Q
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BT5QPF33NIBCNEMMKK32VE62QEPF4L6Q/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 07 Feb 2024 15:11:44 +0530, Dharma Balasubiramani wrote:
> Convert atmel,asoc-wm8904 devicetree binding to json-schema.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dt-bindings: atmel,asoc-wm8904: Convert to json-schema
      commit: 565abf586f3554c94c81027b1f0af1f6a6beea1b

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

