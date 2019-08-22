Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C430599F13
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Aug 2019 20:42:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 485C341;
	Thu, 22 Aug 2019 20:41:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 485C341
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1566499342;
	bh=lvR3To8ozdjQXoenHdeKf5yuO1y3BXCTogWDtgkbh90=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=MgHKUvDcItfric6JjT2n74O83N8mOOMeSs5RgczpmuF+pkRENJZNIm/eN+e4Tuz1p
	 kf0O1PUQw5jnrHTWR6WX49WzcUKv514Do25mt6N/EiJGVHoSXTMS+L1CNhiI79WIsT
	 2YT5hrLrOUDlYB9Wxm7sAzXxltfOmwWMCOr6IKDM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 62C7FF8068A;
	Thu, 22 Aug 2019 20:33:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74A00F8063A; Thu, 22 Aug 2019 20:33:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 74B6BF805A1
 for <alsa-devel@alsa-project.org>; Thu, 22 Aug 2019 20:33:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 74B6BF805A1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="nMO6vVDV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=4DpnHwokigdwyeBSZ2Idwq3dFlMaC6ktlRMbjWWhfg0=; b=nMO6vVDVSsoL
 KChtcYv9MOhPDxIhVTwfzyO/MPLn4cOvOstPIZfGJXdPNACEQHc2/Zg0Pm4LS7zAWX1X3XBKbkYxI
 nirknIhfltOZvtHiET0drfyb1B3AhGnXhdQsF2sROrVJ9L21G6qLKG6nDGSdQCwWsKDaMGZVTtro1
 0K/9M=;
Received: from 92.40.26.78.threembb.co.uk ([92.40.26.78]
 helo=fitzroy.sirena.org.uk) by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i0rtR-0007fk-Kl; Thu, 22 Aug 2019 18:33:06 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 62B8CD02CE8; Thu, 22 Aug 2019 19:32:57 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190821164730.7385-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190822183257.62B8CD02CE8@fitzroy.sirena.org.uk>
Date: Thu, 22 Aug 2019 19:32:57 +0100 (BST)
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Xiubo.Lee@gmail.com, tiwai@suse.de, shengjiu.wang@nxp.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 nicoleotsuka@gmail.com, Mark Brown <broonie@kernel.org>, linux-imx@nxp.com,
 viorel.suman@nxp.com, festevam@gmail.com
Subject: [alsa-devel] Applied "ASoC: SOF: imx: Add i.MX8 HW support" to the
	asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: SOF: imx: Add i.MX8 HW support

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.4

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 202acc565a1f050f82fdab646fd9c86bfdb21733 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 21 Aug 2019 11:47:30 -0500
Subject: [PATCH] ASoC: SOF: imx: Add i.MX8 HW support

Add support for the audio DSP hardware found on NXP i.MX8 platform.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20190821164730.7385-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/Kconfig      |   1 +
 sound/soc/sof/Makefile     |   1 +
 sound/soc/sof/imx/Kconfig  |  22 +++
 sound/soc/sof/imx/Makefile |   4 +
 sound/soc/sof/imx/imx8.c   | 394 +++++++++++++++++++++++++++++++++++++
 5 files changed, 422 insertions(+)
 create mode 100644 sound/soc/sof/imx/Kconfig
 create mode 100644 sound/soc/sof/imx/Makefile
 create mode 100644 sound/soc/sof/imx/imx8.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 01acb580b817..bb8036ae567e 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -173,6 +173,7 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 	  When selected, the probe is handled in two steps, for example to
 	  avoid lockdeps if request_module is used in the probe.
 
+source "sound/soc/sof/imx/Kconfig"
 source "sound/soc/sof/intel/Kconfig"
 source "sound/soc/sof/xtensa/Kconfig"
 
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 772c452d1ae2..b0a6f01bdc44 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -18,4 +18,5 @@ obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-of.o
 obj-$(CONFIG_SND_SOC_SOF_PCI) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
+obj-$(CONFIG_SND_SOC_SOF_IMX_TOPLEVEL) += imx/
 obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
