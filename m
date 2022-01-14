Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E82B48E96C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jan 2022 12:48:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E25A1AFC;
	Fri, 14 Jan 2022 12:47:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E25A1AFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642160905;
	bh=sg5VhLDO/PBaH0SlbO5esYsZAbsmNfmGHY1XgZBRtss=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MoHAP0wsnl4KVpjGzBbqT6nx14gcI5+3Zt8Yj1l+gS5uUKhFtKf0xMl9Rj4bHVRea
	 wRav+szKEG5YEjX9cGKAyvtjHUdFiTsZVpFzERplDJouL2NLsnm6FgfJCBKXLB68lE
	 FLVgdkRsgs+ytYdtbxOqSOKmCswjTZ77CEnXM5Y8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31EB7F8030F;
	Fri, 14 Jan 2022 12:47:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C35F6F80054; Fri, 14 Jan 2022 12:46:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1D794F80054;
 Fri, 14 Jan 2022 12:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1D794F80054
X-UUID: 33cb9fd3b9eb4bbea6ea3613adc6d737-20220114
X-UUID: 33cb9fd3b9eb4bbea6ea3613adc6d737-20220114
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 320804066; Fri, 14 Jan 2022 19:46:37 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 14 Jan 2022 19:46:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Jan 2022 19:46:35 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v14 2/2] mailbox: mediatek: add support for adsp mailbox
 controller
Date: Fri, 14 Jan 2022 19:46:33 +0800
Message-ID: <20220114114633.742-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220114114633.742-1-allen-kh.cheng@mediatek.com>
References: <20220114114633.742-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com, Mark
 Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-kernel@vger.kernel.org,
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

From: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>

This patch is to for MediaTek ADSP IPC mailbox controller driver
It is used to send short messages between processors with adsp

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: YC Hung <yc.hung@mediatek.com>
Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/mailbox/Kconfig            |   7 ++
 drivers/mailbox/Makefile           |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c | 175 +++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index d9cd3606040e..3e5bb745437d 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -238,6 +238,13 @@ config STM32_IPCC
 	  with hardware for Inter-Processor Communication Controller (IPCC)
 	  between processors. Say Y here if you want to have this support.
 
+config MTK_ADSP_MBOX
+	tristate "MediaTek ADSP Mailbox Controller"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for MediaTek ADSP mailbox controller
+	  driver. It is used to send short messages between processors with dsp.
+
 config MTK_CMDQ_MBOX
 	tristate "MediaTek CMDQ Mailbox Support"
 	depends on ARCH_MEDIATEK || COMPILE_TEST
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 338cc05e5431..fc9376117111 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -49,6 +49,8 @@ obj-$(CONFIG_TEGRA_HSP_MBOX)	+= tegra-hsp.o
 
 obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
+obj-$(CONFIG_MTK_ADSP_MBOX)	+= mtk-adsp-mailbox.o
+
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
new file mode 100644
index 000000000000..0613a2befca5
--- /dev/null
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -0,0 +1,175 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
+ * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+ */
+
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+struct mtk_adsp_mbox_priv {
+	struct device *dev;
+	struct mbox_controller mbox;
+	void __iomem *va_mboxreg;
+	const struct mtk_adsp_mbox_cfg *cfg;
+};
+
+struct mtk_adsp_mbox_cfg {
+	u32 set_in;
+	u32 set_out;
+	u32 clr_in;
+	u32 clr_out;
+};
+
+static struct mtk_adsp_mbox_priv *get_mtk_adsp_mbox_priv(struct mbox_controller *mbox)
+{
+	return container_of(mbox, struct mtk_adsp_mbox_priv, mbox);
+}
+
+static irqreturn_t mtk_adsp_mbox_irq(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+	u32 op = readl(priv->va_mboxreg + priv->cfg->set_out);
+
+	writel(op, priv->va_mboxreg + priv->cfg->clr_out);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_adsp_mbox_isr(int irq, void *data)
+{
+	struct mbox_chan *chan = data;
+
+	mbox_chan_received_data(chan, NULL);
+
+	return IRQ_HANDLED;
+}
+
+static struct mbox_chan *mtk_adsp_mbox_xlate(struct mbox_controller *mbox,
+					     const struct of_phandle_args *sp)
+{
+	return mbox->chans;
+}
+
+static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+
+	/* Clear ADSP mbox command */
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
+
+	return 0;
+}
+
+static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+
+	/* Clear ADSP mbox command */
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_in);
+	writel(0xFFFFFFFF, priv->va_mboxreg + priv->cfg->clr_out);
+}
+
+static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+	u32 *msg = data;
+
+	writel(*msg, priv->va_mboxreg + priv->cfg->set_in);
+
+	return 0;
+}
+
+static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct mtk_adsp_mbox_priv *priv = get_mtk_adsp_mbox_priv(chan->mbox);
+
+	return readl(priv->va_mboxreg + priv->cfg->set_in) == 0;
+}
+
+static const struct mbox_chan_ops mtk_adsp_mbox_chan_ops = {
+	.send_data	= mtk_adsp_mbox_send_data,
+	.startup	= mtk_adsp_mbox_startup,
+	.shutdown	= mtk_adsp_mbox_shutdown,
+	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
+};
+
+static int mtk_adsp_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_mbox_priv *priv;
+	const struct mtk_adsp_mbox_cfg *cfg;
+	struct mbox_controller *mbox;
+	int ret, irq;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mbox = &priv->mbox;
+	mbox->dev = dev;
+	mbox->ops = &mtk_adsp_mbox_chan_ops;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = true;
+	mbox->of_xlate = mtk_adsp_mbox_xlate;
+	mbox->num_chans = 1;
+	mbox->chans = devm_kzalloc(dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	priv->va_mboxreg = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->va_mboxreg))
+		return PTR_ERR(priv->va_mboxreg);
+
+	cfg = of_device_get_match_data(dev);
+	if (!cfg)
+		return -EINVAL;
+	priv->cfg = cfg;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq, mtk_adsp_mbox_irq,
+					mtk_adsp_mbox_isr, IRQF_TRIGGER_NONE,
+					dev_name(dev), mbox->chans);
+	if (ret < 0)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	return devm_mbox_controller_register(dev, &priv->mbox);
+}
+
+static const struct mtk_adsp_mbox_cfg mt8195_adsp_mbox_cfg = {
+	.set_in		= 0x00,
+	.set_out	= 0x1c,
+	.clr_in		= 0x04,
+	.clr_out	= 0x20,
+};
+
+static const struct of_device_id mtk_adsp_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt8195-adsp-mbox", .data = &mt8195_adsp_mbox_cfg },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_adsp_mbox_of_match);
+
+static struct platform_driver mtk_adsp_mbox_driver = {
+	.probe		= mtk_adsp_mbox_probe,
+	.driver = {
+		.name	= "mtk_adsp_mbox",
+		.of_match_table = mtk_adsp_mbox_of_match,
+	},
+};
+module_platform_driver(mtk_adsp_mbox_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP Mailbox Controller");
-- 
2.18.0

