Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE3240C52A
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Sep 2021 14:25:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF751181D;
	Wed, 15 Sep 2021 14:24:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF751181D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631708716;
	bh=HPihDiwlJJ4lB4ubFLu9VGIm5HuAwdnPwHLvOX248b8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=V8s3Yw/VsiTiefGLGNpO7htkjWMW6jkkbDRO0HrN0768FJbJjuHjUFH8jU2Ffqp3s
	 47MUANHjjG9cLuiZcx5PDr8Zh+0kZ7ntXodjMqCmqsxfMZIFl5ekDW8mrnhhGc1fb2
	 JxroDPrHZDv44VEuec7qfo11ahv54TUdP73/Ixws=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B36B3F8051D;
	Wed, 15 Sep 2021 14:21:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1AA89F804EC; Wed, 15 Sep 2021 14:21:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23A94F804E0
 for <alsa-devel@alsa-project.org>; Wed, 15 Sep 2021 14:21:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23A94F804E0
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="219117511"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="219117511"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:37 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544901607"
Received: from msavu-mobl1.ti.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 05:21:34 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 07/12] ASoC: SOF: core: Do not use 'bar' as parameter for
 block_read/write
Date: Wed, 15 Sep 2021 15:21:11 +0300
Message-Id: <20210915122116.18317-8-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
References: <20210915122116.18317-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 daniel.baluta@gmail.com, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

The use of bar in the core poses limits on the portability of the code
to other, non iomapped platforms.
To make the API more generic, remove the use of 'bar' as parameter
for the block copy API.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 18 +++++++-----
 sound/soc/sof/loader.c   | 62 ++++++++++++++++++----------------------
 sound/soc/sof/ops.h      | 14 +++++----
 sound/soc/sof/sof-priv.h | 20 ++++++-------
 sound/soc/sof/utils.c    | 28 +++++++++++++-----
 5 files changed, 78 insertions(+), 64 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 9ca3681d266d..18e0bfc1d8a9 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -709,15 +709,19 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol,
 		send_bytes = sizeof(struct sof_ipc_ctrl_value_chan) *
 		cdata->num_elems;
 		if (send)
-			snd_sof_dsp_block_write(sdev, sdev->mmio_bar,
-						scontrol->readback_offset,
-						cdata->chanv, send_bytes);
+			err = snd_sof_dsp_block_write(sdev, SOF_FW_BLK_TYPE_IRAM,
+						      scontrol->readback_offset,
+						      cdata->chanv, send_bytes);
 
 		else
-			snd_sof_dsp_block_read(sdev, sdev->mmio_bar,
-					       scontrol->readback_offset,
-					       cdata->chanv, send_bytes);
-		return 0;
+			err = snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_IRAM,
+						     scontrol->readback_offset,
+						     cdata->chanv, send_bytes);
+
+		if (err)
+			dev_err_once(sdev->dev, "error: %s TYPE_IRAM failed\n",
+				     send ? "write to" :  "read from");
+		return err;
 	}
 
 	cdata->rhdr.hdr.cmd = SOF_IPC_GLB_COMP_MSG | ipc_cmd;
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 6d83ff11effc..16d36249c181 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -86,7 +86,7 @@ static int get_cc_info(struct snd_sof_dev *sdev,
 }
 
 /* parse the extended FW boot data structures from FW boot message */
-static int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offset)
+static int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 offset)
 {
 	struct sof_ipc_ext_data_hdr *ext_hdr;
 	void *ext_data;
@@ -97,15 +97,16 @@ static int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offs
 		return -ENOMEM;
 
 	/* get first header */
-	snd_sof_dsp_block_read(sdev, bar, offset, ext_data,
+	snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, ext_data,
 			       sizeof(*ext_hdr));
 	ext_hdr = ext_data;
 
 	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
 		/* read in ext structure */
-		snd_sof_dsp_block_read(sdev, bar, offset + sizeof(*ext_hdr),
-				   (void *)((u8 *)ext_data + sizeof(*ext_hdr)),
-				   ext_hdr->hdr.size - sizeof(*ext_hdr));
+		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM,
+				       offset + sizeof(*ext_hdr),
+				       (void *)((u8 *)ext_data + sizeof(*ext_hdr)),
+				       ext_hdr->hdr.size - sizeof(*ext_hdr));
 
 		dev_dbg(sdev->dev, "found ext header type %d size 0x%x\n",
 			ext_hdr->type, ext_hdr->hdr.size);
@@ -138,7 +139,7 @@ static int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 bar, u32 offs
 
 		/* move to next header */
 		offset += ext_hdr->hdr.size;
-		snd_sof_dsp_block_read(sdev, bar, offset, ext_data,
+		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, ext_data,
 				       sizeof(*ext_hdr));
 		ext_hdr = ext_data;
 	}
