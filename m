Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDDC157D1C
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:12:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8243816CB;
	Mon, 10 Feb 2020 15:11:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8243816CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581343944;
	bh=s1JGPnwCXkaL9XqZAnXhI1rIF7ySqgQHB9+xgNHGEs0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mfj6n4Ai3QDPkHVcs5tm6t3jpbM2irmM1/76zCWf9/aziyprVjbyKzEKKatLhkxyr
	 vkIeY0neEn31BL34NFtJgcjhPCXA+8Wly8ipk5lFs6Y5nh2IRLAP9JcKh87Ofu521Q
	 JQ2ZhrMIExh7MNOhoQj/j2r0QMjkGk4/v5fAHuV4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 20D67F80257;
	Mon, 10 Feb 2020 15:10:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 85A44F80240; Mon, 10 Feb 2020 15:09:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_78,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2EB7F800E7
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:09:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2EB7F800E7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="BwP//hjD"
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AE9qwe126791;
 Mon, 10 Feb 2020 08:09:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1581343792;
 bh=yu3+n7bZDh4cxlmIaKrakzrIy2mj0ce1NyTvJdnr57Y=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=BwP//hjDOzPoU+hZ8nTrQ7E8P4bg0Nl7FM17Hdwo5BOcrBuHEYTJSk2RmwN+FxVQV
 PaKCJjaQiAG5IIdL12Fmd61NtjoV//vsqsJxaI7JzYcLBBD0JH8//3iid72PxbixDc
 b2dSvoXNNoXNE00HfdPCdOde1QeY6PEayH6Hui4k=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AE9pDB096035
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 10 Feb 2020 08:09:51 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 10
 Feb 2020 08:09:50 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 10 Feb 2020 08:09:50 -0600
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AE9lru046182;
 Mon, 10 Feb 2020 08:09:49 -0600
From: Peter Ujfalusi <peter.ujfalusi@ti.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 10 Feb 2020 16:09:49 +0200
Message-ID: <20200210140950.11090-2-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200210140950.11090-1-peter.ujfalusi@ti.com>
References: <20200210140950.11090-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: alsa-devel@alsa-project.org
Subject: [alsa-devel] [PATCH 1/2] ASoC: ti: Add udma-pcm platform driver for
	UDMA
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Platform driver glue for platforms using UDMA (am654 and j721e).

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
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
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
