Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE2BB43A
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Apr 2019 20:13:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE7E516B1;
	Sat, 27 Apr 2019 20:12:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE7E516B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556388789;
	bh=Gpe5r42bKpwLZozbD+q2BGPDSBpMW7HFT7p6ZHYuKc4=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=BnfJWfudanTx+sGHW64CXimD9JouNdf2CXJHSZUcnPAu7El7fJzkJoUBXz67zX0C+
	 99QrgmzaZ2UkniLx/Pb/sHykGR/SvbYW0SdChUfkQXesddxxCVXz4Rg9E1IV84uljV
	 W69i1j9FInY7OHio3XYoj1eugJZkT6sogL1XqpSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 47271F89814;
	Sat, 27 Apr 2019 19:55:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61DC7F8972E; Sat, 27 Apr 2019 19:53:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1529CF89738;
 Sat, 27 Apr 2019 19:53:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1529CF89738
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="htygwqVG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=H3khzzc0GuvgJ/WEB81zCI3yRehQ26cdPjOr34q7ZXs=; b=htygwqVGFVYW
 vQxw/fgypSdDrIYrTk/UNwe/LDnWC/I99CQGJtYOFKxdhAIcw3lULBHCCzPe5/8siLjxIITJU/tyV
 uJtaZHL7At9c6XAlo2YkJwxmNy0W4MH2UdpyFzcwuyfsYvymgXWZvMqZiPj/bNxcw9ofc39VrWA17
 cgjAU=;
Received: from [211.55.52.15] (helo=finisterre.ee.mobilebroadband)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hKRVX-0004qt-Si; Sat, 27 Apr 2019 17:53:04 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 8B5A4441D41; Sat, 27 Apr 2019 18:53:00 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <liam.r.girdwood@linux.intel.com>
In-Reply-To: <20190412160519.30207-8-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190427175300.8B5A4441D41@finisterre.ee.mobilebroadband>
Date: Sat, 27 Apr 2019 18:53:00 +0100 (BST)
Cc: Dragos Tarcatu <dragos_tarcatu@mentor.com>,
 Daniel Baluta <daniel.baluta@gmail.com>, sound-open-firmware@alsa-project.org,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 liam.r.girdwood@linux.intel.com, vkoul@kernel.org,
 Mark Brown <broonie@kernel.org>, andriy.shevchenko@linux.intel.com,
 Alan Cox <alan@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Add DSP firmware logger support"
	to the asoc tree
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

   ASoC: SOF: Add DSP firmware logger support

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

From fd51c47b352b7da0e78fc88b9e4da7f298bfdd70 Mon Sep 17 00:00:00 2001
From: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Date: Fri, 12 Apr 2019 11:05:12 -0500
Subject: [PATCH] ASoC: SOF: Add DSP firmware logger support

This patch adds support for real-time DSP logging (timestamped events
and bespoke binary data) for firmware debug. The current solution
relies on DMA transfers to system memory that is then accessed by
userspace tools such as sof-logger. For Intel platforms, two types of
DMAs are currently used (GP-DMA for Baytrail/CherryTrail and HDaudio
DMA for SKL+)

Due to historical reasons, the driver code follows the DSP firmware
conventions and refers to 'traces', but it is currently unrelated to
the Linux trace subsystem. Future solutions will include support for
more advanced hardware (e.g. MIPI Sys-T), additional formats and the
ability to enable/disable specific traces dynamically.

Signed-off-by: Pan Xiuli <xiuli.pan@linux.intel.com>
Signed-off-by: Liam Girdwood <liam.r.girdwood@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/trace.c | 297 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 297 insertions(+)
 create mode 100644 sound/soc/sof/trace.c

