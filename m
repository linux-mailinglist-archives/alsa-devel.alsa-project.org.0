Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B009445B6E6
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Nov 2021 09:47:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4510F17B1;
	Wed, 24 Nov 2021 09:46:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4510F17B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637743666;
	bh=xFowhHqgwfw1zCSbq5iMEmcXDmK1QrBn7opng3A72pc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OXC7dzJkFojbLkdcqTkVxh9Py5As8YSn1Bz9SCzh9g/0LaKY9XoiSw9NOUupZZ9wN
	 tzkmObYppMby7g1r2/t8sdXZGXPOIu4FJChi7ymFZ0qjlGKkz1K33CjzndqMsUHBGM
	 fs4jEWDWIulfkMPRpciYVBtxX+wLNaHsKM0W6Lt0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DE19F804B4;
	Wed, 24 Nov 2021 09:46:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 661CFF80245; Wed, 24 Nov 2021 09:46:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0016F8014D;
 Wed, 24 Nov 2021 09:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0016F8014D
X-UUID: cf7f57e4cdda4aa7ba59c7f3600478d1-20211124
X-UUID: cf7f57e4cdda4aa7ba59c7f3600478d1-20211124
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <allen-kh.cheng@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 451740097; Wed, 24 Nov 2021 16:45:43 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 24 Nov 2021 16:45:42 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Nov 2021 16:45:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 24 Nov 2021 16:45:41 +0800
From: allen-kh.cheng <allen-kh.cheng@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
Date: Wed, 24 Nov 2021 16:45:13 +0800
Message-ID: <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
Cc: devicetree@vger.kernel.org, Linux-ALSA <alsa-devel@alsa-project.org>,
 Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, cujomalainey@google.com,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com, Mark
 Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Baluta <daniel.baluta@nxp.com>, linux-arm-kernel@lists.infradead.org,
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

Signed-off-by: Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>
---
 drivers/mailbox/Kconfig            |   7 ++
 drivers/mailbox/Makefile           |   2 +
 drivers/mailbox/mtk-adsp-mailbox.c | 187 +++++++++++++++++++++++++++++
 3 files changed, 196 insertions(+)
 create mode 100644 drivers/mailbox/mtk-adsp-mailbox.c

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index c9fc06c7e685..fc99d9fc80af 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -236,6 +236,13 @@ config MTK_CMDQ_MBOX
 	  critical time limitation, such as updating display configuration
 	  during the vblank.
 
+config MTK_ADSP_IPC_MBOX
+	tristate "MediaTek ADSP Mailbox Controller"
+	depends on ARCH_MEDIATEK || COMPILE_TEST
+	help
+	  Say yes here to add support for MediaTek ADSP IPC mailbox controller
+	  driver. It is used to send short messages between processors with dsp.
+
 config ZYNQMP_IPI_MBOX
 	bool "Xilinx ZynqMP IPI Mailbox"
 	depends on ARCH_ZYNQMP && OF
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index c2089f04887e..479a9ae56d5e 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -51,6 +51,8 @@ obj-$(CONFIG_STM32_IPCC) 	+= stm32-ipcc.o
 
 obj-$(CONFIG_MTK_CMDQ_MBOX)	+= mtk-cmdq-mailbox.o
 
+obj-$(CONFIG_MTK_ADSP_IPC_MBOX)	+= mtk-adsp-mailbox.o
+
 obj-$(CONFIG_ZYNQMP_IPI_MBOX)	+= zynqmp-ipi-mailbox.o
 
 obj-$(CONFIG_SUN6I_MSGBOX)	+= sun6i-msgbox.o
