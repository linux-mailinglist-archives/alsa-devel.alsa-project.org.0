Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 262BB3FE245
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Sep 2021 20:17:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62C2A16FF;
	Wed,  1 Sep 2021 20:16:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62C2A16FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630520232;
	bh=SLkHUaFmZYSRvVymSMsqlnBse9OBxXfESd4/wbzi5iY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SP8Ip7ls1ILXNKZpPfqldtxFZ5hFQz00mbq8j3wj6csAfcYHbE1D2234ogza7unPw
	 XzYz+vsPL9Fav1wzHcBB7zQQKrlwsNt5qRSWsT6XN6g4uTzH9417PhAlrPubLjVpTI
	 3qC2C0+UV3VCFjqCyX1VYGCMHCK0BPIfGI+hccao=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 40BE8F804D6;
	Wed,  1 Sep 2021 20:15:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1FB2F80254; Wed,  1 Sep 2021 20:15:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69564F80171
 for <alsa-devel@alsa-project.org>; Wed,  1 Sep 2021 20:15:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69564F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="R2EjjjxM"
Received: by mail.kernel.org (Postfix) with ESMTPSA id B48B5610E6;
 Wed,  1 Sep 2021 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520125;
 bh=SLkHUaFmZYSRvVymSMsqlnBse9OBxXfESd4/wbzi5iY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R2EjjjxMxvPAvYhygtAMSkK/FfvwiA5wB4CsLesD6hTUBiEDIMoXefWv0cm4n2vj6
 83fj1v4yRJu2tDuhZPjtI5bOaCYBPJ8bmfXCAmKL7v2XpiZoiYnzjsS6co7xygAHcb
 mJc/dRTQkTQ48/2a/v1hSMU3DZ5SYuwAcJMHY05vwRV9Uoeus4KIMwwx1EeGu00dNb
 4YI8EHBpJwTk90Rle5Rc/1u5eo3iWg93vGFztS57KiLo6nX3tfHp+kyY4AQ481Z094
 VrlEB+0FxLNOE3X4KH5Y+pogtFBr9IZ2K9cSxmzyGsRsjf84XQhXSlyaX+gFfGWEY6
 NSSEsRDgmZM5g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 should depend on
 ARCH_MEDIATEK
Date: Wed,  1 Sep 2021 19:14:43 +0100
Message-Id: <163051912509.21630.17446670283577790838.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
References: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
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

On Tue, 31 Aug 2021 15:18:54 +0200, Geert Uytterhoeven wrote:
> The Mediatek MT8195 sound hardware is only present on Mediatek MT8195
> SoCs.  Hence add a dependency on ARCH_MEDIATEK, to prevent asking the
> user about this driver when configuring a kernel without Mediatek SoC
> support.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK
      commit: 940ffa19454704ca2ecd23b0d8dd604c93421bfa

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
