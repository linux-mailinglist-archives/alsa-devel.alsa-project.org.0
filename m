Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9F277C340
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Aug 2023 00:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CC3A53E;
	Tue, 15 Aug 2023 00:06:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CC3A53E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692050861;
	bh=dz7p/IF5WXFJyzcADOT89NRKdfeQ2X754iNpbxAaiZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JYjHiz7CuyaB8kTQpGnE8zSDQEDfxMqmEVY91lFnxUdLombUXaZk+1ethQYuQJ2hH
	 sUl/e1cingQVKDwzaM7UxFakb0apPWPSD6Jp44eaEHOId9jEw4q5ksKvDTGxUmmSPf
	 Wn/hUqpYaCp03wAtOsYQQ9Rb/Hv1qo/jjA78xJt4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 26A9FF80570; Tue, 15 Aug 2023 00:06:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A988FF80549;
	Tue, 15 Aug 2023 00:06:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9FD3CF80551; Tue, 15 Aug 2023 00:06:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1E93DF80074
	for <alsa-devel@alsa-project.org>; Tue, 15 Aug 2023 00:06:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E93DF80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=FlFf6UIR
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5BDED6365C;
	Mon, 14 Aug 2023 22:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08315C433CA;
	Mon, 14 Aug 2023 22:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692050784;
	bh=dz7p/IF5WXFJyzcADOT89NRKdfeQ2X754iNpbxAaiZo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FlFf6UIRWqN1ejVfuFgwlEfGUgu5d3EGkqrQrnH1MybIBa3uJfSYNoG9c8usHW6Ju
	 m9CHzvSmbx9bKTqXd/m0II74rUZbByJIBYSInioXgBh3S/wk2o1/B8rGoZQke/B1QO
	 1F4/bA3FG3ZG5CYrCdPwpuzaceQ4DjFMMJTsqYNyokQqoO1yPcM5Ax5N6af4z5xtkS
	 yXtpON/WQUjcgjQuIOiLDcFVoIkg4ZSkB+QZlOqhlk8v8PU+T2XH05/lSodFkkMY85
	 vbw6StAVtvevySjchVtafbEkHwopkDdflJYGApdB1qPcUPgTURgSVzPjUSojZCOhwN
	 toZOuOBAu9AXQ==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, alsa-devel@alsa-project.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-renesas-soc@vger.kernel.org
In-Reply-To: <20230813073458.59606-1-biju.das.jz@bp.renesas.com>
References: <20230813073458.59606-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] ASoC: ak4613: Simplify probe()
Message-Id: <169205078274.98708.18262592487730953734.b4-ty@kernel.org>
Date: Mon, 14 Aug 2023 23:06:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: KQDLZL26QIJPQOIA2XWJQJVTHEAV3ZPK
X-Message-ID-Hash: KQDLZL26QIJPQOIA2XWJQJVTHEAV3ZPK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KQDLZL26QIJPQOIA2XWJQJVTHEAV3ZPK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Sun, 13 Aug 2023 08:34:58 +0100, Biju Das wrote:
> Simpilfy probe() by replacing of_device_get_match_data() and id lookup for
> retrieving match data by i2c_get_match_data().
> 
> While at it, drop unused local variable np from probe().
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: ak4613: Simplify probe()
      commit: b39eee2754e9fbcbbdd866c1aad59575d8c4342e

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

