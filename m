Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17CE126D9BC
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 13:00:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 702271674;
	Thu, 17 Sep 2020 12:59:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 702271674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600340443;
	bh=lX4UJWCq4RE8gw69Y9H1FVSKz9dIHt2jm/wAeI2bktQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e3VsoRRtheufcLXYOCip6K6URFTl9lP7CU3flteqdJtoAhn3Pett9UulFPXbQRQZd
	 VPZFYe86i6Vp6KBrvTq6l2yc2x4/oOfKPyy9e6UnWgLds3Gmg5/fZCq5fpL0bVn2xn
	 igGaNuF7VcpFSIs+9hb9xRfQV4mejkNr4Iw2+8JI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 434D9F8025E;
	Thu, 17 Sep 2020 12:58:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7987BF80134; Thu, 17 Sep 2020 12:58:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6AB8F801EC
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 12:58:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6AB8F801EC
IronPort-SDR: vtqVBB+Kam6GI/ZwbTkk48H5YY7eY3ns+16A2/H+/AJBMVuqbYCnZIDhn52i0jGtGUNxJOK9Ud
 uY6LG1b7hkSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9746"; a="157075345"
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="157075345"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2020 03:58:05 -0700
IronPort-SDR: NOPa6zpp4arCfFmt5UJUDOkjLqhY6yAKaMbud79QMBzV9vIAYc9Il/D0upQ6oAroQ3Q3tAyBxF
 hTS7gOmycowA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,436,1592895600"; d="scan'208";a="320177304"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga002.jf.intel.com with ESMTP; 17 Sep 2020 03:58:03 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Subject: [PATCH 1/8] ASoC: SOF: imx: Add debug support for imx platforms
Date: Thu, 17 Sep 2020 13:56:26 +0300
Message-Id: <20200917105633.2579047-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
References: <20200917105633.2579047-1-kai.vehmanen@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, Iulian Olaru <iulianolaru249@yahoo.com>,
 daniel.baluta@nxp.com
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

From: Iulian Olaru <iulianolaru249@yahoo.com>

This patch adds debug support for imx platforms. This is important in
order to gather information about the state of the DSP in case of an
oops and the reason for the oops.

This is done by checking if a message with a panic code has been placed
in the debug box, in the imx8_dsp_handle_request function from sof/imx.

If positive, the function imx8_dump, added in common, will be called.
The first step is to gather information about the registers, filename,
line number and stack by calling the imx8_get_registers, added in common.
Then the information will be printed to the console by calling the
get_status function.

Signed-off-by: Iulian Olaru <iulianolaru249@yahoo.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/imx/Kconfig      |  8 ++++
 sound/soc/sof/imx/Makefile     |  3 ++
 sound/soc/sof/imx/imx-common.c | 72 ++++++++++++++++++++++++++++++++++
 sound/soc/sof/imx/imx-common.h | 16 ++++++++
 sound/soc/sof/imx/imx8.c       | 23 ++++++++++-
 sound/soc/sof/imx/imx8m.c      | 17 +++++++-
 6 files changed, 137 insertions(+), 2 deletions(-)
 create mode 100644 sound/soc/sof/imx/imx-common.c
 create mode 100644 sound/soc/sof/imx/imx-common.h

diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 23bfd79d09c3..48f998a19ddb 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -19,6 +19,12 @@ config SND_SOC_SOF_IMX_OF
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level
 
+config SND_SOC_SOF_IMX_COMMON
+	tristate
+	help
+	  This option is not user-selectable but automagically handled by
+	  'select' statements at a higher level.
+
 config SND_SOC_SOF_IMX8_SUPPORT
 	bool "SOF support for i.MX8"
 	depends on IMX_SCU=y || IMX_SCU=SND_SOC_SOF_IMX_OF
@@ -30,6 +36,7 @@ config SND_SOC_SOF_IMX8_SUPPORT
 
 config SND_SOC_SOF_IMX8
 	tristate
+	select SND_SOC_SOF_IMX_COMMON
 	select SND_SOC_SOF_XTENSA
 	help
 	  This option is not user-selectable but automagically handled by
