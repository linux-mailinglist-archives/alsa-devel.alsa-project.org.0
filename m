Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF59384F75
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:07:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C08715E5;
	Wed,  7 Aug 2019 17:06:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C08715E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190446;
	bh=RXIAw7ku4BJu+I4nVa5oALpD2cmlxh7O851WDpzkEGs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J4T5Svga3CXBAIWJFEa6Ud2gu09aDlU/7+rM+G9/qPobfABRSekCGdwTyb9rKPl4H
	 k/FF25JJeivEbF5NjMo3/4ItYHjS3nH5ZHOWtyjXWcCCZypSVVU025KBhdnzusRrvN
	 aJzb0oLrTpN70B/MvJoaA50ImIIv6XtAUptxCrx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6FC1BF80634;
	Wed,  7 Aug 2019 17:02:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0179BF805FA; Wed,  7 Aug 2019 17:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E826EF80483
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E826EF80483
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182305866"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 08:02:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 10:02:02 -0500
Message-Id: <20190807150203.26359-6-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 5/6] ASoC: SOF: Intel: bdw: Use generic
	function for fw ready / mem windows creation
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

bdw_get_windows / bdw_fw_ready is identical with the generic
implementation introduced in a previous patch.

So remove bdw_get_windows / bdw_fw_ready and use the generic
sof_get_windows version.

Do not forget to implement get_mailbox_offset/get_window_offset
so that we export the correct mailbox/memory window offset to
the outside world.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/bdw.c | 156 ++++----------------------------------
 1 file changed, 13 insertions(+), 143 deletions(-)

diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 94be024a99eb..e282179263e8 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -327,148 +327,6 @@ static irqreturn_t bdw_irq_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
-/*
- * IPC Firmware ready.
- */
-static void bdw_get_windows(struct snd_sof_dev *sdev)
-{
-	struct sof_ipc_window_elem *elem;
-	u32 outbox_offset = 0;
-	u32 stream_offset = 0;
-	u32 inbox_offset = 0;
-	u32 outbox_size = 0;
-	u32 stream_size = 0;
-	u32 inbox_size = 0;
-	int i;
-
-	if (!sdev->info_window) {
-		dev_err(sdev->dev, "error: have no window info\n");
-		return;
-	}
-
-	for (i = 0; i < sdev->info_window->num_windows; i++) {
-		elem = &sdev->info_window->window[i];
-
-		switch (elem->type) {
-		case SOF_IPC_REGION_UPBOX:
-			inbox_offset = elem->offset + MBOX_OFFSET;
-			inbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						inbox_offset,
-						elem->size, "inbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DOWNBOX:
-			outbox_offset = elem->offset + MBOX_OFFSET;
-			outbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						outbox_offset,
-						elem->size, "outbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_TRACE:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "etrace",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DEBUG:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "debug",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_STREAM:
-			stream_offset = elem->offset + MBOX_OFFSET;
-			stream_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						stream_offset,
-						elem->size, "stream",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_REGS:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "regs",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_EXCEPTION:
-			sdev->dsp_oops_offset = elem->offset + MBOX_OFFSET;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BDW_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "exception",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		default:
-			dev_err(sdev->dev, "error: get illegal window info\n");
-			return;
-		}
-	}
-
-	if (outbox_size == 0 || inbox_size == 0) {
-		dev_err(sdev->dev, "error: get illegal mailbox window\n");
-		return;
-	}
-
-	snd_sof_dsp_mailbox_init(sdev, inbox_offset, inbox_size,
-				 outbox_offset, outbox_size);
-	sdev->stream_box.offset = stream_offset;
-	sdev->stream_box.size = stream_size;
-
-	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
-		inbox_offset, inbox_size);
-	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
-		outbox_offset, outbox_size);
-	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
-		stream_offset, stream_size);
-}
-
-/* check for ABI compatibility and create memory windows on first boot */
-static int bdw_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
-{
-	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
-	u32 offset;
-	int ret;
-
-	/* mailbox must be on 4k boundary */
-	offset = MBOX_OFFSET;
-
-	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset %d\n",
-		msg_id, offset);
-
-	/* no need to re-check version/ABI for subsequent boots */
-	if (!sdev->first_boot)
-		return 0;
-
-	/* copy data from the DSP FW ready offset */
-	sof_block_read(sdev, sdev->mmio_bar, offset, fw_ready,
-		       sizeof(*fw_ready));
-
-	/* make sure ABI version is compatible */
-	ret = snd_sof_ipc_valid(sdev);
-	if (ret < 0)
-		return ret;
-
-	/* now check for extended data */
-	snd_sof_fw_parse_ext_data(sdev, sdev->mmio_bar, MBOX_OFFSET +
-				  sizeof(struct sof_ipc_fw_ready));
-
-	bdw_get_windows(sdev);
-
-	return 0;
-}
-
 /*
  * IPC Mailbox IO
  */
@@ -522,6 +380,16 @@ static void bdw_get_reply(struct snd_sof_dev *sdev)
 	msg->reply_error = ret;
 }
 
+static int bdw_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int bdw_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
 static void bdw_host_done(struct snd_sof_dev *sdev)
 {
 	/* clear BUSY bit and set DONE bit - accept new messages */
@@ -672,7 +540,9 @@ const struct snd_sof_dsp_ops sof_bdw_ops = {
 
 	/* ipc */
 	.send_msg	= bdw_send_msg,
-	.fw_ready	= bdw_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = bdw_get_mailbox_offset,
+	.get_window_offset = bdw_get_window_offset,
 
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
