Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD125232DB
	for <lists+alsa-devel@lfdr.de>; Wed, 11 May 2022 14:18:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8927868;
	Wed, 11 May 2022 14:17:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8927868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652271514;
	bh=lcohBKdcI+9Epgkmy9uTZYedzhygDkj4r+6Hd2jXhOE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SmFrFtLVBCiEQaoLdLQKNemkWkqB6yHPJPcqbJMvI5+kNNIHy8rdfYTYULvrMH2mO
	 puARW8dNHB/+E5bx+BoIxvevnf4siLo5bDUvKwC6kLjP004PzbfeqIDHzpZpe7oIGm
	 ELhv/Z/IU0dxRg+AFhJ3c2t3GtfiZ0IktGV+sofM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5E98F80544;
	Wed, 11 May 2022 14:15:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65DA4F80137; Wed, 11 May 2022 06:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35BC8F80137;
 Wed, 11 May 2022 06:28:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35BC8F80137
X-UUID: 9bfabf6e990f4cb7945897b93b1e588b-20220511
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2a08b05d-4fe0-4fbf-b684-45bdc4909829, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-20
X-CID-META: VersionHash:faefae9, CLOUDID:90600ae6-38f2-431d-8de7-bf8fac490b0a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 9bfabf6e990f4cb7945897b93b1e588b-20220511
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <tinghan.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1576975418; Wed, 11 May 2022 12:28:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 11 May 2022 12:28:02 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 11 May 2022 12:28:01 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Javier Martinez Canillas <javierm@redhat.com>, Thomas
 Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sudeep Holla
 <sudeep.holla@arm.com>, Michal Suchanek <msuchanek@suse.de>, Shuai Xue
 <xueshuai@linux.alibaba.com>, Simon Trimmer <simont@opensource.cirrus.com>,
 Cristian Marussi <cristian.marussi@arm.com>, TingHan Shen
 <tinghan.shen@mediatek.com>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov
 <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Stultz
 <john.stultz@linaro.org>, Curtis Malainey <cujomalainey@chromium.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, YC Hung <yc.hung@mediatek.com>, 
 Tzung-Bi Shih <tzungbi@google.com>, Yang Yingliang
 <yangyingliang@huawei.com>, Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH v8 1/3] firmware: mediatek: add adsp ipc protocol interface
Date: Wed, 11 May 2022 12:27:16 +0800
Message-ID: <20220511042718.4305-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220511042718.4305-1-tinghan.shen@mediatek.com>
References: <20220511042718.4305-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-Mailman-Approved-At: Wed, 11 May 2022 14:14:58 +0200
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

From: TingHan Shen <tinghan.shen@mediatek.com>

Some of mediatek processors contain
the Tensilica HiFix DSP for audio processing.

The communication between Host CPU and DSP firmware is
taking place using a shared memory area for message passing.

ADSP IPC protocol offers (send/recv) interfaces using
mediatek-mailbox APIs.

We use two mbox channels to implement a request-reply protocol.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Signed-off-by: TingHan Shen <tinghan.shen@mediatek.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Curtis Malainey <cujomalainey@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Reviewed-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/firmware/Kconfig                      |   9 +
 drivers/firmware/Makefile                     |   1 +
 drivers/firmware/mtk-adsp-ipc.c               | 157 ++++++++++++++++++
 .../linux/firmware/mediatek/mtk-adsp-ipc.h    |  65 ++++++++
 4 files changed, 232 insertions(+)
 create mode 100644 drivers/firmware/mtk-adsp-ipc.c
 create mode 100644 include/linux/firmware/mediatek/mtk-adsp-ipc.h

diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index d65964996e8d..b59e3041fd62 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -203,6 +203,15 @@ config INTEL_STRATIX10_RSU
 
 	  Say Y here if you want Intel RSU support.
 
