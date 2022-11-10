Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 70D79624C0F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Nov 2022 21:39:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0EAC11663;
	Thu, 10 Nov 2022 21:39:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0EAC11663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668112799;
	bh=LqQpNnC8EIb8uvwzTz8/j3iKA35fIXtLnObuNjhhYoM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CSvxP7P8ciImZe77Agcus9dufcj3UivZORIvU+1Yqj8wmhK0WSavsUj7Zo8TcC7Qh
	 o+MuvL3+dcDuGWg8gAsGWz7AR8Dsa4WLKoxEiV8k4gOsIxXOiZ63DllV6Pok7QokS0
	 x9dWNapbsjv0rCyArceJbSFSUiKSZ19EiFXegsdM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8EF35F80163;
	Thu, 10 Nov 2022 21:39:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3A8D4F8021D; Thu, 10 Nov 2022 21:39:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5A35BF80114
 for <alsa-devel@alsa-project.org>; Thu, 10 Nov 2022 21:38:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A35BF80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mctM7IX5"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D82ED61E14;
 Thu, 10 Nov 2022 20:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAF5C43470;
 Thu, 10 Nov 2022 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668112736;
 bh=LqQpNnC8EIb8uvwzTz8/j3iKA35fIXtLnObuNjhhYoM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=mctM7IX5Sbi/HpL+27A/Y6GoN5p0NYZ4hdRPQhCIw/T3UflewcUIy709l30+PgPvm
 QQlTdr2HvicKiJreKHZLiQVu6Y8hEn20oT8EuoG8PHgxk4Txf4Lm92v2WZm4K14/bH
 CRKy8s3W9mlCrNgUsUN8L+HD1axcZnfS7XI2NFsT5FoHOy85RfwhK5yGHMqtNYNBQa
 wiVc7NRNMxMsF8QeM/UzGUAPvhYeZ2mAYvRom4YeixPUbWiodGIyxxYJ69cos5QA+G
 3RLF1iZsunqZCVxMTCXehGiUZVugND5nlRtUSeDcjCCGeHu1xqQByqNTxdbqKTsUkS
 KGjHw342rorgg==
From: Mark Brown <broonie@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
In-Reply-To: <20221110190612.1341469-1-detlev.casanova@collabora.com>
References: <20221110190612.1341469-1-detlev.casanova@collabora.com>
Subject: Re: [PATCH] ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
Message-Id: <166811273486.1046320.8327753211481113364.b4-ty@kernel.org>
Date: Thu, 10 Nov 2022 20:38:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
Cc: "moderated list:NXP SGTL5000 DRIVER" <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Fabio Estevam <festevam@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
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

On Thu, 10 Nov 2022 14:06:12 -0500, Detlev Casanova wrote:
> Since commit bf2aebccddef ("ASoC: sgtl5000: Fix noise on shutdown/remove"),
> the device power control registers are reset when the driver is
> removed/shutdown.
> 
> This is an issue when the device is configured to use the PLL clock. The
> device will stop responding if it is still configured to use the PLL
> clock but the PLL clock is powered down.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: sgtl5000: Reset the CHIP_CLK_CTRL reg on remove
      commit: 0bb8e9b36b5b7f2e77892981ff6c27ee831d8026

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
