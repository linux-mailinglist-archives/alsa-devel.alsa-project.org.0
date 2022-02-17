Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4804BA198
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Feb 2022 14:45:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 292AB1939;
	Thu, 17 Feb 2022 14:45:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 292AB1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645105550;
	bh=fbmMMzBDT47jI6xuA0JqpXYdamWqCLgSb1/sJJQyxqk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=W/CGc5HTbfb0/i0uuk5X8qmmQRhCTVbAINaXMYuM9GYievfaD9tqFwzHmjyh4KCp6
	 rTkeqdB8DmC9UqzoaoZPWUoUmi7N++BpWV6FYB1w4pV3DqWRDgStqPgfQskgyIQjbn
	 vPccsVb2l06b921W29h5sTxuTS+lTJGcQA+zLhaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D7E0F8053C;
	Thu, 17 Feb 2022 14:42:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2B3CF8051C; Thu, 17 Feb 2022 14:42:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 45161F80508
 for <alsa-devel@alsa-project.org>; Thu, 17 Feb 2022 14:42:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 45161F80508
X-UUID: 9287c66b22a8421bac5ded8cc04bb237-20220217
X-UUID: 9287c66b22a8421bac5ded8cc04bb237-20220217
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1550400994; Thu, 17 Feb 2022 21:42:24 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Thu, 17 Feb 2022 21:42:23 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 21:42:22 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
Subject: [v2 11/17] ASoC: mediatek: mt8186: support gpio control in platform
 driver
Date: Thu, 17 Feb 2022 21:41:59 +0800
Message-ID: <20220217134205.15400-12-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
References: <20220217134205.15400-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 geert+renesas@glider.be, linux-kernel@vger.kernel.org, zhangqilong3@huawei.com,
 tiwai@suse.com, lgirdwood@gmail.com, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 tzungbi@google.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 trevor.wu@mediatek.com, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 aaronyu@google.com, linux-arm-kernel@lists.infradead.org
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

