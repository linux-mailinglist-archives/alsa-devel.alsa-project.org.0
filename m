Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0407379DB9E
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 00:08:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 715B1A4E;
	Wed, 13 Sep 2023 00:07:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 715B1A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694556482;
	bh=E2XTGRL/IkbTW32YCF8VS7zqFT4U8Ka0FnC5/INNJTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QtWVuaNwtlRiWyVlD8YLJJWhmVEj27Baac33UQ4O9UfzXJEyN4eNzrTedCoASrcvr
	 Su+1xrK6u+ZAJ3t85SF3aswsIHNdXrNEwHzg56EnlVEMWFy5YFNnQ22gEN36BBbu17
	 D+z5dnTjkdOX2EPYna1AsNoj7p6yqz95uE5Ur99c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64BFDF8055B; Wed, 13 Sep 2023 00:06:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6240F8055A;
	Wed, 13 Sep 2023 00:06:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7407F80425; Wed, 13 Sep 2023 00:06:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6224EF80212
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 00:06:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6224EF80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=lCNqeIvB
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 929FBCE1FC9;
	Tue, 12 Sep 2023 22:06:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0EBCC433C9;
	Tue, 12 Sep 2023 22:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694556367;
	bh=E2XTGRL/IkbTW32YCF8VS7zqFT4U8Ka0FnC5/INNJTc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lCNqeIvByiakywFUCNyfdE+DcGHmywQ1NaP4iUBTtfw1rRWFTvrjxbxN4LXuE1lF3
	 NihgDqoloyCBLJ/fm/XGU/7/hu7ugPD9logEwUU8kFCsfqFzKBFvDSMJW6pcfLVQCG
	 LtmYN3dqtwW6QbnDOdzopGP5F8d1PGRrV6xR1Z5tcuGahOadNnoZW+HC5uzHDfCTT/
	 7s2xHD9K2wJD9SotQfH49yld6kxN1Pob/VPQs7euUXS6Unb8/hceODu4Rz7FSA68KM
	 /+1/z7YDG/5blnaiLkag3mikuMpMJWFXrKy4ao18Ip0d/IIETfnxL2X7Idk8GbTWpo
	 CwptUU65PUzug==
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
In-Reply-To: <20230912133841.3480466-1-rf@opensource.cirrus.com>
References: <20230912133841.3480466-1-rf@opensource.cirrus.com>
Subject: Re: [PATCH] ASoC: cs35l56: Disable low-power hibernation mode
Message-Id: <169455636529.155240.12687921810988180049.b4-ty@kernel.org>
Date: Tue, 12 Sep 2023 23:06:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
Message-ID-Hash: 4IW7RZTV7GI5BDFTIUKBSPOXSX7WPBIV
X-Message-ID-Hash: 4IW7RZTV7GI5BDFTIUKBSPOXSX7WPBIV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IW7RZTV7GI5BDFTIUKBSPOXSX7WPBIV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, 12 Sep 2023 14:38:41 +0100, Richard Fitzgerald wrote:
> Do not allow the CS35L56 to be put into its lowest power
> "hibernation" mode. This only affects I2C because "hibernation"
> is already disabled on SPI and SoundWire.
> 
> Recent firmwares need a different wake-up sequence. Until
> that sequence has been specified, the chip "hibernation" mode
> must be disabled otherwise it can intermittently fail to wake.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: cs35l56: Disable low-power hibernation mode
      commit: 18789be8e0d9fbb78b2290dcf93f500726ed19f0

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

