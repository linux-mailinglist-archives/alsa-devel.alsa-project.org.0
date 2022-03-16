Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7E4DB979
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Mar 2022 21:36:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C073E1760;
	Wed, 16 Mar 2022 21:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C073E1760
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647463016;
	bh=SOkQF0ILuP37EZNlvNmOX0oyg1+0AQ9CCiujV4VUCt8=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AiBfV5OWNIuwqHB7BAsye4eiXK69ogG9WyeTVe2jvNQLb7qu1UcH1HYJorz0zxjKL
	 4kkOxp5oI8Z6p7Hw4GW5BJIUra+35imDImHSzeBxwtSjG2GYutbj6ieprUBfvrSEwg
	 cP7+CnBbX7p82jB98QQJOpyKC/OeBcPKTzd/sbdo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D84DF80153;
	Wed, 16 Mar 2022 21:35:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8CFEFF8019D; Wed, 16 Mar 2022 21:35:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BED24F80095
 for <alsa-devel@alsa-project.org>; Wed, 16 Mar 2022 21:35:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BED24F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="iyBwLL+s"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 94714B81D41;
 Wed, 16 Mar 2022 20:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4EA0C340E9;
 Wed, 16 Mar 2022 20:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647462941;
 bh=SOkQF0ILuP37EZNlvNmOX0oyg1+0AQ9CCiujV4VUCt8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=iyBwLL+sX+L53H8jVl4uZVBJge/13srwWAdP5xURwsT8z2otCX9/yRX683EluwQJC
 BnFApqjfhlaLDHMZ1qM0C/NjNv04uBssbsdgFY6VXc9XYmALcEi4byMxC6v1mY3uYT
 xQmRh1oB72ekU1B0Qx2bA5niCPjyUJ0Q33esNJ7GdTqNJt5+PR/vQcaUrshrCsaRjA
 SWe01bWKlEy/ZQGBUrj3dOOTN6bLo56GZSN7P0fk/pvNGK1XW5hc5D+02L8kWm6LJ+
 zhtB7Tx7i8V+4BavvZugV5Q/HIHrS0OIEPrk++z+4TUXp3iFOaqv7PM9HbDX5F5l3u
 4Bg/42BLq+JCQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, perex@perex.cz, zhangqilong <zhangqilong3@huawei.com>,
 heiko@sntech.de, frattaroli.nicolas@gmail.com
In-Reply-To: <20220315025415.2593762-1-zhangqilong3@huawei.com>
References: <20220315025415.2593762-1-zhangqilong3@huawei.com>
Subject: Re: [PATCH -next] ASoC: rockchip: Fix PM usage reference of
 rockchip_i2s_tdm_resume
Message-Id: <164746293938.1220201.12303481539192609575.b4-ty@kernel.org>
Date: Wed, 16 Mar 2022 20:35:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

On Tue, 15 Mar 2022 10:54:15 +0800, zhangqilong wrote:
> pm_runtime_get_sync will increment pm usage counter
> even it failed. Forgetting to putting operation will
> result in reference leak here. We fix it by replacing
> it with pm_runtime_resume_and_get to keep usage counter
> balanced.
> 
> Fixes:081068fd64140 ("ASoC: rockchip: add support for i2s-tdm controller")
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: Fix PM usage reference of rockchip_i2s_tdm_resume
      commit: cc5d8ac95663a5813c696008bc524b794d471215

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