@@ -45,6 +52,7 @@ config SND_SOC_SOF_IMX8M_SUPPORT
 
 config SND_SOC_SOF_IMX8M
 	tristate
+	select SND_SOC_SOF_IMX_COMMON
 	select SND_SOC_SOF_XTENSA
 	help
 	  This option is not user-selectable but automagically handled by
diff --git a/sound/soc/sof/imx/Makefile b/sound/soc/sof/imx/Makefile
index 2b933b02bbac..dba93c3466ec 100644
--- a/sound/soc/sof/imx/Makefile
+++ b/sound/soc/sof/imx/Makefile
@@ -2,5 +2,8 @@
 snd-sof-imx8-objs := imx8.o
 snd-sof-imx8m-objs := imx8m.o
 
+snd-sof-imx-common-objs := imx-common.o
+
 obj-$(CONFIG_SND_SOC_SOF_IMX8) += snd-sof-imx8.o
 obj-$(CONFIG_SND_SOC_SOF_IMX8M) += snd-sof-imx8m.o
+obj-$(CONFIG_SND_SOC_SOF_IMX_COMMON) += imx-common.o
diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
new file mode 100644
index 000000000000..63d8a5d7bc44
--- /dev/null
+++ b/sound/soc/sof/imx/imx-common.c
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright 2020 NXP
+//
+// Common helpers for the audio DSP on i.MX8
+
+#include <sound/sof/xtensa.h>
+#include "../ops.h"
+
+#include "imx-common.h"
+
+/**
+ * imx8_get_registers() - This function is called in case of DSP oops
+ * in order to gather information about the registers, filename and
+ * linenumber and stack.
+ * @sdev: SOF device
+ * @xoops: Stores information about registers.
+ * @panic_info: Stores information about filename and line number.
+ * @stack: Stores the stack dump.
+ * @stack_words: Size of the stack dump.
+ */
+void imx8_get_registers(struct snd_sof_dev *sdev,
+			struct sof_ipc_dsp_oops_xtensa *xoops,
+			struct sof_ipc_panic_info *panic_info,
+			u32 *stack, size_t stack_words)
+{
+	u32 offset = sdev->dsp_oops_offset;
+
+	/* first read registers */
+	sof_mailbox_read(sdev, offset, xoops, sizeof(*xoops));
+
+	/* then get panic info */
+	if (xoops->arch_hdr.totalsize > EXCEPT_MAX_HDR_SIZE) {
+		dev_err(sdev->dev, "invalid header size 0x%x. FW oops is bogus\n",
+			xoops->arch_hdr.totalsize);
+		return;
+	}
+	offset += xoops->arch_hdr.totalsize;
+	sof_mailbox_read(sdev, offset, panic_info, sizeof(*panic_info));
+
+	/* then get the stack */
+	offset += sizeof(*panic_info);
+	sof_mailbox_read(sdev, offset, stack, stack_words * sizeof(u32));
+}
+
+/**
+ * imx8_dump() - This function is called when a panic message is
+ * received from the firmware.
+ */
+void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
+{
+	struct sof_ipc_dsp_oops_xtensa xoops;
+	struct sof_ipc_panic_info panic_info;
+	u32 stack[IMX8_STACK_DUMP_SIZE];
+	u32 status;
+
+	/* Get information about the panic status from the debug box area.
+	 * Compute the trace point based on the status.
+	 */
+	sof_mailbox_read(sdev, sdev->debug_box.offset + 0x4, &status, 4);
+
+	/* Get information about the registers, the filename and line
+	 * number and the stack.
+	 */
+	imx8_get_registers(sdev, &xoops, &panic_info, stack,
+			   IMX8_STACK_DUMP_SIZE);
+
+	/* Print the information to the console */
+	snd_sof_get_status(sdev, status, status, &xoops, &panic_info, stack,
+			   IMX8_STACK_DUMP_SIZE);
+}
+EXPORT_SYMBOL(imx8_dump);
diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
new file mode 100644
index 000000000000..1cc7d6704182
--- /dev/null
+++ b/sound/soc/sof/imx/imx-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+
+#ifndef __IMX_COMMON_H__
+#define __IMX_COMMON_H__
+
+#define EXCEPT_MAX_HDR_SIZE	0x400
+#define IMX8_STACK_DUMP_SIZE 32
+
+void imx8_get_registers(struct snd_sof_dev *sdev,
+			struct sof_ipc_dsp_oops_xtensa *xoops,
+			struct sof_ipc_panic_info *panic_info,
+			u32 *stack, size_t stack_words);
+
+void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
+
+#endif
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 3b9ffc760cb5..4e7dccadd7d0 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -21,6 +21,7 @@
 #include <linux/firmware/imx/svc/misc.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include "../ops.h"
