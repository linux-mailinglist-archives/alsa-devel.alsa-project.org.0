Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D941AB42D
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:04:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FBBE1650;
	Sat, 27 Apr 2019 20:03:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FBBE1650
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388255;
	bh=9c4dTWYg77lOB5UFpngRBbyR/xVJR/QZ8d85WjrL6To=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=hIDP0PvnkiXG7JqUXksZaeedSDLfBwvCF/rzQFfhsI6UGa3+TTiLNeomJS4OY6kuO
	 5Be6z8SP/TmV2qJ/rF+A3ZYGfR101M0kHjyqmTDHpa0Vj/BokkmT1jyl46TL4OXgsr
	 K53vmj2xb6z1poSj0pGL3OfbaxXTA32qC344j/r0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 094DFF8978C;
	Sat, 27 Apr 2019 19:54:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 451D4F89749; Sat, 27 Apr 2019 19:53:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E3B13F89722;
 Sat, 27 Apr 2019 19:52:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E3B13F89722
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="LY2zYESO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=tQcOseOE/lgF4FmL/SHzO03IfSN0joQCJIuj4p63r20=; b=LY2zYESONVu+
 ZNQjFGx45q485PIpFux3RMoUpavOs4aw7pl7rQ/8uPEvqAXdOl2EGCFogaG32f4Il5X5m5Lzbrv1R
 CfFu/Vwyx/h0ruC0TGbetFCLWQdAl3PTTp2Jtrx9sIfh4b2n4tpKju7ndK2PcbH7RxF7Kr/OS7u/b
 DvaXk=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVN-0004of-GN; Sat, 27 Apr 2019 17:52:54 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id DD388441D41; Sat, 27 Apr 2019 18:52:46 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160904.30418-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175246.DD388441D41@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:52:46 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Keyon Jie <yang.jie@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: Add Intel specific HDA IPC
	mechanisms." to the asoc tree
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

   ASoC: SOF: Intel: Add Intel specific HDA IPC mechanisms.

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

From 6e9cde974863dc9d9c6cdb178f625e410c5be3d0 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:08:50 -0500
Subject: [PATCH] ASoC: SOF: Intel: Add Intel specific HDA IPC mechanisms.

Add HDA specific IPC mechanism for Intel DSP HW.

Signed-off-by: Keyon Jie <yang.jie@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-ipc.c | 458 ++++++++++++++++++++++++++++++++++
 1 file changed, 458 insertions(+)
 create mode 100644 sound/soc/sof/intel/hda-ipc.c

diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
new file mode 100644
index 000000000000..a938f568dbb1
--- /dev/null
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -0,0 +1,458 @@
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
+ * Hardware interface for generic Intel audio DSP HDA IP
+ */
+
+#include "../ops.h"
+#include "hda.h"
+
+static void hda_dsp_ipc_host_done(struct snd_sof_dev *sdev)
+{
+	/*
+	 * tell DSP cmd is done - clear busy
+	 * interrupt and send reply msg to dsp
+	 */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       HDA_DSP_REG_HIPCT,
+				       HDA_DSP_REG_HIPCT_BUSY,
+				       HDA_DSP_REG_HIPCT_BUSY);
+
+	/* unmask BUSY interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				HDA_DSP_REG_HIPCCTL,
+				HDA_DSP_REG_HIPCCTL_BUSY,
+				HDA_DSP_REG_HIPCCTL_BUSY);
+}
+
+static void hda_dsp_ipc_dsp_done(struct snd_sof_dev *sdev)
+{
+	/*
+	 * set DONE bit - tell DSP we have received the reply msg
+	 * from DSP, and processed it, don't send more reply to host
+	 */
+	snd_sof_dsp_update_bits_forced(sdev, HDA_DSP_BAR,
+				       HDA_DSP_REG_HIPCIE,
+				       HDA_DSP_REG_HIPCIE_DONE,
+				       HDA_DSP_REG_HIPCIE_DONE);
+
+	/* unmask Done interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+				HDA_DSP_REG_HIPCCTL,
+				HDA_DSP_REG_HIPCCTL_DONE,
+				HDA_DSP_REG_HIPCCTL_DONE);
+}
+
+int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev, struct snd_sof_ipc_msg *msg)
+{
+	u32 cmd = msg->header;
+
+	/* send IPC message to DSP */
+	sof_mailbox_write(sdev, sdev->host_box.offset, msg->msg_data,
+			  msg->msg_size);
+	snd_sof_dsp_write(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCI,
+			  cmd | HDA_DSP_REG_HIPCI_BUSY);
+
+	return 0;
+}
+
+void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply reply;
+	struct sof_ipc_cmd_hdr *hdr;
+	unsigned long flags;
+	int ret = 0;
+
+	/*
+	 * Sometimes, there is unexpected reply ipc arriving. The reply
+	 * ipc belongs to none of the ipcs sent from driver.
+	 * In this case, the driver must ignore the ipc.
+	 */
+	if (!msg) {
+		dev_warn(sdev->dev, "unexpected ipc interrupt raised!\n");
+		return;
+	}
+	spin_lock_irqsave(&sdev->ipc_lock, flags);
+
+	hdr = msg->msg_data;
+	if (hdr->cmd == (SOF_IPC_GLB_PM_MSG | SOF_IPC_PM_CTX_SAVE)) {
+		/*
+		 * memory windows are powered off before sending IPC reply,
+		 * so we can't read the mailbox for CTX_SAVE reply.
+		 */
+		reply.error = 0;
+		reply.hdr.cmd = SOF_IPC_GLB_REPLY;
+		reply.hdr.size = sizeof(reply);
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		goto out;
+	}
+
+	/* get IPC reply from DSP in the mailbox */
+	sof_mailbox_read(sdev, sdev->host_box.offset, &reply,
+			 sizeof(reply));
+
+	if (reply.error < 0) {
+		memcpy(msg->reply_data, &reply, sizeof(reply));
+		ret = reply.error;
+	} else {
+		/* reply correct size ? */
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
+out:
+	msg->reply_error = ret;
+
+	spin_unlock_irqrestore(&sdev->ipc_lock, flags);
+}
+
+static bool hda_dsp_ipc_is_sof(uint32_t msg)
+{
+	return (msg & (HDA_DSP_IPC_PURGE_FW | 0xf << 9)) != msg ||
+		(msg & HDA_DSP_IPC_PURGE_FW) != HDA_DSP_IPC_PURGE_FW;
+}
+
+/* IPC handler thread */
+irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+	irqreturn_t ret = IRQ_NONE;
+	u32 hipci;
+	u32 hipcie;
+	u32 hipct;
+	u32 hipcte;
+	u32 hipcctl;
+	u32 msg;
+	u32 msg_ext;
+
+	/* here we handle IPC interrupts only */
+	if (!(sdev->irq_status & HDA_DSP_ADSPIS_IPC))
+		return IRQ_NONE;
+
+	/* read IPC status */
+	hipcie = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+				  HDA_DSP_REG_HIPCIE);
+	hipct = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCT);
+	hipcctl = snd_sof_dsp_read(sdev, HDA_DSP_BAR, HDA_DSP_REG_HIPCCTL);
+
+	/* reenable IPC interrupt */
+	snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR, HDA_DSP_REG_ADSPIC,
+				HDA_DSP_ADSPIC_IPC, HDA_DSP_ADSPIC_IPC);
+
+	/* is this a reply message from the DSP */
+	if (hipcie & HDA_DSP_REG_HIPCIE_DONE &&
+	    hipcctl & HDA_DSP_REG_HIPCCTL_DONE) {
+		hipci = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					 HDA_DSP_REG_HIPCI);
+		msg = hipci & HDA_DSP_REG_HIPCI_MSG_MASK;
+		msg_ext = hipcie & HDA_DSP_REG_HIPCIE_MSG_MASK;
+
+		dev_vdbg(sdev->dev,
+			 "ipc: firmware response, msg:0x%x, msg_ext:0x%x\n",
+			 msg, msg_ext);
+
+		/* mask Done interrupt */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					HDA_DSP_REG_HIPCCTL,
+					HDA_DSP_REG_HIPCCTL_DONE, 0);
+
+		/* handle immediate reply from DSP core - ignore ROM messages */
+		if (hda_dsp_ipc_is_sof(msg)) {
+			hda_dsp_ipc_get_reply(sdev);
+			snd_sof_ipc_reply(sdev, msg);
+		}
+
+		/* wake up sleeper if we are loading code */
+		if (sdev->code_loading)	{
+			sdev->code_loading = 0;
+			wake_up(&sdev->waitq);
+		}
+
+		/* set the done bit */
+		hda_dsp_ipc_dsp_done(sdev);
+
+		ret = IRQ_HANDLED;
+	}
+
+	/* is this a new message from DSP */
+	if (hipct & HDA_DSP_REG_HIPCT_BUSY &&
+	    hipcctl & HDA_DSP_REG_HIPCCTL_BUSY) {
+
+		hipcte = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					  HDA_DSP_REG_HIPCTE);
+		msg = hipct & HDA_DSP_REG_HIPCT_MSG_MASK;
+		msg_ext = hipcte & HDA_DSP_REG_HIPCTE_MSG_MASK;
+
+		dev_vdbg(sdev->dev,
+			 "ipc: firmware initiated, msg:0x%x, msg_ext:0x%x\n",
+			 msg, msg_ext);
+
+		/* mask BUSY interrupt */
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_BAR,
+					HDA_DSP_REG_HIPCCTL,
+					HDA_DSP_REG_HIPCCTL_BUSY, 0);
+
+		/* handle messages from DSP */
+		if ((hipct & SOF_IPC_PANIC_MAGIC_MASK) == SOF_IPC_PANIC_MAGIC) {
+			/* this is a PANIC message !! */
+			snd_sof_dsp_panic(sdev, HDA_DSP_PANIC_OFFSET(msg_ext));
+		} else {
+			/* normal message - process normally */
+			snd_sof_ipc_msgs_rx(sdev);
+		}
+
+		hda_dsp_ipc_host_done(sdev);
+
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
+/* is this IRQ for ADSP ? - we only care about IPC here */
+irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context)
+{
+	struct snd_sof_dev *sdev = context;
+	int ret = IRQ_NONE;
+
+	spin_lock(&sdev->hw_lock);
+
+	/* store status */
+	sdev->irq_status = snd_sof_dsp_read(sdev, HDA_DSP_BAR,
+					    HDA_DSP_REG_ADSPIS);
+
+	/* invalid message ? */
+	if (sdev->irq_status == 0xffffffff)
+		goto out;
+
+	/* IPC message ? */
+	if (sdev->irq_status & HDA_DSP_ADSPIS_IPC) {
+		/* disable IPC interrupt */
+		snd_sof_dsp_update_bits_unlocked(sdev, HDA_DSP_BAR,
+						 HDA_DSP_REG_ADSPIC,
+						 HDA_DSP_ADSPIC_IPC, 0);
+		ret = IRQ_WAKE_THREAD;
+	}
+
+out:
+	spin_unlock(&sdev->hw_lock);
+	return ret;
+}
+
+/* IPC Firmware ready */
+
+static void ipc_get_windows(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_window_elem *elem;
+	u32 outbox_offset = 0;
+	u32 stream_offset = 0;
+	u32 inbox_offset = 0;
+	u32 outbox_size = 0;
+	u32 stream_size = 0;
+	u32 inbox_size = 0;
+	int i;
+
+	if (!sdev->info_window) {
+		dev_err(sdev->dev, "error: have no window info\n");
+		return;
+	}
+
+	for (i = 0; i < sdev->info_window->num_windows; i++) {
+		elem = &sdev->info_window->window[i];
+
+		switch (elem->type) {
+		case SOF_IPC_REGION_UPBOX:
+			inbox_offset =
+				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
+			inbox_size = elem->size;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						inbox_offset,
+						elem->size, "inbox",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_DOWNBOX:
+			outbox_offset =
+				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
+			outbox_size = elem->size;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						outbox_offset,
+						elem->size, "outbox",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_TRACE:
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						elem->offset +
+						SRAM_WINDOW_OFFSET
+						(elem->id),
+						elem->size, "etrace",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_DEBUG:
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						elem->offset +
+						SRAM_WINDOW_OFFSET
+						(elem->id),
+						elem->size, "debug",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_STREAM:
+			stream_offset =
+				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
+			stream_size = elem->size;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						elem->offset +
+						SRAM_WINDOW_OFFSET
+						(elem->id),
+						elem->size, "stream",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_REGS:
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						elem->offset +
+						SRAM_WINDOW_OFFSET
+						(elem->id),
+						elem->size, "regs",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_EXCEPTION:
+			sdev->dsp_oops_offset = elem->offset +
+						SRAM_WINDOW_OFFSET(elem->id);
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[HDA_DSP_BAR] +
+						elem->offset +
+						SRAM_WINDOW_OFFSET
+						(elem->id),
+						elem->size, "exception",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		default:
+			dev_err(sdev->dev, "error: get illegal window info\n");
+			return;
+		}
+	}
+
+	if (outbox_size == 0 || inbox_size == 0) {
+		dev_err(sdev->dev, "error: get illegal mailbox window\n");
+		return;
+	}
+
+	snd_sof_dsp_mailbox_init(sdev, inbox_offset, inbox_size,
+				 outbox_offset, outbox_size);
+	sdev->stream_box.offset = stream_offset;
+	sdev->stream_box.size = stream_size;
+
+	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
+		inbox_offset, inbox_size);
+	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
+		outbox_offset, outbox_size);
+	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
+		stream_offset, stream_size);
+}
+
+/* check for ABI compatibility and create memory windows on first boot */
+int hda_dsp_ipc_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
+	u32 offset;
+	int ret;
+
+	/* mailbox must be on 4k boundary */
+	offset = HDA_DSP_MBOX_UPLINK_OFFSET;
+
+	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
+		msg_id, offset);
+
+	/* no need to re-check version/ABI for subsequent boots */
+	if (!sdev->first_boot)
+		return 0;
+
+	/* copy data from the DSP FW ready offset */
+	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
+		       sizeof(*fw_ready));
+
+	/* make sure ABI version is compatible */
+	ret = snd_sof_ipc_valid(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* now check for extended data */
+	snd_sof_fw_parse_ext_data(sdev, sdev->mmio_bar,
+				  HDA_DSP_MBOX_UPLINK_OFFSET +
+				  sizeof(struct sof_ipc_fw_ready));
+
+	ipc_get_windows(sdev);
+
+	return 0;
+}
+
+void hda_ipc_msg_data(struct snd_sof_dev *sdev,
+		      struct snd_pcm_substream *substream,
+		      void *p, size_t sz)
+{
+	if (!substream || !sdev->stream_box.size) {
+		sof_mailbox_read(sdev, sdev->dsp_box.offset, p, sz);
+	} else {
+		struct hdac_stream *hstream = substream->runtime->private_data;
+		struct sof_intel_hda_stream *hda_stream;
+
+		hda_stream = container_of(hstream,
+					  struct sof_intel_hda_stream,
+					  hda_stream.hstream);
+
+		/* The stream might already be closed */
+		if (hstream)
+			sof_mailbox_read(sdev, hda_stream->stream.posn_offset,
+					 p, sz);
+	}
+}
+
+int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
+		       struct snd_pcm_substream *substream,
+		       const struct sof_ipc_pcm_params_reply *reply)
+{
+	struct hdac_stream *hstream = substream->runtime->private_data;
+	struct sof_intel_hda_stream *hda_stream;
+	/* validate offset */
+	size_t posn_offset = reply->posn_offset;
+
+	hda_stream = container_of(hstream, struct sof_intel_hda_stream,
+				  hda_stream.hstream);
+
+	/* check for unaligned offset or overflow */
+	if (posn_offset > sdev->stream_box.size ||
+	    posn_offset % sizeof(struct sof_ipc_stream_posn) != 0)
+		return -EINVAL;
+
+	hda_stream->stream.posn_offset = sdev->stream_box.offset + posn_offset;
+
+	dev_dbg(sdev->dev, "pcm: stream dir %d, posn mailbox offset is %zu",
+		substream->stream, hda_stream->stream.posn_offset);
+
+	return 0;
+}
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
