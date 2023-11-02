Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D607DF4F6
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Nov 2023 15:27:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D9EB208;
	Thu,  2 Nov 2023 15:26:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D9EB208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698935266;
	bh=rcXBjMiQQ807SsSE73W1ZsB1P3MDsemZVPcElP+zMXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JnKR+iV3juWjeoK07vaPaCR0Yve50W9rrXwYn7aj/j9pa7zRykKr/8vImQMxQbrvM
	 CbWXPMjw3awbMRnQToQQ29DwmPNoPt9JNOo0vezLPsTSuqgC8BhqP2wKzpkB6Z2i7A
	 2cz2JLs1dBrABtTRSeLY2DdqCkCRrDVqGLUJ9zWE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 864AFF80152; Thu,  2 Nov 2023 15:26:36 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 385CBF8020D;
	Thu,  2 Nov 2023 15:26:36 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1BF3F80290; Thu,  2 Nov 2023 15:26:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8F123F8003C
	for <alsa-devel@alsa-project.org>; Thu,  2 Nov 2023 15:26:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F123F8003C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=hhMeKdRj
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id F03ECB81C16;
	Thu,  2 Nov 2023 14:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6CA3C433C7;
	Thu,  2 Nov 2023 14:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698935185;
	bh=rcXBjMiQQ807SsSE73W1ZsB1P3MDsemZVPcElP+zMXY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hhMeKdRjUwLLB/3HZCgLSvJVy9zZIpSfUk20nwFGioelcmhY4pBPcK13HO1hFK/gb
	 OVromLYq9NbTv6i9Z4un9PKBVRVMFiK3Krhnuc/j5RXyZd0th8ot3CGoFVk7vUMWI/
	 mwkub2D5EV50L8liy8GTg97YCI7R2wfprqWhzqHWNNE9r7B00b91CYUQwsuHNRweJ/
	 gUAsBnTzYZZ3/roV6nh1rA9g5HgOZjqvltaIdy7p+ud0ADoCAV1yBbjY13l5CwBCse
	 pj2wQsuvZBL6dVahEthveQ6FFYV7CHvgzwe1g+DAaVSkGV4DXg4Zj/jk/x+7EfVNge
	 Wiz8oyY89ku5w==
From: Mark Brown <broonie@kernel.org>
To: David Rau <David.Rau.opensource@dm.renesas.com>
Cc: support.opensource@diasemi.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 dmaluka@google.com
In-Reply-To: <20231101022507.6226-1-David.Rau.opensource@dm.renesas.com>
References: <20231101022507.6226-1-David.Rau.opensource@dm.renesas.com>
Subject: Re: [PATCH] ASoC: da7219: Improve system suspend and resume
 handling
Message-Id: <169893518346.36738.17294390778319166082.b4-ty@kernel.org>
Date: Thu, 02 Nov 2023 14:26:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: Z3W3JYE5EAJGXN27YTGRM3JWCVW7H6DC
X-Message-ID-Hash: Z3W3JYE5EAJGXN27YTGRM3JWCVW7H6DC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3W3JYE5EAJGXN27YTGRM3JWCVW7H6DC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 01 Nov 2023 10:25:07 +0800, David Rau wrote:
> When DA7219 is suspended, prevent the AAD IRQ handler is unexpectedly
> executed and cause the I2C driver "Transfer while suspended" failure.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: da7219: Improve system suspend and resume handling
      commit: ab5201e20c181563774631258f737caeefed2364

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

