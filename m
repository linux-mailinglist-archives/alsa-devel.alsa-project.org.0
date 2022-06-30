Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6194456120D
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 07:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 005DD16D6;
	Thu, 30 Jun 2022 07:56:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 005DD16D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656568624;
	bh=lQczcA8eOHHKvt1zKRjjMErfZfrMPnC0lo4G2AJ5RKY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fwk7WOFzp4NSb+Gl73fQka/C/JNHVnZfodXPz4m2HgCllfp4UA9Vx3I/Z2fKOqFVn
	 dRha4weaTKD0NvqJVD7nLkWtlJAky5XHVudxWTGFEZaQPEIgAeS/JLmt2hHY5W/bwz
	 +mX71WVRhvUdYM7RpFzMCJK/8ZHIOtwuVItHtRKQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B1DE4F80551;
	Thu, 30 Jun 2022 07:55:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDD88F804DA; Thu, 30 Jun 2022 07:55:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23A52F804D8
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 07:54:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A52F804D8
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 41C57200758;
 Thu, 30 Jun 2022 07:54:14 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CBFCB2009F9;
 Thu, 30 Jun 2022 07:54:13 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 2D181180222B;
 Thu, 30 Jun 2022 13:54:12 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 1/6] ASoC: fsl_utils: Add function to handle PLL clock source
Date: Thu, 30 Jun 2022 13:39:09 +0800
Message-Id: <1656567554-32122-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656567554-32122-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.
Add common function in fsl_utils to handle these two PLL
clock source, which are needed by CPU DAI drivers

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_utils.c | 69 +++++++++++++++++++++++++++++++++++++++
 sound/soc/fsl/fsl_utils.h |  9 +++++
 2 files changed, 78 insertions(+)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index 9bab202569af..b75843e31f00 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -6,6 +6,8 @@
 //
 // Copyright 2010 Freescale Semiconductor, Inc.
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <sound/soc.h>
@@ -83,6 +85,73 @@ int fsl_asoc_get_dma_channel(struct device_node *ssi_np,
 }
 EXPORT_SYMBOL(fsl_asoc_get_dma_channel);
 
+/**
+ * fsl_asoc_get_pll_clocks - get two PLL clock source
+ *
+ * @dev: device pointer
+ * @pll8k_clk: PLL clock pointer for 8kHz
+ * @pll11k_clk: PLL clock pointer for 11kHz
+ *
+ * This function get two PLL clock source
+ */
+void fsl_asoc_get_pll_clocks(struct device *dev, struct clk **pll8k_clk,
+			     struct clk **pll11k_clk)
+{
+	*pll8k_clk = devm_clk_get(dev, "pll8k");
+	if (IS_ERR(*pll8k_clk))
+		*pll8k_clk = NULL;
+
+	*pll11k_clk = devm_clk_get(dev, "pll11k");
+	if (IS_ERR(*pll11k_clk))
+		*pll11k_clk = NULL;
+}
+EXPORT_SYMBOL(fsl_asoc_get_pll_clocks);
+
+/**
+ * fsl_asoc_reparent_pll_clocks - set clock parent if necessary
+ *
+ * @dev: device pointer
+ * @clk: root clock pointer
+ * @pll8k_clk: PLL clock pointer for 8kHz
+ * @pll11k_clk: PLL clock pointer for 11kHz
+ * @ratio: target requency for root clock
+ *
+ * This function set root clock parent according to the target ratio
+ */
+void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
+				  struct clk *pll8k_clk,
+				  struct clk *pll11k_clk, u64 ratio)
+{
+	struct clk *p, *pll = 0, *npll = 0;
+	bool reparent = false;
+	int ret = 0;
+
+	if (!clk || !pll8k_clk || !pll11k_clk)
+		return;
+
+	p = clk;
+	while (p && pll8k_clk && pll11k_clk) {
+		struct clk *pp = clk_get_parent(p);
+
+		if (clk_is_match(pp, pll8k_clk) ||
+		    clk_is_match(pp, pll11k_clk)) {
+			pll = pp;
+			break;
+		}
+		p = pp;
+	}
+
+	npll = (do_div(ratio, 8000) ? pll11k_clk : pll8k_clk);
+	reparent = (pll && !clk_is_match(pll, npll));
+
+	if (reparent) {
+		ret = clk_set_parent(p, npll);
+		if (ret < 0)
+			dev_warn(dev, "failed to set parent %s: %d\n", __clk_get_name(npll), ret);
+	}
+}
+EXPORT_SYMBOL(fsl_asoc_reparent_pll_clocks);
+
 MODULE_AUTHOR("Timur Tabi <timur@freescale.com>");
 MODULE_DESCRIPTION("Freescale ASoC utility code");
 MODULE_LICENSE("GPL v2");
diff --git a/sound/soc/fsl/fsl_utils.h b/sound/soc/fsl/fsl_utils.h
index c5dc2a14b492..3fec537edd26 100644
--- a/sound/soc/fsl/fsl_utils.h
+++ b/sound/soc/fsl/fsl_utils.h
@@ -11,6 +11,8 @@
 #define _FSL_UTILS_H
 
 #define DAI_NAME_SIZE	32
+#define CLK_8K_FREQ            24576000
+#define CLK_11K_FREQ           22579200
 
 struct snd_soc_dai_link;
 struct device_node;
@@ -19,4 +21,11 @@ int fsl_asoc_get_dma_channel(struct device_node *ssi_np, const char *name,
 			     struct snd_soc_dai_link *dai,
 			     unsigned int *dma_channel_id,
 			     unsigned int *dma_id);
+
+void fsl_asoc_get_pll_clocks(struct device *dev, struct clk **pll8k_clk,
+			     struct clk **pll11k_clk);
+
+void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
+				  struct clk *pll8k_clk,
+				  struct clk *pll11k_clk, u64 ratio);
 #endif /* _FSL_UTILS_H */
-- 
2.17.1

