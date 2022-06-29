Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 238BF560A8A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Jun 2022 21:44:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B4CD01678;
	Wed, 29 Jun 2022 21:43:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B4CD01678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656531888;
	bh=BTy0mmqclot2lVVQ+4NUmS55Evnj/fjfzi9Hk3gMHbA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SQ56ZhstIL+wqHQc8LL/VCtxS1eS5/kNg9VOQCcBqwV3sPzidbysUdD+Q0fe0AuGT
	 GEpNNktyIBlBlOZ6dYOl/a/C6jxB+xwEOBUNuPVuBbzj/GYylmqni8D/220tLuychS
	 /YE0z7QjHNMFoS4W3mv7ajLXAsRbNVj9C88spXTM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E54CF80542;
	Wed, 29 Jun 2022 21:42:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44901F8020D; Wed, 29 Jun 2022 21:42:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C58BFF80245
 for <alsa-devel@alsa-project.org>; Wed, 29 Jun 2022 21:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C58BFF80245
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da7-0007RF-8J; Wed, 29 Jun 2022 21:42:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da2-003SHN-Ak; Wed, 29 Jun 2022 21:42:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1o6da5-001xRV-17; Wed, 29 Jun 2022 21:42:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/5] ASoC: tegra: tegra20_das: Fold header file into only user
Date: Wed, 29 Jun 2022 21:42:20 +0200
Message-Id: <20220629194224.175607-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=9971; h=from:subject;
 bh=BTy0mmqclot2lVVQ+4NUmS55Evnj/fjfzi9Hk3gMHbA=;
 b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBivKsQfZGMbdaPxKTIw4Iv5rym/u69cLIVq/wm719N
 FhD9e7eJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYryrEAAKCRDB/BR4rcrsCbvDB/
 9SFq5iSxebD+Z1KO5D0OaHmJLljXunDMrCv50oBk8b/uZyXitoXZSu7AiIDUk6Vpl2dlJhG9fxSbWN
 j6MVQqi6suMu9HjnKXrgvi7UPdIx8MX6qOTdpfN3EFNp5Vm8oC8fJ25FQsCU69DXQacZZ+RrOtDYCr
 wvAzAV0jgoj8d3RPGxtYZAvef0F2WvCAMwAklKm5Isr+RRxYvjg3fE1q79aOOjRkf1kxPUPnOR+r2X
 BSTLSX1HL4QN1vSuxvXCJstffc+OqBdNc9Rxu5F0CSuRSHeLn72e4/wblX1GJ4Ut3wY66oCk8WNgz0
 IbB2yKn680y5c3jrsA6ctRDEwFoH0i
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org, alsa-devel@alsa-project.org,
 Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
 Jonathan Hunter <jonathanh@nvidia.com>
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

Since commit fcff5f99742e ("ASoC: tegra: remove unnecessary includes")
the header file (which at the time was named tegra_das.h) there is only
the actual driver that includes it. Just move the definitions into the
driver, drop the exports and remove the completely unused function.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 sound/soc/tegra/tegra20_das.c | 110 +++++++++++++++++++++++--------
 sound/soc/tegra/tegra20_das.h | 120 ----------------------------------
 2 files changed, 83 insertions(+), 147 deletions(-)
 delete mode 100644 sound/soc/tegra/tegra20_das.h

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index 69c651274c12..d2801130a986 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -13,10 +13,90 @@
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
-#include "tegra20_das.h"
 
 #define DRV_NAME "tegra20-das"
 
