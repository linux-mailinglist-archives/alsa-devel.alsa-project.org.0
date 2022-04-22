Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB32D50B955
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:58:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3F116C8;
	Fri, 22 Apr 2022 15:58:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3F116C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635933;
	bh=TDR6IRtv2eK97evs7aeh/990PC4scnP3zqK6Rdw6FNs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Qpx6oDyxs90fIghnaSX/I33umGpcAeOmpL+8hm8IJxKU3RyvJ4bF2chG8kzaVH3Lw
	 rSGcejHiToxC3yTn3CXT1xe8K587sTa/Bv7JCSkKm3mSsXiHF7JulvMh9mxYpKSrzx
	 gLFQMYddKZRKurHO5i2Y+n4IxDiRrP6OSKvf+gE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 13D40F80CAD;
	Fri, 22 Apr 2022 15:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17547F80249; Fri, 22 Apr 2022 07:57:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F351F8027C;
 Fri, 22 Apr 2022 07:57:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F351F8027C
X-UUID: a9986424912d4c1f949925f5bc60b0ea-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:e6c3c661-54aa-4302-901a-34cec739af94, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:7ae4bcef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: a9986424912d4c1f949925f5bc60b0ea-20220422
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2032270726; Fri, 22 Apr 2022 13:57:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 13:57:15 +0800
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
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>, "Geert
 Uytterhoeven" <geert@linux-m68k.org>
Subject: [PATCH v1 2/4] ASoC: SOF: mediatek: Add mt8186 sof fw loader and dsp
 ops
Date: Fri, 22 Apr 2022 13:56:57 +0800
Message-ID: <20220422055659.8738-3-tinghan.shen@mediatek.com>
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

Add mt8186-loader module with ops callback to load and run firmware
on mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/Makefile        |  2 +-
 sound/soc/sof/mediatek/mt8186/mt8186-loader.c | 53 +++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186.c        | 18 +++++++
 sound/soc/sof/mediatek/mt8186/mt8186.h        |  3 ++
 4 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-loader.c

diff --git a/sound/soc/sof/mediatek/mt8186/Makefile b/sound/soc/sof/mediatek/mt8186/Makefile
index e0e971c17d5e..03a12f2096f9 100644
--- a/sound/soc/sof/mediatek/mt8186/Makefile
+++ b/sound/soc/sof/mediatek/mt8186/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8186-objs := mt8186.o
+snd-sof-mt8186-objs := mt8186.o mt8186-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8186) += snd-sof-mt8186.o
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-loader.c b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
new file mode 100644
index 000000000000..6ab4921b1010
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-loader.c
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright (c) 2022 Mediatek Corporation. All rights reserved.
+//
+// Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+//         Tinghan Shen <tinghan.shen@mediatek.com>
+//
+// Hardware interface for mt8186 DSP code loader
+
+#include <sound/sof.h>
+#include "mt8186.h"
+#include "../../ops.h"
+
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
+{
+	/* set RUNSTALL to stop core */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
+				RUNSTALL, RUNSTALL);
+
+	/* set core boot address */
+	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVEC_C0, boot_addr);
+	snd_sof_dsp_write(sdev, DSP_SECREG_BAR, ADSP_ALTVECSEL, ADSP_ALTVECSEL_C0);
+
+	/* assert core reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0);
+
+	/* hardware requirement */
+	udelay(1);
+
+	/* release core reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0,
+				0);
+
+	/* clear RUNSTALL (bit31) to start core */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
+				RUNSTALL, 0);
+}
+
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
+{
+	/* set RUNSTALL to stop core */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_IO_CONFIG,
+				RUNSTALL, RUNSTALL);
+
+	/* assert core reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0,
+				SW_RSTN_C0 | SW_DBG_RSTN_C0);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 60021195e0b5..892cd7d79994 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -204,6 +204,17 @@ static int adsp_shared_base_ioremap(struct platform_device *pdev, void *data)
 	return 0;
 }
 
+static int mt8186_run(struct snd_sof_dev *sdev)
+{
+	u32 adsp_bootup_addr;
+
+	adsp_bootup_addr = SRAM_PHYS_BASE_FROM_DSP_VIEW;
+	dev_dbg(sdev->dev, "HIFIxDSP boot from base : 0x%08X\n", adsp_bootup_addr);
+	sof_hifixdsp_boot_sequence(sdev, adsp_bootup_addr);
+
+	return 0;
+}
+
 static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 {
 	struct platform_device *pdev = container_of(sdev->dev, struct platform_device, dev);
@@ -272,6 +283,7 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 
 static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
+	sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
 
 	return 0;
@@ -289,6 +301,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	.probe		= mt8186_dsp_probe,
 	.remove		= mt8186_dsp_remove,
 
+	/* DSP core boot */
+	.run		= mt8186_run,
+
 	/* Block IO */
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
@@ -302,6 +317,9 @@ static struct snd_sof_dsp_ops sof_mt8186_ops = {
 	/* misc */
 	.get_bar_index	= mt8186_get_bar_index,
 
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.h b/sound/soc/sof/mediatek/mt8186/mt8186.h
index 40ea7cb9295b..df52ae9659e4 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.h
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.h
@@ -10,6 +10,7 @@
 #define __MT8186_H
 
 struct mtk_adsp_chip_info;
+struct snd_sof_dev;
 
 #define DSP_REG_BAR			4
 #define DSP_SECREG_BAR			5
@@ -74,4 +75,6 @@ struct mtk_adsp_chip_info;
 #define SIZE_SHARED_DRAM_UL			0x40000 /*Shared buffer for Uplink*/
 #define TOTAL_SIZE_SHARED_DRAM_FROM_TAIL	(SIZE_SHARED_DRAM_DL + SIZE_SHARED_DRAM_UL)
 
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.18.0

