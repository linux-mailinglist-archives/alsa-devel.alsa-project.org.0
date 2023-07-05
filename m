Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D317488DC
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Jul 2023 18:06:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75FA93E7;
	Wed,  5 Jul 2023 18:05:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75FA93E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688573174;
	bh=MaQ9axNX26c9wxnJ0P+IdEAV6VOXIK3LAWryZ90v/Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CdOIwp1b31jPrsGGR+x57l2ztTQGTw4a6nPe9/RO/d8yHpxm6kiTexS/I/FnMFR+Z
	 HFUGILMXqU/brcQjBfhMfJLW9xKFKCaG+A0pyQpZ/fHG+iPPOGaalkJlMwVtz9A4aQ
	 06wcdGELmE+yQHn4AwyH8hN3D6PfGr/34lZAA1sY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2705F80272; Wed,  5 Jul 2023 18:05:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 22806F80124;
	Wed,  5 Jul 2023 18:05:23 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2026DF80132; Wed,  5 Jul 2023 18:05:19 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 92843F800E4
	for <alsa-devel@alsa-project.org>; Wed,  5 Jul 2023 18:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92843F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=l3w5MPUr
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2AD606160D;
	Wed,  5 Jul 2023 16:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7A7FC433C8;
	Wed,  5 Jul 2023 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688573108;
	bh=MaQ9axNX26c9wxnJ0P+IdEAV6VOXIK3LAWryZ90v/Qg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=l3w5MPUrUOOTkdmknB6dx2CtyE52F8JS3tBM0epQzl+7XfY9lWhN2iMZRW8obwzfE
	 2OSTQTiVyWTgkJZ1X/k94tnKvPJuszNC1sD492Gept8Na3v0tjQoPiMHzmOt1y83fG
	 s68wJHzlZ9RN0CRG7CPdagmeRZHbi9Xrsx88wzrORB/C5bBUGC5fH8RL0WgpnFDWaa
	 4gC9pnSi/uYA+dZNAcTrj8jrhduibrdK0zNisA5ZQRLTTIuU6H2awoyad6vEsA8/hZ
	 2fkuXp0LC1Xw55zACnJGJTwUfmUBfAWf8sFQDnYNULgtoqroey94oDHoPstIDJ4AMQ
	 XRIUuMjx8DMpQ==
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: lgirdwood@gmail.com, vkarpovi@opensource.cirrus.com,
 rf@opensource.cirrus.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@lists.linux.dev,
 stable@vger.kernel.org, Marcus Seyfarth <m.seyfarth@gmail.com>
In-Reply-To: <20230703-cs35l45-select-regmap_irq-v1-1-37d7e838b614@kernel.org>
References: <20230703-cs35l45-select-regmap_irq-v1-1-37d7e838b614@kernel.org>
Subject: Re: [PATCH] ASoC: cs35l45: Select REGMAP_IRQ
Message-Id: <168857310652.55162.4180283376212806885.b4-ty@kernel.org>
Date: Wed, 05 Jul 2023 17:05:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: G2M4U4IUBL5GUO7ASGKFX3ULQP4JSIQY
X-Message-ID-Hash: G2M4U4IUBL5GUO7ASGKFX3ULQP4JSIQY
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2M4U4IUBL5GUO7ASGKFX3ULQP4JSIQY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 03 Jul 2023 14:43:15 -0700, Nathan Chancellor wrote:
> After commit 6085f9e6dc19 ("ASoC: cs35l45: IRQ support"), without any
> other configuration that selects CONFIG_REGMAP_IRQ, modpost errors out
> with:
> 
>   ERROR: modpost: "regmap_irq_get_virq" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
>   ERROR: modpost: "devm_regmap_add_irq_chip" [sound/soc/codecs/snd-soc-cs35l45.ko] undefined!
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l45: Select REGMAP_IRQ
      commit: d9ba2975e98a4bec0a9f8d4be4c1de8883fccb71

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

