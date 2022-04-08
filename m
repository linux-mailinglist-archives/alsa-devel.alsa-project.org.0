Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C32C4F9434
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Apr 2022 13:35:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C86A1ACC;
	Fri,  8 Apr 2022 13:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C86A1ACC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649417747;
	bh=klc6jPY4mRAoZhCKOf+YB55IThXF65srhX8iSPwKjgE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BDx28T/q2uwTk6IQhxh2USnFxz/LCNWOpwupPbT4pfBQnLupgmrMaae3uPVNA8KVa
	 ovKqHfWwYyv9CHpdyLe92mOtqrBh+S3jFZjCtHF/2NdfFmj5QI7NSFUbtybJlJ6Dgo
	 9nNJzWu7x/ZFvxLIDY3C+wmlEZBjMM3lZoGIHPAY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C893F805B5;
	Fri,  8 Apr 2022 13:30:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9B8D4F8055A; Fri,  8 Apr 2022 13:30:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCE1FF80518
 for <alsa-devel@alsa-project.org>; Fri,  8 Apr 2022 13:29:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCE1FF80518
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo7-0004vI-EY; Fri, 08 Apr 2022 13:29:39 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo7-001n6c-TB; Fri, 08 Apr 2022 13:29:38 +0200
Received: from sha by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <sha@pengutronix.de>)
 id 1ncmo2-005ZB6-U8; Fri, 08 Apr 2022 13:29:34 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v5 09/21] dmaengine: imx: Move header to include/dma/
Date: Fri,  8 Apr 2022 13:29:16 +0200
Message-Id: <20220408112928.1326755-10-s.hauer@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408112928.1326755-1-s.hauer@pengutronix.de>
References: <20220408112928.1326755-1-s.hauer@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, kernel@pengutronix.de,
 dmaengine@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>
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

The i.MX DMA drivers are device tree only, nothing in
include/linux/platform_data/dma-imx.h has platform_data in it, so move
the file to include/linux/dma/imx-dma.h.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
Acked-By: Vinod Koul <vkoul@kernel.org>
---

Notes:
    Changes since v2:
    - new patch

 drivers/dma/imx-dma.c                                    | 2 +-
 drivers/dma/imx-sdma.c                                   | 2 +-
 drivers/mmc/host/mxcmmc.c                                | 2 +-
 drivers/spi/spi-fsl-lpspi.c                              | 2 +-
 drivers/spi/spi-imx.c                                    | 2 +-
 drivers/tty/serial/imx.c                                 | 2 +-
 drivers/video/fbdev/mx3fb.c                              | 2 +-
 include/linux/{platform_data/dma-imx.h => dma/imx-dma.h} | 6 +++---
 sound/soc/fsl/fsl_asrc.c                                 | 2 +-
 sound/soc/fsl/fsl_asrc_dma.c                             | 2 +-
 sound/soc/fsl/fsl_easrc.h                                | 2 +-
 sound/soc/fsl/imx-pcm.h                                  | 2 +-
 sound/soc/fsl/imx-ssi.h                                  | 2 +-
 13 files changed, 15 insertions(+), 15 deletions(-)
 rename include/linux/{platform_data/dma-imx.h => dma/imx-dma.h} (95%)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index 2ddc31e64db03..3bffe3ecbd1b6 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -25,7 +25,7 @@
 #include <linux/of_dma.h>
 
 #include <asm/irq.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 
 #include "dmaengine.h"
 #define IMXDMA_MAX_CHAN_DESCRIPTORS	16
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 70c0aa931ddf4..80261a905eb5b 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -35,7 +35,7 @@
 #include <linux/workqueue.h>
 
 #include <asm/irq.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
diff --git a/drivers/mmc/host/mxcmmc.c b/drivers/mmc/host/mxcmmc.c
index 40b6878bea6cb..de04b5afef2e8 100644
--- a/drivers/mmc/host/mxcmmc.c
+++ b/drivers/mmc/host/mxcmmc.c
@@ -39,7 +39,7 @@
 #include <asm/irq.h>
 #include <linux/platform_data/mmc-mxcmmc.h>
 
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 
 #define DRIVER_NAME "mxc-mmc"
 #define MXCMCI_TIMEOUT_MS 10000
diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
index 4c601294f8fab..19b1f3d881b08 100644
--- a/drivers/spi/spi-fsl-lpspi.c
+++ b/drivers/spi/spi-fsl-lpspi.c
@@ -20,7 +20,7 @@
 #include <linux/of_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index b2dd0a4d24462..a944c787f53f3 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -24,7 +24,7 @@
 #include <linux/of_device.h>
 #include <linux/property.h>
 
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 
 #define DRIVER_NAME "spi_imx"
 
diff --git a/drivers/tty/serial/imx.c b/drivers/tty/serial/imx.c
index fd38e6ed4fdab..f8b5400e62672 100644
--- a/drivers/tty/serial/imx.c
+++ b/drivers/tty/serial/imx.c
@@ -30,7 +30,7 @@
 #include <linux/dma-mapping.h>
 
 #include <asm/irq.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 
 #include "serial_mctrl_gpio.h"
 
diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
index fabb271337ed2..b945b68984b97 100644
--- a/drivers/video/fbdev/mx3fb.c
+++ b/drivers/video/fbdev/mx3fb.c
@@ -26,7 +26,7 @@
 #include <linux/dma/ipu-dma.h>
 #include <linux/backlight.h>
 
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 #include <linux/platform_data/video-mx3fb.h>
 
 #include <asm/io.h>
diff --git a/include/linux/platform_data/dma-imx.h b/include/linux/dma/imx-dma.h
similarity index 95%
rename from include/linux/platform_data/dma-imx.h
rename to include/linux/dma/imx-dma.h
index 281adbb26e6bd..b06cba85a6d46 100644
--- a/include/linux/platform_data/dma-imx.h
+++ b/include/linux/dma/imx-dma.h
@@ -3,8 +3,8 @@
  * Copyright 2004-2009 Freescale Semiconductor, Inc. All Rights Reserved.
  */
 
-#ifndef __ASM_ARCH_MXC_DMA_H__
-#define __ASM_ARCH_MXC_DMA_H__
+#ifndef __LINUX_DMA_IMX_H
+#define __LINUX_DMA_IMX_H
 
 #include <linux/scatterlist.h>
 #include <linux/device.h>
@@ -65,4 +65,4 @@ static inline int imx_dma_is_general_purpose(struct dma_chan *chan)
 		!strcmp(chan->device->dev->driver->name, "imx-dma");
 }
 
-#endif
+#endif /* __LINUX_DMA_IMX_H */
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index d7d1536a4f377..ad4e6747b8391 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -11,7 +11,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
 #include <linux/of_platform.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 #include <linux/pm_runtime.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
index cd9b36ec0ecb9..5038faf035cba 100644
--- a/sound/soc/fsl/fsl_asrc_dma.c
+++ b/sound/soc/fsl/fsl_asrc_dma.c
@@ -8,7 +8,7 @@
 
 #include <linux/dma-mapping.h>
 #include <linux/module.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 
diff --git a/sound/soc/fsl/fsl_easrc.h b/sound/soc/fsl/fsl_easrc.h
index 30620d56252cc..86d5c360d4f53 100644
--- a/sound/soc/fsl/fsl_easrc.h
+++ b/sound/soc/fsl/fsl_easrc.h
@@ -7,7 +7,7 @@
 #define _FSL_EASRC_H
 
 #include <sound/asound.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 
 #include "fsl_asrc_common.h"
 
diff --git a/sound/soc/fsl/imx-pcm.h b/sound/soc/fsl/imx-pcm.h
index 5c6cf1ca8c8ab..06b25f4b26b6f 100644
--- a/sound/soc/fsl/imx-pcm.h
+++ b/sound/soc/fsl/imx-pcm.h
@@ -9,7 +9,7 @@
 #ifndef _IMX_PCM_H
 #define _IMX_PCM_H
 
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 
 /*
  * Do not change this as the FIQ handler depends on this size
diff --git a/sound/soc/fsl/imx-ssi.h b/sound/soc/fsl/imx-ssi.h
index 19cd0937e740a..2d30d822451a3 100644
--- a/sound/soc/fsl/imx-ssi.h
+++ b/sound/soc/fsl/imx-ssi.h
@@ -182,7 +182,7 @@
 #define DRV_NAME "imx-ssi"
 
 #include <linux/dmaengine.h>
-#include <linux/platform_data/dma-imx.h>
+#include <linux/dma/imx-dma.h>
 #include <sound/dmaengine_pcm.h>
 #include "imx-pcm.h"
 
-- 
2.30.2

