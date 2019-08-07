Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6188284F70
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:06:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF9FC165D;
	Wed,  7 Aug 2019 17:05:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF9FC165D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190401;
	bh=l9JGVsa/hbL5Sh7IRVM2m+X+t4RwsKpFbwVGEzH6MfM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=b+XQjZOIc+CVVZtvgv21slxGtFjUyMcL9V2JAri03xb/s5gE7aT1vil0RodFgTJyP
	 tEISB7J2sYBufj9G0V7AyVPX6Og5l2Hdmjd2UcxFfXYPM4i8jDXc8wTYRMqgb9qoDq
	 L2LvRTNvxDTjECW3599YtLRnGp8pRrtqIVu8jidw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97D79F8060E;
	Wed,  7 Aug 2019 17:02:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF545F805FA; Wed,  7 Aug 2019 17:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82BF6F80529
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:02:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82BF6F80529
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182305862"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 08:02:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 10:02:01 -0500
Message-Id: <20190807150203.26359-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/6] ASoC: SOF: Intel: byt: Refactor fw ready /
	mem windows creation
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

There is a lot of duplicate code when processing IPC firmware ready
notification and creating memory windows.

First step in reducing the code duplication is to introduce generic
functions:
	* sof_get_windows
	* sof_fw_ready
that will replace, in the first step, the specific implementation related
to baytrail related platforms:
	* byt_get_windows
	* byt_fw_ready

So we are basically moving code from intel/byt.c to loader.c keeping
in mind that mbox_offset is a per platform constant so we need to
use newly introduced snd_sof_dsp_get_mailbox_offset /
snd_sof_dsp_get_window_offset in order to get the correct
mbox offset / window offset value.

Also, bar is a per platform constant so we use snd_sof_dsp_get_bar_index
instead of the hardcoded BYT_DSP_BAR.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/byt.c | 164 +++++--------------------------------
 sound/soc/sof/loader.c    | 168 ++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h  |   2 +
 3 files changed, 189 insertions(+), 145 deletions(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index cb8f02ee09f2..5e7a6aaa627a 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -109,148 +109,6 @@ static void byt_host_done(struct snd_sof_dev *sdev);
 static void byt_dsp_done(struct snd_sof_dev *sdev);
 static void byt_get_reply(struct snd_sof_dev *sdev);
 
-/*
- * IPC Firmware ready.
- */
-static void byt_get_windows(struct snd_sof_dev *sdev)
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
-						sdev->bar[BYT_DSP_BAR] +
-						inbox_offset,
-						elem->size, "inbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DOWNBOX:
-			outbox_offset = elem->offset + MBOX_OFFSET;
-			outbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BYT_DSP_BAR] +
-						outbox_offset,
-						elem->size, "outbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_TRACE:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BYT_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "etrace",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DEBUG:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BYT_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "debug",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_STREAM:
-			stream_offset = elem->offset + MBOX_OFFSET;
-			stream_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BYT_DSP_BAR] +
-						stream_offset,
-						elem->size, "stream",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_REGS:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BYT_DSP_BAR] +
-						elem->offset +
-						MBOX_OFFSET,
-						elem->size, "regs",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_EXCEPTION:
-			sdev->dsp_oops_offset = elem->offset + MBOX_OFFSET;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[BYT_DSP_BAR] +
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
-static int byt_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
-{
-	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
-	u32 offset;
-	int ret;
-
-	/* mailbox must be on 4k boundary */
-	offset = MBOX_OFFSET;
-
-	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
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
-	byt_get_windows(sdev);
-
-	return 0;
-}
-
 /*
  * Debug
  */
@@ -418,6 +276,16 @@ static void byt_get_reply(struct snd_sof_dev *sdev)
 	msg->reply_error = ret;
 }
 
