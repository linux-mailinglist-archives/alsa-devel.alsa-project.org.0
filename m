Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D69509A3B
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 10:10:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F38C117DE;
	Thu, 21 Apr 2022 10:09:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F38C117DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650528610;
	bh=aawMxYgOXQ0UV4ymyd/Jj2MVhJ8FbJhOCDFjZycIkZA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vPWhQH/0Mlq2uV6R+sLYBI8lfiaRjLiz5G94fxjoM1RJC9+k2GxAu6UIab8mH5QZf
	 yStYCaCHDYWc3dNF9l4dWax7B97PLwBg0whxOTFoBleC7PsOXPOA/ZqPl9cLgjV8lT
	 FdASLuzVQ37xUxffXCmr1GDwv5weGUziweWESZWU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F3A40F80527;
	Thu, 21 Apr 2022 10:07:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 90084F80537; Thu, 21 Apr 2022 10:07:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5899AF80527
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:07:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5899AF80527
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WEZrDrMz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650528453; x=1682064453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aawMxYgOXQ0UV4ymyd/Jj2MVhJ8FbJhOCDFjZycIkZA=;
 b=WEZrDrMz4wV1553deVVxncwc18wYK40cIJPvIT9CafJc+PLKnCfv8KcH
 QhlpJ9fIiPoWJhbWpcjLWnxAmyCMD6fjLQQ5WGco03U2hZK/BCwk6I8vR
 QuAtZtq/h52aytab0wkDPQN7HkEUXj/IngP606H3XIjPCkCwgHYyyWkV6
 UAHkOZdZiCub9kRBv44A6l9ENNMGdGI1CK62APqCCmIYOZ8M1YxzuLyP6
 ffHnd75+Gm6CgB8v6Qdy9u2Ij5cKMxmTLFs5/yB2KEOTdvauhNKONpu0K
 bpTvMBfqs9+Ggvx+bCqgDQlresD+QE85BowlaHJiiZwSufht1n3qwgL4W w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324718802"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324718802"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="577087188"
Received: from dchirca-mobl4.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, AjitKumar.Pandey@amd.com,
 daniel.baluta@nxp.com
Subject: [PATCH 6/6] ASoC: SOF: loader: Remove the old fw_ready related code
Date: Thu, 21 Apr 2022 11:07:35 +0300
Message-Id: <20220421080735.31698-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
References: <20220421080735.31698-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
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

The fw_ready is handled internally to ipc3, we can remove the old code
from the loader.c along with the functions only used by the fw_ready()

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Ajit Pandey <ajitkumar.pandey@amd.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/ipc.c      |  15 ---
 sound/soc/sof/loader.c   | 227 ---------------------------------------
 sound/soc/sof/sof-priv.h |   9 +-
 3 files changed, 1 insertion(+), 250 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 6f8ac3fb195f..48ea58dbc998 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -188,21 +188,6 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(snd_sof_ipc_valid);
 
-int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev)
-{
-	struct snd_sof_ipc_msg *msg;
-
-	msg = &sdev->ipc->msg;
-
-	msg->reply_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	if (!msg->reply_data)
-		return -ENOMEM;
-
-	sdev->ipc->max_payload_size = SOF_IPC_MSG_MAX_SIZE;
-
-	return 0;
-}
-
 struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc *ipc;
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 697f03565a70..b0d192749734 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -86,69 +86,6 @@ static int get_cc_info(struct snd_sof_dev *sdev,
 	return 0;
 }
 
