Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A77DF514AC5
	for <lists+alsa-devel@lfdr.de>; Fri, 29 Apr 2022 15:40:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D33215C3;
	Fri, 29 Apr 2022 15:39:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D33215C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651239636;
	bh=oTA/bLA09vyo7gZftSiBJgvnmnzNeALY3BscTIa+ohw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UNfS+N1s3XiW0YQkmimLew1vsj8QGt6pMnQk8zU6C3nAtgXU1Qi+sR5XuD7Sv/BBY
	 ef90r9zY4sNp2aAuCmo4EG2ZM29mbTbVgcmfEChn9POuxX3y8nMUGDXQ58388z8Ya7
	 +ksRi44uFJDuq7l4RMfVME20jaoIIsuz/JXzyV94=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76F39F804A9;
	Fri, 29 Apr 2022 15:39:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A3276F80237; Fri, 29 Apr 2022 15:39:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 607CCF80237
 for <alsa-devel@alsa-project.org>; Fri, 29 Apr 2022 15:39:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 607CCF80237
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="g2iWwYLh"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6EE22622E0;
 Fri, 29 Apr 2022 13:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45615C385B0;
 Fri, 29 Apr 2022 13:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651239567;
 bh=oTA/bLA09vyo7gZftSiBJgvnmnzNeALY3BscTIa+ohw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=g2iWwYLhZMqK/AT1qsnItdAbEkyJvxxyoA3K1GYJrA+o76kDlvN915Ls+oqDkF2wY
 +KgnKeJ19klqffLx7drnPNtUY2WqKbuwB4pK2wVy/r6R7dRbai8ZiOvEfxHm4tN5Rk
 Oem4Myu40JQW8wpp4vxU0/dH1bRvwPpRu+rWXj2k73S32TqGYx5ym21swq9VIV9O7X
 7RdRDvp6BreO7NYw2BVovviIQdCwbOkuXqHqtZMkM7FlXNr47pKiTFBKyWAjwEA9Rw
 rFsLLEI3hAx5QtZh/vioFxmvYOjKIoELdAUymfRr1RcCFAopZVJMm5fd2zXfWP5h1e
 yXEbTShKn7FiA==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, katsuhiro@katsuster.net, frattaroli.nicolas@gmail.com,
 perex@perex.cz, tiwai@suse.com
In-Reply-To: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
References: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH] ASoC: rk3328: fix disabling mclk on pclk probe failure
Message-Id: <165123956599.69278.1250997560637769759.b4-ty@kernel.org>
Date: Fri, 29 Apr 2022 14:39:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: linux-rockchip@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

On Wed, 27 Apr 2022 19:23:11 +0200, Nicolas Frattaroli wrote:
> If preparing/enabling the pclk fails, the probe function should
> unprepare and disable the previously prepared and enabled mclk,
> which it doesn't do. This commit rectifies this.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rk3328: fix disabling mclk on pclk probe failure
      commit: dd508e324cdde1c06ace08a8143fa50333a90703

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
