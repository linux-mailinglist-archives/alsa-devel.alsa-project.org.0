Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182E555268
	for <lists+alsa-devel@lfdr.de>; Wed, 22 Jun 2022 19:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 281FD19FD;
	Wed, 22 Jun 2022 19:30:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 281FD19FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655919098;
	bh=wjmwx45d12C26bDvWpgp91d6lJmG4wfDYbcp9V8Bvyw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F6XANTHkK35QEi4LXEZx8N/ygVeaF//dH7l5zC5onbpO4jtI3IPzygdEUVUOmgv3n
	 cKNjbggGYT95h+X5MBlPsV5oy9PUZhukwo/99q+O5RI6KgGL/ojyxe54MJRkLb1Pt8
	 4RD2n+Xkwi3lNJXozF7no57bvmfGk+DmbFalRChA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D75F80535;
	Wed, 22 Jun 2022 19:30:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F754F804AB; Wed, 22 Jun 2022 19:30:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFF4BF80482
 for <alsa-devel@alsa-project.org>; Wed, 22 Jun 2022 19:30:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BFF4BF80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="FCQO60wY"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 25D17B81F2D;
 Wed, 22 Jun 2022 17:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59BF5C341C5;
 Wed, 22 Jun 2022 17:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655919009;
 bh=wjmwx45d12C26bDvWpgp91d6lJmG4wfDYbcp9V8Bvyw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=FCQO60wYINb0qtwRiHsHJ+BMl30CzFr5kTb3wv13Ye3m9bwU7X/BLFvywJyLcdg9C
 U484FEWifRyCsQPFEUlEnm2YUMNzTC26bXMBEPYaU8g/rrmR78m4mL4EwaREliSPXU
 22OBLOG1RWu0975o1CbR47VblL0nEkLO2cLG0hHHlh6tS/2rVuiXUmaeG3p7tnLcnw
 IOAVwNYNZ3p2WNmTFfVfVWtPtE9/gY3jvfZ1z9z+HwPK8pKN1k2Eb/e3/RwnaH10dx
 U6mlW3M9avW/xkBHbz3/Oby48PAL8xFgyOgHCrvtPi8vs5+XpNb0J3hbNfwS6jQI+4
 uxDM/1zWTI2HQ==
From: Mark Brown <broonie@kernel.org>
To: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, lgirdwood@gmail.com
In-Reply-To: <20220622061739.225966-1-u.kleine-koenig@pengutronix.de>
References: <20220622061739.225966-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: amd: acp: Fix error handling in .remove()
Message-Id: <165591900806.1405752.8746115269962335688.b4-ty@kernel.org>
Date: Wed, 22 Jun 2022 18:30:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.com, kernel@pengutronix.de
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

On Wed, 22 Jun 2022 08:17:39 +0200, Uwe Kleine-König wrote:
> Even in the presence of problems (here: rn_acp_deinit() might fail), it's
> important to unregister all resources acquired during .probe() because
> even if .remove() returns an error code, the device is removed.
> 
> As .remove() is only called after .probe() returned success, platdata
> must be valid, so the first check in .remove() can just be dropped.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: amd: acp: Fix error handling in .remove()
      commit: 0deb003933052ac1a44b5f94b927484be6e34f86

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