@@ -361,6 +362,7 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
  */
 static void sof_get_windows(struct snd_sof_dev *sdev)
 {
+	int bar = snd_sof_dsp_get_bar_index(sdev, SOF_FW_BLK_TYPE_SRAM);
 	struct sof_ipc_window_elem *elem;
 	u32 outbox_offset = 0;
 	u32 stream_offset = 0;
@@ -371,7 +373,6 @@ static void sof_get_windows(struct snd_sof_dev *sdev)
 	u32 debug_size = 0;
 	u32 debug_offset = 0;
 	int window_offset;
-	int bar;
 	int i;
 
 	if (!sdev->info_window) {
@@ -379,12 +380,6 @@ static void sof_get_windows(struct snd_sof_dev *sdev)
 		return;
 	}
 
-	bar = snd_sof_dsp_get_bar_index(sdev, SOF_FW_BLK_TYPE_SRAM);
-	if (bar < 0) {
-		dev_err(sdev->dev, "error: have no bar mapping\n");
-		return;
-	}
-
 	for (i = 0; i < sdev->info_window->num_windows; i++) {
 		elem = &sdev->info_window->window[i];
 
@@ -496,7 +491,6 @@ int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 {
 	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
 	int offset;
-	int bar;
 	int ret;
 
 	/* mailbox must be on 4k boundary */
@@ -506,12 +500,6 @@ int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 		return offset;
 	}
 
-	bar = snd_sof_dsp_get_bar_index(sdev, SOF_FW_BLK_TYPE_SRAM);
-	if (bar < 0) {
-		dev_err(sdev->dev, "error: have no bar mapping\n");
-		return -EINVAL;
-	}
-
 	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
 		msg_id, offset);
 
@@ -519,8 +507,17 @@ int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 	if (!sdev->first_boot)
 		return 0;
 
-	/* copy data from the DSP FW ready offset */
-	snd_sof_dsp_block_read(sdev, bar, offset, fw_ready, sizeof(*fw_ready));
+	/*
+	 * copy data from the DSP FW ready offset
+	 * Subsequent error handling is not needed for BLK_TYPE_SRAM
+	 */
+	ret = snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, fw_ready,
+				     sizeof(*fw_ready));
+	if (ret) {
+		dev_err(sdev->dev,
+			"error: unable to read fw_ready, read from TYPE_SRAM failed\n");
+		return ret;
+	}
 
 	/* make sure ABI version is compatible */
 	ret = snd_sof_ipc_valid(sdev);
@@ -528,8 +525,7 @@ int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 		return ret;
 
 	/* now check for extended data */
-	snd_sof_fw_parse_ext_data(sdev, bar, offset +
-				  sizeof(struct sof_ipc_fw_ready));
+	snd_sof_fw_parse_ext_data(sdev, offset + sizeof(struct sof_ipc_fw_ready));
 
 	sof_get_windows(sdev);
 
@@ -542,7 +538,7 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 				struct snd_sof_mod_hdr *module)
 {
 	struct snd_sof_blk_hdr *block;
-	int count, bar;
+	int count, ret;
 	u32 offset;
 	size_t remaining;
 
@@ -579,13 +575,6 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 		case SOF_FW_BLK_TYPE_DRAM:
 		case SOF_FW_BLK_TYPE_SRAM:
 			offset = block->offset;
-			bar = snd_sof_dsp_get_bar_index(sdev, block->type);
-			if (bar < 0) {
-				dev_err(sdev->dev,
-					"error: no BAR mapping for block type 0x%x\n",
-					block->type);
-				return bar;
-			}
 			break;
 		default:
 			dev_err(sdev->dev, "error: bad type 0x%x for block 0x%x\n",
@@ -603,8 +592,13 @@ int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 				block->size);
 			return -EINVAL;
 		}
