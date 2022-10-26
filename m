Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4311F60E6FD
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Oct 2022 20:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEF493A7C;
	Wed, 26 Oct 2022 20:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEF493A7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666807736;
	bh=enLmCax9xea4wAn4oPqtGPe6DLfKjscG5nCv+BzQ+Xc=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mm5soUMP9cc1/Fb+5RZ5OJ8XW2laq+LRry3thgkFC+/ECauHsP6lYceuw3es40ljD
	 ecibFK6z4a91ZffxTHBV8g74fH/w0tlnuPBnNSn5i2xuQPcHBmniL40SVSqR65/e/2
	 SuXtIHNB0gq1typt5nwtvGHRQKwUgHTOwkY/VFXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 57FFDF80508;
	Wed, 26 Oct 2022 20:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 11B7FF8027C; Wed, 26 Oct 2022 20:07:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8492EF80240
 for <alsa-devel@alsa-project.org>; Wed, 26 Oct 2022 20:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8492EF80240
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="GWErYE+Y"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B884F62001;
 Wed, 26 Oct 2022 18:07:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB62DC433D6;
 Wed, 26 Oct 2022 18:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666807650;
 bh=enLmCax9xea4wAn4oPqtGPe6DLfKjscG5nCv+BzQ+Xc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=GWErYE+Ydc6G3qp3+3ESgysdF2O0GYYTe7pdXRU371gmOPP28XaK44q1O91kR0gNM
 7yOgWDW453SARlkAzNoop68G0psc63VAWZbiRYwLp3TuOkzDGJgN7ZhLQumx9sMeeQ
 ny+ZcZk9UQGLQRVEjB9jsnmURbjLRkR9rfcWPy5Eas6LumasFtYu5+TqIgUCQbB1Rg
 ZZKTol8rgjrpmoXPsQT7Tfd4zkke0BSOTWk+mkw1imqgZelASKdAz2IYE3/Uc3EtSE
 3x1Pz7FAbTtWV+MaP8pn3N+r8NsGD1pmu9J4UnV8cN58LC7fOL4cqGJdpTBxjAi2Xd
 KG00H5wEZyPgQ==
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jaroslav Kysela <perex@perex.cz>, 
 Paul Cercueil <paul@crapouillou.net>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>
In-Reply-To: <20221025150149.113129-1-paul@crapouillou.net>
References: <20221025150149.113129-1-paul@crapouillou.net>
Subject: Re: [PATCH] ASoC: dapm: Don't use prefix for regulator name
Message-Id: <166680764848.867857.6473365992161385316.b4-ty@kernel.org>
Date: Wed, 26 Oct 2022 19:07:28 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

On Tue, 25 Oct 2022 16:01:49 +0100, Paul Cercueil wrote:
> When a component has a prefix, and uses a SND_SOC_DAPM_REGULATOR_SUPPLY,
> the name of the regulator should not use the prefix, otherwise it won't
> be properly matched in the DT/ACPI.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: dapm: Don't use prefix for regulator name
      commit: 1683d3282f240336a2b4b6b541d435facfe8bbb6

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
