Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D5E87A35
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Aug 2019 14:33:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E8E3950;
	Fri,  9 Aug 2019 14:33:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E8E3950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565354033;
	bh=VSL6o9U8B7DBt6cXLMvDGCC924cutFaZrrzyVSfmpt8=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=TX2I6cNJXanVpuMklEeLzqf7KqMGr79fXNX+TJ9uDA9k+ZlT8/YZANRU/pb9uG1/T
	 B0d+fcZ65sPtVAhRDlLqO7cepqgVoBHoB/LNA623Zk6/CAO2HmRJZDW76IA+vuqHDX
	 khj7w+S0wcLqjfJd77GJtfXE/04cO+KVONgsfmDg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B6820F805E1;
	Fri,  9 Aug 2019 14:31:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A10AF805AF; Fri,  9 Aug 2019 14:31:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 66FAEF804AB
 for <alsa-devel@alsa-project.org>; Fri,  9 Aug 2019 14:31:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66FAEF804AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="JTjH1o5X"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=Vd2JlC00HuC3T87UiF6XBN7PRsDgPyoUv9HQOJNiu5M=; b=JTjH1o5Xik6v
 KOcLtNWn9s1UO952BU2gWw+VfCUws4REAVa7Swlfj8+riv0uC7gbY7HJwUSBzjaqcWu7tqWj+YUCQ
 /uhIkYeBrKHNq7LywpSMDJRfdf9WatlodCa3BDAsrkGBPY7HJJKnfZMndAOzxy5yu5WSEwJzB5iQF
 6SrFc=;
Received: from ypsilon.sirena.org.uk ([2001:470:1f1d:6b5::7])
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1hw43j-00060t-OF; Fri, 09 Aug 2019 12:31:51 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 0DAE1274303D; Fri,  9 Aug 2019 13:31:51 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@nxp.com>
In-Reply-To: <20190807150203.26359-5-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20190809123151.0DAE1274303D@ypsilon.sirena.org.uk>
Date: Fri,  9 Aug 2019 13:31:51 +0100 (BST)
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: byt: Refactor fw ready /
	mem windows creation" to the asoc tree
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

   ASoC: SOF: Intel: byt: Refactor fw ready / mem windows creation

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

From 83ee7ab1627b7597bbb9acc26b37e9f96fff40c9 Mon Sep 17 00:00:00 2001
From: Daniel Baluta <daniel.baluta@nxp.com>
Date: Wed, 7 Aug 2019 10:02:01 -0500
Subject: [PATCH] ASoC: SOF: Intel: byt: Refactor fw ready / mem windows
 creation

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
Link: https://lore.kernel.org/r/20190807150203.26359-5-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
