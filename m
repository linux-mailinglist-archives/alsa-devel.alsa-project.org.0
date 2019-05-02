Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1D711183
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:33:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65308174E;
	Thu,  2 May 2019 04:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65308174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764402;
	bh=/QbGOEcCzWou96eSxGtiGixpG8t1oj/tGWYujxLp4so=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=WNz+VIB4Je1Apml/c+jkqhutB6+GAt4btr6XpFkgZ4wFw0NBCWS9LrexpMKBAArmX
	 JaKXjsGgDaHUyWNRXaUx7mEGEyUYEmiCaA8Kofr393L8kI8aw4oZbwX7Gt3LoofPYA
	 JJyaDp7QEfLB0DSBzR/BPWUlFI21nKB8XXCetjiI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 443B8F8978F;
	Thu,  2 May 2019 04:19:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B136F89756; Thu,  2 May 2019 04:19:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF21DF89734
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF21DF89734
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="uNqKX7SD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vr2VIXn3Zn8E9lStqhtVN3FmIgvkBlu7YokpK9YQ9y0=; b=uNqKX7SDj5yL
 D43C2f1vMCFiH3NZTL00y+o4cNYiscmYhPVccI/tPTB1vRBsxFoWlayQ/KEoABKBHAhKlkniYjN39
 6+c3b5DqT52irUctnw5gqLTQowFIlMDnfV/gXoHbRu0RaalMm6IWSj6dBETbnKJ4TCg02V/j/kArg
 Sn9mo=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1Iv-0005sC-5U; Thu, 02 May 2019 02:18:33 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 3FCBC441D3D; Thu,  2 May 2019 03:18:30 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Andra Danciu <andradanciu1997@gmail.com>
In-Reply-To: <20190414191450.18377-2-andradanciu1997@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190502021830.3FCBC441D3D@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:30 +0100 (BST)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, Daniel Baluta <daniel.baluta@nxp.com>,
 s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, daniel.baluta@gmail.com,
 lgirdwood@gmail.com, nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>,
 linux-imx@nxp.com, kernel@pengutronix.de, tiwai@suse.com, shawnguo@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, festevam@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] Applied "ASoC: mpc5200_dma: Fix invalid license ID" to
	the asoc tree
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

   ASoC: mpc5200_dma: Fix invalid license ID

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From ac097cac496f69e97083c6b128c5a209a85c6fcb Mon Sep 17 00:00:00 2001
From: Andra Danciu <andradanciu1997@gmail.com>
Date: Sun, 14 Apr 2019 22:14:49 +0300
Subject: [PATCH] ASoC: mpc5200_dma: Fix invalid license ID

As the file had no other license notice/reference, it falls under the
project license and therefore the proper SPDX id is: GPL-2.0-only

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Fixes: 1edfc2485d8dc ("ASoC: mpc5200_dma: Switch to SPDX identifier")
Reported-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Andra Danciu <andradanciu1997@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/mpc5200_dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 4396442c2fdd..ccf9301889fe 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -1,4 +1,4 @@
-// SPDX-License-Identifier: GPL
+// SPDX-License-Identifier: GPL-2.0-only
 //
 // Freescale MPC5200 PSC DMA
 // ALSA SoC Platform driver
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
