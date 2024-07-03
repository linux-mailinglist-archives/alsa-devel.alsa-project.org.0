Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB89266FD
	for <lists+alsa-devel@lfdr.de>; Wed,  3 Jul 2024 19:22:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AD8EE97;
	Wed,  3 Jul 2024 19:22:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AD8EE97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1720027335;
	bh=giXUCjE/bVF2J8IwN5KMHAKxDuYcdenGtsscvyNcoFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pD5A+wRmki5fJc1BYoXyYwGKYYOnWDJqWrHGtL3ZVr6AsK0D4P78SkCbsYk0Ol/LS
	 SIJ/WLe/wIVrvN8uhgNZku9K6xbRPJ45OAQ+iIptY1fzZfmPu1ycYBUm0G7YoRSlsQ
	 5hCreq4cDHt4gOHIAKOm20DfVeOIsVhNiqvT6U7Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 05747F805B6; Wed,  3 Jul 2024 19:21:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79207F800F8;
	Wed,  3 Jul 2024 19:21:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AB764F8025E; Wed,  3 Jul 2024 19:21:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	RCVD_IN_VALIDITY_SAFE_BLOCKED,SPF_HELO_NONE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DF5BFF800F8
	for <alsa-devel@alsa-project.org>; Wed,  3 Jul 2024 19:21:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF5BFF800F8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DNLaOhat
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B7641623C2;
	Wed,  3 Jul 2024 17:21:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83588C4AF07;
	Wed,  3 Jul 2024 17:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720027291;
	bh=giXUCjE/bVF2J8IwN5KMHAKxDuYcdenGtsscvyNcoFk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DNLaOhatSyBmheBUCTXVoWP9pBSwvdkQCzPKio/jnWsJ28MZn/w9C/jXgxgYIHGA4
	 +d3qWvFjFE9pDjd7FUTzpHs964S2+gFb9ZLZAlEMy9wMMH+DC/xzZqUB4RwXocLw5m
	 ypk1gtUICiffHOFiLu0VoeAVcuwictBtFbE7QaAsujwbV5O+d1SnGMay3WZGJnRtVn
	 NfwnLIlcsrS5qvLUe+pZT9uCYrB3EoFJbACcl81XVlfykkQKE5lPnQK1F9dnXS98bn
	 ZEDGS6kQFD4phMsjoUvq0kla0oNEwjZQkDq1pVvUZ5rhTCts/SIYSP44GDCDqOZs6u
	 M+ZeMzL8WTMeQ==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <20240703095517.208077-1-rf@opensource.cirrus.com>
References: <20240703095517.208077-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH 0/2] ASoC: cs35l56: Set correct upper volume limit
Message-Id: <172002729026.88190.11217430564421888436.b4-ty@kernel.org>
Date: Wed, 03 Jul 2024 18:21:30 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707
Message-ID-Hash: 7ACFA7HCRCNIE4S3XBMY5IB4SEW75IAW
X-Message-ID-Hash: 7ACFA7HCRCNIE4S3XBMY5IB4SEW75IAW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ACFA7HCRCNIE4S3XBMY5IB4SEW75IAW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 03 Jul 2024 10:55:15 +0100, Richard Fitzgerald wrote:
> These two commits set the upper limit of the Speaker Volume control
> to +12dB instead of +100dB.
> 
> This should have been a simple 1-line change to the #define in the
> header file, but only the HDA cs35l56 driver is using this define.
> The ASoC cs35l56 driver was using hardcoded numbers instead of the
> header defines.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: cs35l56: Use header defines for Speaker Volume control definition
      commit: c66995ae403073212f5ba60d2079003866c6e130
[2/2] ASoC: cs35l56: Limit Speaker Volume to +12dB maximum
      commit: 244389bd42870640c4b5ef672a360da329b579ed

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

