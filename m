Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BF34E5400F7
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 16:12:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 455C71717;
	Tue,  7 Jun 2022 16:11:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 455C71717
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654611156;
	bh=kfPGOaInU1BYGH+JnxZUqGymu0I19v0lySqG/auXctA=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dEfD+TkYnJTnzY1yQF4A1MaDYZaj7j+P9GP97V6pcWec4p5mY2JhuLNZRUcIjxIBn
	 mq3VaggnBNUw7UV/5rGzo0MlTp9LEjTSkkFKWPcReSBV6iXD6UzBl8sectm3RkeNdH
	 xiI2TSSCx4ieIYvp4tjqITqQGEYuQ0dsqs/P1X4U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F71AF8028B;
	Tue,  7 Jun 2022 16:11:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DB60CF80159; Tue,  7 Jun 2022 16:11:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 81C93F80116
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 16:11:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 81C93F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="q/FCnxdH"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0965B81FCF;
 Tue,  7 Jun 2022 14:11:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1700C385A5;
 Tue,  7 Jun 2022 14:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654611091;
 bh=kfPGOaInU1BYGH+JnxZUqGymu0I19v0lySqG/auXctA=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=q/FCnxdHEfjK2boA/u8zj9aAUItcNlpqfj1BP5MyIIA7+7+q7yMjaQj1tdqaMz2Fq
 v1ojJwcS5u+MCk6WRnGqdd+r7py6iz6Duoeu16gyr9HSmi/XYFfiid94lvxUA2KJbq
 Wcq6uIlBDaadmnpS9PR9Wf+uzZnmI4rZa4C4rFWLRQkNBVWTh84ZKXJQvsd33Kir55
 lixlViiqT2qIK5OBwo3KgzSmOu9TGHv9mbnRZ4lfKil/ffBZxznTJYE42lKJ+9vsPh
 CzpwOwzgWAEEc/s83jBBk0gMmtuitfz6+J5MaMhjJ4tj4RPGBrFekz+64c3ipRzeP5
 lMuDcBM49c0UA==
From: Mark Brown <broonie@kernel.org>
To: cezary.rojewski@intel.com, pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>, yang.jie@linux.intel.com
In-Reply-To: <20220605153904.26921-1-u.kleine-koenig@pengutronix.de>
References: <20220605153904.26921-1-u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] ASoC: Intel: broadwell: Make broadwell_disable_jack()
 return void
Message-Id: <165461108963.1597191.1670854889189649863.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 15:11:29 +0100
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

On Sun, 5 Jun 2022 17:39:04 +0200, Uwe Kleine-König wrote:
> broadwell_disable_jack() returns zero unconditionally. Letting it
> return void instead makes it easier to see in the callers that there is no
> error to handle.
> 
> This is a preparation for making platform remove callbacks return void.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: Intel: broadwell: Make broadwell_disable_jack() return void
      commit: aa0d5f095093610e7274591d41a28381f60467a8

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
