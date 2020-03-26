Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6940719470D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:06:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A2421672;
	Thu, 26 Mar 2020 20:05:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A2421672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249594;
	bh=PX1n56XeQ1mW18TorsGjR64P/xn5v2qjoVYp6XDQiVs=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=fQXV8n9FTWbjJMkZ1k/rnoLemrONjGK4K3dSJwmjXQKC6RYgmp6H3jZq+pdWcz/Vf
	 C1bi7lvDxnqbjEeM2HfSA/iz+HWcSy4sFqPQ9TXh4aIFGvZ7TLSwj8/xygcGsNyq4s
	 jpSbW2fyvBWO+XIjUMY4dumdUFlaTe1gdqmDprUs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27914F80249;
	Thu, 26 Mar 2020 20:04:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF2ECF80227; Thu, 26 Mar 2020 20:04:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 6FD4AF80095
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:04:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FD4AF80095
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 58D797FA;
 Thu, 26 Mar 2020 12:04:44 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFD9C3F71F;
 Thu, 26 Mar 2020 12:04:43 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:04:42 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: Applied "ASoC: pxa: Enable AC'97 bus support for PXA machines" to the
 asoc tree
In-Reply-To: <20200326180116.21375-1-broonie@kernel.org>
Message-Id: <applied-20200326180116.21375-1-broonie@kernel.org>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, KernelCI <bot@kernelci.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Daniel Mack <daniel@zonque.org>, Robert Jarzmik <robert.jarzmik@free.fr>,
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

The patch

   ASoC: pxa: Enable AC'97 bus support for PXA machines

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

From 27821f4ddedcaea0f16d03ee3432bddb729daba5 Mon Sep 17 00:00:00 2001
From: Mark Brown <broonie@kernel.org>
Date: Thu, 26 Mar 2020 18:01:16 +0000
Subject: [PATCH] ASoC: pxa: Enable AC'97 bus support for PXA machines

The AC'97 based PXA machines currently don't build reliably as they don't
ensure that an AC'97 bus is built, causing at least eseries_pxa_defconfig
to fail to build. Add selects to fix this.

Reported-by: KernelCI <bot@kernelci.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Link: https://lore.kernel.org/r/20200326180116.21375-1-broonie@kernel.org
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/pxa/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/pxa/Kconfig b/sound/soc/pxa/Kconfig
index 1f0c08b06c1d..d4c0f580a565 100644
--- a/sound/soc/pxa/Kconfig
+++ b/sound/soc/pxa/Kconfig
@@ -82,6 +82,8 @@ config SND_PXA2XX_SOC_TOSA
 	depends on MFD_TC6393XB
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -93,6 +95,8 @@ config SND_PXA2XX_SOC_E740
 	depends on SND_PXA2XX_SOC && MACH_E740
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_SOC_WM9705
 	select SND_PXA2XX_SOC_AC97
 	help
@@ -116,6 +120,8 @@ config SND_PXA2XX_SOC_E800
 	depends on AC97_BUS=n
 	select REGMAP
 	select SND_SOC_WM9712
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	help
 	  Say Y if you want to add support for SoC audio on the
@@ -127,6 +133,8 @@ config SND_PXA2XX_SOC_EM_X270
 			MACH_CM_X300)
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -139,6 +147,8 @@ config SND_PXA2XX_SOC_PALM27X
 			MACH_PALMT5 || MACH_PALMTE2)
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9712
 	help
@@ -169,6 +179,8 @@ config SND_SOC_ZYLONITE
 	tristate "SoC Audio support for Marvell Zylonite"
 	depends on SND_PXA2XX_SOC && MACH_ZYLONITE
 	depends on AC97_BUS=n
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select REGMAP
 	select SND_PXA_SOC_SSP
@@ -201,6 +213,8 @@ config SND_PXA2XX_SOC_MIOA701
 	depends on SND_PXA2XX_SOC && MACH_MIOA701
 	depends on AC97_BUS=n
 	select REGMAP
+	select AC97_BUS_NEW
+	select AC97_BUS_COMPAT
 	select SND_PXA2XX_SOC_AC97
 	select SND_SOC_WM9713
 	help
-- 
2.20.1

