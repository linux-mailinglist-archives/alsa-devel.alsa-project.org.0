Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3853742409
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Jun 2023 12:34:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3A15D7F1;
	Thu, 29 Jun 2023 12:33:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3A15D7F1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688034877;
	bh=wB0pel8YeGeZm2dbmOAccjhsLOMAiGiZ5vSzz1dazFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fC9FltKy9JRR15z08FXQEkiy/6cmWHauf84lW00B8xeRhBwvJvmZvqT9CUlzTaW5K
	 kqwXsh8v4u2WZPiXVp4TCrAnt7Kzu8XK2KRUrMrZyYs6Ejq3cHY3dPImThMIz5JD6p
	 Edpl4o3Azl/60pnKFdB50S/EXrLH4Cpy3rIPwXIo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1A11F80534; Thu, 29 Jun 2023 12:33:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 07A83F80212;
	Thu, 29 Jun 2023 12:33:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA652F8027B; Thu, 29 Jun 2023 12:33:41 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 84C81F800E3
	for <alsa-devel@alsa-project.org>; Thu, 29 Jun 2023 12:33:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84C81F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qbLMjZHt
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E54961519;
	Thu, 29 Jun 2023 10:33:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DE4C433C8;
	Thu, 29 Jun 2023 10:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688034814;
	bh=wB0pel8YeGeZm2dbmOAccjhsLOMAiGiZ5vSzz1dazFE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qbLMjZHtlQkF57ZP0el9eJmJDkZ36wuYmCGqrxWftEYkcfxDYqAHCBnVena5PVmCS
	 VL4jKxsVZdcSNK7TOZ4ctzwBTkgb6JCa3NU5mhbzK1GsqU7QvbqybXxT39Iuwk3dTm
	 5EOpezJHy7WZuUQDQYjx8EIt2xhlcH3N5vkWAwQMvIEVb8MNUG4h80kUn/rQ3Mln2E
	 pTFLDdcphPRxAmc2BO92siabf59G+1g4Pap/5NDN4Rc+FEk/6xlCdARKNzZhPQQAhK
	 UWIYopRm7MxVVpgtWTvi2gCNvB6VC/B200MJDNakyuJmayqwS6tCRMPgFnjoAzy2iP
	 h1iWmwY2UfAeQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Reichl <hias@horus.com>
Cc: Dom Cobley <popcornmix@gmail.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230624165232.5751-1-hias@horus.com>
References: <20230624165232.5751-1-hias@horus.com>
Subject: Re: [PATCH] ASoC: hdmi-codec: fix channel info for compressed
 formats
Message-Id: <168803481324.25247.5593448279992144349.b4-ty@kernel.org>
Date: Thu, 29 Jun 2023 11:33:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c6835
Message-ID-Hash: BDAX3XKLZW3AK3LDOSXBMXGV3AZDYCG5
X-Message-ID-Hash: BDAX3XKLZW3AK3LDOSXBMXGV3AZDYCG5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDAX3XKLZW3AK3LDOSXBMXGV3AZDYCG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sat, 24 Jun 2023 18:52:32 +0200, Matthias Reichl wrote:
> According to CTA 861 the channel/speaker allocation info in the
> audio infoframe only applies to uncompressed (PCM) audio streams.
> 
> The channel count info should indicate the number of channels
> in the transmitted audio, which usually won't match the number of
> channels used to transmit the compressed bitstream.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: hdmi-codec: fix channel info for compressed formats
      commit: 7b5162080174ae50e8288574379d339b0fcd1760

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