+/* Register TEGRA20_DAS_DAP_CTRL_SEL */
+#define TEGRA20_DAS_DAP_CTRL_SEL			0x00
+#define TEGRA20_DAS_DAP_CTRL_SEL_COUNT			5
+#define TEGRA20_DAS_DAP_CTRL_SEL_STRIDE			4
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P		31
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_S		1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P	30
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_S	1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P	29
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_S	1
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P		0
+#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_S		5
+
+/* Values for field TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL */
+#define TEGRA20_DAS_DAP_SEL_DAC1	0
+#define TEGRA20_DAS_DAP_SEL_DAC2	1
+#define TEGRA20_DAS_DAP_SEL_DAC3	2
+#define TEGRA20_DAS_DAP_SEL_DAP1	16
+#define TEGRA20_DAS_DAP_SEL_DAP2	17
+#define TEGRA20_DAS_DAP_SEL_DAP3	18
+#define TEGRA20_DAS_DAP_SEL_DAP4	19
+#define TEGRA20_DAS_DAP_SEL_DAP5	20
+
+/* Register TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL */
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL			0x40
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT		3
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE		4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P	28
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_S	4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P	24
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_S	4
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P	0
+#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_S	4
+
+/*
+ * Values for:
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL
+ * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL
+ */
+#define TEGRA20_DAS_DAC_SEL_DAP1	0
+#define TEGRA20_DAS_DAC_SEL_DAP2	1
+#define TEGRA20_DAS_DAC_SEL_DAP3	2
+#define TEGRA20_DAS_DAC_SEL_DAP4	3
+#define TEGRA20_DAS_DAC_SEL_DAP5	4
+
+/*
+ * Names/IDs of the DACs/DAPs.
+ */
+
+#define TEGRA20_DAS_DAP_ID_1 0
+#define TEGRA20_DAS_DAP_ID_2 1
+#define TEGRA20_DAS_DAP_ID_3 2
+#define TEGRA20_DAS_DAP_ID_4 3
+#define TEGRA20_DAS_DAP_ID_5 4
+
+#define TEGRA20_DAS_DAC_ID_1 0
+#define TEGRA20_DAS_DAC_ID_2 1
+#define TEGRA20_DAS_DAC_ID_3 2
+
+struct tegra20_das {
+	struct device *dev;
+	struct regmap *regmap;
+};
+
+/*
+ * Terminology:
+ * DAS: Digital audio switch (HW module controlled by this driver)
+ * DAP: Digital audio port (port/pins on Tegra device)
+ * DAC: Digital audio controller (e.g. I2S or AC97 controller elsewhere)
+ *
+ * The Tegra DAS is a mux/cross-bar which can connect each DAP to a specific
+ * DAC, or another DAP. When DAPs are connected, one must be the master and
+ * one the slave. Each DAC allows selection of a specific DAP for input, to
+ * cater for the case where N DAPs are connected to 1 DAC for broadcast
+ * output.
+ *
+ * This driver is dumb; no attempt is made to ensure that a valid routing
+ * configuration is programmed.
+ */
+
 static struct tegra20_das *das;
 
 static inline void tegra20_das_write(u32 reg, u32 val)
@@ -32,7 +112,7 @@ static inline u32 tegra20_das_read(u32 reg)
 	return val;
 }
 
