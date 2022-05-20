Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E638252EAA8
	for <lists+alsa-devel@lfdr.de>; Fri, 20 May 2022 13:21:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 813CE1756;
	Fri, 20 May 2022 13:21:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 813CE1756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653045717;
	bh=hm92cqByreXas/bEgQfVySkccwSgtlqkEkhn8E2dpuM=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SCeGzSi0QMXG+jSxofoJ3Yn9BKVcAm+dR9s0adRW4biF2ki1Oxg4vxUtNisnxMNgQ
	 zeijLyiAKYEKNcAFg97hikDHtMHeV1M5OcMWZkTe0uxrdUg2EIXPAxSI481rKBOKSn
	 89AJrqEYC0zze/tjzYNTZ0k17/LiAjB4fjMJWNuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C1B1F8053E;
	Fri, 20 May 2022 13:19:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 49C56F8053D; Fri, 20 May 2022 13:19:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C9E6F80533
 for <alsa-devel@alsa-project.org>; Fri, 20 May 2022 13:18:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C9E6F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ZmBUhPxg"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A8A3E61DB3;
 Fri, 20 May 2022 11:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2804EC385A9;
 Fri, 20 May 2022 11:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045532;
 bh=hm92cqByreXas/bEgQfVySkccwSgtlqkEkhn8E2dpuM=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=ZmBUhPxgtXVt+6ijlPIB99zHWNb0nh7K1KxOfUBgRbh97A0FhYDvhf+e43+2GiHf8
 nHI4l/eaA2ZysNMKUIYndvy7w+9PPKRg/dMnBywjdq6FSzcfLsbOy4Vns6UZqX5F2f
 cvSOmfanHnjS69MMP/PojwUIgNqd2pv566t6WKUivZJWhl+FgsfwyAjt0lV0meiNdX
 FmSwK/gxjFbfZtctPC1AXDqIn0am6gCbHhsph9gl5jvgRXKn0EZeRJFmRiLIIZy78d
 qyF6MOa0K/YPtiGTr8uWdmoph3wTvCloGK+7c4qe8tNIoroVeOBz+I75WG2+f2Luov
 j4/JCu6zcVQLQ==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, u0084500@gmail.com, perex@perex.cz
In-Reply-To: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
References: <1652926418-8519-1-git-send-email-u0084500@gmail.com>
Subject: Re: [PATCH 0/2] ASoC: rt9120: Fix 3byte read logic and optimize
 'PWDN' control
Message-Id: <165304552987.45439.3493847954121004579.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 ritchie_hsieh@richtek.com, linux-kernel@vger.kernel.org, lgirdwood@gmail.com,
 cy_huang@richtek.com, allen_lin@richtek.com
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

On Thu, 19 May 2022 10:13:36 +0800, cy_huang wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Hi,
> 
> This patch series try to fix two things.
> - 3byte read logic bug
> - Use regcache and pm_runtime to optimize 'PWDN' control
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt9120: Fix 3byte read, valule offset typo
      commit: 57f68f2168988e574133fb5abcd73949bf1d1df2
[2/2] ASoC: rt9120: Use pm_runtime and regcache to optimize 'pwdnn' logic
      commit: 80b949f332e331b67c3ae4f323daf2cb91e743e5

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
