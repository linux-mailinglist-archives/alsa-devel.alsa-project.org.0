Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CC954022B
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jun 2022 17:12:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 620271945;
	Tue,  7 Jun 2022 17:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 620271945
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654614760;
	bh=sFzNLVHvj6l3QxJElRr+ElNCo3nI/0csIe/347gASR0=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pTp94+p3uedP0OIi2mg0T6p6KLNa0SVvWC+T4sVdWCtG+9/PG4YltP+ivPP7L8/Qz
	 yluQYuREryApXAGtfNoBc8OcCQYqh+OtK9Isj21n1GR4YP2hbdeU2EgKmjW2rfbE7q
	 5GVMyvkKOT7TkVGIVHk++ZkOBtHPzuWmYfgVru1w=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C978CF80116;
	Tue,  7 Jun 2022 17:11:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D11AAF80159; Tue,  7 Jun 2022 17:11:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D5BCF80109
 for <alsa-devel@alsa-project.org>; Tue,  7 Jun 2022 17:11:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D5BCF80109
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Qsvy2SBq"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BB95D616C2;
 Tue,  7 Jun 2022 15:11:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00E9DC34114;
 Tue,  7 Jun 2022 15:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654614695;
 bh=sFzNLVHvj6l3QxJElRr+ElNCo3nI/0csIe/347gASR0=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Qsvy2SBqE9ROPVqQ72h3TfbuIqviG/RK3XlYw5Jwt4gGMbTpQ+fuoBmf15kZul767
 mUYDe1u1xerMI587Zn7GZv5FaM+3OtFeve7huKQxsg/SekPIu/Vkuzuftbre6DgsWz
 NuPmupo3FgHY1GO5dwLE2/7tzev+YSW4FEeRcnYCUobbF8C0cUssp6FZ1CODMAnegr
 dJMLXjmqY40vlJrCT10+gyq5exW4JRau2IyrYG/cZ5YpR0ZARuhxiMyBO7JKbecB4v
 LxlYex7W0tdivyMPVmQgC795QqEy9JfTbnTBBCSrw6SomANM3yeQt9TMGn3ASWQD11
 DhA6V3CPoE6rw==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, lars@metafoo.de, broonie@kernel.org,
 nuno.sa@analog.com
In-Reply-To: <20220602130531.3552275-1-broonie@kernel.org>
References: <20220602130531.3552275-1-broonie@kernel.org>
Subject: Re: [PATCH 0/3] ASoC: ssm: Use modern ASoC DAI format terminology
Message-Id: <165461469364.1873781.12318960270819829835.b4-ty@kernel.org>
Date: Tue, 07 Jun 2022 16:11:33 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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

On Thu, 2 Jun 2022 15:05:28 +0200, Mark Brown wrote:
> Trivial updates to modernise the various ssm* drivers to the new
> DAI clocking constants.
> 
> Mark Brown (3):
>   ASoC: ssm2518: Use modern ASoC DAI format terminology
>   ASoC: ssm2602: Use modern ASoC DAI format terminology
>   ASoC: ssm4567: Use modern ASoC DAI format terminology
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: ssm2518: Use modern ASoC DAI format terminology
      commit: 8dc51d009fad7aba0575e0eb4b684d25c0f01f37
[2/3] ASoC: ssm2602: Use modern ASoC DAI format terminology
      commit: 0160e8835fab4d4a15abefe7509d0397890c0ffd
[3/3] ASoC: ssm4567: Use modern ASoC DAI format terminology
      commit: 627a18149250e13409079ffb6936e472c3766f44

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
