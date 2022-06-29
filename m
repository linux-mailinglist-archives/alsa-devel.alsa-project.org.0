Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE05600A3
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 15:07:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7933A164E;
	Wed, 29 Jun 2022 15:06:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7933A164E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656508062;
	bh=G1RHu+MQpFit+ddCR7nyFYmDlIv0wOv1rNdxkGGY0uE=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eqz0Ini4WrU1+uYP3Yan4BYvdF2+t1Nf8sUyBrk6NwMbczCmFIRW9Mdh2alavZCLV
	 SC+pDQe98JHMQVXwmconYoUanJrdIkIPyqraQzEU7D468R4cB4twUn+Fz3a6zvXgyz
	 AHbCge+oUrcNwwh8pVJ+as9lknHxbNj61fUo2UcQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C455F804E6;
	Wed, 29 Jun 2022 15:06:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70B65F8027B; Wed, 29 Jun 2022 15:06:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE3B3F800F8
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 15:06:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE3B3F800F8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kUeRI/gV"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D3A17CE26FB;
 Wed, 29 Jun 2022 13:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FDCCC34114;
 Wed, 29 Jun 2022 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656507961;
 bh=G1RHu+MQpFit+ddCR7nyFYmDlIv0wOv1rNdxkGGY0uE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kUeRI/gV6BNLHSRypWDCSHu4puVrewJKBHcepAS55RmuxVBIe4AgMt8VnnJKY3gs2
 MhxOc51Cb4YRW9iA10aqzPt6DY3QHiP7MfDxXtYlqv+HOyebdCIPfVM8k5d0gjYYqY
 ZiDTwYk8wQg4ulw6gQeqKqvZZRNOLtGn914rTl5w182Hk+e32uwGl/zgItQKjioxGa
 23ZEC4PUEiFGe3gNeKzH2XBhab4s1RhiXt8qc4LGyEkdY0qM9/TOPRVSGMFqiEEkaT
 ezLUvyr0xpj7zYbXs4/9qHkmTYo4xzdl9TvjwpG/vzD8vVdPGKWcvu5pAWFZJm+h1A
 +n8AzKbjiw8wA==
From: Mark Brown <broonie@kernel.org>
To: ckeepax@opensource.cirrus.com
In-Reply-To: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
References: <20220628153409.3266932-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 1/4] ASoC: wm5102: Fix event generation for output
 compensation
Message-Id: <165650795982.1089020.5711367681769613096.b4-ty@kernel.org>
Date: Wed, 29 Jun 2022 14:05:59 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org
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

On Tue, 28 Jun 2022 16:34:06 +0100, Charles Keepax wrote:
> The output compensation controls always returns zero regardless of if
> the control value was updated. This results in missing notifications
> to user-space of the control change. Update the handling to return 1
> when the value is changed.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/4] ASoC: wm5102: Fix event generation for output compensation
      commit: cb41d454b2478a98c831f14e656a34c21418e241
[2/4] ASoC: wm8998: Fix event generation for input mux
      commit: a83f511909217a1c2b971a509c992b6327bb18e7
[3/4] ASoC: cs47l92: Fix event generation for OUT1 demux
      commit: 2d81cca17329dece1c4f37d1de271bc967439327
[4/4] ASoC: arizona: Update arizona_aif_cfg_changed to use RX_BCLK_RATE
      commit: 6f04f1bfe9a4adf750c816f6094878222e496d0e

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
