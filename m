Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2243AB431
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:06:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC337920;
	Sat, 27 Apr 2019 20:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC337920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388384;
	bh=6qO5L0iPYlnA6Cb9V0xlJsB8R0Cbi1xb3WCkRT4tRnk=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=UhW8zqP+tsNdYnDXcMYFbDzbmMOV5NG+m5ZpAtAMVMTHs++mke4T3ZxLks6/UTo2Y
	 TiUoRqx4DKjKiCDFyKe6w1TTDq1Br/g4xGDQ9/Y0DWicOzLwq8vNFKHkW4KM+5A4xZ
	 0GAKkQorfyeujTtClLJGEyyXU3wbEbrrAqxzccKM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A19CF897A1;
	Sat, 27 Apr 2019 19:54:32 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EE0DFF89756; Sat, 27 Apr 2019 19:53:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80E0CF896DB;
 Sat, 27 Apr 2019 19:52:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80E0CF896DB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="szFcHnTQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=jarkj/AdzydlBuYRFeI7prJC8PbQtbThzvGAyAMtH3A=; b=szFcHnTQFCuA
 z8EPp+cOfIzYx+npiJlPbeE72ZScsxM3BI4wEgXlsNG9kShCpaJsu8EvGkYQvm8TBOcXaA3T8lX4V
 SC/DSTt6n8KqXLpvcuBbUf799P6MhKkCnxmoKGJmFM3s3bM1uYKwZORxoZUTuke6/UXZWWX7IDAtR
 CKoGY=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVJ-0004nu-6J; Sat, 27 Apr 2019 17:52:51 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 2DC68441D3F; Sat, 27 Apr 2019 18:52:41 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-16-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175241.2DC68441D3F@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:41 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add platform
	differentiation for APL and CNL" to the asoc tree
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

   ASoC: SOF: Intel: Add platform differentiation for APL and CNL

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.2

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

From 273020522ef62361c5d86eebe45a72418ed8dea4 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:58 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add platform differentiation for APL and
 CNL