diff --git a/sound/soc/sof/trace.c b/sound/soc/sof/trace.c
new file mode 100644
index 000000000000..d588e4b70fad
--- /dev/null
+++ b/sound/soc/sof/trace.c
@@ -0,0 +1,297 @@
+// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license.  When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2018 Intel Corporation. All rights reserved.
+//
+// Author: Liam Girdwood <liam.r.girdwood@linux.intel.com>
+//
+
+#include <linux/debugfs.h>
+#include <linux/sched/signal.h>
+#include "sof-priv.h"
+#include "ops.h"
+
+static size_t sof_wait_trace_avail(struct snd_sof_dev *sdev,
+				   loff_t pos, size_t buffer_size)
+{
+	wait_queue_entry_t wait;
+	loff_t host_offset = READ_ONCE(sdev->host_offset);
+
+	/*
+	 * If host offset is less than local pos, it means write pointer of
+	 * host DMA buffer has been wrapped. We should output the trace data
+	 * at the end of host DMA buffer at first.
+	 */
+	if (host_offset < pos)
+		return buffer_size - pos;
+
+	/* If there is available trace data now, it is unnecessary to wait. */
+	if (host_offset > pos)
+		return host_offset - pos;
+
+	/* wait for available trace data from FW */
+	init_waitqueue_entry(&wait, current);
+	set_current_state(TASK_INTERRUPTIBLE);
+	add_wait_queue(&sdev->trace_sleep, &wait);
+
+	if (!signal_pending(current)) {
+		/* set timeout to max value, no error code */
+		schedule_timeout(MAX_SCHEDULE_TIMEOUT);
+	}
+	remove_wait_queue(&sdev->trace_sleep, &wait);
+
+	/* return bytes available for copy */
+	host_offset = READ_ONCE(sdev->host_offset);
+	if (host_offset < pos)
+		return buffer_size - pos;
+
+	return host_offset - pos;
+}
+
+static ssize_t sof_dfsentry_trace_read(struct file *file, char __user *buffer,
+				       size_t count, loff_t *ppos)
+{
+	struct snd_sof_dfsentry *dfse = file->private_data;
+	struct snd_sof_dev *sdev = dfse->sdev;
+	unsigned long rem;
+	loff_t lpos = *ppos;
+	size_t avail, buffer_size = dfse->size;
+	u64 lpos_64;
+
+	/* make sure we know about any failures on the DSP side */
+	sdev->dtrace_error = false;
+
+	/* check pos and count */
+	if (lpos < 0)
+		return -EINVAL;
+	if (!count)
+		return 0;
+
+	/* check for buffer wrap and count overflow */
+	lpos_64 = lpos;
+	lpos = do_div(lpos_64, buffer_size);
+
+	if (count > buffer_size - lpos) /* min() not used to avoid sparse warnings */
+		count = buffer_size - lpos;
+
+	/* get available count based on current host offset */
+	avail = sof_wait_trace_avail(sdev, lpos, buffer_size);
+	if (sdev->dtrace_error) {
+		dev_err(sdev->dev, "error: trace IO error\n");
+		return -EIO;
+	}
+
+	/* make sure count is <= avail */
+	count = avail > count ? count : avail;
+
+	/* copy available trace data to debugfs */
+	rem = copy_to_user(buffer, ((u8 *)(dfse->buf) + lpos), count);
+	if (rem)
+		return -EFAULT;
+
+	*ppos += count;
+
+	/* move debugfs reading position */
+	return count;
+}
+
+static const struct file_operations sof_dfs_trace_fops = {
+	.open = simple_open,
+	.read = sof_dfsentry_trace_read,
+	.llseek = default_llseek,
+};
+
+static int trace_debugfs_create(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_dfsentry *dfse;
+
+	if (!sdev)
+		return -EINVAL;
+
+	dfse = devm_kzalloc(sdev->dev, sizeof(*dfse), GFP_KERNEL);
+	if (!dfse)
+		return -ENOMEM;
+
+	dfse->type = SOF_DFSENTRY_TYPE_BUF;
+	dfse->buf = sdev->dmatb.area;
+	dfse->size = sdev->dmatb.bytes;
+	dfse->sdev = sdev;
+
+	dfse->dfsentry = debugfs_create_file("trace", 0444, sdev->debugfs_root,
+					     dfse, &sof_dfs_trace_fops);
+	if (!dfse->dfsentry) {
+		/* can't rely on debugfs, only log error and keep going */
+		dev_err(sdev->dev,
+			"error: cannot create debugfs entry for trace\n");
+	}
+
+	return 0;
+}
+
+int snd_sof_init_trace_ipc(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_dma_trace_params params;
+	struct sof_ipc_reply ipc_reply;
+	int ret;
+
+	if (sdev->dtrace_is_enabled || !sdev->dma_trace_pages)
+		return -EINVAL;
+
+	/* set IPC parameters */
+	params.hdr.size = sizeof(params);
+	params.hdr.cmd = SOF_IPC_GLB_TRACE_MSG | SOF_IPC_TRACE_DMA_PARAMS;
+	params.buffer.phy_addr = sdev->dmatp.addr;
+	params.buffer.size = sdev->dmatb.bytes;
+	params.buffer.pages = sdev->dma_trace_pages;
+	params.stream_tag = 0;
+
+	sdev->host_offset = 0;
+
+	ret = snd_sof_dma_trace_init(sdev, &params.stream_tag);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: fail in snd_sof_dma_trace_init %d\n", ret);
+		return ret;
+	}
+	dev_dbg(sdev->dev, "stream_tag: %d\n", params.stream_tag);
+
+	/* send IPC to the DSP */
+	ret = sof_ipc_tx_message(sdev->ipc,
+				 params.hdr.cmd, &params, sizeof(params),
+				 &ipc_reply, sizeof(ipc_reply));
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: can't set params for DMA for trace %d\n", ret);
+		goto trace_release;
+	}
+
+	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: snd_sof_dma_trace_trigger: start: %d\n", ret);
+		goto trace_release;
+	}
+
+	sdev->dtrace_is_enabled = true;
+
+	return 0;
+
+trace_release:
+	snd_sof_dma_trace_release(sdev);
+	return ret;
+}
+
+int snd_sof_init_trace(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	/* set false before start initialization */
+	sdev->dtrace_is_enabled = false;
+
+	/* allocate trace page table buffer */
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV, sdev->dev,
+				  PAGE_SIZE, &sdev->dmatp);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: can't alloc page table for trace %d\n", ret);
+		return ret;
+	}
+
+	/* allocate trace data buffer */
+	ret = snd_dma_alloc_pages(SNDRV_DMA_TYPE_DEV_SG, sdev->dev,
+				  DMA_BUF_SIZE_FOR_TRACE, &sdev->dmatb);
+	if (ret < 0) {
+		dev_err(sdev->dev,
+			"error: can't alloc buffer for trace %d\n", ret);
+		goto page_err;
+	}
+
+	/* create compressed page table for audio firmware */
+	ret = snd_sof_create_page_table(sdev, &sdev->dmatb, sdev->dmatp.area,
+					sdev->dmatb.bytes);
+	if (ret < 0)
+		goto table_err;
+
+	sdev->dma_trace_pages = ret;
+	dev_dbg(sdev->dev, "dma_trace_pages: %d\n", sdev->dma_trace_pages);
+
+	if (sdev->first_boot) {
+		ret = trace_debugfs_create(sdev);
+		if (ret < 0)
+			goto table_err;
+	}
+
+	init_waitqueue_head(&sdev->trace_sleep);
+
+	ret = snd_sof_init_trace_ipc(sdev);
+	if (ret < 0)
+		goto table_err;
+
+	return 0;
+table_err:
+	sdev->dma_trace_pages = 0;
+	snd_dma_free_pages(&sdev->dmatb);
+page_err:
+	snd_dma_free_pages(&sdev->dmatp);
+	return ret;
+}
+EXPORT_SYMBOL(snd_sof_init_trace);
+
+int snd_sof_trace_update_pos(struct snd_sof_dev *sdev,
+			     struct sof_ipc_dma_trace_posn *posn)
+{
+	if (sdev->dtrace_is_enabled && sdev->host_offset != posn->host_offset) {
+		sdev->host_offset = posn->host_offset;
+		wake_up(&sdev->trace_sleep);
+	}
+
+	if (posn->overflow != 0)
+		dev_err(sdev->dev,
+			"error: DSP trace buffer overflow %u bytes. Total messages %d\n",
+			posn->overflow, posn->messages);
+
+	return 0;
+}
+
+/* an error has occurred within the DSP that prevents further trace */
+void snd_sof_trace_notify_for_error(struct snd_sof_dev *sdev)
+{
+	if (sdev->dtrace_is_enabled) {
+		dev_err(sdev->dev, "error: waking up any trace sleepers\n");
+		sdev->dtrace_error = true;
+		wake_up(&sdev->trace_sleep);
+	}
+}
+EXPORT_SYMBOL(snd_sof_trace_notify_for_error);
+
+void snd_sof_release_trace(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	if (!sdev->dtrace_is_enabled)
+		return;
+
+	ret = snd_sof_dma_trace_trigger(sdev, SNDRV_PCM_TRIGGER_STOP);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: snd_sof_dma_trace_trigger: stop: %d\n", ret);
+
+	ret = snd_sof_dma_trace_release(sdev);
+	if (ret < 0)
+		dev_err(sdev->dev,
+			"error: fail in snd_sof_dma_trace_release %d\n", ret);
+
+	sdev->dtrace_is_enabled = false;
+}
+EXPORT_SYMBOL(snd_sof_release_trace);
+
+void snd_sof_free_trace(struct snd_sof_dev *sdev)
+{
+	snd_sof_release_trace(sdev);
+
+	snd_dma_free_pages(&sdev->dmatb);
+	snd_dma_free_pages(&sdev->dmatp);
+}
+EXPORT_SYMBOL(snd_sof_free_trace);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
