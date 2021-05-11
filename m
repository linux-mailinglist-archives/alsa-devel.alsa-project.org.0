Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F17037A22E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 May 2021 10:33:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2D6C177E;
	Tue, 11 May 2021 10:32:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2D6C177E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620722000;
	bh=BK/eR3DMt5sJhPvChlL7VaAZjoGBISoyWz7S+2nPcuU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tSFL3Oi96RyOCzdxxvIeIdw70GsRnWiZLjy3XlgLXDAdWB5KJ6iLNlmJICwdZcQDp
	 vyScivdeQYAn+bdrMIyzZbk5Zw3yQopIoh7LLR+RNnfSBAZP7PTeiVaIeJG0UrCj4p
	 NFBE4zQSdffnhY8C7aavxTMnXUuXmOrGuAt3s/YQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 448CEF804F1;
	Tue, 11 May 2021 10:28:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C38F6F804D1; Tue, 11 May 2021 10:28:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5B4DCF804D8
 for <alsa-devel@alsa-project.org>; Tue, 11 May 2021 10:28:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B4DCF804D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ifkXq+LG"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1EACA61184;
 Tue, 11 May 2021 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620721679;
 bh=BK/eR3DMt5sJhPvChlL7VaAZjoGBISoyWz7S+2nPcuU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ifkXq+LGLV87NVybNWJDIyPk64lCKe8k+YdFFnMILVVqUUrKVJQnsMqyu66x3yUOk
 WTGXnrxIHuzaP4a18ybKzPg/vd9sCPI9AWfrSNzqmJWQ2VpjwiymD1Fml4eJ6PI1jT
 tIrUm6k+y0gZLE/27XGib4UG4XuuOuCd2Z9RgUhszz+yNdHkgYQ5r7gEd0Cx+raLyV
 S1/kDGvdJz4lGtdnPm7OZQxMw/YeTbzXrOrvqoj/yMEGzbVsokoMhb4XIb3jNp5orf
 b/bIf5CK20TQW4KYeDubrwZVX66DE7P8E/rCzwcMLFrZJShFmDxFxnFa54luiw/IQ0
 tupgmOW3cBPQg==
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [PATCH 1/2] ASoC: rt5682: Disable irq on shutdown
Date: Tue, 11 May 2021 09:25:55 +0100
Message-Id: <162072058170.33157.8040502886621667235.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508075151.1626903-1-swboyd@chromium.org>
References: <20210508075151.1626903-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Jairaj Arava <jairaj.arava@intel.com>,
 linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Shuming Fan <shumingf@realtek.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@intel.com>
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

On Sat, 8 May 2021 00:51:50 -0700, Stephen Boyd wrote:
> We cancel the work queues, and reset the device on shutdown, but the irq
> isn't disabled so the work queues could be queued again. Let's disable
> the irq during shutdown so that we don't have to worry about this device
> trying to do anything anymore. This fixes a problem seen where the i2c
> bus is shutdown at reboot but this device irq still comes in and tries
> to make another i2c transaction when the bus doesn't work.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5682: Disable irq on shutdown
      commit: 47bcb1c7108363418cd578283333d72e310dfeaa
[2/2] ASoC: rt5682: Implement remove callback
      commit: 87b42abae99d3d851aec64cd4d0f7def8113950e

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
