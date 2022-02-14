Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A12CF4B53DB
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Feb 2022 15:57:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4ED4517F8;
	Mon, 14 Feb 2022 15:56:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4ED4517F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644850666;
	bh=y+Rr2b5WM7F6auE0BW2a+3Ab1MYhu1zzwg5gCTdAqH0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AhhIlc2/1j185uRqjS/o4sdcxho3yOdcuCMCgztSLTrb5ptxOeVYevAIxMqsAoBNK
	 odbAdrH9RLKw8JLUKX7+cRdv6ahvBqyZLraj4+4A6YZZ9PYhj86ZNCPuBpmd4YCzIW
	 WIjZE8sO5CQoqkoj6QeOzz/ZPJr5e5AYWvK3NQ98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6BCCF80517;
	Mon, 14 Feb 2022 15:56:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5EF74F800C0; Mon, 14 Feb 2022 15:56:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47861F800C0
 for <alsa-devel@alsa-project.org>; Mon, 14 Feb 2022 15:56:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47861F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uhVfjJh+"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A464B810D8;
 Mon, 14 Feb 2022 14:56:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD81DC340EE;
 Mon, 14 Feb 2022 14:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644850560;
 bh=y+Rr2b5WM7F6auE0BW2a+3Ab1MYhu1zzwg5gCTdAqH0=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=uhVfjJh+bKD8Lhh2LM5ApUe0IXmjlp2loNhS8irmzKR2weyQXsE+dbzbo3VnG/S31
 uIGqxIEaSH4aAHJser2DJiBJZ/+WRMPO59ccn1JA8wyq+rI+1HXlgadEgSndi/geL8
 jcFxWXuWgn6bcnO3MxbFM10FGfClt09QMcv9/WPDMXHQvVDkaht6MfvAendi8dea3b
 iQVRHh7kX1CWME38u+S+KdypK0ym3loxfKQQax6zISrSWdHQdLxamtZOa02HZZZV4Z
 rW2/iYPMCVI38hIfOX0WHyxXZdr97+v3ZdkOS1HkPCOpVhtBcEOlvnIyZJTwBgCFsv
 25yxmJIwwJEWQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Daniel Baluta <daniel.baluta@nxp.com>,
 Shengjiu Wang <shengjiu.wang@freescale.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Viorel Suman <viorel.suman@nxp.com>,
 patches@opensource.cirrus.com, "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
In-Reply-To: <20220208121727.4461-1-viorel.suman@oss.nxp.com>
References: <20220208121727.4461-1-viorel.suman@oss.nxp.com>
Subject: Re: [PATCH] ASoC: codec: wm8960: complete discharge on BIAS
 OFF->STANDBY
Message-Id: <164485055842.397940.7117468372476499848.b4-ty@kernel.org>
Date: Mon, 14 Feb 2022 14:55:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Tue, 8 Feb 2022 14:17:27 +0200, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> On BIAS STANDBY->OFF transition the current implementation sleeps
> 600ms on suspend in order to discharge the chip. The suspend is
> propagated from "snd_soc_suspend" call for all audio cards in a
> serial fashion, thus in case of boards like i.MX8DXL EVK which has
> 3 distinct WM8960 codecs the total cumulated sleep on suspend is 1.8
> seconds.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: codec: wm8960: complete discharge on BIAS OFF->STANDBY
      commit: 3c7a4c24bd0ac2dfeb4f3f9053a2207cad90c7dd

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