new file mode 100644
index 000000000000..fd73d8402dbf
--- /dev/null
+++ b/sound/soc/sof/imx/Kconfig
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+
+config SND_SOC_SOF_IMX_TOPLEVEL
+	bool "SOF support for NXP i.MX audio DSPs"
+	depends on ARM64 && SND_SOC_SOF_OF || COMPILE_TEST
+	help
+          This adds support for Sound Open Firmware for NXP i.MX platforms.
+          Say Y if you have such a device.
+          If unsure select "N".
+
+if SND_SOC_SOF_IMX_TOPLEVEL
+
+config SND_SOC_SOF_IMX8
+	tristate "SOF support for i.MX8"
+	depends on IMX_SCU
+	depends on IMX_DSP
+	help
+          This adds support for Sound Open Firmware for NXP i.MX8 platforms
+          Say Y if you have such a device.
+          If unsure select "N".
+
+endif ## SND_SOC_SOF_IMX_IMX_TOPLEVEL
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
new file mode 100644
index 000000000000..6ef908e8c807
--- /dev/null
+++ b/sound/soc/sof/imx/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+snd-sof-imx8-objs := imx8.o
+
+obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
new file mode 100644
index 000000000000..e502f584207f
--- /dev/null
+++ b/sound/soc/sof/imx/imx8.c
@@ -0,0 +1,394 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// Copyright 2019 NXP
+//
+// Author: Daniel Baluta <daniel.baluta@nxp.com>
+//
+// Hardware interface for audio DSP on i.MX8
+
+#include <linux/firmware.h>
+#include <linux/of_platform.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+#include <linux/pm_domain.h>
+
+#include <linux/module.h>
+#include <sound/sof.h>
+#include <sound/sof/xtensa.h>
+#include <linux/firmware/imx/ipc.h>
+#include <linux/firmware/imx/dsp.h>
+
+#include <linux/firmware/imx/svc/misc.h>
+#include <dt-bindings/firmware/imx/rsrc.h>
+#include "../ops.h"
+
+/* DSP memories */
+#define IRAM_OFFSET		0x10000
+#define IRAM_SIZE		(2 * 1024)
+#define DRAM0_OFFSET		0x0
+#define DRAM0_SIZE		(32 * 1024)
+#define DRAM1_OFFSET		0x8000
+#define DRAM1_SIZE		(32 * 1024)
+#define SYSRAM_OFFSET		0x18000
+#define SYSRAM_SIZE		(256 * 1024)
+#define SYSROM_OFFSET		0x58000
+#define SYSROM_SIZE		(192 * 1024)
+
+#define RESET_VECTOR_VADDR	0x596f8000
+
+#define MBOX_OFFSET	0x800000
+#define MBOX_SIZE	0x1000
+
+struct imx8_priv {
+	struct device *dev;
+	struct snd_sof_dev *sdev;
+
+	/* DSP IPC handler */
+	struct imx_dsp_ipc *dsp_ipc;
+	struct platform_device *ipc_dev;
+
+	/* System Controller IPC handler */
+	struct imx_sc_ipc *sc_ipc;
+
+	/* Power domain handling */
+	int num_domains;
+	struct device **pd_dev;
+	struct device_link **link;
+
+};
+
+static void imx8_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	int ret = 0;
+
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt\n");
+		return;
+	}
+
+	/* get reply */
+	sof_mailbox_read(sdev, sdev->host_box.offset, &reply, sizeof(reply));
+
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else {
+		/* reply has correct size? */
+		if (reply.hdr.size != msg->reply_size) {
+			dev_err(sdev->dev, "error: reply expected %zu got %u bytes\n",
+				msg->reply_size, reply.hdr.size);
+			ret = -EINVAL;
+		}
+
+		/* read the message */
+		if (msg->reply_size > 0)
+			sof_mailbox_read(sdev, sdev->host_box.offset,
+					 msg->reply_data, msg->reply_size);
+	}
+
+	msg->reply_error = ret;
+}
+
+static int imx8_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int imx8_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
+void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
+{
+	struct imx8_priv *priv = imx_dsp_get_data(ipc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->sdev->ipc_lock, flags);
+	imx8_get_reply(priv->sdev);
+	snd_sof_ipc_reply(priv->sdev, 0);
+	spin_unlock_irqrestore(&priv->sdev->ipc_lock, flags);
+}
+
+void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
+{
+	struct imx8_priv *priv = imx_dsp_get_data(ipc);
+
+	snd_sof_ipc_msgs_rx(priv->sdev);
+}
+
+struct imx_dsp_ops dsp_ops = {
+	.handle_reply		= imx8_dsp_handle_reply,
+	.handle_request		= imx8_dsp_handle_request,
+};
+
+static int imx8_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	struct imx8_priv *priv = (struct imx8_priv *)sdev->private;
+
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+	imx_dsp_ring_doorbell(priv->dsp_ipc, 0);
+
+	return 0;
+}
+
+/*
+ * DSP control.
+ */
+static int imx8_run(struct snd_sof_dev *sdev)
+{
+	struct imx8_priv *dsp_priv = (struct imx8_priv *)sdev->private;
+	int ret;
+
+	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+				      IMX_SC_C_OFS_SEL, 1);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error system address offset source select\n");
+		return ret;
+	}
+
+	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+				      IMX_SC_C_OFS_AUDIO, 0x80);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error system address offset of AUDIO\n");
+		return ret;
+	}
+
+	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+				      IMX_SC_C_OFS_PERIPH, 0x5A);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error system address offset of PERIPH %d\n",
+			ret);
+		return ret;
+	}
+
+	ret = imx_sc_misc_set_control(dsp_priv->sc_ipc, IMX_SC_R_DSP,
+				      IMX_SC_C_OFS_IRQ, 0x51);
+	if (ret < 0) {
+		dev_err(sdev->dev, "Error system address offset of IRQ\n");
+		return ret;
+	}
+
+	imx_sc_pm_cpu_start(dsp_priv->sc_ipc, IMX_SC_R_DSP, true,
+			    RESET_VECTOR_VADDR);
+
+	return 0;
+}
+
+static int imx8_probe(struct snd_sof_dev *sdev)
+{
+	struct platform_device *pdev =
+		container_of(sdev->dev, struct platform_device, dev);
+	struct device_node *np = pdev->dev.of_node;
+	struct device_node *res_node;
+	struct resource *mmio;
+	struct imx8_priv *priv;
+	struct resource res;
+	u32 base, size;
+	int ret = 0;
+	int i;
+
+	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	sdev->private = priv;
+	priv->dev = sdev->dev;
+	priv->sdev = sdev;
+
+	/* power up device associated power domains */
+	priv->num_domains = of_count_phandle_with_args(np, "power-domains",
+						       "#power-domain-cells");
+	if (priv->num_domains < 0) {
+		dev_err(sdev->dev, "no power-domains property in %pOF\n", np);
+		return priv->num_domains;
+	}
+
+	priv->pd_dev = devm_kmalloc_array(&pdev->dev, priv->num_domains,
+					  sizeof(*priv->pd_dev), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->link = devm_kmalloc_array(&pdev->dev, priv->num_domains,
+					sizeof(*priv->link), GFP_KERNEL);
+	if (!priv->link)
+		return -ENOMEM;
+
+	for (i = 0; i < priv->num_domains; i++) {
+		priv->pd_dev[i] = dev_pm_domain_attach_by_id(&pdev->dev, i);
+		if (IS_ERR(priv->pd_dev[i])) {
+			ret = PTR_ERR(priv->pd_dev[i]);
+			goto exit_unroll_pm;
+		}
+		priv->link[i] = device_link_add(&pdev->dev, priv->pd_dev[i],
+						DL_FLAG_STATELESS |
+						DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (IS_ERR(priv->link[i])) {
+			ret = PTR_ERR(priv->link[i]);
+			dev_pm_domain_detach(priv->pd_dev[i], false);
+			goto exit_unroll_pm;
+		}
+	}
+
+	ret = imx_scu_get_handle(&priv->sc_ipc);
+	if (ret) {
+		dev_err(sdev->dev, "Cannot obtain SCU handle (err = %d)\n",
+			ret);
+		goto exit_unroll_pm;
+	}
+
+	priv->ipc_dev = platform_device_register_data(sdev->dev, "imx-dsp",
+						      PLATFORM_DEVID_NONE,
+						      pdev, sizeof(*pdev));
+	if (IS_ERR(priv->ipc_dev)) {
+		ret = PTR_ERR(priv->ipc_dev);
+		goto exit_unroll_pm;
+	}
+
+	priv->dsp_ipc = dev_get_drvdata(&priv->ipc_dev->dev);
+	if (!priv->dsp_ipc) {
+		/* DSP IPC driver not probed yet, try later */
+		ret = -EPROBE_DEFER;
+		dev_err(sdev->dev, "Failed to get drvdata\n");
+		goto exit_pdev_unregister;
+	}
+
+	imx_dsp_set_data(priv->dsp_ipc, priv);
+	priv->dsp_ipc->ops = &dsp_ops;
+
+	/* DSP base */
+	mmio = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (mmio) {
+		base = mmio->start;
+		size = resource_size(mmio);
+	} else {
+		dev_err(sdev->dev, "error: failed to get DSP base at idx 0\n");
+		ret = -EINVAL;
+		goto exit_pdev_unregister;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_IRAM] = devm_ioremap(sdev->dev, base, size);
+	if (!sdev->bar[SOF_FW_BLK_TYPE_IRAM]) {
+		dev_err(sdev->dev, "failed to ioremap base 0x%x size 0x%x\n",
+			base, size);
+		ret = -ENODEV;
+		goto exit_pdev_unregister;
+	}
+	sdev->mmio_bar = SOF_FW_BLK_TYPE_IRAM;
+
+	res_node = of_parse_phandle(np, "memory-region", 0);
+	if (!res_node) {
+		dev_err(&pdev->dev, "failed to get memory region node\n");
+		ret = -ENODEV;
+		goto exit_pdev_unregister;
+	}
+
+	ret = of_address_to_resource(res_node, 0, &res);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to get reserved region address\n");
+		goto exit_pdev_unregister;
+	}
+
+	sdev->bar[SOF_FW_BLK_TYPE_SRAM] = devm_ioremap_wc(sdev->dev, res.start,
+							  res.end - res.start +
+							  1);
+	if (IS_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM])) {
+		dev_err(sdev->dev, "failed to ioremap mem 0x%x size 0x%x\n",
+			base, size);
+		ret = PTR_ERR(sdev->bar[SOF_FW_BLK_TYPE_SRAM]);
+		goto exit_pdev_unregister;
+	}
+	sdev->mailbox_bar = SOF_FW_BLK_TYPE_SRAM;
+
+	return 0;
+
+exit_pdev_unregister:
+	platform_device_unregister(priv->ipc_dev);
+exit_unroll_pm:
+	while (--i >= 0) {
+		device_link_del(priv->link[i]);
+		dev_pm_domain_detach(priv->pd_dev[i], false);
+	}
+
+	return ret;
+}
+
+static int imx8_remove(struct snd_sof_dev *sdev)
+{
+	struct imx8_priv *priv = (struct imx8_priv *)sdev->private;
+	int i;
+
+	platform_device_unregister(priv->ipc_dev);
+
+	for (i = 0; i < priv->num_domains; i++) {
+		device_link_del(priv->link[i]);
+		dev_pm_domain_detach(priv->pd_dev[i], false);
+	}
+
+	return 0;
+}
+
+/* on i.MX8 there is 1 to 1 match between type and BAR idx */
+int imx8_get_bar_index(struct snd_sof_dev *sdev, u32 type)
+{
+	return type;
+}
+
+void imx8_ipc_msg_data(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       void *p, size_t sz)
+{
+	sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+}
+
+int imx8_ipc_pcm_params(struct snd_sof_dev *sdev,
+			struct snd_pcm_substream *substream,
+			const struct sof_ipc_pcm_params_reply *reply)
+{
+	return 0;
+}
+
+static struct snd_soc_dai_driver imx8_dai[] = {
+{
+	.name = "esai-port",
+},
+};
+
+/* i.MX8  ops */
+struct snd_sof_dsp_ops sof_imx8_ops = {
+	/* probe and remove */
+	.probe		= imx8_probe,
+	.remove		= imx8_remove,
+	/* DSP core boot */
+	.run		= imx8_run,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* ipc */
+	.send_msg	= imx8_send_msg,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset	= imx8_get_mailbox_offset,
+	.get_window_offset	= imx8_get_window_offset,
+
+	.ipc_msg_data	= imx8_ipc_msg_data,
+	.ipc_pcm_params	= imx8_ipc_pcm_params,
+
+	/* module loading */
+	.load_module	= snd_sof_parse_module_memcpy,
+	.get_bar_index	= imx8_get_bar_index,
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
+	/* DAI drivers */
+	.drv = imx8_dai,
+	.num_drv = 1, /* we have only 1 ESAI interface on i.MX8 */
+};
+EXPORT_SYMBOL(sof_imx8_ops);
+
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
