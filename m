Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD1950B957
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:59:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C589D1887;
	Fri, 22 Apr 2022 15:58:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C589D1887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635962;
	bh=PHH1wCuRwb9KPUzAwrw8NrAsucadA7Yn+3E53uslkQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n4Lno35eLnEZYezqNPDln1JVsh7VCyfd5iAJK6xULPma2+w+J7uohwP5m1fXxD6fn
	 SoGDThE2bhYYcv5ke9rtrjIWQBpuBDpX64gsYwKWsvSEEmAhbvsOElGPsHBUxb363z
	 4+ghSskJWrgt3S1OJTWryM676otH1cTUPBpIjlms=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48FB6F80CB9;
	Fri, 22 Apr 2022 15:33:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D717DF804FB; Fri, 22 Apr 2022 07:57:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6FDA8F80154;
 Fri, 22 Apr 2022 07:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FDA8F80154
X-UUID: ba42e565d4b546fdbb9b8cb4f4355392-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:faf54797-7821-4f2d-9785-04f88213680a, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Release_Ham
 ,ACTION:release,TS:80
X-CID-INFO: VERSION:1.1.4, REQID:faf54797-7821-4f2d-9785-04f88213680a, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:100,FILE:0,RULE:Spam_GS981B3D
 ,ACTION:quarantine,TS:80
X-CID-META: VersionHash:faefae9, CLOUDID:7be4bcef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:9240c96bf552,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: ba42e565d4b546fdbb9b8cb4f4355392-20220422
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 425954366; Fri, 22 Apr 2022 13:57:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 13:57:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 13:57:15 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood
 <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Daniel Baluta
 <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, YC Hung <yc.hung@mediatek.com>, Allen-KH Cheng
 <allen-kh.cheng@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v1 1/4] ASoC: SOF: mediatek: Add mt8186 hardware support
Date: Fri, 22 Apr 2022 13:56:56 +0800
Message-ID: <20220422055659.8738-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20220422055659.8738-1-tinghan.shen@mediatek.com>
References: <20220422055659.8738-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Fri, 22 Apr 2022 15:31:40 +0200
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 sound-open-firmware@alsa-project.org
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

Add support of SOF on Mediatek mt8186 SoC.
MT8186 has 2 Cortex A76 cores paired with 6 Cortex A55 cores.
It also has Cadence HiFi-5 DSP single core. The IPC communication
between AP and DSP is based on shared DRAM and mailbox interrupt.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/Kconfig         |   9 +
 sound/soc/sof/mediatek/Makefile        |   1 +
 sound/soc/sof/mediatek/adsp_helper.h   |   8 +
 sound/soc/sof/mediatek/mt8186/Makefile |   4 +
 sound/soc/sof/mediatek/mt8186/mt8186.c | 352 +++++++++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h |  77 ++++++
 6 files changed, 451 insertions(+)
 create mode 100644 sound/soc/sof/mediatek/mt8186/Makefile
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186.h

diff --git a/sound/soc/sof/mediatek/Kconfig b/sound/soc/sof/mediatek/Kconfig
index aeacf0e5bfbb..f79e76a6f3c6 100644
--- a/sound/soc/sof/mediatek/Kconfig
+++ b/sound/soc/sof/mediatek/Kconfig
@@ -21,6 +21,15 @@ config SND_SOC_SOF_MTK_COMMON
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_MT8186
+	tristate "SOF support for MT8186 audio DSP"
+	select SND_SOC_SOF_MTK_COMMON
+	help
+	  This adds support for Sound Open Firmware for Mediatek platforms
+	  using the mt8186 processors.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
 config SND_SOC_SOF_MT8195
 	tristate "SOF support for MT8195 audio DSP"
 	select SND_SOC_SOF_MTK_COMMON