This patch add gpio control for all audio interface separately.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c | 210 ++++++++++++++++++++
 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h |  19 ++
 2 files changed, 229 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
 create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-gpio.h

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
new file mode 100644
index 000000000000..6faec5c95bf3
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// mt8186-afe-gpio.c  --  Mediatek 8186 afe gpio ctrl
+//
+// Copyright (c) 2022 MediaTek Inc.
+// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+
+#include <linux/gpio.h>
+#include <linux/pinctrl/consumer.h>
+
+#include "mt8186-afe-common.h"
+#include "mt8186-afe-gpio.h"
+
+struct pinctrl *aud_pinctrl;
+
+enum mt8186_afe_gpio {
+	MT8186_AFE_GPIO_CLK_MOSI_OFF,
+	MT8186_AFE_GPIO_CLK_MOSI_ON,
+	MT8186_AFE_GPIO_CLK_MISO_OFF,
+	MT8186_AFE_GPIO_CLK_MISO_ON,
+	MT8186_AFE_GPIO_DAT_MISO_OFF,
+	MT8186_AFE_GPIO_DAT_MISO_ON,
+	MT8186_AFE_GPIO_DAT_MOSI_OFF,
+	MT8186_AFE_GPIO_DAT_MOSI_ON,
+	MT8186_AFE_GPIO_I2S0_OFF,
+	MT8186_AFE_GPIO_I2S0_ON,
+	MT8186_AFE_GPIO_I2S1_OFF,
+	MT8186_AFE_GPIO_I2S1_ON,
+	MT8186_AFE_GPIO_I2S2_OFF,
+	MT8186_AFE_GPIO_I2S2_ON,
+	MT8186_AFE_GPIO_I2S3_OFF,
+	MT8186_AFE_GPIO_I2S3_ON,
+	MT8186_AFE_GPIO_TDM_OFF,
+	MT8186_AFE_GPIO_TDM_ON,
+	MT8186_AFE_GPIO_PCM_OFF,
+	MT8186_AFE_GPIO_PCM_ON,
+	MT8186_AFE_GPIO_GPIO_NUM
+};
+
+struct audio_gpio_attr {
+	const char *name;
+	bool gpio_prepare;
+	struct pinctrl_state *gpioctrl;
+};
+
+static struct audio_gpio_attr aud_gpios[MT8186_AFE_GPIO_GPIO_NUM] = {
+	[MT8186_AFE_GPIO_CLK_MOSI_OFF] = {"aud_clk_mosi_off", false, NULL},
+	[MT8186_AFE_GPIO_CLK_MOSI_ON] = {"aud_clk_mosi_on", false, NULL},
+	[MT8186_AFE_GPIO_CLK_MISO_OFF] = {"aud_clk_miso_off", false, NULL},
+	[MT8186_AFE_GPIO_CLK_MISO_ON] = {"aud_clk_miso_on", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MISO_OFF] = {"aud_dat_miso_off", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MISO_ON] = {"aud_dat_miso_on", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MOSI_OFF] = {"aud_dat_mosi_off", false, NULL},
+	[MT8186_AFE_GPIO_DAT_MOSI_ON] = {"aud_dat_mosi_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S0_OFF] = {"aud_gpio_i2s0_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S0_ON] = {"aud_gpio_i2s0_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S1_OFF] = {"aud_gpio_i2s1_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S1_ON] = {"aud_gpio_i2s1_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S2_OFF] = {"aud_gpio_i2s2_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S2_ON] = {"aud_gpio_i2s2_on", false, NULL},
+	[MT8186_AFE_GPIO_I2S3_OFF] = {"aud_gpio_i2s3_off", false, NULL},
+	[MT8186_AFE_GPIO_I2S3_ON] = {"aud_gpio_i2s3_on", false, NULL},
+	[MT8186_AFE_GPIO_TDM_OFF] = {"aud_gpio_tdm_off", false, NULL},
+	[MT8186_AFE_GPIO_TDM_ON] = {"aud_gpio_tdm_on", false, NULL},
+	[MT8186_AFE_GPIO_PCM_OFF] = {"aud_gpio_pcm_off", false, NULL},
+	[MT8186_AFE_GPIO_PCM_ON] = {"aud_gpio_pcm_on", false, NULL},
+};
+
+static DEFINE_MUTEX(gpio_request_mutex);
+
+int mt8186_afe_gpio_init(struct device *dev)
+{
+	int ret;
+	int i = 0;
+
+	aud_pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(aud_pinctrl)) {
+		ret = PTR_ERR(aud_pinctrl);
+		dev_info(dev, "%s(), ret %d, cannot get aud_pinctrl!\n",
+			 __func__, ret);
+		return -ENODEV;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(aud_gpios); i++) {
+		aud_gpios[i].gpioctrl = pinctrl_lookup_state(aud_pinctrl,
+							     aud_gpios[i].name);
+		if (IS_ERR(aud_gpios[i].gpioctrl)) {
+			ret = PTR_ERR(aud_gpios[i].gpioctrl);
+			dev_info(dev, "%s(), pinctrl_lookup_state %s fail, ret %d\n",
+				 __func__, aud_gpios[i].name, ret);
+		} else {
+			aud_gpios[i].gpio_prepare = true;
+		}
+	}
+
+	/* gpio status init */
+	mt8186_afe_gpio_request(dev, false, MT8186_DAI_ADDA, 0);
+	mt8186_afe_gpio_request(dev, false, MT8186_DAI_ADDA, 1);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8186_afe_gpio_init);
+
+static int mt8186_afe_gpio_select(struct device *dev,
+				  enum mt8186_afe_gpio type)
+{
+	int ret = 0;
+
+	if (type < 0 || type >= MT8186_AFE_GPIO_GPIO_NUM) {
+		dev_info(dev, "%s(), error, invalid gpio type %d\n",
+			 __func__, type);
+		return -EINVAL;
+	}
+
+	if (!aud_gpios[type].gpio_prepare) {
+		dev_info(dev, "%s(), error, gpio type %d not prepared\n",
+			 __func__, type);
+		return -EIO;
+	}
+
+	ret = pinctrl_select_state(aud_pinctrl,
+				   aud_gpios[type].gpioctrl);
+	if (ret)
+		dev_info(dev, "%s(), error, can not set gpio type %d\n",
+			 __func__, type);
+
+	return ret;
+}
+
+static int mt8186_afe_gpio_adda_dl(struct device *dev, bool enable)
+{
+	if (enable) {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_ON);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_ON);
+	} else {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MOSI_OFF);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MOSI_OFF);
+	}
+
+	return 0;
+}
+
+static int mt8186_afe_gpio_adda_ul(struct device *dev, bool enable)
+{
+	if (enable) {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_ON);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_ON);
+	} else {
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_DAT_MISO_OFF);
+		mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_CLK_MISO_OFF);
+	}
+
+	return 0;
+}
+
+int mt8186_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink)
+{
+	mutex_lock(&gpio_request_mutex);
+	switch (dai) {
+	case MT8186_DAI_ADDA:
+		if (uplink)
+			mt8186_afe_gpio_adda_ul(dev, enable);
+		else
+			mt8186_afe_gpio_adda_dl(dev, enable);
+		break;
+	case MT8186_DAI_I2S_0:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S0_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S0_OFF);
+		break;
+	case MT8186_DAI_I2S_1:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S1_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S1_OFF);
+		break;
+	case MT8186_DAI_I2S_2:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S2_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S2_OFF);
+		break;
+	case MT8186_DAI_I2S_3:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S3_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_I2S3_OFF);
+		break;
+	case MT8186_DAI_TDM_IN:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_TDM_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_TDM_OFF);
+		break;
+	case MT8186_DAI_PCM:
+		if (enable)
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_PCM_ON);
+		else
+			mt8186_afe_gpio_select(dev, MT8186_AFE_GPIO_PCM_OFF);
+		break;
+	default:
+		mutex_unlock(&gpio_request_mutex);
+		dev_info(dev, "%s(), invalid dai %d\n", __func__, dai);
+		return -EINVAL;
+	}
+	mutex_unlock(&gpio_request_mutex);
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
new file mode 100644
index 000000000000..1ddc27838eb1
--- /dev/null
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-gpio.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * mt6833-afe-gpio.h  --  Mediatek 6833 afe gpio ctrl definition
+ *
+ * Copyright (c) 2022 MediaTek Inc.
+ * Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
+ */
+
+#ifndef _MT8186_AFE_GPIO_H_
+#define _MT8186_AFE_GPIO_H_
+
+struct mtk_base_afe;
+
+int mt8186_afe_gpio_init(struct device *dev);
+
+int mt8186_afe_gpio_request(struct device *dev, bool enable,
+			    int dai, int uplink);
+
+#endif
-- 
2.18.0