Add platform differentiation operations for different Intel HDA DSP
platforms.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/apl.c | 109 +++++++++++++++++
 sound/soc/sof/intel/cnl.c | 249 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 358 insertions(+)
 create mode 100644 sound/soc/sof/intel/apl.c
 create mode 100644 sound/soc/sof/intel/cnl.c

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
new file mode 100644
index 000000000000..8c6282606944
--- /dev/null
+++ b/sound/soc/sof/intel/apl.c
@@ -0,0 +1,109 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//	    Rander Wang <rander.wang@intel.com>
+//          Keyon Jie <yang.jie@linux.intel.com>
+//
+
+/*
+ * Hardware interface for audio DSP on Apollolake and GeminiLake
+ */
+
+#include "../sof-priv.h"
+#include "hda.h"
+
+static const struct snd_sof_debugfs_map apl_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+};
+
+/* apollolake ops */
+const struct snd_sof_dsp_ops sof_apl_ops = {
+	/* probe and remove */
+	.probe		= hda_dsp_probe,
+	.remove		= hda_dsp_remove,
+
+	/* Register IO */
+	.write		= sof_io_write,
+	.read		= sof_io_read,
+	.write64	= sof_io_write64,
+	.read64		= sof_io_read64,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* doorbell */
+	.irq_handler	= hda_dsp_ipc_irq_handler,
+	.irq_thread	= hda_dsp_ipc_irq_thread,
+
+	/* ipc */
+	.send_msg	= hda_dsp_ipc_send_msg,
+	.fw_ready	= hda_dsp_ipc_fw_ready,
+
+	.ipc_msg_data	= hda_ipc_msg_data,
+	.ipc_pcm_params	= hda_ipc_pcm_params,
+
+	/* debug */
+	.debug_map	= apl_dsp_debugfs,
+	.debug_map_count	= ARRAY_SIZE(apl_dsp_debugfs),
+	.dbg_dump	= hda_dsp_dump,
+
+	/* stream callbacks */
+	.pcm_open	= hda_dsp_pcm_open,
+	.pcm_close	= hda_dsp_pcm_close,
+	.pcm_hw_params	= hda_dsp_pcm_hw_params,
+	.pcm_trigger	= hda_dsp_pcm_trigger,
+	.pcm_pointer	= hda_dsp_pcm_pointer,
+
+	/* firmware loading */
+	.load_firmware = snd_sof_load_firmware_raw,
+
+	/* firmware run */
+	.run = hda_dsp_cl_boot_firmware,
+
+	/* pre/post fw run */
+	.pre_fw_run = hda_dsp_pre_fw_run,
+	.post_fw_run = hda_dsp_post_fw_run,
+
+	/* dsp core power up/down */
+	.core_power_up = hda_dsp_enable_core,
+	.core_power_down = hda_dsp_core_reset_power_down,
+
+	/* trace callback */
+	.trace_init = hda_dsp_trace_init,
+	.trace_release = hda_dsp_trace_release,
+	.trace_trigger = hda_dsp_trace_trigger,
+
+	/* DAI drivers */
+	.drv		= skl_dai,
+	.num_drv	= SOF_SKL_NUM_DAIS,
+
+	/* PM */
+	.suspend		= hda_dsp_suspend,
+	.resume			= hda_dsp_resume,
+	.runtime_suspend	= hda_dsp_runtime_suspend,
+	.runtime_resume		= hda_dsp_runtime_resume,
+};
+EXPORT_SYMBOL(sof_apl_ops);
+
+const struct sof_intel_dsp_desc apl_chip_info = {
+	/* Apollolake */
+	.cores_num = 2,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0) | HDA_DSP_CORE_MASK(1),
+	.ipc_req = HDA_DSP_REG_HIPCI,
+	.ipc_req_mask = HDA_DSP_REG_HIPCI_BUSY,
+	.ipc_ack = HDA_DSP_REG_HIPCIE,
+	.ipc_ack_mask = HDA_DSP_REG_HIPCIE_DONE,
+	.ipc_ctl = HDA_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 150,
+};
+EXPORT_SYMBOL(apl_chip_info);
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
new file mode 100644
index 000000000000..3e95c1e5e491
--- /dev/null
+++ b/sound/soc/sof/intel/cnl.c
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Authors: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//	    Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
+//	    Rander Wang <rander.wang@intel.com>
+//          Keyon Jie <yang.jie@linux.intel.com>
+//
+
+/*
+ * Hardware interface for audio DSP on Cannonlake.
+ */
+
+#include "../ops.h"
+#include "hda.h"
+
+static const struct snd_sof_debugfs_map cnl_dsp_debugfs[] = {
+	{"hda", HDA_DSP_HDA_BAR, 0, 0x4000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"pp", HDA_DSP_PP_BAR,  0, 0x1000, SOF_DEBUGFS_ACCESS_ALWAYS},
+	{"dsp", HDA_DSP_BAR,  0, 0x10000, SOF_DEBUGFS_ACCESS_ALWAYS},
+};
+
+static void cnl_ipc_host_done(struct snd_sof_dev *sdev);
+static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev);
+
+static irqreturn_t cnl_ipc_irq_thread(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+	u32 hipci;
+	u32 hipcctl;
+	u32 hipcida;
+	u32 hipctdr;
+	u32 hipctdd;
+	u32 msg;
+	u32 msg_ext;
+	irqreturn_t ret = IRQ_NONE;
+
+	/* here we handle IPC interrupts only */
+	if (!(sdev->irq_status & HDA_DSP_ADSPIS_IPC))
+		return ret;
+
+	hipcida = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDA);
+	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCCTL);
+	hipctdr = snd_sof_dsp_read(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCTDR);
+
+	/* reenable IPC interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
+
+	/* reply message from DSP */
+	if (hipcida & CNL_DSP_REG_HIPCIDA_DONE &&
+	    hipcctl & CNL_DSP_REG_HIPCCTL_DONE) {
+		hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					 CNL_DSP_REG_HIPCIDR);
+		msg_ext = hipci & CNL_DSP_REG_HIPCIDR_MSG_MASK;
+		msg = hipcida & CNL_DSP_REG_HIPCIDA_MSG_MASK;
+
+		dev_vdbg(sdev->dev,
+			 "ipc: firmware response, msg:0x%x, msg_ext:0x%x\n",
+			 msg, msg_ext);
+
+		/* mask Done interrupt */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					CNL_DSP_REG_HIPCCTL,
+					CNL_DSP_REG_HIPCCTL_DONE, 0);
+
+		/* handle immediate reply from DSP core */
+		hda_dsp_ipc_get_reply(sdev);
+		snd_sof_ipc_reply(sdev, msg);
+
+		if (sdev->code_loading)	{
+			sdev->code_loading = 0;
+			wake_up(&sdev->waitq);
+		}
+
+		cnl_ipc_dsp_done(sdev);
+
+		ret = IRQ_HANDLED;
+	}
+
+	/* new message from DSP */
+	if (hipctdr & CNL_DSP_REG_HIPCTDR_BUSY) {
+		hipctdd = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					   CNL_DSP_REG_HIPCTDD);
+		msg = hipctdr & CNL_DSP_REG_HIPCTDR_MSG_MASK;
+		msg_ext = hipctdd & CNL_DSP_REG_HIPCTDD_MSG_MASK;
+
+		dev_vdbg(sdev->dev,
+			 "ipc: firmware initiated, msg:0x%x, msg_ext:0x%x\n",
+			 msg, msg_ext);
+
+		/* handle messages from DSP */
+		if ((hipctdr & SOF_IPC_PANIC_MAGIC_MASK) ==
+		   SOF_IPC_PANIC_MAGIC) {
+			snd_sof_dsp_panic(sdev, HDA_DSP_PANIC_OFFSET(msg_ext));
+		} else {
+			snd_sof_ipc_msgs_rx(sdev);
+		}
+
+		/*
+		 * clear busy interrupt to tell dsp controller this
+		 * interrupt has been accepted, not trigger it again
+		 */
+		snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+					       CNL_DSP_REG_HIPCTDR,
+					       CNL_DSP_REG_HIPCTDR_BUSY,
+					       CNL_DSP_REG_HIPCTDR_BUSY);
+
+		cnl_ipc_host_done(sdev);
+
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+static void cnl_ipc_host_done(struct snd_sof_dev *sdev)
+{
+	/*
+	 * set done bit to ack dsp the msg has been
+	 * processed and send reply msg to dsp
+	 */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       CNL_DSP_REG_HIPCTDA,
+				       CNL_DSP_REG_HIPCTDA_DONE,
+				       CNL_DSP_REG_HIPCTDA_DONE);
+}
+
+static void cnl_ipc_dsp_done(struct snd_sof_dev *sdev)
+{
+	/*
+	 * set DONE bit - tell DSP we have received the reply msg
+	 * from DSP, and processed it, don't send more reply to host
+	 */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       CNL_DSP_REG_HIPCIDA,
+				       CNL_DSP_REG_HIPCIDA_DONE,
+				       CNL_DSP_REG_HIPCIDA_DONE);
+
+	/* unmask Done interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				CNL_DSP_REG_HIPCCTL,
+				CNL_DSP_REG_HIPCCTL_DONE,
+				CNL_DSP_REG_HIPCCTL_DONE);
+}
+
+static int cnl_ipc_send_msg(struct snd_sof_dev *sdev,
+			    struct snd_sof_ipc_msg *msg)
+{
+	u32 cmd = msg->header;
+
+	/* send the message */
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, CNL_DSP_REG_HIPCIDR,
+			  cmd | CNL_DSP_REG_HIPCIDR_BUSY);
+
+	return 0;
+}
+
+/* cannonlake ops */
+const struct snd_sof_dsp_ops sof_cnl_ops = {
+	/* probe and remove */
+	.probe		= hda_dsp_probe,
+	.remove		= hda_dsp_remove,
+
+	/* Register IO */
+	.write		= sof_io_write,
+	.read		= sof_io_read,
+	.write64	= sof_io_write64,
+	.read64		= sof_io_read64,
+
+	/* Block IO */
+	.block_read	= sof_block_read,
+	.block_write	= sof_block_write,
+
+	/* doorbell */
+	.irq_handler	= hda_dsp_ipc_irq_handler,
+	.irq_thread	= cnl_ipc_irq_thread,
+
+	/* ipc */
+	.send_msg	= cnl_ipc_send_msg,
+	.fw_ready	= hda_dsp_ipc_fw_ready,
+
+	.ipc_msg_data	= hda_ipc_msg_data,
+	.ipc_pcm_params	= hda_ipc_pcm_params,
+
+	/* debug */
+	.debug_map	= cnl_dsp_debugfs,
+	.debug_map_count	= ARRAY_SIZE(cnl_dsp_debugfs),
+	.dbg_dump	= hda_dsp_dump,
+
+	/* stream callbacks */
+	.pcm_open	= hda_dsp_pcm_open,
+	.pcm_close	= hda_dsp_pcm_close,
+	.pcm_hw_params	= hda_dsp_pcm_hw_params,
+	.pcm_trigger	= hda_dsp_pcm_trigger,
+
+	/* firmware loading */
+	.load_firmware = snd_sof_load_firmware_raw,
+
+	/* pre/post fw run */
+	.pre_fw_run = hda_dsp_pre_fw_run,
+	.post_fw_run = hda_dsp_post_fw_run,
+
+	/* dsp core power up/down */
+	.core_power_up = hda_dsp_enable_core,
+	.core_power_down = hda_dsp_core_reset_power_down,
+
+	/* firmware run */
+	.run = hda_dsp_cl_boot_firmware,
+
+	/* trace callback */
+	.trace_init = hda_dsp_trace_init,
+	.trace_release = hda_dsp_trace_release,
+	.trace_trigger = hda_dsp_trace_trigger,
+
+	/* DAI drivers */
+	.drv		= skl_dai,
+	.num_drv	= SOF_SKL_NUM_DAIS,
+
+	/* PM */
+	.suspend		= hda_dsp_suspend,
+	.resume			= hda_dsp_resume,
+	.runtime_suspend	= hda_dsp_runtime_suspend,
+	.runtime_resume		= hda_dsp_runtime_resume,
+};
+EXPORT_SYMBOL(sof_cnl_ops);
+
+const struct sof_intel_dsp_desc cnl_chip_info = {
+	/* Cannonlake */
+	.cores_num = 4,
+	.init_core_mask = 1,
+	.cores_mask = HDA_DSP_CORE_MASK(0) |
+				HDA_DSP_CORE_MASK(1) |
+				HDA_DSP_CORE_MASK(2) |
+				HDA_DSP_CORE_MASK(3),
+	.ipc_req = CNL_DSP_REG_HIPCIDR,
+	.ipc_req_mask = CNL_DSP_REG_HIPCIDR_BUSY,
+	.ipc_ack = CNL_DSP_REG_HIPCIDA,
+	.ipc_ack_mask = CNL_DSP_REG_HIPCIDA_DONE,
+	.ipc_ctl = CNL_DSP_REG_HIPCCTL,
+	.rom_init_timeout	= 300,
+};
+EXPORT_SYMBOL(cnl_chip_info);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