+static int byt_get_mailbox_offset(struct snd_sof_dev *sdev)
+{
+	return MBOX_OFFSET;
+}
+
+static int byt_get_window_offset(struct snd_sof_dev *sdev, u32 id)
+{
+	return MBOX_OFFSET;
+}
+
 static void byt_host_done(struct snd_sof_dev *sdev)
 {
 	/* clear BUSY bit and set DONE bit - accept new messages */
@@ -612,7 +480,9 @@ const struct snd_sof_dsp_ops sof_tng_ops = {
 
 	/* ipc */
 	.send_msg	= byt_send_msg,
-	.fw_ready	= byt_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = byt_get_mailbox_offset,
+	.get_window_offset = byt_get_window_offset,
 
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
@@ -771,7 +641,9 @@ const struct snd_sof_dsp_ops sof_byt_ops = {
 
 	/* ipc */
 	.send_msg	= byt_send_msg,
-	.fw_ready	= byt_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = byt_get_mailbox_offset,
+	.get_window_offset = byt_get_window_offset,
 
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
@@ -828,7 +700,9 @@ const struct snd_sof_dsp_ops sof_cht_ops = {
 
 	/* ipc */
 	.send_msg	= byt_send_msg,
-	.fw_ready	= byt_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = byt_get_mailbox_offset,
+	.get_window_offset = byt_get_window_offset,
 
 	.ipc_msg_data	= intel_ipc_msg_data,
 	.ipc_pcm_params	= intel_ipc_pcm_params,
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 93cb8fd0844f..d7f32745fefe 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -87,6 +87,174 @@ int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
 }
 EXPORT_SYMBOL(snd_sof_fw_parse_ext_data);
 
+/*
+ * IPC Firmware ready.
+ */
+static void sof_get_windows(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_window_elem *elem;
+	u32 outbox_offset = 0;
+	u32 stream_offset = 0;
+	u32 inbox_offset = 0;
+	u32 outbox_size = 0;
+	u32 stream_size = 0;
+	u32 inbox_size = 0;
+	int window_offset;
+	int bar;
+	int i;
+
+	if (!sdev->info_window) {
+		dev_err(sdev->dev, "error: have no window info\n");
+		return;
+	}
+
+	bar = snd_sof_dsp_get_bar_index(sdev, SOF_FW_BLK_TYPE_SRAM);
+	if (bar < 0) {
+		dev_err(sdev->dev, "error: have no bar mapping\n");
+		return;
+	}
+
+	for (i = 0; i < sdev->info_window->num_windows; i++) {
+		elem = &sdev->info_window->window[i];
+
+		window_offset = snd_sof_dsp_get_window_offset(sdev, elem->id);
+		if (window_offset < 0) {
+			dev_warn(sdev->dev, "warn: no offset for window %d\n",
+				 elem->id);
+			continue;
+		}
+
+		switch (elem->type) {
+		case SOF_IPC_REGION_UPBOX:
+			inbox_offset = window_offset + elem->offset;
+			inbox_size = elem->size;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						inbox_offset,
+						elem->size, "inbox",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_DOWNBOX:
+			outbox_offset = window_offset + elem->offset;
+			outbox_size = elem->size;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						outbox_offset,
+						elem->size, "outbox",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_TRACE:
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						window_offset +
+						elem->offset,
+						elem->size, "etrace",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_DEBUG:
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						window_offset +
+						elem->offset,
+						elem->size, "debug",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_STREAM:
+			stream_offset = window_offset + elem->offset;
+			stream_size = elem->size;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						stream_offset,
+						elem->size, "stream",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_REGS:
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						window_offset +
+						elem->offset,
+						elem->size, "regs",
+						SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_EXCEPTION:
+			sdev->dsp_oops_offset = window_offset + elem->offset;
+			snd_sof_debugfs_io_item(sdev,
+						sdev->bar[bar] +
+						window_offset +
+						elem->offset,
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
+int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
+	int offset;
+	int bar;
+	int ret;
+
+	/* mailbox must be on 4k boundary */
+	offset = snd_sof_dsp_get_mailbox_offset(sdev);
+	if (offset < 0) {
+		dev_err(sdev->dev, "error: have no mailbox offset\n");
+		return offset;
+	}
+
+	bar = snd_sof_dsp_get_bar_index(sdev, SOF_FW_BLK_TYPE_SRAM);
+	if (bar < 0) {
+		dev_err(sdev->dev, "error: have no bar mapping\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
+		msg_id, offset);
+
+	/* no need to re-check version/ABI for subsequent boots */
+	if (!sdev->first_boot)
+		return 0;
+
+	/* copy data from the DSP FW ready offset */
+	sof_block_read(sdev, bar, offset, fw_ready, sizeof(*fw_ready));
+
+	/* make sure ABI version is compatible */
+	ret = snd_sof_ipc_valid(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* now check for extended data */
+	snd_sof_fw_parse_ext_data(sdev, bar, offset +
+				  sizeof(struct sof_ipc_fw_ready));
+
+	sof_get_windows(sdev);
+
+	return 0;
+}
+EXPORT_SYMBOL(sof_fw_ready);
+
 /* generic module parser for mmaped DSPs */
 int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 				struct snd_sof_mod_hdr *module)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index de11f28bae3a..730f3259dd02 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -642,6 +642,8 @@ void sof_block_write(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *src,
 void sof_block_read(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *dest,
 		    size_t size);
 
+int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
+
 void intel_ipc_msg_data(struct snd_sof_dev *sdev,
 			struct snd_pcm_substream *substream,
 			void *p, size_t sz);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
