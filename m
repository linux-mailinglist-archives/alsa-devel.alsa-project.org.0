Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A25606DDD9D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 16:20:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DF4F14;
	Tue, 11 Apr 2023 16:20:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DF4F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681222857;
	bh=kdQTUFDrppcbll+bPRUoyQi03XX3nEL9SdpO7pnbEXI=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U0E4qf94TWffzLzHzgrc0SfiB1QR8FTlQjAZMWXVVr7VdQ8ajKwhaHqEcSWNYTTM8
	 8uNvxumQMJdXzqLs6so9+Wtgkq2S/ck/7iGqHvzG5nkSIfLyNexz0bZiZW48hoIll8
	 zJ0RT6kwYxRkJF7OF6NAF7y4tOq4MMtgl8qh1Syc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C7861F8052D;
	Tue, 11 Apr 2023 16:19:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4BD7F8051F; Tue, 11 Apr 2023 16:19:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0F93CF8025E
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 16:19:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F93CF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=dV245lNU
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8ED3A62766;
	Tue, 11 Apr 2023 14:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A317DC433EF;
	Tue, 11 Apr 2023 14:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681222747;
	bh=kdQTUFDrppcbll+bPRUoyQi03XX3nEL9SdpO7pnbEXI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=dV245lNUy0cQvqED7MKhuvvzB3zVQtzgeaVo7iXHTIrj2atMR0iXdikGaWwam4Vfn
	 5fTiIUQeSOWdHCa/k5olVclSC5hvqy3ArmsnVfzrJKnn0ecFWd4VGDrkYdbPmKo1IZ
	 RCMm4Kpsnx0kggTgoRGRSitW/ifkySNFmHa1qhvXDu7/2y22cCJ2WYtMNtLKAS8kT4
	 OWOmhKQPEitikXq4wBg720qbqNngqC1EG8eHHvI3zmdFQLdwn3yj5NBl4pP8ODz7pA
	 XhFB/409eui8GI1XM944voar0tCq6fXK3lCeJVBPi2k7svYydNhl8i+YSyfg2tlps0
	 Sxd8TFcKTHPWg==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
In-Reply-To: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
References: <20230410223902.2321834-1-alexander.sverdlin@gmail.com>
Subject: Re: [PATCH 0/3] ASoC: ep93xx: Prepare for DT transition
Message-Id: <168122274438.54453.12909974766938645863.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 15:19:04 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
Message-ID-Hash: SSLHZBQLWFPWQ26VQDSFV62UMQ2T4PZU
X-Message-ID-Hash: SSLHZBQLWFPWQ26VQDSFV62UMQ2T4PZU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Nikita Shubin <nikita.shubin@maquefel.me>,
 David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Lucas Tanure <tanureal@opensource.cirrus.com>, patches@opensource.cirrus.com,
 Richard Fitzgerald <rf@opensource.cirrus.com>, Takashi Iwai <tiwai@suse.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SSLHZBQLWFPWQ26VQDSFV62UMQ2T4PZU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 11 Apr 2023 00:38:59 +0200, Alexander Sverdlin wrote:
> This is a preparatory series for EP93xx transition to DT. This patchset is
> a pre-requisite and has been tested with the full DT patchset [1].
> 
> [1]. git://git.maquefel.me/linux.git branch ep93xx/6.2-rc4-v0
> 
> Alexander Sverdlin (3):
>   ASoC: ep93xx: i2s: move enable call to startup callback
>   ASoC: cs4271: flat regcache, trivial simplifications
>   ASoC: ep93xx: i2s: Make it individually selectable
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ep93xx: i2s: move enable call to startup callback
      commit: 80f47122538d40b1a6a2c1a3c2d37b6e51b74224
[2/3] ASoC: cs4271: flat regcache, trivial simplifications
      commit: 2e9688c81cfc48b210af6f313cb04589b7943e86
[3/3] ASoC: ep93xx: i2s: Make it individually selectable
      commit: 24f934becf60598fdec9c9f2e06437c831ffa374

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

