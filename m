Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FE5B58F081
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Aug 2022 18:38:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9F4F8FA;
	Wed, 10 Aug 2022 18:37:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9F4F8FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660149497;
	bh=9Skanl1iMwAqaapFGcRYRT9omyYVXtcx9PfeqAC+zx4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g0u2NUIHNuJXZaohA2b6mqq5DCG2y7lNc/GjuHPBV5AYGLRNvczITHfTpVgaDsH3A
	 /lGGdgbPLMwDcmkExgEEqPLNAaDGW4wDYDsPCwalCDRXOZw6AhsoOEs3p0OpWVhW2q
	 F9jlthMtkGurDzpuxG1s2SUa/BWxOgr00RVRT4Xw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2480AF80240;
	Wed, 10 Aug 2022 18:37:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34BD5F801F5; Wed, 10 Aug 2022 18:37:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 76F7AF80132
 for <alsa-devel@alsa-project.org>; Wed, 10 Aug 2022 18:37:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 76F7AF80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="VJZFoaJx"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D6BEB81DD8;
 Wed, 10 Aug 2022 16:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9F78C433D6;
 Wed, 10 Aug 2022 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660149431;
 bh=9Skanl1iMwAqaapFGcRYRT9omyYVXtcx9PfeqAC+zx4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=VJZFoaJxw+ncGluA+ze9GmmSjpLwrNV5Wbv05Y+COueWSCZa4rF7HvtK20o2nNEh0
 453JImV4XDADsEwuSaQSiV2YJgxRTpSiyjltjKH6MZCmBA2UWa51cpQ8CBJxPwpXc1
 SHH1gg45aqug2fwKY8pbXlb48ud888j0us0Xue5LOysy4dNE8V0CXIrak5/xGKWPQQ
 nfAJN+2Vlh5JHQI+tmaKSQwDqOBSijImjWVAf+kVtyGpcb4SkZjPVd8fUGxNOkOliC
 6SCcxAh/I8DNs3apj2cPclx2p8bK6+sevSKRgrllZ+WG6cELGoi/+MXNnflYAtyVly
 gx4BKfjnRyasw==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
In-Reply-To: <20220810104156.665452-1-p.zabel@pengutronix.de>
References: <20220810104156.665452-1-p.zabel@pengutronix.de>
Subject: Re: [PATCH] ASoC: codec: tlv320aic32x4: fix mono playback via I2S
Message-Id: <166014942953.702841.10369271363773615007.b4-ty@kernel.org>
Date: Wed, 10 Aug 2022 17:37:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fe10a
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 kernel@pengutronix.de, Miquel Raynal <miquel.raynal@bootlin.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>
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

On Wed, 10 Aug 2022 12:41:56 +0200, Philipp Zabel wrote:
> The two commits referenced below break mono playback via I2S DAI because
> they set BCLK to half the required speed. For PCM transport over I2S, the
> number of transmitted channels is always 2, even for mono playback.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: tlv320aic32x4: fix mono playback via I2S
      commit: b4b5f29a076e52181f63e45a2ad1bc88593072e3

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
