Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F291FF9B2
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jun 2020 18:50:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C5EC617A4;
	Thu, 18 Jun 2020 18:49:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C5EC617A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592499023;
	bh=/WNekgZirWYXrCP4XgGxyiKDiwg2gM4IDVcjUWu8fBs=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sVCsyaZgQhD6oP21qN3reGV/8au9PmojOzFU/tVUkpyHABc7BeikZEgBfJ8rEvpro
	 lTHTKK+cOtOO4mqQCHC/gOUXTXZlU+G7CQhzDT72Do0anRMx4hfVLn/u50s4kDyfi0
	 8XeGG1TRBsT4zA1eHyXMNBWMJtDjYhr/GtwdeZv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ABA65F80162;
	Thu, 18 Jun 2020 18:48:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0371EF80116; Thu, 18 Jun 2020 18:48:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0E7E4F800EF
 for <alsa-devel@alsa-project.org>; Thu, 18 Jun 2020 18:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0E7E4F800EF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="JHBJc52q"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D5E4D208C7;
 Thu, 18 Jun 2020 16:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592498912;
 bh=/WNekgZirWYXrCP4XgGxyiKDiwg2gM4IDVcjUWu8fBs=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=JHBJc52qgg06U8TRJ0jR/I4mprYbbU4MTjDm7kuraFaXPRRQJgsb3yOg/rwPzFupq
 x4yqSvAoIMEs1KHyFHA4Pdlg7VTPlr4AR1ptsxOB0r3oInSdR1ezG4Pz3Itth8Xui6
 orfh/1y1Cqq3v+HjZEZtT0LDV787jsds9KKxNxMI=
Date: Thu, 18 Jun 2020 17:48:30 +0100
From: Mark Brown <broonie@kernel.org>
To: kjlu@umn.edu, "wu000273@umn.edu" <wu000273@umn.edu>
In-Reply-To: <20200613205158.27296-1-wu000273@umn.edu>
References: <20200613205158.27296-1-wu000273@umn.edu>
Subject: Re: [PATCH] ASoC: rockchip: Fix a reference count leak.
Message-Id: <159249891020.8643.15196266849523031585.b4-ty@kernel.org>
Cc: alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Sugar Zhang <sugar.zhang@rock-chips.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
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

On Sat, 13 Jun 2020 15:51:58 -0500, wu000273@umn.edu wrote:
> Calling pm_runtime_get_sync increments the counter even in case of
> failure, causing incorrect ref count if pm_runtime_put is not called in
> error handling paths. Call pm_runtime_put if pm_runtime_get_sync fails.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: rockchip: Fix a reference count leak.
      commit: f141a422159a199f4c8dedb7e0df55b3b2cf16cd

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