diff --git a/drivers/mailbox/mtk-adsp-mailbox.c b/drivers/mailbox/mtk-adsp-mailbox.c
new file mode 100644
index 000000000000..b814b003aeb2
--- /dev/null
+++ b/drivers/mailbox/mtk-adsp-mailbox.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2021 MediaTek Corporation. All rights reserved.
+ * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+ */
+
+#include <linux/firmware/mediatek/mtk-adsp-ipc.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/slab.h>
+
+/* adsp mbox register offset */
+#define MTK_ADSP_MBOX_IN_CMD 0x00
+#define MTK_ADSP_MBOX_IN_CMD_CLR 0x04
+#define MTK_ADSP_MBOX_OUT_CMD 0x1c
+#define MTK_ADSP_MBOX_OUT_CMD_CLR 0x20
+#define MTK_ADSP_MBOX_IN_MSG0 0x08
+#define MTK_ADSP_MBOX_IN_MSG1 0x0C
+#define MTK_ADSP_MBOX_OUT_MSG0 0x24
+#define MTK_ADSP_MBOX_OUT_MSG1 0x28
+
+struct mtk_adsp_mbox_priv {
+	struct device *dev;
+	struct mbox_controller mbox;
+	void __iomem *va_mboxreg;
+};
+
+static irqreturn_t mtk_adsp_ipc_irq_handler(int irq, void *data)
+{
+	struct mbox_chan *ch = (struct mbox_chan *)data;
+	struct adsp_mbox_ch_info *ch_info = ch->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+	u32 op = readl(reg + MTK_ADSP_MBOX_OUT_CMD);
+
+	writel(op, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static irqreturn_t mtk_adsp_ipc_handler(int irq, void *data)
+{
+	struct mbox_chan *ch = (struct mbox_chan *)data;
+	struct adsp_mbox_ch_info *ch_info = ch->con_priv;
+
+	mbox_chan_received_data(ch, ch_info);
+
+	return IRQ_HANDLED;
+}
+
+static struct mbox_chan *mtk_adsp_mbox_xlate(struct mbox_controller *mbox,
+					     const struct of_phandle_args *sp)
+{
+	return &mbox->chans[sp->args[0]];
+}
+
+static int mtk_adsp_mbox_startup(struct mbox_chan *chan)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+
+	/* Clear DSP mbox command */
+	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_IN_CMD_CLR);
+	writel(0xFFFFFFFF, reg + MTK_ADSP_MBOX_OUT_CMD_CLR);
+
+	return 0;
+}
+
+static void mtk_adsp_mbox_shutdown(struct mbox_chan *chan)
+{
+	chan->con_priv = NULL;
+}
+
+static int mtk_adsp_mbox_send_data(struct mbox_chan *chan, void *data)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+
+	spin_lock(&ch_info->lock);
+	writel(ch_info->ipc_op_val, reg + MTK_ADSP_MBOX_IN_CMD);
+	spin_unlock(&ch_info->lock);
+
+	return 0;
+}
+
+static bool mtk_adsp_mbox_last_tx_done(struct mbox_chan *chan)
+{
+	struct adsp_mbox_ch_info *ch_info = chan->con_priv;
+	void __iomem *reg = ch_info->va_reg;
+	u32 op = readl(reg + MTK_ADSP_MBOX_IN_CMD);
+
+	return (op == 0) ? true : false;
+}
+
+static const struct mbox_chan_ops adsp_mbox_chan_ops = {
+	.send_data	= mtk_adsp_mbox_send_data,
+	.startup	= mtk_adsp_mbox_startup,
+	.shutdown	= mtk_adsp_mbox_shutdown,
+	.last_tx_done	= mtk_adsp_mbox_last_tx_done,
+};
+
+static int mtk_adsp_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mbox_controller *mbox;
+	struct mtk_adsp_mbox_priv *priv;
+	struct resource *res;
+	struct adsp_mbox_ch_info *ch_info;
+	u32 size;
+	int ret;
+	int irq;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	mbox = &priv->mbox;
+	mbox->dev = dev;
+	mbox->ops = &adsp_mbox_chan_ops;
+	mbox->txdone_irq = false;
+	mbox->txdone_poll = true;
+	mbox->of_xlate = mtk_adsp_mbox_xlate;
+	mbox->num_chans = 1;
+	mbox->chans = devm_kzalloc(mbox->dev, sizeof(*mbox->chans), GFP_KERNEL);
+	if (!mbox->chans)
+		return -ENOMEM;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "no adsp mbox register resource\n");
+		return -ENXIO;
+	}
+
+	size = resource_size(res);
+	priv->va_mboxreg = devm_ioremap(dev, (phys_addr_t)res->start, size);
+	if (IS_ERR(priv->va_mboxreg))
+		return PTR_ERR(priv->va_mboxreg);
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_threaded_irq(dev, irq,
+					mtk_adsp_ipc_irq_handler, mtk_adsp_ipc_handler,
+					IRQF_TRIGGER_NONE, dev_name(dev),
+					mbox->chans);
+	if (ret < 0)
+		return ret;
+
+	/* set adsp mbox channel info */
+	ch_info = devm_kzalloc(mbox->dev, sizeof(*ch_info), GFP_KERNEL);
+	if (!ch_info)
+		return -ENOMEM;
+
+	spin_lock_init(&ch_info->lock);
+	ch_info->va_reg = priv->va_mboxreg;
+	mbox->chans->con_priv = ch_info;
+	platform_set_drvdata(pdev, priv);
+	ret = devm_mbox_controller_register(dev, &priv->mbox);
+	if (ret < 0)
+		dev_err(dev, "error: failed to register mailbox:%d\n", ret);
+
+	return ret;
+}
+
+static const struct of_device_id mtk_adsp_mbox_of_match[] = {
+	{ .compatible = "mediatek,mt8195-adsp-mbox", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mtk_adsp_mbox_of_match);
+
+static struct platform_driver mtk_adsp_ipc_mbox_driver = {
+	.probe		= mtk_adsp_mbox_probe,
+	.driver = {
+		.name	= "mtk_adsp_mbox",
+		.of_match_table = mtk_adsp_mbox_of_match,
+	},
+};
+module_platform_driver(mtk_adsp_ipc_mbox_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <Allen-KH.Cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP mailbox IPC driver");
+MODULE_LICENSE("GPL v2");
-- 
2.18.0

