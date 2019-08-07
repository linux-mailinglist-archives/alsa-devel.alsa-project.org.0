Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA1284F77
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 17:08:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99A8584B;
	Wed,  7 Aug 2019 17:07:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99A8584B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565190493;
	bh=GCSEHBthj409+x+2tP5WBNQ7VEeh5PadewJxyHg5Odc=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RysJw3hoo0u9yNa1W4pOq6Ilei8gCTV3bx5Lm7G2BqOgBHjnCIvybjKH05R2QHfUW
	 SDr1kgvD8ZJ8p+oolbFrzlcj7P/CtybJDkjXS6oUX3uPLjg+hDI0gqUaFuGLVfphrE
	 VV9eV0YBW0ynZOcfQlG8l+KXA5E9INsAxp/zUSY8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D563AF80641;
	Wed,  7 Aug 2019 17:02:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 44B3EF80641; Wed,  7 Aug 2019 17:02:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F341F8059F
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 17:02:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F341F8059F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 08:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="182305875"
Received: from knguye7-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.255.81.127])
 by FMSMGA003.fm.intel.com with ESMTP; 07 Aug 2019 08:02:12 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  7 Aug 2019 10:02:03 -0500
Message-Id: <20190807150203.26359-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
References: <20190807150203.26359-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 6/6] ASoC: SOF: Intel: hda: Use generic
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

We can use generic sof_fw_ready function and reduce code duplication.
Careful here that we need to provide the implementation for
get_mailbox_offset and get_window_offset.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/apl.c     |   4 +-
 sound/soc/sof/intel/cnl.c     |   4 +-
 sound/soc/sof/intel/hda-ipc.c | 150 +---------------------------------
 sound/soc/sof/intel/hda.h     |   4 +-
 4 files changed, 13 insertions(+), 149 deletions(-)

diff --git a/sound/soc/sof/intel/apl.c b/sound/soc/sof/intel/apl.c
index fd2e26d79796..8dc7a5558da4 100644
--- a/sound/soc/sof/intel/apl.c
+++ b/sound/soc/sof/intel/apl.c
@@ -46,7 +46,9 @@ const struct snd_sof_dsp_ops sof_apl_ops = {
 
 	/* ipc */
 	.send_msg	= hda_dsp_ipc_send_msg,
-	.fw_ready	= hda_dsp_ipc_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
+	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
 	.ipc_pcm_params	= hda_ipc_pcm_params,
diff --git a/sound/soc/sof/intel/cnl.c b/sound/soc/sof/intel/cnl.c
index ffd8d4394537..6d7d9c93252c 100644
--- a/sound/soc/sof/intel/cnl.c
+++ b/sound/soc/sof/intel/cnl.c
@@ -204,7 +204,9 @@ const struct snd_sof_dsp_ops sof_cnl_ops = {
 
 	/* ipc */
 	.send_msg	= cnl_ipc_send_msg,
-	.fw_ready	= hda_dsp_ipc_fw_ready,
+	.fw_ready	= sof_fw_ready,
+	.get_mailbox_offset = hda_dsp_ipc_get_mailbox_offset,
+	.get_window_offset = hda_dsp_ipc_get_window_offset,
 
 	.ipc_msg_data	= hda_ipc_msg_data,
 	.ipc_pcm_params	= hda_ipc_pcm_params,
diff --git a/sound/soc/sof/intel/hda-ipc.c b/sound/soc/sof/intel/hda-ipc.c
index 2ecba91f5219..6aae6f18b3dc 100644
--- a/sound/soc/sof/intel/hda-ipc.c
+++ b/sound/soc/sof/intel/hda-ipc.c
@@ -266,156 +266,14 @@ irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context)
 	return ret;
 }
 
-/* IPC Firmware ready */
-
-static void ipc_get_windows(struct snd_sof_dev *sdev)
+int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev)
 {
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
-			inbox_offset =
-				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
-			inbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						inbox_offset,
-						elem->size, "inbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DOWNBOX:
-			outbox_offset =
-				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
-			outbox_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						outbox_offset,
-						elem->size, "outbox",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_TRACE:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "etrace",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DEBUG:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "debug",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_STREAM:
-			stream_offset =
-				elem->offset + SRAM_WINDOW_OFFSET(elem->id);
-			stream_size = elem->size;
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "stream",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_REGS:
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
-						elem->size, "regs",
-						SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_EXCEPTION:
-			sdev->dsp_oops_offset = elem->offset +
-						SRAM_WINDOW_OFFSET(elem->id);
-			snd_sof_debugfs_io_item(sdev,
-						sdev->bar[HDA_DSP_BAR] +
-						elem->offset +
-						SRAM_WINDOW_OFFSET
-						(elem->id),
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
+	return HDA_DSP_MBOX_UPLINK_OFFSET;
 }
 
-/* check for ABI compatibility and create memory windows on first boot */
-int hda_dsp_ipc_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
+int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id)
 {
-	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
-	u32 offset;
-	int ret;
-
-	/* mailbox must be on 4k boundary */
-	offset = HDA_DSP_MBOX_UPLINK_OFFSET;
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
-	snd_sof_fw_parse_ext_data(sdev, sdev->mmio_bar,
-				  HDA_DSP_MBOX_UPLINK_OFFSET +
-				  sizeof(struct sof_ipc_fw_ready));
-
-	ipc_get_windows(sdev);
-
-	return 0;
+	return SRAM_WINDOW_OFFSET(id);
 }
 
 void hda_ipc_msg_data(struct snd_sof_dev *sdev,
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index ceaaa8d467f4..9246ba776d68 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -519,7 +519,9 @@ int hda_ipc_pcm_params(struct snd_sof_dev *sdev,
 int hda_dsp_ipc_send_msg(struct snd_sof_dev *sdev,
 			 struct snd_sof_ipc_msg *msg);
 void hda_dsp_ipc_get_reply(struct snd_sof_dev *sdev);
-int hda_dsp_ipc_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
+int hda_dsp_ipc_get_mailbox_offset(struct snd_sof_dev *sdev);
+int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
+
 irqreturn_t hda_dsp_ipc_irq_handler(int irq, void *context);
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context);
 int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