diff --git a/sound/soc/sof/mediatek/Makefile b/sound/soc/sof/mediatek/Makefile
index e8ec6da981de..6ca8b8201ed1 100644
--- a/sound/soc/sof/mediatek/Makefile
+++ b/sound/soc/sof/mediatek/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += mt8195/
+obj-$(CONFIG_SND_SOC_SOF_MT8186) += mt8186/
diff --git a/sound/soc/sof/mediatek/adsp_helper.h b/sound/soc/sof/mediatek/adsp_helper.h
index 6734e2c0c6b1..f269a2b6c26a 100644
--- a/sound/soc/sof/mediatek/adsp_helper.h
+++ b/sound/soc/sof/mediatek/adsp_helper.h
@@ -29,6 +29,14 @@ struct mtk_adsp_chip_info {
 	void __iomem *shared_dram; /* part of  va_dram */
 	phys_addr_t adsp_bootup_addr;
 	int dram_offset; /*dram offset between system and dsp view*/
+
+	phys_addr_t pa_secreg;
+	u32 secregsize;
+	void __iomem *va_secreg;
+
+	phys_addr_t pa_busreg;
+	u32 busregsize;
+	void __iomem *va_busreg;
 };
 
 struct adsp_priv {
diff --git a/sound/soc/sof/mediatek/mt8186/Makefile b/sound/soc/sof/mediatek/mt8186/Makefile
new file mode 100644
index 000000000000..e0e971c17d5e
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+snd-sof-mt8186-objs := mt8186.o
+obj-$(CONFIG_SND_SOC_SOF_MT8186) += snd-sof-mt8186.o
+
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
new file mode 100644
index 000000000000..60021195e0b5
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -0,0 +1,352 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2022 Mediatek Inc. All rights reserved.
+//
+// Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+//         Tinghan Shen <tinghan.shen@mediatek.com>
+
+/*
+ * Hardware interface for audio DSP on mt8186
+ */
+
+#include <linux/delay.h>
+#include <linux/firmware.h>
+#include <linux/io.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/module.h>
+
+#include <sound/sof.h>
+#include <sound/sof/xtensa.h>
+#include "../../ops.h"
+#include "../../sof-of-dev.h"
+#include "../../sof-audio.h"
+#include "../adsp_helper.h"
+#include "mt8186.h"
+
+static int platform_parse_resource(struct platform_device *pdev, void *data)
+{
+	struct resource *mmio;
+	struct resource res;
+	struct device_node *mem_region;
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_chip_info *adsp = data;
+	int ret;
+
+	mem_region = of_parse_phandle(dev->of_node, "memory-region", 0);
+	if (!mem_region) {
+		dev_err(dev, "no dma memory-region phandle\n");
+		return -ENODEV;
+	}
+
+	ret = of_address_to_resource(mem_region, 0, &res);
+	of_node_put(mem_region);
+	if (ret) {
+		dev_err(dev, "of_address_to_resource dma failed\n");
+		return ret;
+	}
+
+	dev_dbg(dev, "DMA %pR\n", &res);
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret) {
+		dev_err(dev, "of_reserved_mem_device_init failed\n");
+		return ret;
+	}
+
+	mem_region = of_parse_phandle(dev->of_node, "memory-region", 1);
+	if (!mem_region) {
+		dev_err(dev, "no memory-region sysmem phandle\n");
+		return -ENODEV;
+	}
+
+	ret = of_address_to_resource(mem_region, 0, &res);
+	of_node_put(mem_region);
+	if (ret) {
+		dev_err(dev, "of_address_to_resource sysmem failed\n");
+		return ret;
+	}
+
+	adsp->pa_dram = (phys_addr_t)res.start;
+	if (adsp->pa_dram & DRAM_REMAP_MASK) {
+		dev_err(dev, "adsp memory(%#x) is not 4K-aligned\n",
+			(u32)adsp->pa_dram);
+		return -EINVAL;
+	}
+
+	adsp->dramsize = resource_size(&res);
+	if (adsp->dramsize < TOTAL_SIZE_SHARED_DRAM_FROM_TAIL) {
+		dev_err(dev, "adsp memory(%#x) is not enough for share\n",
+			adsp->dramsize);
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "dram pbase=%pa size=%#x\n", &adsp->pa_dram, adsp->dramsize);
+
+	mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
+	if (!mmio) {
+		dev_err(dev, "no ADSP-CFG register resource\n");
+		return -ENXIO;
+	}
+
+	adsp->va_cfgreg = devm_ioremap_resource(dev, mmio);
+	if (IS_ERR(adsp->va_cfgreg))
+		return PTR_ERR(adsp->va_cfgreg);
+
+	adsp->pa_cfgreg = (phys_addr_t)mmio->start;
+	adsp->cfgregsize = resource_size(mmio);
+
+	dev_dbg(dev, "cfgreg pbase=%pa size=%#x\n", &adsp->pa_cfgreg, adsp->cfgregsize);
+
+	mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
+	if (!mmio) {
+		dev_err(dev, "no SRAM resource\n");
+		return -ENXIO;
+	}
+
+	adsp->pa_sram = (phys_addr_t)mmio->start;
+	adsp->sramsize = resource_size(mmio);
+
+	dev_dbg(dev, "sram pbase=%pa size=%#x\n", &adsp->pa_sram, adsp->sramsize);
+
+	mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sec");
+	if (!mmio) {
+		dev_err(dev, "no SEC register resource\n");
+		return -ENXIO;
+	}
+
+	adsp->va_secreg = devm_ioremap_resource(dev, mmio);
+	if (IS_ERR(adsp->va_secreg))
+		return PTR_ERR(adsp->va_secreg);
+
+	adsp->pa_secreg = (phys_addr_t)mmio->start;
+	adsp->secregsize = resource_size(mmio);
+
+	dev_dbg(dev, "secreg pbase=%pa size=%#x\n", &adsp->pa_secreg, adsp->secregsize);
+
+	mmio = platform_get_resource_byname(pdev, IORESOURCE_MEM, "bus");
+	if (!mmio) {
+		dev_err(dev, "no BUS register resource\n");
+		return -ENXIO;
+	}
+
+	adsp->va_busreg = devm_ioremap_resource(dev, mmio);
+	if (IS_ERR(adsp->va_busreg))
+		return PTR_ERR(adsp->va_busreg);
+
+	adsp->pa_busreg = (phys_addr_t)mmio->start;
+	adsp->busregsize = resource_size(mmio);
+
+	dev_dbg(dev, "busreg pbase=%pa size=%#x\n", &adsp->pa_busreg, adsp->busregsize);
+
+	return 0;
+}
+
+static void adsp_sram_power_on(struct snd_sof_dev *sdev)
+{
+	snd_sof_dsp_update_bits(sdev, DSP_BUSREG_BAR, ADSP_SRAM_POOL_CON,
+				DSP_SRAM_POOL_PD_MASK, 0);
+}
+
+static void adsp_sram_power_off(struct snd_sof_dev *sdev)
+{
+	snd_sof_dsp_update_bits(sdev, DSP_BUSREG_BAR, ADSP_SRAM_POOL_CON,
+				DSP_SRAM_POOL_PD_MASK, DSP_SRAM_POOL_PD_MASK);
+}
+
+/*  Init the basic DSP DRAM address */
+static int adsp_memory_remap_init(struct snd_sof_dev *sdev, struct mtk_adsp_chip_info *adsp)
+{
+	u32 offset;
+
+	offset = adsp->pa_dram - DRAM_PHYS_BASE_FROM_DSP_VIEW;
+	adsp->dram_offset = offset;
+	offset >>= DRAM_REMAP_SHIFT;
+
+	dev_dbg(sdev->dev, "adsp->pa_dram %pa, offset %#x\n", &adsp->pa_dram, offset);
+
+	snd_sof_dsp_write(sdev, DSP_BUSREG_BAR, DSP_C0_EMI_MAP_ADDR, offset);
+	snd_sof_dsp_write(sdev, DSP_BUSREG_BAR, DSP_C0_DMAEMI_MAP_ADDR, offset);
+
+	if (offset != snd_sof_dsp_read(sdev, DSP_BUSREG_BAR, DSP_C0_EMI_MAP_ADDR) ||
+	    offset != snd_sof_dsp_read(sdev, DSP_BUSREG_BAR, DSP_C0_DMAEMI_MAP_ADDR)) {
+		dev_err(sdev->dev, "emi remap fail\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_chip_info *adsp = data;
+	u32 shared_size;
+
+	/* remap shared-dram base to be non-cachable */
+	shared_size = TOTAL_SIZE_SHARED_DRAM_FROM_TAIL;
+	adsp->pa_shared_dram = adsp->pa_dram + adsp->dramsize - shared_size;
+	if (adsp->va_dram) {
+		adsp->shared_dram = adsp->va_dram + DSP_DRAM_SIZE - shared_size;
+	} else {
+		adsp->shared_dram = devm_ioremap(dev, adsp->pa_shared_dram,
+						 shared_size);
+		if (!adsp->shared_dram) {
+			dev_err(dev, "ioremap failed for shared DRAM\n");
+			return -ENOMEM;
+		}
+	}
+	dev_dbg(dev, "shared-dram vbase=%p, phy addr :%pa, size=%#x\n",
+		adsp->shared_dram, &adsp->pa_shared_dram, shared_size);
+
+	return 0;
+}
+
+static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
+{
+	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
+	struct adsp_priv *priv;
+	int ret;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	sdev->pdata->hw_pdata = priv;
+	priv->dev = sdev->dev;
+	priv->sdev = sdev;
+
+	priv->adsp = devm_kzalloc(&pdev->dev, sizeof(struct mtk_adsp_chip_info), GFP_KERNEL);
+	if (!priv->adsp)
+		return -ENOMEM;
+
+	ret = platform_parse_resource(pdev, priv->adsp);
+	if (ret)
+		return ret;
+
+	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev,
+						       priv->adsp->pa_sram,
+						       priv->adsp->sramsize);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
+		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
+			&priv->adsp->pa_sram, priv->adsp->sramsize);
+		return -ENOMEM;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev,
+							  priv->adsp->pa_dram,
+							  priv->adsp->dramsize);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_SRAM]) {
+		dev_err(sdev->dev, "failed to ioremap base %pa size %#x\n",
+			&priv->adsp->pa_dram, priv->adsp->dramsize);
+		return -ENOMEM;
+	}
+
+	priv->adsp->va_dram = sdev->bar[SOF_FW_BLK_TYPE_SRAM];
+
+	ret = adsp_shared_base_ioremap(pdev, priv->adsp);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_shared_base_ioremap fail!\n");
+		return ret;
+	}
+
+	sdev->bar[DSP_REG_BAR] = priv->adsp->va_cfgreg;
+	sdev->bar[DSP_SECREG_BAR] = priv->adsp->va_secreg;
+	sdev->bar[DSP_BUSREG_BAR] = priv->adsp->va_busreg;
+
+	sdev->mmio_bar = SOF_FW_BLK_TYPE_SRAM;
+	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
+
+	ret = adsp_memory_remap_init(sdev, priv->adsp);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_memory_remap_init fail!\n");
+		return ret;
+	}
+
+	adsp_sram_power_on(sdev);
+
+	return 0;
+}
+
+static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
+{
+	adsp_sram_power_off(sdev);
+
+	return 0;
+}
+
+/* on mt8186 there is 1 to 1 match between type and BAR idx */
+static int mt8186_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	return type;
+}
+
+/* mt8186 ops */
+static struct snd_sof_dsp_ops sof_mt8186_ops = {
+	/* probe and remove */
+	.probe		= mt8186_dsp_probe,
+	.remove		= mt8186_dsp_remove,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* Register IO */
+	.write		= sof_io_write,
+	.read		= sof_io_read,
+	.write64	= sof_io_write64,
+	.read64		= sof_io_read64,
+
+	/* misc */
+	.get_bar_index	= mt8186_get_bar_index,
+
+	/* Firmware ops */
+	.dsp_arch_ops = &sof_xtensa_arch_ops,
+
+	/* ALSA HW info flags */
+	.hw_info =	SNDRV_PCM_INFO_MMAP |
+			SNDRV_PCM_INFO_MMAP_VALID |
+			SNDRV_PCM_INFO_INTERLEAVED |
+			SNDRV_PCM_INFO_PAUSE |
+			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+};
+
+static const struct sof_dev_desc sof_of_mt8186_desc = {
+	.ipc_supported_mask	= BIT(SOF_IPC),
+	.ipc_default		= SOF_IPC,
+	.default_fw_path = {
+		[SOF_IPC] = "mediatek/sof",
+	},
+	.default_tplg_path = {
+		[SOF_IPC] = "mediatek/sof-tplg",
+	},
+	.default_fw_filename = {
+		[SOF_IPC] = "sof-mt8186.ri",
+	},
+	.nocodec_tplg_filename = "sof-mt8186-nocodec.tplg",
+	.ops = &sof_mt8186_ops,
+};
+
+static const struct of_device_id sof_of_mt8186_ids[] = {
+	{ .compatible = "mediatek,mt8186-dsp", .data = &sof_of_mt8186_desc},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
+
+/* DT driver definition */
+static struct platform_driver snd_sof_of_mt8186_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+	.name = "sof-audio-of-mt8186",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_mt8186_ids,
+	},
+};
+module_platform_driver(snd_sof_of_mt8186_driver);
+
+MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
+MODULE_IMPORT_NS(SND_SOC_SOF_MTK_COMMON);
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
new file mode 100644
index 000000000000..40ea7cb9295b
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+/*
+ * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
+ *
+ *  Header file for the mt8186 DSP register definition
+ */
+
+#ifndef __MT8186_H
+#define __MT8186_H
+
+struct mtk_adsp_chip_info;
+
+#define DSP_REG_BAR			4
+#define DSP_SECREG_BAR			5
+#define DSP_BUSREG_BAR			6
+
+/*****************************************************************************
+ *                  R E G I S T E R       TABLE
+ *****************************************************************************/
+/* dsp cfg */
+#define ADSP_CFGREG_SW_RSTN		0x0000
+#define SW_DBG_RSTN_C0			BIT(0)
+#define SW_RSTN_C0			BIT(4)
+#define ADSP_HIFI_IO_CONFIG		0x000C
+#define TRACEMEMREADY			BIT(15)
+#define RUNSTALL			BIT(31)
+#define ADSP_IRQ_MASK			0x0030
+#define ADSP_DVFSRC_REQ			0x0040
+#define ADSP_DDREN_REQ_0		0x0044
+#define ADSP_SEMAPHORE			0x0064
+#define ADSP_WDT_CON_C0			0x007C
+#define ADSP_MBOX_IRQ_EN		0x009C
+#define DSP_MBOX0_IRQ_EN		BIT(0)
+#define DSP_MBOX1_IRQ_EN		BIT(1)
+#define DSP_MBOX2_IRQ_EN		BIT(2)
+#define DSP_MBOX3_IRQ_EN		BIT(3)
+#define DSP_MBOX4_IRQ_EN		BIT(4)
+#define DSP_PDEBUGPC			0x013C
+#define ADSP_CK_EN			0x1000
+#define CORE_CLK_EN			BIT(0)
+#define COREDBG_EN			BIT(1)
+#define TIMER_EN			BIT(3)
+#define DMA_EN				BIT(4)
+#define UART_EN				BIT(5)
+#define ADSP_UART_CTRL			0x1010
+#define UART_BCLK_CG			BIT(0)
+#define UART_RSTN			BIT(3)
+
+/* dsp sec */
+#define ADSP_PRID			0x0
+#define ADSP_ALTVEC_C0			0x04
+#define ADSP_ALTVECSEL			0x0C
+#define ADSP_ALTVECSEL_C0		BIT(1)
+
+/* dsp bus */
+#define ADSP_SRAM_POOL_CON		0x190
+#define DSP_SRAM_POOL_PD_MASK		0xF00F /* [0:3] and [12:15] */
+#define DSP_C0_EMI_MAP_ADDR		0xA00  /* ADSP Core0 To EMI Address Remap */
+#define DSP_C0_DMAEMI_MAP_ADDR		0xA08  /* DMA0 To EMI Address Remap */
+
+/* DSP memories */
+#define MBOX_OFFSET			0x500000 /* DRAM */
+#define MBOX_SIZE			0x1000   /* consistent with which in memory.h of sof fw */
+#define DSP_DRAM_SIZE			0xA00000 /* 16M */
+
+/*remap dram between AP and DSP view, 4KB aligned*/
+#define SRAM_PHYS_BASE_FROM_DSP_VIEW	0x4E100000 /* MT8186 DSP view */
+#define DRAM_PHYS_BASE_FROM_DSP_VIEW	0x60000000 /* MT8186 DSP view */
+#define DRAM_REMAP_SHIFT		12
+#define DRAM_REMAP_MASK			0xFFF
+
+#define SIZE_SHARED_DRAM_DL			0x40000 /*Shared buffer for Downlink*/
+#define SIZE_SHARED_DRAM_UL			0x40000 /*Shared buffer for Uplink*/
+#define TOTAL_SIZE_SHARED_DRAM_FROM_TAIL	(SIZE_SHARED_DRAM_DL + SIZE_SHARED_DRAM_UL)
+
+#endif
-- 
2.18.0

