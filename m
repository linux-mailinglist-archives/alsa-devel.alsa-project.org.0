Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B0B509A36
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Apr 2022 10:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 053E31707;
	Thu, 21 Apr 2022 10:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 053E31707
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650528534;
	bh=eumb0oI3VCaqkS+1koOTqAYyXNjI7pMzW0z/HOOAUHQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NtP1QVO7YZaHb4eJ8dv4N3Nsxgk2sVrwdGb5EBlCkkYryYdvMYNUiM5LQTli/xC5r
	 G1iQWrTDqmW1EoSsxOQRZWIk7pgJmlO6/f/leEvcDxmEL/+hCrlKtzmyxFVfQl4k0b
	 DpJEuGR5nR4M05f2gfOJUYtUybKhFMqtjUgvqnxk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68AE0F804F3;
	Thu, 21 Apr 2022 10:07:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE600F804F1; Thu, 21 Apr 2022 10:07:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 69ACCF800F4
 for <alsa-devel@alsa-project.org>; Thu, 21 Apr 2022 10:07:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69ACCF800F4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Rp3FkCag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650528439; x=1682064439;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eumb0oI3VCaqkS+1koOTqAYyXNjI7pMzW0z/HOOAUHQ=;
 b=Rp3FkCagBjE2G42zAo+Ox3V6zKvdIfKM5vofm9CoHwTetpYvr7BwFqxP
 5HuFbSQj6xJ5vYGbwD63Z/1SwO5XK0OefVdPrGQbrtXLoVm/GzYEd726j
 uxdaA1cHMdU7ZfzLxa9Lz0dfKaC1odMiNaT3SogsQZZGI8Q/xMluUbGyy
 J3eFvtiegdjWNshgdA2xjj/yJoznOSgfCoFEdtc9yGPg0hrnChG09AL5+
 BCDhxeIL6QwL3MMnyQkUE75UxLXVUjbRN/gd/b12dLfEvpF7Q3dl+HO/B
 8YoCcZTLfmede1M0hmDTuY89bdjstOki0N6SQ+zdrBs54Wn7/6X9d8+Ng A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10323"; a="324718775"
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="324718775"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:16 -0700
X-IronPort-AV: E=Sophos;i="5.90,278,1643702400"; d="scan'208";a="577086977"
Received: from dchirca-mobl4.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.215.207])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2022 01:07:13 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, AjitKumar.Pandey@amd.com,
 daniel.baluta@nxp.com
Subject: [PATCH 1/6] ASoC: SOF: ipc3: Add local implementation for handling
 fw_ready message
Date: Thu, 21 Apr 2022 11:07:30 +0300
Message-Id: <20220421080735.31698-2-peter.ujfalusi@linux.intel.com>
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

The handling of fw_ready is IPC3 specific, move the needed code from the
loader.c to ipc3.c and stop using the sof_ops(sdev)->fw_ready() callback.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Ajit Pandey <ajitkumar.pandey@amd.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/ipc3.c | 306 ++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 305 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 8480a1b5733a..7d28bfa3d231 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -475,6 +475,310 @@ static int sof_ipc3_set_get_data(struct snd_sof_dev *sdev, void *data, size_t da
 	return ret;
 }
 