+#include "imx-common.h"
 
 /* DSP memories */
 #define IRAM_OFFSET		0x10000
@@ -115,8 +116,16 @@ static void imx8_dsp_handle_reply(struct imx_dsp_ipc *ipc)
 static void imx8_dsp_handle_request(struct imx_dsp_ipc *ipc)
 {
 	struct imx8_priv *priv = imx_dsp_get_data(ipc);
+	u32 p; /* panic code */
 
-	snd_sof_ipc_msgs_rx(priv->sdev);
+	/* Read the message from the debug box. */
+	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
+
+	/* Check to see if the message is a panic code (0x0dead***) */
+	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
+		snd_sof_dsp_panic(priv->sdev, p);
+	else
+		snd_sof_ipc_msgs_rx(priv->sdev);
 }
 
 static struct imx_dsp_ops dsp_ops = {
@@ -409,6 +418,9 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Module IO */
+	.read64	= sof_io_read64,
+
 	/* ipc */
 	.send_msg	= imx8_send_msg,
 	.fw_ready	= sof_fw_ready,
@@ -424,6 +436,9 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
+	/* Debug information */
+	.dbg_dump = imx8_dump,
+
 	/* Firmware ops */
 	.arch_ops = &sof_xtensa_arch_ops,
 
@@ -452,6 +467,9 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Module IO */
+	.read64	= sof_io_read64,
+
 	/* ipc */
 	.send_msg	= imx8_send_msg,
 	.fw_ready	= sof_fw_ready,
@@ -467,6 +485,9 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
+	/* Debug information */
+	.dbg_dump = imx8_dump,
+
 	/* Firmware ops */
 	.arch_ops = &sof_xtensa_arch_ops,
 
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index ca23ac99a63d..cb822d953767 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -17,6 +17,7 @@
 #include <linux/firmware/imx/dsp.h>
 
 #include "../ops.h"
+#include "imx-common.h"
 
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
@@ -88,8 +89,16 @@ static void imx8m_dsp_handle_reply(struct imx_dsp_ipc *ipc)
 static void imx8m_dsp_handle_request(struct imx_dsp_ipc *ipc)
 {
 	struct imx8m_priv *priv = imx_dsp_get_data(ipc);
+	u32 p; /* Panic code */
 
-	snd_sof_ipc_msgs_rx(priv->sdev);
+	/* Read the message from the debug box. */
+	sof_mailbox_read(priv->sdev, priv->sdev->debug_box.offset + 4, &p, sizeof(p));
+
+	/* Check to see if the message is a panic code (0x0dead***) */
+	if ((p & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC)
+		snd_sof_dsp_panic(priv->sdev, p);
+	else
+		snd_sof_ipc_msgs_rx(priv->sdev);
 }
 
 static struct imx_dsp_ops imx8m_dsp_ops = {
@@ -262,6 +271,9 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
 
+	/* Module IO */
+	.read64	= sof_io_read64,
+
 	/* ipc */
 	.send_msg	= imx8m_send_msg,
 	.fw_ready	= sof_fw_ready,
@@ -277,6 +289,9 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* firmware loading */
 	.load_firmware	= snd_sof_load_firmware_memcpy,
 
+	/* Debug information */
+	.dbg_dump = imx8_dump,
+
 	/* Firmware ops */
 	.arch_ops = &sof_xtensa_arch_ops,
 
-- 
2.27.0

