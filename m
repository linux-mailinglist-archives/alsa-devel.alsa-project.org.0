Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDDC413631
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Sep 2021 17:28:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2D1E1612;
	Tue, 21 Sep 2021 17:27:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2D1E1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632238085;
	bh=5mGV+nCp9l2zmcCGt8WiEpj+RJfDrXbHM11DF0P27xA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Bq8bk7gvb1Ftg0WG/AtYlBvkho72P+zpa291puFiVkGo9C0kfKrp5T2U90jpZqr36
	 EsVME7NL7Z2pscpKwTKZAvCDkzEA9FNR3eXDX5kjeF9cztS8brRxIfyH2ao2IOse13
	 tTMelgPlHIqlHjrH+fJl/9+qvRO4p4yUyF/kKwmo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD327F804E3;
	Tue, 21 Sep 2021 17:26:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4A91DF804BD; Tue, 21 Sep 2021 17:26:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B6051F802BE
 for <alsa-devel@alsa-project.org>; Tue, 21 Sep 2021 17:26:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B6051F802BE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Zx7FtSy5"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 471E5611C6;
 Tue, 21 Sep 2021 15:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632237961;
 bh=5mGV+nCp9l2zmcCGt8WiEpj+RJfDrXbHM11DF0P27xA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zx7FtSy5mQEQnDq1Rg2VU1fb65Y1ouLG0i+J4T7X2VyjI9BxhPv2FbKA5OUItp81S
 3CF4NMi3X0/suvLs1T1paaR/Zsb/qi/IPItXNXjHZvrUyQwtWqwbLhnVv9VNuinh9O
 LZesLwzTETwFBUEmUlXnfJA4e6cjgfijMMAS7x7YcQwuzXe8kG91Avlkfsq6MYe10Y
 dFfVRrHquZg65TgGBFKVrYoqYQVvevbJoKeFagJFdnshKfFfzd22LP3xTC3dWr9pEi
 r77GUxIoWjAGjbIrOZO8kfhABqPJPekxvfl6cLBliFnLh6BQgrv+E8z/jVxdngDCdQ
 pPe2GYCCFFwZA==
From: Mark Brown <broonie@kernel.org>
To: Peter Rosin <peda@axentia.se>,
	alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2
 registers
Date: Tue, 21 Sep 2021 16:25:09 +0100
Message-Id: <163223651319.32236.308889133436007639.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
References: <2d221984-7a2e-7006-0f8a-ffb5f64ee885@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Kirill Marinushkin <kmarinushkin@birdec.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 20 Sep 2021 16:49:39 +0200, Peter Rosin wrote:
> From 625f858894af2b7e547cc723b97361081438b123 Mon Sep 17 00:00:00 2001
> From: Peter Rosin <peda@axentia.se>
> 
> Commit 25d27c4f68d2 ("ASoC: pcm512x: Add support for more data formats")
> breaks the TSE-850 device, which is using a pcm5142 in I2S and
> CBM_CFS mode (maybe not relevant). Without this fix, the result
> is:
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: pcm512x: Mend accesses to the I2S_1 and I2S_2 registers
      commit: 3f4b57ad07d9237acf1b8cff3f8bf530cacef87a

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
