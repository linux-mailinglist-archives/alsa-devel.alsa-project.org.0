Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDCC7A5144
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Sep 2023 19:49:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76B506C0;
	Mon, 18 Sep 2023 19:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76B506C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695059364;
	bh=oHw562cwwj68xY+FoUZXzpEdcQhn4hhCJhVT1FDVvGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E8nceamLjWYyc6RKje8gKZXKT3nqAddcSI1zFNYJW/D8WHh7g3fAMlRp18mslH1w+
	 lmukcHddnCXatkKCPijmfsBRYoSssZJPQD5GeiR50wg1qbNnjUxAw7Nq3+pdyVaUQv
	 P2mDf9ni/S7BgGsrf3pEBafdGi2eqmTs/LHFAAPo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCBD7F8047D; Mon, 18 Sep 2023 19:48:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FDDDF801F5;
	Mon, 18 Sep 2023 19:48:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BE5EF8025A; Mon, 18 Sep 2023 19:48:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BA18DF800AA
	for <alsa-devel@alsa-project.org>; Mon, 18 Sep 2023 19:48:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA18DF800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=LFEP0QLy
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2F08861269;
	Mon, 18 Sep 2023 17:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A4A7C433CB;
	Mon, 18 Sep 2023 17:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695059297;
	bh=oHw562cwwj68xY+FoUZXzpEdcQhn4hhCJhVT1FDVvGY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LFEP0QLyhENz9xpylhd21WJKOD9zfZi1knNuf61Fslt3waS9WLhy17eKBgW/vPw1i
	 VkN4/WVebS0MwjdDmsD289l3Zj4jfMppuotTXTU4DCP/L3F6r+e9UHwWteU4MEvenE
	 na2O0Ly/qpOxMy08Q6rLyEthqiFFichqxrBKnmMTTQS/aHbpXUsXjsqwrX2MZ8QHNT
	 ULjyG3OU+GK/BhibC0I9iBB4OL98a2rxIy3MCtrCk2nvidAb9gOAhyjnzmueCgVawL
	 ZlkBgGkoAM3sHPuVr7p5qdvvFsfts6teRVxqkXW3jLzaKrY5rjFgraWEEv8SKyPbfQ
	 IzIzmPG+xNWhA==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
References: <871qf5ij0d.wl-kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 0/2] ASoC: da7213: add .auto_selectable_formats support
Message-Id: <169505929579.78329.14996059650591207946.b4-ty@kernel.org>
Date: Mon, 18 Sep 2023 18:48:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: V3B2EG3HQLAMXRSEF7DSXA77VRTGQHST
X-Message-ID-Hash: V3B2EG3HQLAMXRSEF7DSXA77VRTGQHST
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/V3B2EG3HQLAMXRSEF7DSXA77VRTGQHST/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 11 Sep 2023 01:41:23 +0000, Kuninori Morimoto wrote:
> da7213 is still using M/S instead of P/C for SND_SOC_DAIFMT_CBx_CFx.
> [PATCH 1/2] will update it.
> [PATCH 2/2] will enable DAI format automatic select.
> 
> Kuninori Morimoto (2):
>   ASoC: da7213: tidyup SND_SOC_DAIFMT_xxx
>   ASoC: da7213: add .auto_selectable_formats support
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: da7213: tidyup SND_SOC_DAIFMT_xxx
      commit: e335f29583ac9bb3ba454a1273a3d72c6d2e1fec
[2/2] ASoC: da7213: add .auto_selectable_formats support
      commit: 88e20c1f8c1c0018a2dad50b991b87ef028b9c1c

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

