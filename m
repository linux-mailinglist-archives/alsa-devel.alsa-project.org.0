Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FC52B1F98
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 17:08:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 271031881;
	Fri, 13 Nov 2020 17:07:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 271031881
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605283689;
	bh=xazOJCGu3dNwBPq2iap9k2AOyfFmgVfLpwqC2DoyDsU=;
	h=Date:From:To:In-Reply-To:References:Subject:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDDcSh8cJfl0z8RqnIpJ5iEzA51Az1+kwOoSX/3txt1JdtbsYRtq4qbGm0HHaO8iE
	 1ZvwsfXWzoZ23mRoyiMxYVS2lohpI0Fml7UM2WwrvMJ5T3729tXSG/tddyF5BBeSI7
	 hjemIOelwbzcUXn90jWC45pOxaWetJCH/7T2Dlz8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87068F8020C;
	Fri, 13 Nov 2020 17:06:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8B9CF801F5; Fri, 13 Nov 2020 17:06:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 21860F80086
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 17:06:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 21860F80086
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="MvCLxQ06"
Received: from localhost (fw-tnat.cambridge.arm.com [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0EEF2076E;
 Fri, 13 Nov 2020 16:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605283583;
 bh=xazOJCGu3dNwBPq2iap9k2AOyfFmgVfLpwqC2DoyDsU=;
 h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
 b=MvCLxQ069yYZ85Nt/ThLa1iNfIj/cyyXlEBCktyPPRHz4tezBKcRGWvb/+TahRrax
 r4h336YutEWArWO9rs5uQKNeH0wPf/uOZhq4W0MSic678nH9zF6HTe1LsW5uT/cRwl
 pDK+mGzRp1GhabJlOUABTWwibrTctsgDS6XXouBE=
Date: Fri, 13 Nov 2020 16:06:07 +0000
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, Oder Chiou <oder_chiou@realtek.com>
In-Reply-To: <20201113055400.11242-1-oder_chiou@realtek.com>
References: <20201113055400.11242-1-oder_chiou@realtek.com>
Subject: Re: [PATCH 1/2] ASoC: rt5682: Add a new property for the DMIC clock
 driving
Message-Id: <160528356700.2641.7979531877422138830.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, cychiang@google.com,
 albertchen@realtek.com, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Fri, 13 Nov 2020 13:53:59 +0800, Oder Chiou wrote:
> The patch adds a new property to set the DMIC clock driving.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: rt5682: Add a new property for the DMIC clock driving
      commit: 7416f6bc5fcb1fe6700391c94b59ac1c744ad9d1
[2/2] ASoC: rt5682: Add a new property to the device tree.
      commit: 33ee67b47ba09fc30840668c9ccec5ad18c94de0

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
