Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 418C84C42F7
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 11:58:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E354C190A;
	Fri, 25 Feb 2022 11:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E354C190A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645786716;
	bh=89rqm2ifmXySPHLeCbez15+jooeI8OGyebGAjDHwiUY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DTPGjUidX7yzjZlXbvnxUnuV3lIDNd+fKqZvkJANr5ihdNI5rl4fZHcGcR4O9LdN4
	 sfDZBOoSWwe9+Mmh5eIQuewxz2SS9MqI5yaHnllx2uzbtX/YvP6QfZKZDduUTDPnzp
	 sYYqM0lDUG5ZPpT+vYHN1kCbIMewDiIDCxATHCbM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC0AF80508;
	Fri, 25 Feb 2022 11:57:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B86EF80508; Fri, 25 Feb 2022 11:57:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
 (using TLSv1.2 with cipher AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B73A5F8012F
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 11:57:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B73A5F8012F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=quicinc.com header.i=@quicinc.com
 header.b="aA0fRW2a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1645786652; x=1677322652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version;
 bh=SiHQCH1t2VGFpgGH5/43EAPqiUo7itw6h3cU99it5dk=;
 b=aA0fRW2aKB/Lp6Ymwe01QfdYQKZN2hEu+GSobWKjJBQf6iFAy4iJeqOX
 7Dk8pHqhQH99PH3U5U8OhyZ56B7LYX/NQY6xw8JYxfbkA2KT0ELLnHBee
 ZAyb4seSt9RX88vx7tvyqiiQk8SEsGd/QbZ6VlEyvjoAMnk+WiSEJMNuW I=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
 by alexa-out.qualcomm.com with ESMTP; 25 Feb 2022 02:57:28 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 02:57:27 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 02:57:26 -0800
Received: from hu-srivasam-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 25 Feb 2022 02:57:21 -0800
From: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
To: <agross@kernel.org>, <bjorn.andersson@linaro.org>, <lgirdwood@gmail.com>, 
 <broonie@kernel.org>, <robh+dt@kernel.org>, <quic_plai@quicinc.com>,
 <bgoswami@codeaurora.org>, <perex@perex.cz>, <tiwai@suse.com>,
 <srinivas.kandagatla@linaro.org>, <rohitkr@codeaurora.org>,
 <linux-arm-msm@vger.kernel.org>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <swboyd@chromium.org>, <judyhsiao@chromium.org>
Subject: [PATCH v4 1/2] ASoC: codecs: Add power domains support in digital
 macro codecs
Date: Fri, 25 Feb 2022 16:27:03 +0530
Message-ID: <1645786624-12311-2-git-send-email-quic_srivasam@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
References: <1645786624-12311-1-git-send-email-quic_srivasam@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Cc: Venkata Prasad Potturu <quic_potturu@quicinc.com>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

Add support for enabling required power domains in digital macro codecs.
macro and dcodec power domains are being requested as clocks by HLOS
in ADSP based architectures and ADSP internally handling as powerdomains.
In ADSP bypass case need to handle them as power domains explicitly.

Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
Co-developed-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Signed-off-by: Venkata Prasad Potturu <quic_potturu@quicinc.com>
Reported-by: kernel test robot <lkp@intel.com>
---
 sound/soc/codecs/Kconfig              |  7 ++++
 sound/soc/codecs/Makefile             |  2 ++
 sound/soc/codecs/lpass-macro-common.c | 67 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/lpass-macro-common.h | 17 +++++++++
 sound/soc/codecs/lpass-rx-macro.c     | 13 ++++++-
 sound/soc/codecs/lpass-tx-macro.c     | 10 ++++++
 sound/soc/codecs/lpass-va-macro.c     | 11 +++++-
 sound/soc/qcom/Kconfig                |  1 +
 8 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/codecs/lpass-macro-common.c
 create mode 100644 sound/soc/codecs/lpass-macro-common.h

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index c2627f7..4de029a 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -244,6 +244,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_WCD9335
 	imply SND_SOC_WCD934X
 	imply SND_SOC_WCD938X_SDW
+	imply SND_SOC_LPASS_MACRO_COMMON
 	imply SND_SOC_LPASS_RX_MACRO
 	imply SND_SOC_LPASS_TX_MACRO
 	imply SND_SOC_WL1273
@@ -2008,6 +2009,9 @@ config SND_SOC_TPA6130A2
 	tristate "Texas Instruments TPA6130A2 headphone amplifier"
 	depends on I2C
 
+config SND_SOC_LPASS_MACRO_COMMON
+        tristate
+
 config SND_SOC_LPASS_WSA_MACRO
 	depends on COMMON_CLK
 	select REGMAP_MMIO
@@ -2016,16 +2020,19 @@ config SND_SOC_LPASS_WSA_MACRO
 config SND_SOC_LPASS_VA_MACRO
 	depends on COMMON_CLK
 	select REGMAP_MMIO
+	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm VA Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_RX_MACRO
 	depends on COMMON_CLK
 	select REGMAP_MMIO
+	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm RX Macro in LPASS(Low Power Audio SubSystem)"
 
 config SND_SOC_LPASS_TX_MACRO
 	depends on COMMON_CLK
 	select REGMAP_MMIO
+	select SND_SOC_LPASS_MACRO_COMMON
 	tristate "Qualcomm TX Macro in LPASS(Low Power Audio SubSystem)"
 
 endmenu
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index b4e11c3..c3c6059 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -112,6 +112,7 @@ snd-soc-l3-objs := l3.o
 snd-soc-lm4857-objs := lm4857.o
 snd-soc-lm49453-objs := lm49453.o
 snd-soc-lochnagar-sc-objs := lochnagar-sc.o
+snd-soc-lpass-macro-common-objs := lpass-macro-common.o
 snd-soc-lpass-rx-macro-objs := lpass-rx-macro.o
 snd-soc-lpass-tx-macro-objs := lpass-tx-macro.o
 snd-soc-lpass-wsa-macro-objs := lpass-wsa-macro.o
@@ -676,6 +677,7 @@ obj-$(CONFIG_SND_SOC_MAX9877)	+= snd-soc-max9877.o
 obj-$(CONFIG_SND_SOC_MAX98504)	+= snd-soc-max98504.o
 obj-$(CONFIG_SND_SOC_SIMPLE_AMPLIFIER)	+= snd-soc-simple-amplifier.o
 obj-$(CONFIG_SND_SOC_TPA6130A2)	+= snd-soc-tpa6130a2.o
+obj-$(CONFIG_SND_SOC_LPASS_MACRO_COMMON)	+= snd-soc-lpass-macro-common.o
 obj-$(CONFIG_SND_SOC_LPASS_WSA_MACRO)	+= snd-soc-lpass-wsa-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_VA_MACRO)	+= snd-soc-lpass-va-macro.o
 obj-$(CONFIG_SND_SOC_LPASS_RX_MACRO)	+= snd-soc-lpass-rx-macro.o
diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
new file mode 100644
index 0000000..6cede75
--- /dev/null
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2022, The Linux Foundation. All rights reserved.
+
+#include <linux/export.h>
+#include <linux/module.h>
+#include <linux/init.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "lpass-macro-common.h"
+
+struct lpass_macro *lpass_macro_pds_init(struct device *dev)
+{
+	struct lpass_macro *l_pds;
+	int ret;
+
+	if (!of_find_property(dev->of_node, "power-domains", NULL))
+		return NULL;
+
+	l_pds = devm_kzalloc(dev, sizeof(*l_pds), GFP_KERNEL);
+	if (!l_pds)
+		return ERR_PTR(-ENOMEM);
+
+	l_pds->macro_pd = dev_pm_domain_attach_by_name(dev, "macro");
+	if (IS_ERR_OR_NULL(l_pds->macro_pd))
+		return NULL;
+
+	ret = pm_runtime_get_sync(l_pds->macro_pd);
+	if (ret < 0) {
+		pm_runtime_put_noidle(l_pds->macro_pd);
+		goto macro_err;
+	}
+
+	l_pds->dcodec_pd = dev_pm_domain_attach_by_name(dev, "dcodec");
+	if (IS_ERR_OR_NULL(l_pds->dcodec_pd))
+		goto dcodec_err;
+
+	ret = pm_runtime_get_sync(l_pds->dcodec_pd);
+	if (ret < 0) {
+		pm_runtime_put_noidle(l_pds->dcodec_pd);
+		goto dcodec_sync_err;
+	}
+	return l_pds;
+
+dcodec_sync_err:
+	dev_pm_domain_detach(l_pds->dcodec_pd, false);
+dcodec_err:
+	pm_runtime_put(l_pds->macro_pd);
+macro_err:
+	dev_pm_domain_detach(l_pds->macro_pd, false);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(lpass_macro_pds_init);
+
+void lpass_macro_pds_exit(struct lpass_macro *pds)
+{
+	pm_runtime_put(pds->macro_pd);
+	dev_pm_domain_detach(pds->macro_pd, false);
+	pm_runtime_put(pds->dcodec_pd);
+	dev_pm_domain_detach(pds->dcodec_pd, false);
+}
+EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
+
+MODULE_DESCRIPTION("Common macro driver");
+MODULE_LICENSE("GPL");
diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
new file mode 100644
index 0000000..f2cbf9f
--- /dev/null
+++ b/sound/soc/codecs/lpass-macro-common.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __LPASS_MACRO_COMMON_H__
+#define __LPASS_MACRO_COMMON_H__
+
+struct lpass_macro {
+	struct device *macro_pd;
+	struct device *dcodec_pd;
+};
+
+struct lpass_macro *lpass_macro_pds_init(struct device *dev);
+void lpass_macro_pds_exit(struct lpass_macro *pds);
+
+#endif /* __LPASS_MACRO_COMMON_H__ */
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 29d214f..4ba5876 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -14,6 +14,8 @@
 #include <linux/of_clk.h>
 #include <linux/clk-provider.h>
 
+#include "lpass-macro-common.h"
+
 #define CDC_RX_TOP_TOP_CFG0		(0x0000)
 #define CDC_RX_TOP_SWR_CTRL		(0x0008)
 #define CDC_RX_TOP_DEBUG		(0x000C)
@@ -606,7 +608,7 @@ struct rx_macro {
 	int is_softclip_on;
 	int is_aux_hpf_on;
 	int softclip_clk_users;
-
+	struct lpass_macro *pds;
 	struct regmap *regmap;
 	struct clk_bulk_data clks[RX_NUM_CLKS_MAX];
 	struct clk_hw hw;
@@ -3537,6 +3539,12 @@ static int rx_macro_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	rx->pds = lpass_macro_pds_init(dev);
+	if (!rx->pds) {
+		dev_err(dev, "Enabling power domains failed in %s\n", __func__);
+		return ret;
+	}
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -3575,6 +3583,9 @@ static int rx_macro_remove(struct platform_device *pdev)
 
 	of_clk_del_provider(pdev->dev.of_node);
 	clk_bulk_disable_unprepare(RX_NUM_CLKS_MAX, rx->clks);
+
+	lpass_macro_pds_exit(rx->pds);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 9c96ab1..7938bf3 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -13,6 +13,8 @@
 #include <linux/of_clk.h>
 #include <linux/clk-provider.h>
 
+#include "lpass-macro-common.h"
+
 #define CDC_TX_CLK_RST_CTRL_MCLK_CONTROL (0x0000)
 #define CDC_TX_MCLK_EN_MASK		BIT(0)
 #define CDC_TX_MCLK_ENABLE		BIT(0)
@@ -266,6 +268,7 @@ struct tx_macro {
 	u16 dmic_clk_div;
 	bool bcs_enable;
 	int dec_mode[NUM_DECIMATORS];
+	struct lpass_macro *pds;
 	bool bcs_clk_en;
 };
 #define to_tx_macro(_hw) container_of(_hw, struct tx_macro, hw)
@@ -1802,6 +1805,11 @@ static int tx_macro_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	tx->pds = lpass_macro_pds_init(dev);
+	if (!tx->pds) {
+		dev_err(dev, "Enabling power domains failed in %s\n", __func__);
+		return ret;
+	}
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -1859,6 +1867,8 @@ static int tx_macro_remove(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(TX_NUM_CLKS_MAX, tx->clks);
 
+	lpass_macro_pds_exit(tx->pds);
+
 	return 0;
 }
 
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 11147e3..748ef44 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -15,6 +15,8 @@
 #include <sound/soc-dapm.h>
 #include <sound/tlv.h>
 
+#include "lpass-macro-common.h"
+
 /* VA macro registers */
 #define CDC_VA_CLK_RST_CTRL_MCLK_CONTROL	(0x0000)
 #define CDC_VA_MCLK_CONTROL_EN			BIT(0)
@@ -195,6 +197,7 @@ struct va_macro {
 	struct regmap *regmap;
 	struct clk_bulk_data clks[VA_NUM_CLKS_MAX];
 	struct clk_hw hw;
+	struct lpass_macro *pds;
 
 	s32 dmic_0_1_clk_cnt;
 	s32 dmic_2_3_clk_cnt;
@@ -1413,7 +1416,11 @@ static int va_macro_probe(struct platform_device *pdev)
 		dev_err(dev, "Error getting VA Clocks (%d)\n", ret);
 		return ret;
 	}
-
+	va->pds = lpass_macro_pds_init(dev);
+	if (!va->pds) {
+		dev_err(dev, "Enabling power domains failed %s\n", __func__);
+		return ret;
+	}
 	ret = of_property_read_u32(dev->of_node, "qcom,dmic-sample-rate",
 				   &sample_rate);
 	if (ret) {
@@ -1468,6 +1475,8 @@ static int va_macro_remove(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(VA_NUM_CLKS_MAX, va->clks);
 
+	lpass_macro_pds_exit(va->pds);
+
 	return 0;
 }
 
diff --git a/sound/soc/qcom/Kconfig b/sound/soc/qcom/Kconfig
index 52db003..6ffd51a 100644
--- a/sound/soc/qcom/Kconfig
+++ b/sound/soc/qcom/Kconfig
@@ -194,6 +194,7 @@ config SND_SOC_SC7280
 	select SND_SOC_LPASS_SC7280
 	select SND_SOC_MAX98357A
 	select SND_SOC_WCD938X
+	select SND_SOC_LPASS_MACRO_COMMON
 	select SND_SOC_LPASS_RX_MACRO
 	select SND_SOC_LPASS_TX_MACRO
 	help
-- 
2.7.4

