Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC98579B62E
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:04:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A36BEB1;
	Tue, 12 Sep 2023 02:04:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A36BEB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477090;
	bh=ICaA0huUb9/fxo/31gwj6ndxM2rczzeMvoZAt/a+ZQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=C0SJ0O4c3uea/xrGBgwFaD1+hx78DGkABtthzmO8i0Y5evXZ7QuuqOVqvB/WNkrFx
	 aQSzbjFjd1JGo8kYpribUGM4Bh+zXekxYnClyBgA86UKtFu1dVuQseD6Tivb16r/lx
	 Im+74j4bk0pEtW6nQkaQHdlsAd6Jz47b38tYaLV0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 80335F805EC; Tue, 12 Sep 2023 01:57:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D3F1EF805EC;
	Tue, 12 Sep 2023 01:57:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FFADF8057B; Tue, 12 Sep 2023 01:57:26 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 6E472F80549
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E472F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KA2BC0FM
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD92F613E9;
	Mon, 11 Sep 2023 23:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2CCC116D5;
	Mon, 11 Sep 2023 23:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476641;
	bh=ICaA0huUb9/fxo/31gwj6ndxM2rczzeMvoZAt/a+ZQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KA2BC0FMcnu9QuVVOd2+jU0GKXjvRJv2BICe1BJl7nwpyTz4mu24002KX2mmN7mGW
	 l629wWKQ1d3CxBiL2O+A32Tse5at5otAN44Q3EsZ6LIHIhTrK0AAVKlE10XVXHT7I1
	 QYVwiAQosPKCnpvIyUACIfRhVQBfgjhcX/+lnLt89H2rm+dqGsrYnc3sVZ97fibijn
	 W87M0kpRazJlZyt2G4GWgwc+YOuBHx51ijPDYTpfJLtPdN3lyHVbaQY+NkDODW+DAN
	 Lkdh6dsjC+CxygpzHWxN9/h5NdE3iv3fJBsrKgJjqA6axja2ufrlf6iuM/EMoMkfG4
	 CH8y2SASTUSjg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230828174019.119250-1-biju.das.jz@bp.renesas.com>
References: <20230828174019.119250-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v2] ASoC: wm8580: Simplify probe()
Message-Id: <169447663845.2387538.8668283266177753726.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:18 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: ALZYATV5XC6WTS7DSZAUSRLBGGKVIKUR
X-Message-ID-Hash: ALZYATV5XC6WTS7DSZAUSRLBGGKVIKUR
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ALZYATV5XC6WTS7DSZAUSRLBGGKVIKUR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, 28 Aug 2023 18:40:19 +0100, Biju Das wrote:
> Simplify probe() by replacing of_match_device->i2c_get_match_data() and
> extend matching support for ID table.
> 
> While at it, remove comma in the terminator entry and simplify probe()
> by replacing dev_err->dev_err_probe().
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: wm8580: Simplify probe()
      commit: 26eacb98ca7dd3ba5a6845028a13d13a7f03123f

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

