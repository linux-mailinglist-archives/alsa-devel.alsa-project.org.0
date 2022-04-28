Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5148C513A4D
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Apr 2022 18:48:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F091815E2;
	Thu, 28 Apr 2022 18:47:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F091815E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651164515;
	bh=oTA/bLA09vyo7gZftSiBJgvnmnzNeALY3BscTIa+ohw=;
	h=From:To:In-Reply-To:References:Subject:Date:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rz/sQPLbp4qylyVkKk1GCEpVrIQYNhtUaF/Alyfumc5Q5tHG1AtZH2s0v9ZbGDnxs
	 qBok7MwajgL63EY5s4bcDoGGWL3bnQkyqvTsyuoTGVc3Rnd/JFBOvGe57GEpelI8pN
	 TaNjnSKb1/8Q1lGlPClfpQu9JiOLL2pLPa8yPFY4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0252F80510;
	Thu, 28 Apr 2022 18:47:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CBD71F804BD; Thu, 28 Apr 2022 18:47:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E441FF804BD
 for <alsa-devel@alsa-project.org>; Thu, 28 Apr 2022 18:47:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E441FF804BD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="kzImxQxt"
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1CAB862026;
 Thu, 28 Apr 2022 16:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEBEC385A9;
 Thu, 28 Apr 2022 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651164419;
 bh=oTA/bLA09vyo7gZftSiBJgvnmnzNeALY3BscTIa+ohw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=kzImxQxtKo2A4VfSdtTB5B2HQF5eIMKRAuAelphHIW4NYWeafoGPqJYbmVl9JqVpy
 LgaRdgvPg1QheX0laSoq8QZ1n7U8Lx0MFBbg7PYGCD7p6jNbdomCIe+IXMvdZ01OED
 Ur91+jW4qSgd+LcePzEbAM1P+dDi1sFEs6KLezxeLPhA510mcHWGhAU4GdPUb3buIW
 3s92pSDZeJROYgFMNPaX9yZScLT1AiaFOgn5df3hkOLwTKNu0OvAfzj611FACxzm//
 HpN6pdKOi+0VdBLxjyKVm5u18uVvyvrwGy6jZssFuLPUv6cAHmTAPeOYD0joBjou5E
 TCTy2g7WB/yvw==
From: Mark Brown <broonie@kernel.org>
To: perex@perex.cz, frattaroli.nicolas@gmail.com, lgirdwood@gmail.com,
 tiwai@suse.com, katsuhiro@katsuster.net
In-Reply-To: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
References: <20220427172310.138638-1-frattaroli.nicolas@gmail.com>
Subject: Re: [PATCH] ASoC: rk3328: fix disabling mclk on pclk probe failure
Message-Id: <165116441767.4067540.16396705501182849019.b4-ty@kernel.org>
Date: Thu, 28 Apr 2022 17:46:57 +0100
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