+static int sof_ipc3_get_ext_windows(struct snd_sof_dev *sdev,
+				    const struct sof_ipc_ext_data_hdr *ext_hdr)
+{
+	const struct sof_ipc_window *w =
+		container_of(ext_hdr, struct sof_ipc_window, ext_hdr);
+
+	if (w->num_windows == 0 || w->num_windows > SOF_IPC_MAX_ELEMS)
+		return -EINVAL;
+
+	if (sdev->info_window) {
+		if (memcmp(sdev->info_window, w, ext_hdr->hdr.size)) {
+			dev_err(sdev->dev, "mismatch between window descriptor from extended manifest and mailbox");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	/* keep a local copy of the data */
+	sdev->info_window = devm_kmemdup(sdev->dev, w, ext_hdr->hdr.size, GFP_KERNEL);
+	if (!sdev->info_window)
+		return -ENOMEM;
+
+	return 0;
+}
+
+static int sof_ipc3_get_cc_info(struct snd_sof_dev *sdev,
+				const struct sof_ipc_ext_data_hdr *ext_hdr)
+{
+	int ret;
+
+	const struct sof_ipc_cc_version *cc =
+		container_of(ext_hdr, struct sof_ipc_cc_version, ext_hdr);
+
+	if (sdev->cc_version) {
+		if (memcmp(sdev->cc_version, cc, cc->ext_hdr.hdr.size)) {
+			dev_err(sdev->dev,
+				"Receive diverged cc_version descriptions");
+			return -EINVAL;
+		}
+		return 0;
+	}
+
+	dev_dbg(sdev->dev,
+		"Firmware info: used compiler %s %d:%d:%d%s used optimization flags %s\n",
+		cc->name, cc->major, cc->minor, cc->micro, cc->desc, cc->optim);
+
+	/* create read-only cc_version debugfs to store compiler version info */
+	/* use local copy of the cc_version to prevent data corruption */
+	if (sdev->first_boot) {
+		sdev->cc_version = devm_kmalloc(sdev->dev, cc->ext_hdr.hdr.size,
+						GFP_KERNEL);
+
+		if (!sdev->cc_version)
+			return -ENOMEM;
+
+		memcpy(sdev->cc_version, cc, cc->ext_hdr.hdr.size);
+		ret = snd_sof_debugfs_buf_item(sdev, sdev->cc_version,
+					       cc->ext_hdr.hdr.size,
+					       "cc_version", 0444);
+
+		/* errors are only due to memory allocation, not debugfs */
+		if (ret < 0) {
+			dev_err(sdev->dev, "snd_sof_debugfs_buf_item failed\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+/* parse the extended FW boot data structures from FW boot message */
+static int ipc3_fw_parse_ext_data(struct snd_sof_dev *sdev, u32 offset)
+{
+	struct sof_ipc_ext_data_hdr *ext_hdr;
+	void *ext_data;
+	int ret = 0;
+
+	ext_data = kzalloc(PAGE_SIZE, GFP_KERNEL);
+	if (!ext_data)
+		return -ENOMEM;
+
+	/* get first header */
+	snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, ext_data,
+			       sizeof(*ext_hdr));
+	ext_hdr = ext_data;
+
+	while (ext_hdr->hdr.cmd == SOF_IPC_FW_READY) {
+		/* read in ext structure */
+		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM,
+				       offset + sizeof(*ext_hdr),
+				       (void *)((u8 *)ext_data + sizeof(*ext_hdr)),
+				       ext_hdr->hdr.size - sizeof(*ext_hdr));
+
+		dev_dbg(sdev->dev, "found ext header type %d size 0x%x\n",
+			ext_hdr->type, ext_hdr->hdr.size);
+
+		/* process structure data */
+		switch (ext_hdr->type) {
+		case SOF_IPC_EXT_WINDOW:
+			ret = sof_ipc3_get_ext_windows(sdev, ext_hdr);
+			break;
+		case SOF_IPC_EXT_CC_INFO:
+			ret = sof_ipc3_get_cc_info(sdev, ext_hdr);
+			break;
+		case SOF_IPC_EXT_UNUSED:
+		case SOF_IPC_EXT_PROBE_INFO:
+		case SOF_IPC_EXT_USER_ABI_INFO:
+			/* They are supported but we don't do anything here */
+			break;
+		default:
+			dev_info(sdev->dev, "unknown ext header type %d size 0x%x\n",
+				 ext_hdr->type, ext_hdr->hdr.size);
+			ret = 0;
+			break;
+		}
+
+		if (ret < 0) {
+			dev_err(sdev->dev, "Failed to parse ext data type %d\n",
+				ext_hdr->type);
+			break;
+		}
+
+		/* move to next header */
+		offset += ext_hdr->hdr.size;
+		snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, ext_data,
+				       sizeof(*ext_hdr));
+		ext_hdr = ext_data;
+	}
+
+	kfree(ext_data);
+	return ret;
+}
+
+static void ipc3_get_windows(struct snd_sof_dev *sdev)
+{
+	struct sof_ipc_window_elem *elem;
+	u32 outbox_offset = 0;
+	u32 stream_offset = 0;
+	u32 inbox_offset = 0;
+	u32 outbox_size = 0;
+	u32 stream_size = 0;
+	u32 inbox_size = 0;
+	u32 debug_size = 0;
+	u32 debug_offset = 0;
+	int window_offset;
+	int i;
+
+	if (!sdev->info_window) {
+		dev_err(sdev->dev, "%s: No window info present\n", __func__);
+		return;
+	}
+
+	for (i = 0; i < sdev->info_window->num_windows; i++) {
+		elem = &sdev->info_window->window[i];
+
+		window_offset = snd_sof_dsp_get_window_offset(sdev, elem->id);
+		if (window_offset < 0) {
+			dev_warn(sdev->dev, "No offset for window %d\n", elem->id);
+			continue;
+		}
+
+		switch (elem->type) {
+		case SOF_IPC_REGION_UPBOX:
+			inbox_offset = window_offset + elem->offset;
+			inbox_size = elem->size;
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							inbox_offset,
+							elem->size, "inbox",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_DOWNBOX:
+			outbox_offset = window_offset + elem->offset;
+			outbox_size = elem->size;
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							outbox_offset,
+							elem->size, "outbox",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_TRACE:
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							window_offset + elem->offset,
+							elem->size, "etrace",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_DEBUG:
+			debug_offset = window_offset + elem->offset;
+			debug_size = elem->size;
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							window_offset + elem->offset,
+							elem->size, "debug",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_STREAM:
+			stream_offset = window_offset + elem->offset;
+			stream_size = elem->size;
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							stream_offset,
+							elem->size, "stream",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_REGS:
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							window_offset + elem->offset,
+							elem->size, "regs",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		case SOF_IPC_REGION_EXCEPTION:
+			sdev->dsp_oops_offset = window_offset + elem->offset;
+			snd_sof_debugfs_add_region_item(sdev, SOF_FW_BLK_TYPE_SRAM,
+							window_offset + elem->offset,
+							elem->size, "exception",
+							SOF_DEBUGFS_ACCESS_D0_ONLY);
+			break;
+		default:
+			dev_err(sdev->dev, "%s: Illegal window info: %u\n",
+				__func__, elem->type);
+			return;
+		}
+	}
+
+	if (outbox_size == 0 || inbox_size == 0) {
+		dev_err(sdev->dev, "%s: Illegal mailbox window\n", __func__);
+		return;
+	}
+
+	sdev->dsp_box.offset = inbox_offset;
+	sdev->dsp_box.size = inbox_size;
+
+	sdev->host_box.offset = outbox_offset;
+	sdev->host_box.size = outbox_size;
+
+	sdev->stream_box.offset = stream_offset;
+	sdev->stream_box.size = stream_size;
+
+	sdev->debug_box.offset = debug_offset;
+	sdev->debug_box.size = debug_size;
+
+	dev_dbg(sdev->dev, " mailbox upstream 0x%x - size 0x%x\n",
+		inbox_offset, inbox_size);
+	dev_dbg(sdev->dev, " mailbox downstream 0x%x - size 0x%x\n",
+		outbox_offset, outbox_size);
+	dev_dbg(sdev->dev, " stream region 0x%x - size 0x%x\n",
+		stream_offset, stream_size);
+	dev_dbg(sdev->dev, " debug region 0x%x - size 0x%x\n",
+		debug_offset, debug_size);
+}
+
+static int ipc3_init_reply_data_buffer(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = &sdev->ipc->msg;
+
+	msg->reply_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!msg->reply_data)
+		return -ENOMEM;
+
+	sdev->ipc->max_payload_size = SOF_IPC_MSG_MAX_SIZE;
+
+	return 0;
+}
+
+static int ipc3_fw_ready(struct snd_sof_dev *sdev, u32 cmd)
+{
+	struct sof_ipc_fw_ready *fw_ready = &sdev->fw_ready;
+	int offset;
+	int ret;
+
+	/* mailbox must be on 4k boundary */
+	offset = snd_sof_dsp_get_mailbox_offset(sdev);
+	if (offset < 0) {
+		dev_err(sdev->dev, "%s: no mailbox offset\n", __func__);
+		return offset;
+	}
+
+	dev_dbg(sdev->dev, "DSP is ready 0x%8.8x offset 0x%x\n", cmd, offset);
+
+	/* no need to re-check version/ABI for subsequent boots */
+	if (!sdev->first_boot)
+		return 0;
+
+	/*
+	 * copy data from the DSP FW ready offset
+	 * Subsequent error handling is not needed for BLK_TYPE_SRAM
+	 */
+	ret = snd_sof_dsp_block_read(sdev, SOF_FW_BLK_TYPE_SRAM, offset, fw_ready,
+				     sizeof(*fw_ready));
+	if (ret) {
+		dev_err(sdev->dev,
+			"Unable to read fw_ready, read from TYPE_SRAM failed\n");
+		return ret;
+	}
+
+	/* make sure ABI version is compatible */
+	ret = snd_sof_ipc_valid(sdev);
+	if (ret < 0)
+		return ret;
+
+	/* now check for extended data */
+	ipc3_fw_parse_ext_data(sdev, offset + sizeof(struct sof_ipc_fw_ready));
+
+	ipc3_get_windows(sdev);
+
+	return ipc3_init_reply_data_buffer(sdev);
+}
+
 /* IPC stream position. */
 static void ipc3_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
 {
@@ -633,7 +937,7 @@ static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
 	case SOF_IPC_FW_READY:
 		/* check for FW boot completion */
 		if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS) {
-			err = sof_ops(sdev)->fw_ready(sdev, cmd);
+			err = ipc3_fw_ready(sdev, cmd);
 			if (err < 0)
 				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_FAILED);
 			else
-- 
2.35.3