-/* parse the extended FW boot data structures from FW boot message */
-static int snd_sof_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 offset)
-{
-	struct sof_ipc_ext_data_hdr *ext_hdr;
-	void *ext_data;
-	int ret = 0;
-
-	ext_data = kzalloc(PAGE_SIZE, GFP_KERNEL);
-	if (!ext_data)
-		return -ENOMEM;
-
-	/* get first header */
-	snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, ext_data,
-			       sizeof(*ext_hdr));
-	ext_hdr = ext_data;
-
-	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
-		/* read in ext structure */
-		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM,
-				       offset + sizeof(*ext_hdr),
-				       (void *)((u8 *)ext_data + sizeof(*ext_hdr)),
-				       ext_hdr->hdr.size - sizeof(*ext_hdr));
-
-		dev_dbg(sdev->dev, "found ext header type %d size 0x%x\n",
-			ext_hdr->type, ext_hdr->hdr.size);
-
-		/* process structure data */
-		switch (ext_hdr->type) {
-		case SOF_IPC_EXT_WINDOW:
-			ret = get_ext_windows(sdev, ext_hdr);
-			break;
-		case SOF_IPC_EXT_CC_INFO:
-			ret = get_cc_info(sdev, ext_hdr);
-			break;
-		case SOF_IPC_EXT_UNUSED:
-		case SOF_IPC_EXT_PROBE_INFO:
-		case SOF_IPC_EXT_USER_ABI_INFO:
-			/* They are supported but we don't do anything here */
-			break;
-		default:
-			dev_info(sdev->dev, "unknown ext header type %d size 0x%x\n",
-				 ext_hdr->type, ext_hdr->hdr.size);
-			ret = 0;
-			break;
-		}
-
-		if (ret < 0) {
-			dev_err(sdev->dev, "error: failed to parse ext data type %d\n",
-				ext_hdr->type);
-			break;
-		}
-
-		/* move to next header */
-		offset += ext_hdr->hdr.size;
-		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, ext_data,
-				       sizeof(*ext_hdr));
-		ext_hdr = ext_data;
-	}
-
-	kfree(ext_data);
-	return ret;
-}
-
 static int ext_man_get_fw_version(struct snd_sof_dev *sdev,
 				  const struct sof_ext_man_elem_header *hdr)
 {
@@ -358,170 +295,6 @@ static int snd_sof_fw_ext_man_parse(struct snd_sof_dev *sdev,
 	return ext_man_size;
 }
 
-/*
- * IPC Firmware ready.
- */
-static void sof_get_windows(struct snd_sof_dev *sdev)
-{
-	struct sof_ipc_window_elem *elem;
-	u32 outbox_offset = 0;
-	u32 stream_offset = 0;
-	u32 inbox_offset = 0;
-	u32 outbox_size = 0;
-	u32 stream_size = 0;
-	u32 inbox_size = 0;
-	u32 debug_size = 0;
-	u32 debug_offset = 0;
-	int window_offset;
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
-		window_offset = snd_sof_dsp_get_window_offset(sdev, elem->id);
-		if (window_offset < 0) {
-			dev_warn(sdev->dev, "warn: no offset for window %d\n",
-				 elem->id);
-			continue;
-		}
-
-		switch (elem->type) {
-		case SOF_IPC_REGION_UPBOX:
-			inbox_offset = window_offset + elem->offset;
-			inbox_size = elem->size;
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							inbox_offset,
-							elem->size, "inbox",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DOWNBOX:
-			outbox_offset = window_offset + elem->offset;
-			outbox_size = elem->size;
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							outbox_offset,
-							elem->size, "outbox",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_TRACE:
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							window_offset + elem->offset,
-							elem->size, "etrace",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_DEBUG:
-			debug_offset = window_offset + elem->offset;
-			debug_size = elem->size;
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							window_offset + elem->offset,
-							elem->size, "debug",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_STREAM:
-			stream_offset = window_offset + elem->offset;
-			stream_size = elem->size;
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							stream_offset,
-							elem->size, "stream",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_REGS:
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							window_offset + elem->offset,
-							elem->size, "regs",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
-			break;
-		case SOF_IPC_REGION_EXCEPTION:
-			sdev->dsp_oops_offset = window_offset + elem->offset;
-			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
-							window_offset + elem->offset,
-							elem->size, "exception",
-							SOF_DEBUGFS_ACCESS_D0_ONLY);
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
-	sdev->dsp_box.offset = inbox_offset;
-	sdev->dsp_box.size = inbox_size;
-
-	sdev->host_box.offset = outbox_offset;
-	sdev->host_box.size = outbox_size;
-
-	sdev->stream_box.offset = stream_offset;
-	sdev->stream_box.size = stream_size;
-
-	sdev->debug_box.offset = debug_offset;
-	sdev->debug_box.size = debug_size;
-
-	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
-		inbox_offset, inbox_size);
-	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
-		outbox_offset, outbox_size);
-	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
-		stream_offset, stream_size);
-	dev_dbg(sdev->dev, " debug region 0x%x - size 0x%x\n",
-		debug_offset, debug_size);
-}
-
-/* check for ABI compatibility and create memory windows on first boot */
-int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
-{
-	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
-	int offset;
-	int ret;
-
-	/* mailbox must be on 4k boundary */
-	offset = snd_sof_dsp_get_mailbox_offset(sdev);
-	if (offset < 0) {
-		dev_err(sdev->dev, "error: have no mailbox offset\n");
-		return offset;
-	}
-
-	dev_dbg(sdev->dev, "ipc: DSP is ready 0x%8.8x offset 0x%x\n",
-		msg_id, offset);
-
-	/* no need to re-check version/ABI for subsequent boots */
-	if (!sdev->first_boot)
-		return 0;
-
-	/*
-	 * copy data from the DSP FW ready offset
-	 * Subsequent error handling is not needed for BLK_TYPE_SRAM
-	 */
-	ret = snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, fw_ready,
-				     sizeof(*fw_ready));
-	if (ret) {
-		dev_err(sdev->dev,
-			"error: unable to read fw_ready, read from TYPE_SRAM failed\n");
-		return ret;
-	}
-
-	/* make sure ABI version is compatible */
-	ret = snd_sof_ipc_valid(sdev);
-	if (ret < 0)
-		return ret;
-
-	/* now check for extended data */
-	snd_sof_fw_parse_ext_data(sdev, offset + sizeof(struct sof_ipc_fw_ready));
-
-	sof_get_windows(sdev);
-
-	return sof_ipc_init_msg_memory(sdev);
-}
-EXPORT_SYMBOL(sof_fw_ready);
-
 /* generic module parser for mmaped DSPs */
 int snd_sof_parse_module_memcpy(struct snd_sof_dev *sdev,
 				struct snd_sof_mod_hdr *module)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 6a09e5a73a50..382187e89e54 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -181,11 +181,6 @@ struct snd_sof_dsp_ops {
 	int (*load_firmware)(struct snd_sof_dev *sof_dev); /* mandatory */
 	int (*load_module)(struct snd_sof_dev *sof_dev,
 			   struct snd_sof_mod_hdr *hdr); /* optional */
-	/*
-	 * FW ready checks for ABI compatibility and creates
-	 * memory windows at first boot
-	 */
-	int (*fw_ready)(struct snd_sof_dev *sdev, u32 msg_id); /* mandatory */
 
 	/* connect pcm substream to a host stream */
 	int (*pcm_open)(struct snd_sof_dev *sdev,
@@ -614,7 +609,7 @@ int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, void *msg_data, size_t msg
 			     void *reply_data, size_t reply_bytes);
 int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 		     size_t reply_bytes);
-int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev);
+
 static inline void snd_sof_ipc_process_reply(struct snd_sof_dev *sdev, u32 msg_id)
 {
 	snd_sof_ipc_get_reply(sdev);
@@ -685,8 +680,6 @@ int sof_block_write(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 int sof_block_read(struct snd_sof_dev *sdev, enum snd_sof_fw_blk_type blk_type,
 		   u32 offset, void *dest, size_t size);
 
-int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id);
-
 int sof_ipc_msg_data(struct snd_sof_dev *sdev,
 		     struct snd_pcm_substream *substream,
 		     void *p, size_t sz);
-- 
2.35.3