+config MTK_ADSP_IPC
+	tristate "MTK ADSP IPC Protocol driver"
+	depends on MTK_ADSP_MBOX
+	help
+	  Say yes here to add support for the MediaTek ADSP IPC
+	  between host AP (Linux) and the firmware running on ADSP.
+	  ADSP exists on some mtk processors.
+	  Client might use shared memory to exchange information with ADSP.
+
 config QCOM_SCM
 	tristate
 
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 4e58cb474a68..1be0e8295222 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_INTEL_STRATIX10_RSU)     += stratix10-rsu.o
 obj-$(CONFIG_ISCSI_IBFT_FIND)	+= iscsi_ibft_find.o
 obj-$(CONFIG_ISCSI_IBFT)	+= iscsi_ibft.o
 obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
+obj-$(CONFIG_MTK_ADSP_IPC)	+= mtk-adsp-ipc.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom-scm.o
diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
new file mode 100644
index 000000000000..cb255a99170c
--- /dev/null
+++ b/drivers/firmware/mtk-adsp-ipc.c
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 MediaTek Corporation. All rights reserved.
+ * Author: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
+ */
+
+#include <linux/firmware/mediatek/mtk-adsp-ipc.h>
+#include <linux/kernel.h>
+#include <linux/mailbox_client.h>
+#include <linux/module.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+
+/*
+ * mtk_adsp_ipc_send - send ipc cmd to MTK ADSP
+ *
+ * @ipc: ADSP IPC handle
+ * @idx: index of the mailbox channel
+ * @msg: IPC cmd (reply or request)
+ *
+ * Returns zero for success from mbox_send_message
+ * negative value for error
+ */
+int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t msg)
+{
+	struct mtk_adsp_chan *adsp_chan;
+	int ret;
+
+	if (idx >= MTK_ADSP_MBOX_NUM)
+		return -EINVAL;
+
+	adsp_chan = &ipc->chans[idx];
+	ret = mbox_send_message(adsp_chan->ch, &msg);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mtk_adsp_ipc_send);
+
+/*
+ * mtk_adsp_ipc_recv - recv callback used by MTK ADSP mailbox
+ *
+ * @c: mbox client
+ * @msg: message received
+ *
+ * Users of ADSP IPC will need to privde handle_reply and handle_request
+ * callbacks.
+ */
+static void mtk_adsp_ipc_recv(struct mbox_client *c, void *msg)
+{
+	struct mtk_adsp_chan *chan = container_of(c, struct mtk_adsp_chan, cl);
+	struct device *dev = c->dev;
+
+	switch (chan->idx) {
+	case MTK_ADSP_MBOX_REPLY:
+		chan->ipc->ops->handle_reply(chan->ipc);
+		break;
+	case MTK_ADSP_MBOX_REQUEST:
+		chan->ipc->ops->handle_request(chan->ipc);
+		break;
+	default:
+		dev_err(dev, "wrong mbox chan %d\n", chan->idx);
+		break;
+	}
+}
+
+static int mtk_adsp_ipc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_adsp_ipc *adsp_ipc;
+	struct mtk_adsp_chan *adsp_chan;
+	struct mbox_client *cl;
+	char *chan_name;
+	int ret;
+	int i, j;
+
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
+
+	adsp_ipc = devm_kzalloc(dev, sizeof(*adsp_ipc), GFP_KERNEL);
+	if (!adsp_ipc)
+		return -ENOMEM;
+
+	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
+		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
+		if (!chan_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		adsp_chan = &adsp_ipc->chans[i];
+		cl = &adsp_chan->cl;
+		cl->dev = dev->parent;
+		cl->tx_block = false;
+		cl->knows_txdone = false;
+		cl->tx_prepare = NULL;
+		cl->rx_callback = mtk_adsp_ipc_recv;
+
+		adsp_chan->ipc = adsp_ipc;
+		adsp_chan->idx = i;
+		adsp_chan->ch = mbox_request_channel_byname(cl, chan_name);
+		if (IS_ERR(adsp_chan->ch)) {
+			ret = PTR_ERR(adsp_chan->ch);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to request mbox chan %d ret %d\n",
+					i, ret);
+			goto out_free;
+		}
+
+		dev_dbg(dev, "request mbox chan %s\n", chan_name);
+		kfree(chan_name);
+	}
+
+	adsp_ipc->dev = dev;
+	dev_set_drvdata(dev, adsp_ipc);
+	dev_dbg(dev, "MTK ADSP IPC initialized\n");
+
+	return 0;
+
+out_free:
+	kfree(chan_name);
+out:
+	for (j = 0; j < i; j++) {
+		adsp_chan = &adsp_ipc->chans[j];
+		mbox_free_channel(adsp_chan->ch);
+	}
+
+	return ret;
+}
+
+static int mtk_adsp_ipc_remove(struct platform_device *pdev)
+{
+	struct mtk_adsp_ipc *adsp_ipc = dev_get_drvdata(&pdev->dev);
+	struct mtk_adsp_chan *adsp_chan;
+	int i;
+
+	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
+		adsp_chan = &adsp_ipc->chans[i];
+		mbox_free_channel(adsp_chan->ch);
+	}
+
+	return 0;
+}
+
+static struct platform_driver mtk_adsp_ipc_driver = {
+	.driver = {
+		.name = "mtk-adsp-ipc",
+	},
+	.probe = mtk_adsp_ipc_probe,
+	.remove = mtk_adsp_ipc_remove,
+};
+builtin_platform_driver(mtk_adsp_ipc_driver);
+
+MODULE_AUTHOR("Allen-KH Cheng <allen-kh.cheng@mediatek.com>");
+MODULE_DESCRIPTION("MTK ADSP IPC Driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/firmware/mediatek/mtk-adsp-ipc.h b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
new file mode 100644
index 000000000000..28fd313340b8
--- /dev/null
+++ b/include/linux/firmware/mediatek/mtk-adsp-ipc.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef MTK_ADSP_IPC_H
+#define MTK_ADSP_IPC_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+#include <linux/mailbox_controller.h>
+#include <linux/mailbox_client.h>
+
+#define MTK_ADSP_IPC_REQ 0
+#define MTK_ADSP_IPC_RSP 1
+#define MTK_ADSP_IPC_OP_REQ 0x1
+#define MTK_ADSP_IPC_OP_RSP 0x2
+
+enum {
+	MTK_ADSP_MBOX_REPLY,
+	MTK_ADSP_MBOX_REQUEST,
+	MTK_ADSP_MBOX_NUM,
+};
+
+struct mtk_adsp_ipc;
+
+struct mtk_adsp_ipc_ops {
+	void (*handle_reply)(struct mtk_adsp_ipc *ipc);
+	void (*handle_request)(struct mtk_adsp_ipc *ipc);
+};
+
+struct mtk_adsp_chan {
+	struct mtk_adsp_ipc *ipc;
+	struct mbox_client cl;
+	struct mbox_chan *ch;
+	char *name;
+	int idx;
+};
+
+struct mtk_adsp_ipc {
+	struct mtk_adsp_chan chans[MTK_ADSP_MBOX_NUM];
+	struct device *dev;
+	struct mtk_adsp_ipc_ops *ops;
+	void *private_data;
+};
+
+static inline void mtk_adsp_ipc_set_data(struct mtk_adsp_ipc *ipc, void *data)
+{
+	if (!ipc)
+		return;
+
+	ipc->private_data = data;
+}
+
+static inline void *mtk_adsp_ipc_get_data(struct mtk_adsp_ipc *ipc)
+{
+	if (!ipc)
+		return NULL;
+
+	return ipc->private_data;
+}
+
+int mtk_adsp_ipc_send(struct mtk_adsp_ipc *ipc, unsigned int idx, uint32_t op);
+
+#endif /* MTK_ADSP_IPC_H */
-- 
2.18.0

