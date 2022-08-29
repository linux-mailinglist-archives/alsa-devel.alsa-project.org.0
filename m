Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7175A50D1
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Aug 2022 17:58:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AF941E2;
	Mon, 29 Aug 2022 17:58:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AF941E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661788734;
	bh=uE92TjJdIW32uGc6WG4v/qRB5zqFoqnq8jHfO2r3gss=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SX+epxlVArYd5FdwuUdbajNjJ1w5HggfS2+lS5YMXNTUEmf8TVK/MeYnU7Jb1Ks8x
	 gMJFtHzNbeKbOsS7R3ExYKA9FGnX7kgeG9HHpnQ93cRelid/TkZmghyT/Nj9iv7o94
	 lG/62uZugPbzGfMfSsTjj74SX1QCniTy0wrfRkoM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B7513F80115;
	Mon, 29 Aug 2022 17:57:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07D54F801F7; Mon, 29 Aug 2022 17:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,MIME_8BIT_HEADER,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9A48AF80115
 for <alsa-devel@alsa-project.org>; Mon, 29 Aug 2022 17:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A48AF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="K1OyCCL+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B3AFDB81103;
 Mon, 29 Aug 2022 15:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1B7C433C1;
 Mon, 29 Aug 2022 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661788667;
 bh=uE92TjJdIW32uGc6WG4v/qRB5zqFoqnq8jHfO2r3gss=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=K1OyCCL+PN8deD6ziryLzUoodOz+98L5PbMHn6JYTnimsFXpEMJJUDldkw1mbEkgg
 4wdFhU9ctWQaP+OC+j5xUJmY9nqHaPXNLMf+ZU6HFbEp90O3EsKkCyW7IvMUCCrqvu
 8+XMmR8sy3Hb7CkFQ8Abfbk4WHo9hVDlTPDsLn5CIw4loetvMYQUeih0zC4BaFwfvE
 D1bNPZrH/OnLUch2w5Tk+pqo13ufm2g2ddgZjTBAAqm1tYMkcw9RCGOMdYrtMkfDU8
 hdsswnu/eBN40xeCWKw6QlbjUiOGHLJwCWWMNJk5yy8+cFSVeCoh1QN6uNwaUZFM95
 Au8fcWI2gToWw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Martin Povišer <povik+lin@cutebit.org>
In-Reply-To: <20220825140241.53963-1-povik+lin@cutebit.org>
References: <20220825140241.53963-1-povik+lin@cutebit.org>
Subject: Re: [PATCH 0/5] TAS2764 fixes/extensions
Message-Id: <166178866033.855087.6477777309558997906.b4-ty@kernel.org>
Date: Mon, 29 Aug 2022 16:57:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-65ba7
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 navada@ti.com, asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
 shenghao-ding@ti.com, asyrus@ti.com, raphael-xu@ti.com,
 Stephen Kitt <steve@sk2.org>, Dan Murphy <dmurphy@ti.com>
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

On Thu, 25 Aug 2022 16:02:36 +0200, Martin Povišer wrote:
> First three patches are fixes analogical to those recently done to
> the TAS2770 driver.
> Link: https://lore.kernel.org/asahi/20220808141246.5749-1-povik+lin@cutebit.org/T/#t
> 
> The latter two add IRQ handler to log faults and expose a new control.
> 
> Martin Povišer (5):
>   ASoC: tas2764: Allow mono streams
>   ASoC: tas2764: Drop conflicting set_bias_level power setting
>   ASoC: tas2764: Fix mute/unmute
>   ASoC: tas2764: Add IRQ handling
>   ASoC: tas2764: Export highpass filter setting
> 
> [...]

Applied to

   broonie/sound.git for-next

Thanks!

[1/5] ASoC: tas2764: Allow mono streams
      commit: 23204d928a27146d13e11c9383632775345ecca8
[2/5] ASoC: tas2764: Drop conflicting set_bias_level power setting
      commit: 09273f38832406db19a8907a934687cc10660a6b
[3/5] ASoC: tas2764: Fix mute/unmute
      commit: f5ad67f13623548e5aff847f89700c178aaf2a98
[4/5] ASoC: tas2764: Add IRQ handling
      commit: dae191fb957f82fbf570d13c060110eb278813ec
[5/5] ASoC: tas2764: Export highpass filter setting
      commit: aca86ec9a02a4d6099dbe23d1078faa005d58422

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
