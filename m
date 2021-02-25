Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A2E324939
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 04:09:44 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 96AE61699;
	Thu, 25 Feb 2021 04:08:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 96AE61699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614222583;
	bh=e3w4T4Z9ZXbqzvwgpobO14/H9peGwBtDmymA9pxHpRk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LTSa/luHb+Y7zVJXa7kbD2PNb/vyakkeYU0vRJ8IAw9Fv/Qx2ebn7cEAhb1rPU+ds
	 c3ddu/UG54evYXEdg+EiTaq0cseMmF1vQJir90zri1N0K+ex1GLpphwhG1oGMvVwrn
	 ggtzZNFt9HW4Ywdf9rZAyQ//hv6UikWAi63x5oWI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8912EF804B1;
	Thu, 25 Feb 2021 04:06:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9E81CF80278; Thu, 25 Feb 2021 04:06:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5973CF8026C
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 04:05:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5973CF8026C
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 374EF1A05D3;
 Thu, 25 Feb 2021 04:05:26 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5EE241A0628;
 Thu, 25 Feb 2021 04:05:19 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 26AEE4032B;
 Thu, 25 Feb 2021 04:05:11 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 4/7] ASoC: imx-audio-rpmsg: Add rpmsg_driver for audio
 channel
Date: Thu, 25 Feb 2021 10:52:40 +0800
Message-Id: <1614221563-26822-5-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614221563-26822-1-git-send-email-shengjiu.wang@nxp.com>
References: <1614221563-26822-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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

This driver is used to accept the message from rpmsg audio
channel, and if this driver is probed, it will help to register
the platform driver, the platform driver will use this
audio channel to send and receive message to and from Cortex-M
core.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig           |   4 +
 sound/soc/fsl/Makefile          |   1 +
 sound/soc/fsl/imx-audio-rpmsg.c | 151 ++++++++++++++++++++++++++++++++
 3 files changed, 156 insertions(+)
 create mode 100644 sound/soc/fsl/imx-audio-rpmsg.c

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index a688c3c2efbc..84d9f0f1f75b 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -126,6 +126,10 @@ config SND_SOC_IMX_PCM_DMA
 	tristate
 	select SND_SOC_GENERIC_DMAENGINE_PCM
 
+config SND_SOC_IMX_AUDIO_RPMSG
+	tristate
+	depends on RPMSG
+
 config SND_SOC_IMX_AUDMUX
 	tristate "Digital Audio Mux module support"
 	help
diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
index b63802f345cc..f08f3cd07ff5 100644
--- a/sound/soc/fsl/Makefile
+++ b/sound/soc/fsl/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_SND_SOC_IMX_AUDMUX) += snd-soc-imx-audmux.o
 
 obj-$(CONFIG_SND_SOC_IMX_PCM_FIQ) += imx-pcm-fiq.o
 obj-$(CONFIG_SND_SOC_IMX_PCM_DMA) += imx-pcm-dma.o
+obj-$(CONFIG_SND_SOC_IMX_AUDIO_RPMSG) += imx-audio-rpmsg.o
 
 # i.MX Machine Support
 snd-soc-eukrea-tlv320-objs := eukrea-tlv320.o
diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
new file mode 100644
index 000000000000..145edb1492b4
--- /dev/null
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -0,0 +1,151 @@
+// SPDX-License-Identifier: GPL-2.0+
+// Copyright 2017-2020 NXP
+
+#include <linux/module.h>
+#include <linux/rpmsg.h>
+#include "imx-pcm-rpmsg.h"
+
+/*
+ * struct imx_audio_rpmsg: private data
+ *
+ * @rpmsg_pdev: pointer of platform device
+ */
+struct imx_audio_rpmsg {
+	struct platform_device *rpmsg_pdev;
+};
+
+static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
+			      void *priv, u32 src)
+{
+	struct imx_audio_rpmsg *rpmsg = dev_get_drvdata(&rpdev->dev);
+	struct rpmsg_info *info = platform_get_drvdata(rpmsg->rpmsg_pdev);
+	struct rpmsg_r_msg *r_msg = (struct rpmsg_r_msg *)data;
+	struct rpmsg_msg *msg;
+	unsigned long flags;
+
+	dev_dbg(&rpdev->dev, "get from%d: cmd:%d. %d\n",
+		src, r_msg->header.cmd, r_msg->param.resp);
+
+	switch (r_msg->header.type) {
+	case MSG_TYPE_C:
+		/* TYPE C is notification from M core */
+		switch (r_msg->header.cmd) {
+		case TX_PERIOD_DONE:
+			spin_lock_irqsave(&info->lock[TX], flags);
+			msg = &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
+
+			/*
+			 * Low power mode: get the buffer pointer from
+			 * receive msg.
+			 */
+			if (r_msg->header.major == 1 &&
+			    r_msg->header.minor == 2)
+				msg->r_msg.param.buffer_tail =
+						r_msg->param.buffer_tail;
+			else
+				msg->r_msg.param.buffer_tail++;
+
+			msg->r_msg.param.buffer_tail %= info->num_period[TX];
+			spin_unlock_irqrestore(&info->lock[TX], flags);
+			info->callback[TX](info->callback_param[TX]);
+			break;
+		case RX_PERIOD_DONE:
+			spin_lock_irqsave(&info->lock[RX], flags);
+			msg = &info->msg[RX_PERIOD_DONE + MSG_TYPE_A_NUM];
+
+			if (r_msg->header.major == 1 &&
+			    r_msg->header.minor == 2)
+				msg->r_msg.param.buffer_tail =
+						r_msg->param.buffer_tail;
+			else
+				msg->r_msg.param.buffer_tail++;
+
+			msg->r_msg.param.buffer_tail %= info->num_period[1];
+			spin_unlock_irqrestore(&info->lock[RX], flags);
+			info->callback[RX](info->callback_param[RX]);
+			break;
+		default:
+			dev_warn(&rpdev->dev, "unknown msg command\n");
+			break;
+		}
+		break;
+	case MSG_TYPE_B:
+		/* TYPE B is response msg */
+		memcpy(&info->r_msg, r_msg, sizeof(struct rpmsg_r_msg));
+		complete(&info->cmd_complete);
+		break;
+	default:
+		dev_warn(&rpdev->dev, "unknown msg type\n");
+		break;
+	}
+
+	return 0;
+}
+
+static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
+{
+	struct imx_audio_rpmsg *data;
+	int ret = 0;
+
+	dev_info(&rpdev->dev, "new channel: 0x%x -> 0x%x!\n",
+		 rpdev->src, rpdev->dst);
+
+	data = devm_kzalloc(&rpdev->dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	dev_set_drvdata(&rpdev->dev, data);
+
+	/* Register platform driver for rpmsg routine */
+	data->rpmsg_pdev = platform_device_register_data(&rpdev->dev,
+							 IMX_PCM_DRV_NAME,
+							 PLATFORM_DEVID_NONE,
+							 NULL, 0);
+	if (IS_ERR(data->rpmsg_pdev)) {
+		dev_err(&rpdev->dev, "failed to register rpmsg platform.\n");
+		ret = PTR_ERR(data->rpmsg_pdev);
+	}
+
+	return ret;
+}
+
+static void imx_audio_rpmsg_remove(struct rpmsg_device *rpdev)
+{
+	struct imx_audio_rpmsg *data = dev_get_drvdata(&rpdev->dev);
+
+	if (data->rpmsg_pdev)
+		platform_device_unregister(data->rpmsg_pdev);
+
+	dev_info(&rpdev->dev, "audio rpmsg driver is removed\n");
+}
+
+static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
+	{ .name	= "rpmsg-audio-channel" },
+	{ },
+};
+
+static struct rpmsg_driver imx_audio_rpmsg_driver = {
+	.drv.name	= "imx_audio_rpmsg",
+	.drv.owner	= THIS_MODULE,
+	.id_table	= imx_audio_rpmsg_id_table,
+	.probe		= imx_audio_rpmsg_probe,
+	.callback	= imx_audio_rpmsg_cb,
+	.remove		= imx_audio_rpmsg_remove,
+};
+
+static int __init imx_audio_rpmsg_init(void)
+{
+	return register_rpmsg_driver(&imx_audio_rpmsg_driver);
+}
+
+static void __exit imx_audio_rpmsg_exit(void)
+{
+	unregister_rpmsg_driver(&imx_audio_rpmsg_driver);
+}
+module_init(imx_audio_rpmsg_init);
+module_exit(imx_audio_rpmsg_exit);
+
+MODULE_DESCRIPTION("Freescale SoC Audio RPMSG interface");
+MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
+MODULE_ALIAS("platform:imx_audio_rpmsg");
+MODULE_LICENSE("GPL v2");
-- 
2.27.0

