Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6271118D
	for <lists+alsa-devel@lfdr.de>; Thu,  2 May 2019 04:35:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2618174E;
	Thu,  2 May 2019 04:34:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2618174E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556764530;
	bh=EKuWA2kh3l2X2rUs8FETIVCo36MRV+t9WZCJPfL/BFk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gcv65d5SiEDEQ4pzGkB59+KJIr+dvoKq0asVUHNDctVeZYcWnxhndpntd1mXviRKW
	 AJYoAhs+aPM5JFZft0v7CeKcnhuYKNtWVKFyscJp72E2EDr3N1UmIxMPtrqpTmUkXP
	 WO2BviUxXJxrBdsm4dzCiEOatbN28NTg7FQZ+AZg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6461EF897A4;
	Thu,  2 May 2019 04:19:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD26DF8975C; Thu,  2 May 2019 04:19:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0C2D5F8973A
 for <alsa-devel@alsa-project.org>; Thu,  2 May 2019 04:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0C2D5F8973A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="R4ctCByo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=r3CyppHMBbbvBau7Gtud8BstrQ70gDTeNXRpDTmvaMk=; b=R4ctCByoicg3
 nB+OqNmdXltXegvsA4azXvfJ2+4EQajUsBHMo+uIGLZt1jrmUb6AvB7Legheyc5675NmEfTs0aApG
 EQuEpltuCZVb9ynZddLGvq5Q7fV4OrftOk/3SvbYiS3U+L4RGGSwaRjtyyi7agYLv9GZeSo+bIUsj
 bCbkk=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hM1J1-0005sk-PO; Thu, 02 May 2019 02:18:40 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id A4527441D3C; Thu,  2 May 2019 03:18:36 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
In-Reply-To: <20190416131242.1232143-1-arnd@arndb.de>
X-Patchwork-Hint: ignore
Message-Id: <20190502021836.A4527441D3C@finisterre.ee.mobilebroadband>
Date: Thu,  2 May 2019 03:18:36 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Cosmin Samoila <cosmin.samoila@nxp.com>, Fabio Estevam <festevam@gmail.com>
Subject: [alsa-devel] Applied "ASoC: imx: fix fiq dependencies" to the asoc
	tree
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

   ASoC: imx: fix fiq dependencies

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

From ea751227c813ab833609afecfeedaf0aa26f327e Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 16 Apr 2019 15:12:23 +0200
Subject: [PATCH] ASoC: imx: fix fiq dependencies

During randconfig builds, I occasionally run into an invalid configuration
of the freescale FIQ sound support:

WARNING: unmet direct dependencies detected for SND_SOC_IMX_PCM_FIQ
  Depends on [m]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=m]
  Selected by [y]:
  - SND_SOC_FSL_SPDIF [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_IMX_SOC [=m]!=n && (MXC_TZIC [=n] || MXC_AVIC [=y])

sound/soc/fsl/imx-ssi.o: In function `imx_ssi_remove':
imx-ssi.c:(.text+0x28): undefined reference to `imx_pcm_fiq_exit'
sound/soc/fsl/imx-ssi.o: In function `imx_ssi_probe':
imx-ssi.c:(.text+0xa64): undefined reference to `imx_pcm_fiq_init'

The Kconfig warning is a result of the symbol being defined inside of
the "if SND_IMX_SOC" block, and is otherwise harmless. The link error
is more tricky and happens with SND_SOC_IMX_SSI=y, which may or may not
imply FIQ support. However, if SND_SOC_FSL_SSI is set to =m at the same
time, that selects SND_SOC_IMX_PCM_FIQ as a loadable module dependency,
which then causes a link failure from imx-ssi.

The solution here is to make SND_SOC_IMX_PCM_FIQ built-in whenever
one of its potential users is built-in.

Fixes: ff40260f79dc ("ASoC: fsl: refine DMA/FIQ dependencies")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index d87c842806bd..55ed47c599e2 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -189,16 +189,17 @@ config SND_MPC52xx_SOC_EFIKA
 
 endif # SND_POWERPC_SOC
 
+config SND_SOC_IMX_PCM_FIQ
+	tristate
+	default y if SND_SOC_IMX_SSI=y && (SND_SOC_FSL_SSI=m || SND_SOC_FSL_SPDIF=m) && (MXC_TZIC || MXC_AVIC)
+	select FIQ
+
 if SND_IMX_SOC
 
 config SND_SOC_IMX_SSI
 	tristate
 	select SND_SOC_FSL_UTILS
 
-config SND_SOC_IMX_PCM_FIQ
-	tristate
-	select FIQ
-
 comment "SoC Audio support for Freescale i.MX boards:"
 
 config SND_MXC_SOC_WM1133_EV1
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
