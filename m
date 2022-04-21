Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7050A8ED
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 21:20:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D85116BC;
	Thu, 21 Apr 2022 21:19:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D85116BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650568800;
	bh=HOdy8VUWf3kV6Iqxji46w9RRT+an7kD/+0PjvVrebC4=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H/i72HtGMyTs4fivEiyKDl8sBSYW05S7Nk82vVqTJ1urL6KWimycoeh+b9Fb6SZP6
	 5NZqbMUJlHDt1Db8qIuZ4ahU9C5aNjAzPyR0MGRkCk5nn+WYJjiVxWLdZY3etJGUY+
	 fh45g7oUbbh+ATP93uH4og8eel6WQp/pl5mOENu8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C918DF804DA;
	Thu, 21 Apr 2022 21:18:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE015F8032D; Thu, 21 Apr 2022 21:18:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 86160F800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 21:18:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86160F800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jgiChYOt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83B03B823F3;
 Thu, 21 Apr 2022 19:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEAAEC385A7;
 Thu, 21 Apr 2022 19:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650568698;
 bh=HOdy8VUWf3kV6Iqxji46w9RRT+an7kD/+0PjvVrebC4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=jgiChYOtfVG+bjOC1HbHAqw8uFBBlouq3zey0JPnHtMBGX77EGYggPfBdRx4ye+wB
 zAqaZI7cmPrEdaX1d9gwMM5oEk4K4vCTWHOJLj4SjyaitBPMuUNJ5XigQ08cYmzrD+
 WgWVFOsSUzGEv1UTqitLwEvy+8qQ4Akog/+lvRV1gDwpmX6ixAvbZ6Gk+O14CCqS/8
 4MfP/DoDYqLE3rCEZyDSN2+iNhfO7T7H6zeErp5WDY+yjDMEZIS+L6X0Z78Md1TJIJ
 97GJgz7YtYk5/Au9gt/dDybGqrD2OFQ2gxzyZULJg8ut4ZYkidolE/CnjN3Fn71pJl
 Ye2oJZmiR8+Mg==
From: Mark Brown <broonie@kernel.org>
To: narmstrong@baylibre.com, jbrunet@baylibre.com
In-Reply-To: <20220421155725.2589089-1-narmstrong@baylibre.com>
References: <20220421155725.2589089-1-narmstrong@baylibre.com>
Subject: Re: [PATCH 1/2] Revert "ASoC: meson: axg-tdm-interface: manage
 formatters in trigger"
Message-Id: <165056869649.409171.13055364117592401974.b4-ty@kernel.org>
Date: Thu, 21 Apr 2022 20:18:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-amlogic@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dimitrysh@google.com
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

On Thu, 21 Apr 2022 17:57:24 +0200, Neil Armstrong wrote:
> This reverts commit bf5e4887eeddb48480568466536aa08ec7f179a5 because
> the following and required commit e138233e56e9829e65b6293887063a1a3ccb2d68
> causes the following system crash when using audio:
>  BUG: sleeping function called from invalid context at kernel/locking/mutex.c:282
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] Revert "ASoC: meson: axg-tdm-interface: manage formatters in trigger"
      commit: c26830b6c5c534d273ce007eb33d5a2d2ad4e969
[2/2] Revert "ASoC: meson: axg-card: make links nonatomic"
      commit: 0c9b152c72e53016e96593bdbb8cffe2176694b9

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
