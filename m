Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D96B7F655C
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 18:23:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B1D8EAEA;
	Thu, 23 Nov 2023 18:23:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B1D8EAEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700760218;
	bh=8F/jiguRcq32VOINzefmDyYIkXt/3k3NK5/RQR1wYU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cO+kAHMvydolH3iocGFqIZvbaimVpPmSz4UnXDt7GhZiBhyewFbevGCmUFZVg3vzn
	 TYm36JSKtVm4XowzOAQavRiS891m9WgHdeU4pKUqHzu4kxXnlqyvMBtRitczBX29ln
	 R/6ue6d43bQEuJqL6HKd1YsiDThR3upVw1RrnPcc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8D4EF80567; Thu, 23 Nov 2023 18:23:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C074F8057C;
	Thu, 23 Nov 2023 18:23:04 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B46A4F802E8; Thu, 23 Nov 2023 18:10:17 +0100 (CET)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3F344F80254
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 18:00:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F344F80254
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MtCQPBEX
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CD4C962272;
	Thu, 23 Nov 2023 17:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15857C433CC;
	Thu, 23 Nov 2023 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700758811;
	bh=8F/jiguRcq32VOINzefmDyYIkXt/3k3NK5/RQR1wYU0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MtCQPBEXWTX4xUsNeYiJze7scCumxb+pLoonCyIRI3n/ioJzllWZCfbTm679Z2sxX
	 KSA/OIwXxihNsDYi5Tw8H+l7+2FnI0exz8p3+aDp/ZCcqWyK2WGR0VRKyiuMgGLdQ6
	 MKe4G90ieENhC5dz5UVGt8ezJ72xxQHe2Sk82kBZcDvDY8XEMWkrgtBpav1ePSDfOH
	 30lmj1nMaq4fA0VJLGrPHFNXsv95i5MbNcKDnwvG4C0jOmX4xm458D68Z6PEuf1vXl
	 mWjeZPv/Xo2xWEhFc8GMXsJPfXtYP/jrAU3hcPKeYRSCmxbkeK7lYzbTQz8H10G6wJ
	 vc7V4ZGJIRHHQ==
From: Mark Brown <broonie@kernel.org>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <1700702093-8008-1-git-send-email-shengjiu.wang@nxp.com>
References: <1700702093-8008-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: refine the requested phy clock
 frequency
Message-Id: <170075880893.2448402.4841454362054924374.b4-ty@kernel.org>
Date: Thu, 23 Nov 2023 17:00:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c
Message-ID-Hash: 57SSFSLCBL7N5XMAHJNGA27NO526H7ZN
X-Message-ID-Hash: 57SSFSLCBL7N5XMAHJNGA27NO526H7ZN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/57SSFSLCBL7N5XMAHJNGA27NO526H7ZN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Thu, 23 Nov 2023 09:14:53 +0800, Shengjiu Wang wrote:
> As the input phy clock frequency will divided by 2 by default
> on i.MX8MP with the implementation of clk-imx8mp-audiomix driver,
> So the requested frequency need to be updated.
> 
> The relation of phy clock is:
>     sai_pll_ref_sel
>        sai_pll
>           sai_pll_bypass
>              sai_pll_out
>                 sai_pll_out_div2
>                    earc_phy_cg
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_xcvr: refine the requested phy clock frequency
      commit: 347ecf29a68cc8958fbcbd26ef410d07fe9d82f4

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

