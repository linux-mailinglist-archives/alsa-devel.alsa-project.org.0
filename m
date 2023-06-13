Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD9572E8AE
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 18:42:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C61F4E9F;
	Tue, 13 Jun 2023 18:41:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C61F4E9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686674525;
	bh=l8DMg/NUxsnlwLyIoJT1yDhZwFdS7ic9FNDHvvLyCQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gdHZCUaCsUHUB6T5lf3gdU1DhQ0onZ4Tg/UtxLGKiS5UzEV2hD2l+pkBAlC9Kh7p1
	 ASaPI5+tYP5mOVz1ZecGLP0NLw2O7qNK6Mt6kpN+c8pLpnjk3/d8+X+wnmwn1iqrgL
	 6pqHxinHmPCwzbhRKwZ1m8MRK660Slw1etAtAXCs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 270A8F80544; Tue, 13 Jun 2023 18:40:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED50F80132;
	Tue, 13 Jun 2023 18:40:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5092CF80149; Tue, 13 Jun 2023 18:40:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8C5AF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 18:40:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8C5AF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f4ZrMqiI
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14CEC62323;
	Tue, 13 Jun 2023 16:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6FEC433D9;
	Tue, 13 Jun 2023 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686674440;
	bh=l8DMg/NUxsnlwLyIoJT1yDhZwFdS7ic9FNDHvvLyCQg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=f4ZrMqiIunIXF0Kna2VmILRm0ST2XiueAJlIDI+T98JkIh1rJNndlhMg7WPFXyNIr
	 CzP0tVlRppx2X2MaiZMHCjoJFKypy6VOOqKykrxuht3drUKtWnewpthw5nX/Dd6KC+
	 8JlxBXHSkmpnq0U1eKZOp4dJtZWU1yXooqI81QRw2Fn0Dtpp6HWHmGSfpi1gwsY7K2
	 FYM8Hd2nsIi/UX5nAnRTXVchzwr4wRYXecaSaj/hqXJPLT1jVqy7PxRpxmXTPb7ORG
	 4998p2DpeHvUO11AeH9ivTG5FlRnGq+5y4dJEe9kWs5NVi9J2Xp8uHn9gBoSJ/aMgc
	 QeY0mkXBxShtg==
From: Mark Brown <broonie@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Walker Chen <walker.chen@starfivetech.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2 0/5] ASoC: add new trigger ordering method
Message-Id: <168667443823.125535.10354930944213259111.b4-ty@kernel.org>
Date: Tue, 13 Jun 2023 17:40:38 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
Message-ID-Hash: HXH23RQ6L2LPMJKGLK6IOBWIWYCWQX55
X-Message-ID-Hash: HXH23RQ6L2LPMJKGLK6IOBWIWYCWQX55
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HXH23RQ6L2LPMJKGLK6IOBWIWYCWQX55/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 08 Jun 2023 06:48:19 +0000, Kuninori Morimoto wrote:
> This patch-set adds new "trigger" starting/stopping method.
> 
> Link: https://lore.kernel.org/r/874jnihm8y.wl-kuninori.morimoto.gx@renesas.com
> 
> v1 -> v2
> 	- tidyup const vs static
> 	- care missing starfive
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/5] ASoC: add new trigger ordering method
      commit: a11e6515b019da62266b731ff20bc6863f00df4d
[2/5] ASoC: amd: use use new trigger ordering method
      commit: 4a6aeaebbe3b5ef2ae637c00840de171a6c93478
[3/5] ASoC: atmel: use use new trigger ordering method
      commit: 38cb2a362d070dcabfbfb2466ca409751c426c30
[4/5] ASoC: starfive: use use new trigger ordering method
      commit: 0a67a14f74ace85cbd5bd4f49595850db2ebe53c
[5/5] ASoC: remove old trigger ordering method
      commit: 099770e2dae04579670947aaf8b5c70ef6a4cb6a

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

