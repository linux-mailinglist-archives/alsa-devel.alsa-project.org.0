Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A968E15942B
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 17:03:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5360B15E2;
	Tue, 11 Feb 2020 17:02:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5360B15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581436981;
	bh=teFda7AVou78AwNHw8H/WX7k21pleCJ9LLIOi5g/8Zc=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=gACAql88xCGWyh3xrpjkO1e/OOBwgxb9fot2CW4Jbxqpy7BCo8tFbL9qGPmj/NxYp
	 UZDb5fJDIXlgKg+Y8EnSMZp0UsYLiBTE3Fvb4MbSusfBj5aei2jXbUEyj8Fvvgy9tp
	 xn2a0o67iiNzspf+W7vNf6canQyEtnoUk8JvLFsM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D32F80363;
	Tue, 11 Feb 2020 16:49:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 83980F80348; Tue, 11 Feb 2020 16:49:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7CAA5F80342
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 16:49:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CAA5F80342
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D21ABFEC;
 Tue, 11 Feb 2020 07:49:12 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 570F53F68E;
 Tue, 11 Feb 2020 07:49:12 -0800 (PST)
Date: Tue, 11 Feb 2020 15:49:10 +0000
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
In-Reply-To: <20200210140950.11090-2-peter.ujfalusi@ti.com>
Message-Id: <applied-20200210140950.11090-2-peter.ujfalusi@ti.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 lgirdwood@gmail.com
Subject: [alsa-devel] Applied "ASoC: ti: Add udma-pcm platform driver for
	UDMA" to the asoc tree
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

   ASoC: ti: Add udma-pcm platform driver for UDMA

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7

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

From 2619e03703475b7e0a6f73f85e642859cd25dfc8 Mon Sep 17 00:00:00 2001
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
Date: Mon, 10 Feb 2020 16:09:49 +0200
Subject: [PATCH] ASoC: ti: Add udma-pcm platform driver for UDMA

Platform driver glue for platforms using UDMA (am654 and j721e).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20200210140950.11090-2-peter.ujfalusi@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/ti/Kconfig    |  4 ++++
 sound/soc/ti/Makefile   |  2 ++
 sound/soc/ti/udma-pcm.c | 43 +++++++++++++++++++++++++++++++++++++++++
 sound/soc/ti/udma-pcm.h | 18 +++++++++++++++++
 4 files changed, 67 insertions(+)
 create mode 100644 sound/soc/ti/udma-pcm.c
 create mode 100644 sound/soc/ti/udma-pcm.h

diff --git a/sound/soc/ti/Kconfig b/sound/soc/ti/Kconfig
index 29f61053ab62..bf85a160a523 100644
--- a/sound/soc/ti/Kconfig
+++ b/sound/soc/ti/Kconfig
@@ -10,6 +10,10 @@ config SND_SOC_TI_SDMA_PCM
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 
+config SND_SOC_TI_UDMA_PCM
+	tristate
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+
 comment "Texas Instruments DAI support for:"
 config SND_SOC_DAVINCI_ASP
 	tristate "daVinci Audio Serial Port (ASP) or McBSP support"
diff --git a/sound/soc/ti/Makefile b/sound/soc/ti/Makefile
index 08c44d56ef3e..ea48c6679cc7 100644
--- a/sound/soc/ti/Makefile
+++ b/sound/soc/ti/Makefile
@@ -3,9 +3,11 @@
 # Platform drivers
 snd-soc-ti-edma-objs := edma-pcm.o
 snd-soc-ti-sdma-objs := sdma-pcm.o
+snd-soc-ti-udma-objs := udma-pcm.o
 
 obj-$(CONFIG_SND_SOC_TI_EDMA_PCM) += snd-soc-ti-edma.o
 obj-$(CONFIG_SND_SOC_TI_SDMA_PCM) += snd-soc-ti-sdma.o
+obj-$(CONFIG_SND_SOC_TI_UDMA_PCM) += snd-soc-ti-udma.o
 
 # CPU DAI drivers
 snd-soc-davinci-asp-objs := davinci-i2s.o
diff --git a/sound/soc/ti/udma-pcm.c b/sound/soc/ti/udma-pcm.c
new file mode 100644
index 000000000000..39830caaaf7c
--- /dev/null
+++ b/sound/soc/ti/udma-pcm.c
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2020 Texas Instruments Incorporated - http://www.ti.com
+ *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+ */
+
+#include <linux/module.h>
+#include <sound/core.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/dmaengine_pcm.h>
+
+#include "udma-pcm.h"
+
+static const struct snd_pcm_hardware udma_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				  SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
+				  SNDRV_PCM_INFO_INTERLEAVED,
+	.buffer_bytes_max	= SIZE_MAX,
+	.period_bytes_min	= 32,
+	.period_bytes_max	= SZ_64K,
+	.periods_min		= 2,
+	.periods_max		= UINT_MAX,
+};
+
+static const struct snd_dmaengine_pcm_config udma_dmaengine_pcm_config = {
+	.pcm_hardware = &udma_pcm_hardware,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+};
+
+int udma_pcm_platform_register(struct device *dev)
+{
+	return devm_snd_dmaengine_pcm_register(dev, &udma_dmaengine_pcm_config,
+					       0);
+}
+EXPORT_SYMBOL_GPL(udma_pcm_platform_register);
+
+MODULE_AUTHOR("Peter Ujfalusi <peter.ujfalusi@ti.com>");
+MODULE_DESCRIPTION("UDMA PCM ASoC platform driver");
+MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/ti/udma-pcm.h b/sound/soc/ti/udma-pcm.h
new file mode 100644
index 000000000000..54111e7312c1
--- /dev/null
+++ b/sound/soc/ti/udma-pcm.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ *  Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com
+ */
+
+#ifndef __UDMA_PCM_H__
+#define __UDMA_PCM_H__
+
+#if IS_ENABLED(CONFIG_SND_SOC_TI_UDMA_PCM)
+int udma_pcm_platform_register(struct device *dev);
+#else
+static inline int udma_pcm_platform_register(struct device *dev)
+{
+	return 0;
+}
+#endif /* CONFIG_SND_SOC_TI_UDMA_PCM */
+
+#endif /* __UDMA_PCM_H__ */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
