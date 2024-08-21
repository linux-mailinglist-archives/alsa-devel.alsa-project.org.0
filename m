Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B83E95A163
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 17:29:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A39293E7;
	Wed, 21 Aug 2024 17:29:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A39293E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724254156;
	bh=M665HueVgPzh28EhOJPEFMc+8owqWigN/ofPohf5Uvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tEykm/MFy5p9v67JQwIIkhMm8yZF/JyxA2aXIDe8WDY1uHWbX7/lP3zZhiqHnLZP0
	 UK7+gPJU2GXBfIUe90o6DzCAszrx6ogrSDPBsjK1nRkFFoReNCnkw95i691CaapElS
	 CJkMlKJQMWloTnuyJF8pD+OdJKfaaxc+H8XxL3a0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BF7F6F80608; Wed, 21 Aug 2024 17:28:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A331BF805FC;
	Wed, 21 Aug 2024 17:28:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3DCCDF80496; Wed, 21 Aug 2024 17:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EEC8CF8049C
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 17:24:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEC8CF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=bMVM2d2t
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A1FD61086;
	Wed, 21 Aug 2024 15:24:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7645C4AF10;
	Wed, 21 Aug 2024 15:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724253894;
	bh=M665HueVgPzh28EhOJPEFMc+8owqWigN/ofPohf5Uvw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bMVM2d2tKTtQEjC6Ag28LIYd0DeD+nYlSCbcIAG6cNjx5hxuCpsp/gWY3mBCL/tqH
	 tdfgxZKj79cHnoKRkJKBKH+FlAjkEnFaIDiPrqevkgrwMDgY7zPl1hRf2WEJhr7M4L
	 fkdwjWZvn9oTWrbL3YspCZvZ7EF0133tRnwMD8PH1hKEyOwHsLMEoe1D0NphVB38id
	 w8secT5JbltWiB9ezhu/bYOsxuu3DALsZifylMMCdt2Qnoq6xa5eagHseMPIbnu/5E
	 fFp6lrThs8IkSU6mEGKyX3ktqbKU2ZV5iIhf7qzDxTJ29JMgptBrsoY/Q7mjHL1MxC
	 xogosdWa2vcyQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87msl6aa2c.wl-kuninori.morimoto.gx@renesas.com>
References: <87msl6aa2c.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH v2] ASoC: soc-pcm: remove
 snd_soc_dpcm_stream_lock_irqsave_nested()
Message-Id: <172425389361.1704682.3861870798647569294.b4-ty@kernel.org>
Date: Wed, 21 Aug 2024 16:24:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-37811
Message-ID-Hash: XNULZ7FM57LG45AMVCJL7AFL3RUB7CNP
X-Message-ID-Hash: XNULZ7FM57LG45AMVCJL7AFL3RUB7CNP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XNULZ7FM57LG45AMVCJL7AFL3RUB7CNP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 21 Aug 2024 02:23:07 +0000, Kuninori Morimoto wrote:
> soc-pcm.c has snd_soc_dpcm_stream_lock_irqsave_nested() /
> snd_soc_dpcm_stream_unlock_irqrestore()  helper function,
> but it is almost nothing help. It just makes a code complex.
> Let's remove it.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: soc-pcm: remove snd_soc_dpcm_stream_lock_irqsave_nested()
      commit: 2d3b218d383e24623070f4439a0af64d200eb740

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

