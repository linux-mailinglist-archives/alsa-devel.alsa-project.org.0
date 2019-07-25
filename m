Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A874F31
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Jul 2019 15:23:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 548FC1AC1;
	Thu, 25 Jul 2019 15:22:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 548FC1AC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564060983;
	bh=t9dCqJe7AzRNow3QLVpLZe6wy65MzRh9BlavMiyAFTs=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=GSiA0m18K990p8fWnUdRVMweUrTGJY3EElNvlYUj61svlTo9XR2Ne/OlRCP/5kTGU
	 YnyDlhJz8GmNo5c7+wrqT5fWcgOXPIiz93VHq1E0Tv5846bBA223EDq7xcLGvIh80e
	 i5fHfmA1vCTl0nye4bZlIEAIkbAPTTYbwNaEDVAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25C08F804CC;
	Thu, 25 Jul 2019 15:19:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5D83CF8044A; Thu, 25 Jul 2019 15:19:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3F15EF8044A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 15:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3F15EF8044A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="m0Z2Zlrs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=1en8np9UEuX2viFSfkLl80pOt0ZhdyWeNp1+nM3UG3U=; b=m0Z2Zlrs47jw
 gDGBnVgTnVPn21KGZIm9Ff/nu5jgWhN6sA+4UoamcLTtN7lF0j26stXCwM7UveTu7LM4Bpmzst6rC
 hAja+kVFwAorS5Nw4oE0uM7spbYtwFI07zWwHH1UghoO58YBZ3mD0UHuJatcLWUL8Tfb6Nx+FCkZ3
 KU+Qc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hqdeZ-0002rZ-BX; Thu, 25 Jul 2019 13:19:27 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id B594E2742B5F; Thu, 25 Jul 2019 14:19:26 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20190725083423.7321-1-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Message-Id: <20190725131926.B594E2742B5F@ypsilon.sirena.org.uk>
Date: Thu, 25 Jul 2019 14:19:26 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com, jsarha@ti.com, misael.lopez@ti.com
Subject: [alsa-devel] Applied "ASoC: ti: davinci-mcasp: Fix clk PDIR
	handling for i2s master mode" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: ti: davinci-mcasp: Fix clk PDIR handling for i2s master mode

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 9fcf9139a2fd06b1ea1b11579371834cfa04bf4c Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Thu, 25 Jul 2019 11:34:23 +0300
Subject: [PATCH] ASoC: ti: davinci-mcasp: Fix clk PDIR handling for i2s master
 mode

When running McASP as master capture alone will not record any audio unless
a parallel playback stream is running. As soon as the playback stops the
captured data is going to be silent again.

In McASP master mode we need to set the PDIR for the clock pins and fix
the mcasp_set_axr_pdir() to skip the bits in the PDIR registers above
AMUTE.

This went unnoticed as most of the boards uses McASP as slave and neither
of these issues are visible (audible) in those setups.

Fixes: 2302be4126f52 ("ASoC: davinci-mcasp: Update PDIR (pin direction) register handling")
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190725083423.7321-1-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/davinci-mcasp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 2c518088b64d..4d611565375b 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -195,7 +195,7 @@ static inline void mcasp_set_axr_pdir(struct davinci_mcasp *mcasp, bool enable)
 {
 	u32 bit;
 
-	for_each_set_bit(bit, &mcasp->pdir, PIN_BIT_AFSR) {
+	for_each_set_bit(bit, &mcasp->pdir, PIN_BIT_AMUTE) {
 		if (enable)
 			mcasp_set_bits(mcasp, DAVINCI_MCASP_PDIR_REG, BIT(bit));
 		else
@@ -223,6 +223,7 @@ static void mcasp_start_rx(struct davinci_mcasp *mcasp)
 	if (mcasp_is_synchronous(mcasp)) {
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXHCLKRST);
 		mcasp_set_ctl_reg(mcasp, DAVINCI_MCASP_GBLCTLX_REG, TXCLKRST);
+		mcasp_set_clk_pdir(mcasp, true);
 	}
 
 	/* Activate serializer(s) */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