-int tegra20_das_connect_dap_to_dac(int dap, int dac)
+static int tegra20_das_connect_dap_to_dac(int dap, int dac)
 {
 	u32 addr;
 	u32 reg;
@@ -48,31 +128,8 @@ int tegra20_das_connect_dap_to_dac(int dap, int dac)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra20_das_connect_dap_to_dac);
-
-int tegra20_das_connect_dap_to_dap(int dap, int otherdap, int master,
-				   int sdata1rx, int sdata2rx)
-{
-	u32 addr;
-	u32 reg;
-
-	if (!das)
-		return -ENODEV;
-
-	addr = TEGRA20_DAS_DAP_CTRL_SEL +
-		(dap * TEGRA20_DAS_DAP_CTRL_SEL_STRIDE);
-	reg = (otherdap << TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P) |
-		(!!sdata2rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P) |
-		(!!sdata1rx << TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P) |
-		(!!master << TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P);
-
-	tegra20_das_write(addr, reg);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(tegra20_das_connect_dap_to_dap);
 
-int tegra20_das_connect_dac_to_dap(int dac, int dap)
+static int tegra20_das_connect_dac_to_dap(int dac, int dap)
 {
 	u32 addr;
 	u32 reg;
@@ -90,7 +147,6 @@ int tegra20_das_connect_dac_to_dap(int dac, int dap)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(tegra20_das_connect_dac_to_dap);
 
 #define LAST_REG(name) \
 	(TEGRA20_DAS_##name + \
diff --git a/sound/soc/tegra/tegra20_das.h b/sound/soc/tegra/tegra20_das.h
deleted file mode 100644
index 18e832ded73a..000000000000
--- a/sound/soc/tegra/tegra20_das.h
+++ /dev/null
@@ -1,120 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * tegra20_das.h - Definitions for Tegra20 DAS driver
- *
- * Author: Stephen Warren <swarren@nvidia.com>
- * Copyright (C) 2010,2012 - NVIDIA, Inc.
- */
-
-#ifndef __TEGRA20_DAS_H__
-#define __TEGRA20_DAS_H__
-
-/* Register TEGRA20_DAS_DAP_CTRL_SEL */
-#define TEGRA20_DAS_DAP_CTRL_SEL			0x00
-#define TEGRA20_DAS_DAP_CTRL_SEL_COUNT			5
-#define TEGRA20_DAS_DAP_CTRL_SEL_STRIDE			4
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_P		31
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_MS_SEL_S		1
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_P	30
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA1_TX_RX_S	1
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_P	29
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_SDATA2_TX_RX_S	1
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_P		0
-#define TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL_S		5
-
-/* Values for field TEGRA20_DAS_DAP_CTRL_SEL_DAP_CTRL_SEL */
-#define TEGRA20_DAS_DAP_SEL_DAC1	0
-#define TEGRA20_DAS_DAP_SEL_DAC2	1
-#define TEGRA20_DAS_DAP_SEL_DAC3	2
-#define TEGRA20_DAS_DAP_SEL_DAP1	16
-#define TEGRA20_DAS_DAP_SEL_DAP2	17
-#define TEGRA20_DAS_DAP_SEL_DAP3	18
-#define TEGRA20_DAS_DAP_SEL_DAP4	19
-#define TEGRA20_DAS_DAP_SEL_DAP5	20
-
-/* Register TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL */
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL			0x40
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_COUNT		3
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_STRIDE		4
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_P	28
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL_S	4
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_P	24
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL_S	4
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_P	0
-#define TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL_S	4
-
-/*
- * Values for:
- * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA2_SEL
- * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_SDATA1_SEL
- * TEGRA20_DAS_DAC_INPUT_DATA_CLK_SEL_DAC_CLK_SEL
- */
-#define TEGRA20_DAS_DAC_SEL_DAP1	0
-#define TEGRA20_DAS_DAC_SEL_DAP2	1
-#define TEGRA20_DAS_DAC_SEL_DAP3	2
-#define TEGRA20_DAS_DAC_SEL_DAP4	3
-#define TEGRA20_DAS_DAC_SEL_DAP5	4
-
-/*
- * Names/IDs of the DACs/DAPs.
- */
-
-#define TEGRA20_DAS_DAP_ID_1 0
-#define TEGRA20_DAS_DAP_ID_2 1
-#define TEGRA20_DAS_DAP_ID_3 2
-#define TEGRA20_DAS_DAP_ID_4 3
-#define TEGRA20_DAS_DAP_ID_5 4
-
-#define TEGRA20_DAS_DAC_ID_1 0
-#define TEGRA20_DAS_DAC_ID_2 1
-#define TEGRA20_DAS_DAC_ID_3 2
-
-struct tegra20_das {
-	struct device *dev;
-	struct regmap *regmap;
-};
-
-/*
- * Terminology:
- * DAS: Digital audio switch (HW module controlled by this driver)
- * DAP: Digital audio port (port/pins on Tegra device)
- * DAC: Digital audio controller (e.g. I2S or AC97 controller elsewhere)
- *
- * The Tegra DAS is a mux/cross-bar which can connect each DAP to a specific
- * DAC, or another DAP. When DAPs are connected, one must be the master and
- * one the slave. Each DAC allows selection of a specific DAP for input, to
- * cater for the case where N DAPs are connected to 1 DAC for broadcast
- * output.
- *
- * This driver is dumb; no attempt is made to ensure that a valid routing
- * configuration is programmed.
- */
-
-/*
- * Connect a DAP to a DAC
- * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
- * dac_sel: DAC to connect to: TEGRA20_DAS_DAP_SEL_DAC*
- */
-extern int tegra20_das_connect_dap_to_dac(int dap, int dac);
-
-/*
- * Connect a DAP to another DAP
- * dap_id: DAP to connect: TEGRA20_DAS_DAP_ID_*
- * other_dap_sel: DAP to connect to: TEGRA20_DAS_DAP_SEL_DAP*
- * master: Is this DAP the master (1) or slave (0)
- * sdata1rx: Is this DAP's SDATA1 pin RX (1) or TX (0)
- * sdata2rx: Is this DAP's SDATA2 pin RX (1) or TX (0)
- */
-extern int tegra20_das_connect_dap_to_dap(int dap, int otherdap,
-					  int master, int sdata1rx,
-					  int sdata2rx);
-
-/*
- * Connect a DAC's input to a DAP
- * (DAC outputs are selected by the DAP)
- * dac_id: DAC ID to connect: TEGRA20_DAS_DAC_ID_*
- * dap_sel: DAP to receive input from: TEGRA20_DAS_DAC_SEL_DAP*
- */
-extern int tegra20_das_connect_dac_to_dap(int dac, int dap);
-
-#endif

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

