Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A79250B954
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Apr 2022 15:58:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FED1861;
	Fri, 22 Apr 2022 15:57:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FED1861
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650635914;
	bh=TuEhwUZP5p80m88lAEQI5rXGV0rQVCiOUIbPjgTWgGw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lm5gM5QtY4oRdO84oCeSbepEqGxgS6dndFXPld1VAqNVjomDx5/zQefo0gFcuqQYa
	 kUxQRrniXVZ6mCrHibW9dsvl+0PUGCOQWV9Jwt5FhzEPAhxHerkZEUukUqfLtzcFB1
	 DvdwVZO6mDiTD+65gcgBgOFY+Pqf4VKajiOvo+7U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 64A15F80516;
	Fri, 22 Apr 2022 15:33:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D9C8F80125; Fri, 22 Apr 2022 07:57:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D7EDDF80125;
 Fri, 22 Apr 2022 07:57:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D7EDDF80125
X-UUID: bbdf443bd4af41ac9a1d42496d1d254b-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:5583daf8-6201-485c-a264-989a122d0476, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:7bd992f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: bbdf443bd4af41ac9a1d42496d1d254b-20220422
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1719905381; Fri, 22 Apr 2022 13:57:16 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 22 Apr 2022 13:57:16 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 13:57:15 +0800
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
Subject: [PATCH v1 3/4] ASoC: SOF: mediatek: Add mt8186 dsp clock support
Date: Fri, 22 Apr 2022 13:56:58 +0800
Message-ID: <20220422055659.8738-4-tinghan.shen@mediatek.com>
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

Add adsp clock on/off support on mt8186 SoC.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/mediatek/mt8186/Makefile     |   2 +-
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c | 101 +++++++++++++++++++++
 sound/soc/sof/mediatek/mt8186/mt8186-clk.h |  24 +++++
 sound/soc/sof/mediatek/mt8186/mt8186.c     |  15 +++
 4 files changed, 141 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.c
 create mode 100644 sound/soc/sof/mediatek/mt8186/mt8186-clk.h

diff --git a/sound/soc/sof/mediatek/mt8186/Makefile b/sound/soc/sof/mediatek/mt8186/Makefile
index 03a12f2096f9..c1f5fc4e2495 100644
--- a/sound/soc/sof/mediatek/mt8186/Makefile
+++ b/sound/soc/sof/mediatek/mt8186/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8186-objs := mt8186.o mt8186-loader.o
+snd-sof-mt8186-objs := mt8186.o mt8186-clk.o mt8186-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8186) += snd-sof-mt8186.o
 
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
new file mode 100644
index 000000000000..5f805981b8e6
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright(c) 2022 Mediatek Corporation. All rights reserved.
+//
+// Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+//         Tinghan Shen <tinghan.shen@mediatek.com>
+//
+// Hardware interface for mt8186 DSP clock
+
+#include <linux/clk.h>
+#include <linux/pm_runtime.h>
+#include <linux/io.h>
+
+#include "../../sof-audio.h"
+#include "../../ops.h"
+#include "../adsp_helper.h"
+#include "mt8186.h"
+#include "mt8186-clk.h"
+
+static const char *adsp_clks[ADSP_CLK_MAX] = {
+	[CLK_TOP_AUDIODSP] = "audiodsp_sel",
+	[CLK_TOP_ADSP_BUS] = "adsp_bus_sel",
+};
+
+int mt8186_adsp_init_clock(struct snd_sof_dev *sdev)
+{
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+	struct device *dev = sdev->dev;
+	int i;
+
+	priv->clk = devm_kcalloc(dev, ADSP_CLK_MAX, sizeof(*priv->clk), GFP_KERNEL);
+	if (!priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < ADSP_CLK_MAX; i++) {
+		priv->clk[i] = devm_clk_get(dev, adsp_clks[i]);
+
+		if (IS_ERR(priv->clk[i]))
+			return PTR_ERR(priv->clk[i]);
+	}
+
+	return 0;
+}
+
+static int adsp_enable_all_clock(struct snd_sof_dev *sdev)
+{
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+	struct device *dev = sdev->dev;
+	int ret;
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_AUDIODSP]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(audiodsp) fail %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->clk[CLK_TOP_ADSP_BUS]);
+	if (ret) {
+		dev_err(dev, "%s clk_prepare_enable(adsp_bus) fail %d\n",
+			__func__, ret);
+		clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void adsp_disable_all_clock(struct snd_sof_dev *sdev)
+{
+	struct adsp_priv *priv = sdev->pdata->hw_pdata;
+
+	clk_disable_unprepare(priv->clk[CLK_TOP_ADSP_BUS]);
+	clk_disable_unprepare(priv->clk[CLK_TOP_AUDIODSP]);
+}
+
+int adsp_clock_on(struct snd_sof_dev *sdev)
+{
+	struct device *dev = sdev->dev;
+	int ret;
+
+	ret = adsp_enable_all_clock(sdev);
+	if (ret) {
+		dev_err(dev, "failed to adsp_enable_clock: %d\n", ret);
+		return ret;
+	}
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_CK_EN,
+			  UART_EN | DMA_EN | TIMER_EN | COREDBG_EN | CORE_CLK_EN);
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_UART_CTRL,
+			  UART_BCLK_CG | UART_RSTN);
+
+	return 0;
+}
+
+void adsp_clock_off(struct snd_sof_dev *sdev)
+{
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_CK_EN, 0);
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, ADSP_UART_CTRL, 0);
+	adsp_disable_all_clock(sdev);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.h b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
new file mode 100644
index 000000000000..fa174dfceff0
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+/*
+ * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
+ *
+ *  Header file for the mt8186 DSP clock definition
+ */
+
+#ifndef __MT8186_CLK_H
+#define __MT8186_CLK_H
+
+struct snd_sof_dev;
+
+/* DSP clock */
+enum adsp_clk_id {
+	CLK_TOP_AUDIODSP,
+	CLK_TOP_ADSP_BUS,
+	ADSP_CLK_MAX
+};
+
+int mt8186_adsp_init_clock(struct snd_sof_dev *sdev);
+int adsp_clock_on(struct snd_sof_dev *sdev);
+void adsp_clock_off(struct snd_sof_dev *sdev);
+#endif
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 892cd7d79994..a04cea77bd4d 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -25,6 +25,7 @@
 #include "../../sof-audio.h"
 #include "../adsp_helper.h"
 #include "mt8186.h"
+#include "mt8186-clk.h"
 
 static int platform_parse_resource(struct platform_device *pdev, void *data)
 {
@@ -276,6 +277,19 @@ static int mt8186_dsp_probe(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
+	/* enable adsp clock before touching registers */
+	ret = mt8186_adsp_init_clock(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "mt8186_adsp_init_clock failed\n");
+		return ret;
+	}
+
+	ret = adsp_clock_on(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "adsp_clock_on fail!\n");
+		return ret;
+	}
+
 	adsp_sram_power_on(sdev);
 
 	return 0;
@@ -285,6 +299,7 @@ static int mt8186_dsp_remove(struct snd_sof_dev *sdev)
 {
 	sof_hifixdsp_shutdown(sdev);
 	adsp_sram_power_off(sdev);
+	adsp_clock_off(sdev);
 
 	return 0;
 }
-- 
2.18.0