-		snd_sof_dsp_block_write(sdev, bar, offset,
-					block + 1, block->size);
+		ret = snd_sof_dsp_block_write(sdev, block->type, offset,
+					      block + 1, block->size);
+		if (ret < 0) {
+			dev_err(sdev->dev, "error: write to block type 0x%x failed\n",
+				block->type);
+			return ret;
+		}
 
 		if (remaining < block->size) {
 			dev_err(sdev->dev, "error: not enough data remaining\n");
diff --git a/sound/soc/sof/ops.h b/sound/soc/sof/ops.h
index 4a5d6e497f05..8d7fb7fd72bb 100644
--- a/sound/soc/sof/ops.h
+++ b/sound/soc/sof/ops.h
@@ -297,16 +297,18 @@ static inline u64 snd_sof_dsp_read64(struct snd_sof_dev *sdev, u32 bar,
 }
 
 /* block IO */
-static inline void snd_sof_dsp_block_read(struct snd_sof_dev *sdev, u32 bar,
-					  u32 offset, void *dest, size_t bytes)
+static inline int snd_sof_dsp_block_read(struct snd_sof_dev *sdev,
+					 enum snd_sof_fw_blk_type blk_type,
+					 u32 offset, void *dest, size_t bytes)
 {
-	sof_ops(sdev)->block_read(sdev, bar, offset, dest, bytes);
+	return sof_ops(sdev)->block_read(sdev, blk_type, offset, dest, bytes);
 }
 
-static inline void snd_sof_dsp_block_write(struct snd_sof_dev *sdev, u32 bar,
-					   u32 offset, void *src, size_t bytes)
+static inline int snd_sof_dsp_block_write(struct snd_sof_dev *sdev,
+					  enum snd_sof_fw_blk_type blk_type,
+					  u32 offset, void *src, size_t bytes)
 {
-	sof_ops(sdev)->block_write(sdev, bar, offset, src, bytes);
+	return sof_ops(sdev)->block_write(sdev, blk_type, offset, src, bytes);
 }
 
 /* ipc */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index f5a505a8ce15..f9a39141e752 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -127,12 +127,12 @@ struct snd_sof_dsp_ops {
 		      void __iomem *addr); /* optional */
 
 	/* memcpy IO */
-	void (*block_read)(struct snd_sof_dev *sof_dev, u32 bar,
-			   u32 offset, void *dest,
-			   size_t size); /* mandatory */
-	void (*block_write)(struct snd_sof_dev *sof_dev, u32 bar,
-			    u32 offset, void *src,
-			    size_t size); /* mandatory */
+	int (*block_read)(struct snd_sof_dev *sof_dev,
+			  enum snd_sof_fw_blk_type type, u32 offset,
+			  void *dest, size_t size); /* mandatory */
+	int (*block_write)(struct snd_sof_dev *sof_dev,
+			   enum snd_sof_fw_blk_type type, u32 offset,
+			   void *src, size_t size); /* mandatory */
 
 	/* doorbell */
 	irqreturn_t (*irq_handler)(int irq, void *context); /* optional */
@@ -569,10 +569,10 @@ void sof_mailbox_write(struct snd_sof_dev *sdev, u32 offset,
 		       void *message, size_t bytes);
 void sof_mailbox_read(struct snd_sof_dev *sdev, u32 offset,
 		      void *message, size_t bytes);
-void sof_block_write(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *src,
-		     size_t size);
-void sof_block_read(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *dest,
-		    size_t size);
+int sof_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+		    u32 offset, void *src, size_t size);
+int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+		   u32 offset, void *dest, size_t size);
 
 int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
 
diff --git a/sound/soc/sof/utils.c b/sound/soc/sof/utils.c
index 5539d3afbe8f..66fa6602fb67 100644
--- a/sound/soc/sof/utils.c
+++ b/sound/soc/sof/utils.c
@@ -14,6 +14,7 @@
 #include <sound/soc.h>
 #include <sound/sof.h>
 #include "sof-priv.h"
+#include "ops.h"
 
 /*
  * Register IO
@@ -72,15 +73,21 @@ EXPORT_SYMBOL(sof_mailbox_read);
  * Memory copy.
  */
 
-void sof_block_write(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *src,
-		     size_t size)
+int sof_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+		    u32 offset, void *src, size_t size)
 {
-	void __iomem *dest = sdev->bar[bar] + offset;
+	int bar = snd_sof_dsp_get_bar_index(sdev, blk_type);
 	const u8 *src_byte = src;
+	void __iomem *dest;
 	u32 affected_mask;
 	u32 tmp;
 	int m, n;
 
+	if (bar < 0)
+		return bar;
+
+	dest = sdev->bar[bar] + offset;
+
 	m = size / 4;
 	n = size % 4;
 
@@ -100,15 +107,22 @@ void sof_block_write(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *src,
 		tmp |= *(u32 *)(src_byte + m * 4) & affected_mask;
 		iowrite32(tmp, dest + m * 4);
 	}
+
+	return 0;
 }
 EXPORT_SYMBOL(sof_block_write);
 
-void sof_block_read(struct snd_sof_dev *sdev, u32 bar, u32 offset, void *dest,
-		    size_t size)
+int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
+		   u32 offset, void *dest, size_t size)
 {
-	void __iomem *src = sdev->bar[bar] + offset;
+	int bar = snd_sof_dsp_get_bar_index(sdev, blk_type);
+
+	if (bar < 0)
+		return bar;
+
+	memcpy_fromio(dest, sdev->bar[bar] + offset, size);
 
-	memcpy_fromio(dest, src, size);
+	return 0;
 }
 EXPORT_SYMBOL(sof_block_read);
 
-- 
2.33.0

