Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAD694C56
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Feb 2023 17:21:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 45FB082C;
	Mon, 13 Feb 2023 17:20:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 45FB082C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676305262;
	bh=oAM3hbw2sY9KDt+8uK/Y7ws/V1GvEiL5sJUkkO6PiFw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a9bszx6HsWAk1q5VadfaPbxXsmDQOJZttF9U4A2zn+fvZletP5eB+KtF1DPGS05PT
	 co/GzgKm+jLmKl/RZs5zrnpzw12dHCBQoAX/95vLRCjnLNRBXuVE/0sovc1tgP5Ng6
	 EQFqb7BOwGOEpqPCfHhoNeYSvr8ul1mPGsAWdH0k=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A2A07F80548;
	Mon, 13 Feb 2023 17:19:00 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1ECB3F8051F; Mon, 13 Feb 2023 17:18:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 23890F80051
	for <alsa-devel@alsa-project.org>; Mon, 13 Feb 2023 17:18:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23890F80051
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=NtJ6e0V0
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EE3B60F54;
	Mon, 13 Feb 2023 16:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3362C4339B;
	Mon, 13 Feb 2023 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676305125;
	bh=oAM3hbw2sY9KDt+8uK/Y7ws/V1GvEiL5sJUkkO6PiFw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=NtJ6e0V081StIA7u1c9LrxTBfAbAt4d4KO7FxY2UjzmlIB6f4s8e9Ji4/vmOAjwbs
	 dMCckDMHtXDx7vQaHWN7EaA9TaAVlTFrkiu/ZT9kOC316niGnD88ywjx9vQ9D6ABfo
	 HbdAbNYPymXYrNV9zdjTOXwsc+FyYk9pB3wC7Ibql4j3fAeR3dZpJt1hXW1bQsm9jc
	 1Zb0rOqCk7xjqpMMUVqaH0EcBNLYNzX1y48ShtOdNcRaCyGvhna897WTdWgzuezU3a
	 EDP6QTmFx0E669FhD0cO74jThxd1d1iTsxRo1J+kaGwGOdVN+rKYaFMbkv+mYCYEhd
	 YsF1vELzwtrOQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
In-Reply-To: <20230212220923.258414-1-alexander.sverdlin@gmail.com>
References: <20230212220923.258414-1-alexander.sverdlin@gmail.com>
Subject: Re: [PATCH] ASoC: ep93xx: ignore 0 Hz sysclk
Message-Id: <167630512330.2770751.11991611476848663796.b4-ty@kernel.org>
Date: Mon, 13 Feb 2023 16:18:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.0
Message-ID-Hash: QYUGC4MU5PBKESQI7BJ6A5VFEXVBBPYT
X-Message-ID-Hash: QYUGC4MU5PBKESQI7BJ6A5VFEXVBBPYT
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYUGC4MU5PBKESQI7BJ6A5VFEXVBBPYT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 12 Feb 2023 23:09:23 +0100, Alexander Sverdlin wrote:
> Commit 2458adb8f92a
> ("SoC: simple-card-utils: set 0Hz to sysclk when shutdown")
> added a call to snd_soc_dai_set_sysclk() with 0 Hz frequency. Being
> propagated further it causes a division by zero in clk-ep93xx driver:
> 
> Division by zero in kernel.
> CPU: 0 PID: 52 Comm: aplay Tainted: G        W          6.2.0-rc4-... #1
> Hardware name: Generic DT based system
>  unwind_backtrace from show_stack+0x10/0x18
>  show_stack from dump_stack_lvl+0x28/0x34
>  dump_stack_lvl from __div0+0x10/0x1c
>  __div0 from Ldiv0+0x8/0x1c
>  Ldiv0 from ep93xx_mux_determine_rate+0x78/0x1d0
>  ep93xx_mux_determine_rate from clk_core_round_rate_nolock+0x48/0xc8
>  clk_core_round_rate_nolock from clk_core_set_rate_nolock+0x48/0x160
>  clk_core_set_rate_nolock from clk_set_rate+0x30/0x8c
>  clk_set_rate from ep93xx_i2s_set_sysclk+0x30/0x6c
>  ep93xx_i2s_set_sysclk from snd_soc_dai_set_sysclk+0x3c/0xa4
>  snd_soc_dai_set_sysclk from asoc_simple_shutdown+0xb8/0x164
>  asoc_simple_shutdown from snd_soc_link_shutdown+0x44/0x54
>  snd_soc_link_shutdown from soc_pcm_clean+0x78/0x180
>  soc_pcm_clean from soc_pcm_close+0x28/0x40
>  soc_pcm_close from snd_pcm_release_substream.part.0+0x3c/0x84
>  snd_pcm_release_substream.part.0 from snd_pcm_release+0x40/0x88
>  snd_pcm_release from __fput+0x74/0x278
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/1] ASoC: ep93xx: ignore 0 Hz sysclk
      commit: 66dc3b9b9a6f4b5c7013f15c66073ddd20852b66

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

