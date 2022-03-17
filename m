Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5D4DCEA5
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Mar 2022 20:16:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7645A1AA4;
	Thu, 17 Mar 2022 20:16:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7645A1AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647544614;
	bh=Y+apd5wGVAcbGhJSYKEioR4SaIWjP+1tnLbv+JCtuTs=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V6cuB3IoboFflzK6conuEI60ngx9xRonAuuMpSxFd1DjZLGyBfDk3piqYV0YXruh/
	 Yy1gnlaj7ga2REQxluth4da12h7X7armIQo8wsWKha5EKTllb8dY9NnTM5AY5x5LNk
	 7j8e/Tw7dwe3owhCf54+qwNzB2DD7K1RRa7MNyDs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEDB2F80510;
	Thu, 17 Mar 2022 20:15:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 994EDF802DF; Thu, 17 Mar 2022 20:15:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDAAEF8023A
 for <alsa-devel@alsa-project.org>; Thu, 17 Mar 2022 20:15:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDAAEF8023A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="YyV2Y3NN"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2224CCE2457;
 Thu, 17 Mar 2022 19:15:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 689FCC340EC;
 Thu, 17 Mar 2022 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647544517;
 bh=Y+apd5wGVAcbGhJSYKEioR4SaIWjP+1tnLbv+JCtuTs=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=YyV2Y3NNRcDkNQ91mK4rRWosiPM6MGwZq9m1P8FwcGCGV1iQiSijyjAMR981+MIjF
 znFuwFdxgDM6391YZkQ4Ifm91A01c3yN77rkj0ag3e1rY2BFnh7VrTevnW7GYICvaG
 HeBRWJamGYKtyjiyw963tqomW9uZXWe/zllzz4mT1nv6RRCFWBXQaUtfeUKRNBbv5X
 fHirIWXXn/2rxHB/MW3ttc4gy21na47hxcx7XwrfUYjWyEOk4pybewsEI4Li55SWL7
 nRTVqvyJ/06aaLd1v+B8FN94HkSge75odjzuSx4IJkCo9/YskymnkRcX3Da06dGsmP
 Lgn3XryG/Ey5Q==
From: Mark Brown <broonie@kernel.org>
To: festevam@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, tiwai@suse.com,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo.Lee@gmail.com,
 shengjiu.wang@gmail.com
In-Reply-To: <1647408538-2982-1-git-send-email-shengjiu.wang@nxp.com>
References: <1647408538-2982-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add new registers included on i.MX8ULP
Message-Id: <164754451515.3036648.9457796820741527004.b4-ty@kernel.org>
Date: Thu, 17 Mar 2022 19:15:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, 16 Mar 2022 13:28:58 +0800, Shengjiu Wang wrote:
> There are some new registers added on i.MX8ULP, they are
> the SPDIF transmit Professional C channel registers,
> 192bit SPDIF receive C channel registers, and 192bit SPDIF
> transmit C channel registers.
> 
> There are two output lines, SPDIF_OUT1 and SPDIF_OUT2, the
> original REG_SPDIF_STCSCH and REG_SPDIF_STCSCL are used for
> SPDIF_OUT1, the new REG_SPDIF_STCSPH and REG_SPDIF_STCSPL
> are used for SPDIF_OUT2, the 192bit SPDIF C channel registers
> are used for both.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: fsl_spdif: Add new registers included on i.MX8ULP
      commit: 638cec39339db40df9fc2ece0411a64856669b93

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
