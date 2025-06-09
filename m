Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69236AD1F10
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Jun 2025 15:41:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0AD7A60217;
	Mon,  9 Jun 2025 15:40:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0AD7A60217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749476465;
	bh=fwQ/XGRm+j6lfP0Wh7oeKygXipSMZzyVO+2pN+aiQZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NSMFte3hk8KCDGoh3KOk6bl2sC8xt4opY0lFaA1bAEwyuvbrqH6WdSWRaxZDpLI/f
	 Hyrzho9ljMOdy95oNjhUmdmgA2N+FxkjH/nkfQriiw0OoHENI6r3zAWg/4dQuZadpC
	 Ghn0lutxXmWSAk8ruYND0vqJRwY1fM/Gim7mGkac=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 488B2F805E6; Mon,  9 Jun 2025 15:40:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2EE50F805E6;
	Mon,  9 Jun 2025 15:40:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C1838F805D3; Mon,  9 Jun 2025 15:40:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 110C1F805CB
	for <alsa-devel@alsa-project.org>; Mon,  9 Jun 2025 15:40:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 110C1F805CB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=QlDIumbT
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E0E225C2570;
	Mon,  9 Jun 2025 13:37:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FB8FC4CEF0;
	Mon,  9 Jun 2025 13:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749476416;
	bh=fwQ/XGRm+j6lfP0Wh7oeKygXipSMZzyVO+2pN+aiQZA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=QlDIumbTm91k20+n46slPd1ryfkV1U6kZ0m9VxE0ztHdfDcg9k+MFq3Jnz2A7D0Wo
	 XFERcaBOu6s5k0+zk6FoLkwEJiEpartV7aBWwtM3uelT8WviU1KwNeW4ba5YnA1yeF
	 xDf3Bgedg2RtEx13MX3Vo/wcboxzciPTjq/i9PzuRH817R/klWfWGne7LGA0uTHFIU
	 pB6IStlh1rD4h9BiThrzjM3fIG+yZu0tBZNrpoiGxiS7hmMbOYHSH6AyaNy1wJSWng
	 MNveDhpJv8wm2uZqjVI2e25AOchXRt7hgG96FVoop+y2labN/7sv+8cFYhWTV1tlMN
	 yc56bE9mL8ynQ==
From: Mark Brown <broonie@kernel.org>
To: alsa-devel@alsa-project.org, Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
 yangxiaohua@everest-semi.com
In-Reply-To: <20250604061821.2678-1-zhangyi@everest-semi.com>
References: <20250604061821.2678-1-zhangyi@everest-semi.com>
Subject: Re: [PATCH] ASoC: codecs: ES8326: Modify initialization
 configuration
Message-Id: <174947641506.126747.13776192862157337716.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 14:40:15 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1
Message-ID-Hash: LNDL2NHRMDKSFKBVM5C4GSQRV2G5EW56
X-Message-ID-Hash: LNDL2NHRMDKSFKBVM5C4GSQRV2G5EW56
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LNDL2NHRMDKSFKBVM5C4GSQRV2G5EW56/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, 04 Jun 2025 14:18:21 +0800, Zhang Yi wrote:
> Modify the value of ES8326_SDINOUT1_IO in the initialization
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codecs: ES8326: Modify initialization configuration
      commit: b44b2694005b501b2eaeb56aa778f3ca22de4659

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

