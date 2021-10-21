Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DF0436345
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 15:44:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B84EF1673;
	Thu, 21 Oct 2021 15:43:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B84EF1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634823880;
	bh=M4F6Y2fqa1ub/BkynSNuVBd769HCJAtvmYbRbnkScfs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qgLpzVN66U+UkXZMmtyLdgwF34Gz+usrjbk9Ym1dQPLdoQVdt+0mW42YZ3gau/4ca
	 vVlgmBxqiwhmruMmgOTUF5rCS1mlUPZFdyO3qluuaMSviHLwHk9WpVsh8oaCnGW5lT
	 0/L1Yl1o8+TG5f6mklvguPaUCX8Jvl9RWev2/SE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F23B2F80246;
	Thu, 21 Oct 2021 15:43:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B053F80240; Thu, 21 Oct 2021 15:43:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 191CDF80155
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 15:43:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 191CDF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="i/19NMdZ"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8B3D96112D;
 Thu, 21 Oct 2021 13:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634823783;
 bh=M4F6Y2fqa1ub/BkynSNuVBd769HCJAtvmYbRbnkScfs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i/19NMdZz/wsZwLgxnIDyM7mqX3zHWSn/Ah1Dff7zME8n0ZiyyAKEeLREFSIogMBk
 M/z9g7jN81wDuYuPWUU9kDpQR/AFIDKKU9/Ro0SYqxY1EOs1/PjwuR7FVEZjbvFqSA
 MVxxo2Umg2YuVlpi5AUt1zsTT46zFNhFx8/fzveT28ZzU6GmG4ItxN8rqFSeMsiaSg
 nRO+Tjf8+Ev2DZDSvXZKMVT3xArcid4+f0M2QLCcD/1AC2IQ/Gs9f92irKkavSj3SB
 8hH+BLkxYihs8bZPYvHu+BoABwofxabldFXjS1cfkF0JZRirUoqRuA7Hm9P1vjP8Kr
 454YRBABYg7Pw==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de,
	Sugar Zhang <sugar.zhang@rock-chips.com>
Subject: Re: [PATCH] Revert "ASoC: rockchip: add config for rockchip dmaengine
 pcm register"
Date: Thu, 21 Oct 2021 14:42:58 +0100
Message-Id: <163482376624.1547375.15550615168301470105.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <1632792957-80428-1-git-send-email-sugar.zhang@rock-chips.com>
References: <1632792957-80428-1-git-send-email-sugar.zhang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 linux-rockchip@lists.infradead.org, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

On Tue, 28 Sep 2021 09:35:57 +0800, Sugar Zhang wrote:
> This reverts commit 75b31192fe6ad20b42276b20ee3bdf1493216d63.
> 
> The original purpose of customized pcm was to config prealloc buffer size
> flexibly. but, we can do the same thing by soc-generic-dmaengine-pcm.
> 
> And the generic one can generated the better config by querying DMA
> capabilities from dmaengine driver rather than the Hard-Coded one.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] Revert "ASoC: rockchip: add config for rockchip dmaengine pcm register"
      commit: 5ba8ecf2272d34de9cd2271a0ac12f5f615ef7aa

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
