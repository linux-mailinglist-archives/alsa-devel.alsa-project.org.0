Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F56779B7A6
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 02:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D3011503;
	Tue, 12 Sep 2023 02:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D3011503
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694477238;
	bh=wdn9zlEHyAc8HiPWc965gAJpmz+DsTAFslrex/UwS74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jBiI8APjwWpIrljzl4A5aaCeiLvrmwShsIEZR2+5R5MmmSMgoDA7N6cz4waWlqibs
	 ZpFg3Esewh6TicFTL5UnlDEvY/ip+T4wWG/pFvFmMncwraXaK+lmyG3ZpwCrOvX+c7
	 lDSj67hXZ1sTUNbPPOCYMPLMk/76BU0QTDd2ftoQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 35A44F80696; Tue, 12 Sep 2023 01:58:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CEB3F8063B;
	Tue, 12 Sep 2023 01:58:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A35DBF8062F; Tue, 12 Sep 2023 01:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 39625F80637
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:57:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39625F80637
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=HDL5+m/n
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D91F7614A4;
	Mon, 11 Sep 2023 23:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6B9C3277A;
	Mon, 11 Sep 2023 23:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694476666;
	bh=wdn9zlEHyAc8HiPWc965gAJpmz+DsTAFslrex/UwS74=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=HDL5+m/n8EniyneVT4YXFL1cvsyH8H903hGyFuIy5FUSFIkAu4gFiVg5baOz+Yh1R
	 sHOJ4MKZg/bVhNKtxDkiBRbnoeOj4r9pKYVfSGID4E4F8QcNOhsoqZCzwXnZ28/tz4
	 SqIC24Y/BKwmLBx/8qTCR3s1D6cnoPJfTsmku6GeAwHBQ6lPlAfkJz4kbemp5EjQY+
	 7w7SGrYjyLSWjwFApSfG6xRqoFL0L1CmHf/GLsL7q+ikP3W03m0m2W5YDmEq6zl6xS
	 YZJF4MRX49rxWrhA1u+9IWUb77kgBMoToH4wnXKrv8e3+VshiSKcVDO8BxQhzMRWWM
	 MNift8QGnTlyg==
From: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Biju Das <biju.das.au@gmail.com>
In-Reply-To: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
References: <20230901065952.18760-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 0/3] Match data improvements for wm8580 driver
Message-Id: <169447666353.2387538.719003244549420214.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 00:57:43 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-099c9
Message-ID-Hash: KFKEEMDCWQJQVYGFBUU6ZTGVYAEKTIX5
X-Message-ID-Hash: KFKEEMDCWQJQVYGFBUU6ZTGVYAEKTIX5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KFKEEMDCWQJQVYGFBUU6ZTGVYAEKTIX5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, 01 Sep 2023 07:59:49 +0100, Biju Das wrote:
> This patch series aims to add match data improvements for wm8580 driver.
> 
> This patch series is only compile tested.
> 
> v3->v4:
>  * Created patch#2 for removing trailing comma in the terminator entry
>    for OF table.
> v2->v3:
>  * Added Rb tag from Andy.
>  * Restored OF table postion and moved in patch#2
>  * Moved OF table near to the user.
> v1->v2:
>  * Added Ack from Charles Keepax.
>  * Removed comma in the terminator entry.
>  * Restored original error code -EINVAL
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: wm8580: Simplify probe()
      commit: 26eacb98ca7dd3ba5a6845028a13d13a7f03123f
[2/3] ASoC: wm8580: Remove trailing comma in the terminator entry
      commit: aa11a78fecab8809167dcb59dd3f55b5fdbc9ef3
[3/3] ASoC: wm8580: Move OF table
      commit: ef01a6dec7f1717d13282e84bb4ac68f2119d9d9

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

