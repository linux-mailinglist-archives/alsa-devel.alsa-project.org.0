Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5E04F3CDC
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:32:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AC8A4E;
	Tue,  5 Apr 2022 19:31:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AC8A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179942;
	bh=NQ5+BD3Jj7UAq+Rhjoxiq/xxancUbMweGDkZn8N5/zs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SPvP3W7K5lRzfN+47vEopgxljTKYZKpLYpQFpY4rVTEX8xPWslZ00ueR6YU+hpCRY
	 HDMzpUZv7xLuBR9zV1n8Lx0+Uotx7rlre2jxJ4bnKU24vzK0qjlYRawRKWJd/o9Su8
	 +tbjwVY24jRcQt9h3aKxoNV6neTlIiYfU8+DoqsQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0ED9AF80578;
	Tue,  5 Apr 2022 19:27:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD04CF80548; Tue,  5 Apr 2022 19:27:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47D4CF8016E
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47D4CF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="fvKgdv2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179662; x=1680715662;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NQ5+BD3Jj7UAq+Rhjoxiq/xxancUbMweGDkZn8N5/zs=;
 b=fvKgdv2QsuDREnxB/SKAPF0Pv+UponlrhL5vEDYscMfHxCaSoGPXDw+q
 5VmVdCtYkM1nEPxEbwRcDkGol5WdZ+TfJP9XrKNSYBrufuT5q8T43eQxN
 RdXbAJFu8SYLCMFwrCjdX4cSOCfK6nqoJ/BGOEcBMO2tPdWlWg/cz61qC
 qMVygj4YjqxFhDJIsDBjXhF85FSFt5CsWJlZzDieiasSJtyLSr19ASbao
 LsnVUtMoHMTsXGyXqAjw+Jk3uOo8n4OggIm0c4FpgBDShudAms235H+Uz
 ANBN1ENIr+qvdiqHLhHkPrnbqdy6mkLUVOuGtYCHA8kQXoH5s9f++g2h+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986777"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986777"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140999"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:25 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 12/15] ASoC: SOF: ipc: Switch over to use the rx_msg ops
Date: Tue,  5 Apr 2022 10:27:05 -0700
Message-Id: <20220405172708.122168-13-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
References: <20220405172708.122168-1-ranjani.sridharan@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org,
 Daniel Baluta <daniel.baluta@nxp.com>
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

From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Use the new ops for handling message reception.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 452 ---------------------------------------
 sound/soc/sof/sof-priv.h |   5 +-
 2 files changed, 4 insertions(+), 453 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 05c1ba0c2206..45c487ab8b54 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -19,215 +19,6 @@
 #include "ops.h"
 #include "ipc3-ops.h"
 
-typedef void (*ipc_rx_callback)(struct snd_sof_dev *sdev, void *msg_buf);
-
-static void ipc_trace_message(struct snd_sof_dev *sdev, void *msg_buf);
-static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf);
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC)
-static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
-{
-	u8 *str;
-	u8 *str2 = NULL;
-	u32 glb;
-	u32 type;
-	bool vdbg = false;
-
-	glb = cmd & SOF_GLB_TYPE_MASK;
-	type = cmd & SOF_CMD_TYPE_MASK;
-
-	switch (glb) {
-	case SOF_IPC_GLB_REPLY:
-		str = "GLB_REPLY"; break;
-	case SOF_IPC_GLB_COMPOUND:
-		str = "GLB_COMPOUND"; break;
-	case SOF_IPC_GLB_TPLG_MSG:
-		str = "GLB_TPLG_MSG";
-		switch (type) {
-		case SOF_IPC_TPLG_COMP_NEW:
-			str2 = "COMP_NEW"; break;
-		case SOF_IPC_TPLG_COMP_FREE:
-			str2 = "COMP_FREE"; break;
-		case SOF_IPC_TPLG_COMP_CONNECT:
-			str2 = "COMP_CONNECT"; break;
-		case SOF_IPC_TPLG_PIPE_NEW:
-			str2 = "PIPE_NEW"; break;
-		case SOF_IPC_TPLG_PIPE_FREE:
-			str2 = "PIPE_FREE"; break;
-		case SOF_IPC_TPLG_PIPE_CONNECT:
-			str2 = "PIPE_CONNECT"; break;
-		case SOF_IPC_TPLG_PIPE_COMPLETE:
-			str2 = "PIPE_COMPLETE"; break;
-		case SOF_IPC_TPLG_BUFFER_NEW:
-			str2 = "BUFFER_NEW"; break;
-		case SOF_IPC_TPLG_BUFFER_FREE:
-			str2 = "BUFFER_FREE"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_PM_MSG:
-		str = "GLB_PM_MSG";
-		switch (type) {
-		case SOF_IPC_PM_CTX_SAVE:
-			str2 = "CTX_SAVE"; break;
-		case SOF_IPC_PM_CTX_RESTORE:
-			str2 = "CTX_RESTORE"; break;
-		case SOF_IPC_PM_CTX_SIZE:
-			str2 = "CTX_SIZE"; break;
-		case SOF_IPC_PM_CLK_SET:
-			str2 = "CLK_SET"; break;
-		case SOF_IPC_PM_CLK_GET:
-			str2 = "CLK_GET"; break;
-		case SOF_IPC_PM_CLK_REQ:
-			str2 = "CLK_REQ"; break;
-		case SOF_IPC_PM_CORE_ENABLE:
-			str2 = "CORE_ENABLE"; break;
-		case SOF_IPC_PM_GATE:
-			str2 = "GATE"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_COMP_MSG:
-		str = "GLB_COMP_MSG";
-		switch (type) {
-		case SOF_IPC_COMP_SET_VALUE:
-			str2 = "SET_VALUE"; break;
-		case SOF_IPC_COMP_GET_VALUE:
-			str2 = "GET_VALUE"; break;
-		case SOF_IPC_COMP_SET_DATA:
-			str2 = "SET_DATA"; break;
-		case SOF_IPC_COMP_GET_DATA:
-			str2 = "GET_DATA"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_STREAM_MSG:
-		str = "GLB_STREAM_MSG";
-		switch (type) {
-		case SOF_IPC_STREAM_PCM_PARAMS:
-			str2 = "PCM_PARAMS"; break;
-		case SOF_IPC_STREAM_PCM_PARAMS_REPLY:
-			str2 = "PCM_REPLY"; break;
-		case SOF_IPC_STREAM_PCM_FREE:
-			str2 = "PCM_FREE"; break;
-		case SOF_IPC_STREAM_TRIG_START:
-			str2 = "TRIG_START"; break;
-		case SOF_IPC_STREAM_TRIG_STOP:
-			str2 = "TRIG_STOP"; break;
-		case SOF_IPC_STREAM_TRIG_PAUSE:
-			str2 = "TRIG_PAUSE"; break;
-		case SOF_IPC_STREAM_TRIG_RELEASE:
-			str2 = "TRIG_RELEASE"; break;
-		case SOF_IPC_STREAM_TRIG_DRAIN:
-			str2 = "TRIG_DRAIN"; break;
-		case SOF_IPC_STREAM_TRIG_XRUN:
-			str2 = "TRIG_XRUN"; break;
-		case SOF_IPC_STREAM_POSITION:
-			vdbg = true;
-			str2 = "POSITION"; break;
-		case SOF_IPC_STREAM_VORBIS_PARAMS:
-			str2 = "VORBIS_PARAMS"; break;
-		case SOF_IPC_STREAM_VORBIS_FREE:
-			str2 = "VORBIS_FREE"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_FW_READY:
-		str = "FW_READY"; break;
-	case SOF_IPC_GLB_DAI_MSG:
-		str = "GLB_DAI_MSG";
-		switch (type) {
-		case SOF_IPC_DAI_CONFIG:
-			str2 = "CONFIG"; break;
-		case SOF_IPC_DAI_LOOPBACK:
-			str2 = "LOOPBACK"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_TRACE_MSG:
-		str = "GLB_TRACE_MSG";
-		switch (type) {
-		case SOF_IPC_TRACE_DMA_PARAMS:
-			str2 = "DMA_PARAMS"; break;
-		case SOF_IPC_TRACE_DMA_POSITION:
-			str2 = "DMA_POSITION"; break;
-		case SOF_IPC_TRACE_DMA_PARAMS_EXT:
-			str2 = "DMA_PARAMS_EXT"; break;
-		case SOF_IPC_TRACE_FILTER_UPDATE:
-			str2 = "FILTER_UPDATE"; break;
-		case SOF_IPC_TRACE_DMA_FREE:
-			str2 = "DMA_FREE"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_TEST_MSG:
-		str = "GLB_TEST_MSG";
-		switch (type) {
-		case SOF_IPC_TEST_IPC_FLOOD:
-			str2 = "IPC_FLOOD"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_DEBUG:
-		str = "GLB_DEBUG";
-		switch (type) {
-		case SOF_IPC_DEBUG_MEM_USAGE:
-			str2 = "MEM_USAGE"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	case SOF_IPC_GLB_PROBE:
-		str = "GLB_PROBE";
-		switch (type) {
-		case SOF_IPC_PROBE_INIT:
-			str2 = "INIT"; break;
-		case SOF_IPC_PROBE_DEINIT:
-			str2 = "DEINIT"; break;
-		case SOF_IPC_PROBE_DMA_ADD:
-			str2 = "DMA_ADD"; break;
-		case SOF_IPC_PROBE_DMA_INFO:
-			str2 = "DMA_INFO"; break;
-		case SOF_IPC_PROBE_DMA_REMOVE:
-			str2 = "DMA_REMOVE"; break;
-		case SOF_IPC_PROBE_POINT_ADD:
-			str2 = "POINT_ADD"; break;
-		case SOF_IPC_PROBE_POINT_INFO:
-			str2 = "POINT_INFO"; break;
-		case SOF_IPC_PROBE_POINT_REMOVE:
-			str2 = "POINT_REMOVE"; break;
-		default:
-			str2 = "unknown type"; break;
-		}
-		break;
-	default:
-		str = "unknown GLB command"; break;
-	}
-
-	if (str2) {
-		if (vdbg)
-			dev_vdbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
-		else
-			dev_dbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
-	} else {
-		dev_dbg(dev, "%s: 0x%x: %s\n", text, cmd, str);
-	}
-}
-#else
-static inline void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
-{
-	if ((cmd & SOF_GLB_TYPE_MASK) != SOF_IPC_GLB_TRACE_MSG)
-		dev_dbg(dev, "%s: 0x%x\n", text, cmd);
-}
-#endif
-
 /**
  * sof_ipc_send_msg - generic function to prepare and send one IPC message
  * @sdev:		pointer to SOF core device struct
@@ -346,249 +137,6 @@ void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 }
 EXPORT_SYMBOL(snd_sof_ipc_reply);
 
-static void ipc_comp_notification(struct snd_sof_dev *sdev, void *msg_buf)
-{
-	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
-	struct sof_ipc_cmd_hdr *hdr = msg_buf;
-	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
-
-	switch (msg_type) {
-	case SOF_IPC_COMP_GET_VALUE:
-	case SOF_IPC_COMP_GET_DATA:
-		break;
-	default:
-		dev_err(sdev->dev, "error: unhandled component message %#x\n", msg_type);
-		return;
-	}
-
-	if (tplg_ops->control->update)
-		tplg_ops->control->update(sdev, msg_buf);
-}
-
-/* DSP firmware has sent host a message  */
-void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
-{
-	ipc_rx_callback rx_callback = NULL;
-	struct sof_ipc_cmd_hdr hdr;
-	void *msg_buf;
-	u32 cmd;
-	int err;
-
-	/* read back header */
-	err = snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
-	if (err < 0) {
-		dev_warn(sdev->dev, "failed to read IPC header: %d\n", err);
-		return;
-	}
-
-	if (hdr.size < sizeof(hdr)) {
-		dev_err(sdev->dev, "The received message size is invalid\n");
-		return;
-	}
-
-	ipc_log_header(sdev->dev, "ipc rx", hdr.cmd);
-
-	cmd = hdr.cmd & SOF_GLB_TYPE_MASK;
-
-	/* check message type */
-	switch (cmd) {
-	case SOF_IPC_GLB_REPLY:
-		dev_err(sdev->dev, "error: ipc reply unknown\n");
-		break;
-	case SOF_IPC_FW_READY:
-		/* check for FW boot completion */
-		if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS) {
-			err = sof_ops(sdev)->fw_ready(sdev, cmd);
-			if (err < 0)
-				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_FAILED);
-			else
-				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_OK);
-
-			/* wake up firmware loader */
-			wake_up(&sdev->boot_wait);
-		}
-		break;
-	case SOF_IPC_GLB_COMPOUND:
-	case SOF_IPC_GLB_TPLG_MSG:
-	case SOF_IPC_GLB_PM_MSG:
-		break;
-	case SOF_IPC_GLB_COMP_MSG:
-		rx_callback = ipc_comp_notification;
-		break;
-	case SOF_IPC_GLB_STREAM_MSG:
-		rx_callback = ipc_stream_message;
-		break;
-	case SOF_IPC_GLB_TRACE_MSG:
-		rx_callback = ipc_trace_message;
-		break;
-	default:
-		dev_err(sdev->dev, "%s: Unknown DSP message: 0x%x\n", __func__, cmd);
-		break;
-	}
-
-	/* read the full message */
-	msg_buf = kmalloc(hdr.size, GFP_KERNEL);
-	if (!msg_buf)
-		return;
-
-	err = snd_sof_ipc_msg_data(sdev, NULL, msg_buf, hdr.size);
-	if (err < 0) {
-		dev_err(sdev->dev, "%s: Failed to read message: %d\n", __func__, err);
-	} else {
-		/* Call local handler for the message */
-		if (rx_callback)
-			rx_callback(sdev, msg_buf);
-
-		/* Notify registered clients */
-		sof_client_ipc_rx_dispatcher(sdev, msg_buf);
-	}
-
-	kfree(msg_buf);
-
-	ipc_log_header(sdev->dev, "ipc rx done", hdr.cmd);
-}
-EXPORT_SYMBOL(snd_sof_ipc_msgs_rx);
-
-/*
- * IPC trace mechanism.
- */
-
-static void ipc_trace_message(struct snd_sof_dev *sdev, void *msg_buf)
-{
-	struct sof_ipc_cmd_hdr *hdr = msg_buf;
-	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
-
-	switch (msg_type) {
-	case SOF_IPC_TRACE_DMA_POSITION:
-		snd_sof_trace_update_pos(sdev, msg_buf);
-		break;
-	default:
-		dev_err(sdev->dev, "error: unhandled trace message %#x\n", msg_type);
-		break;
-	}
-}
-
-/*
- * IPC stream position.
- */
-
-static void ipc_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
-{
-	struct snd_soc_component *scomp = sdev->component;
-	struct snd_sof_pcm_stream *stream;
-	struct sof_ipc_stream_posn posn;
-	struct snd_sof_pcm *spcm;
-	int direction, ret;
-
-	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
-	if (!spcm) {
-		dev_err(sdev->dev,
-			"error: period elapsed for unknown stream, msg_id %d\n",
-			msg_id);
-		return;
-	}
-
-	stream = &spcm->stream[direction];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
-	if (ret < 0) {
-		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
-		return;
-	}
-
-	dev_vdbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
-		 posn.host_posn, posn.dai_posn, posn.wallclock);
-
-	memcpy(&stream->posn, &posn, sizeof(posn));
-
-	if (spcm->pcm.compress)
-		snd_sof_compr_fragment_elapsed(stream->cstream);
-	else if (stream->substream->runtime &&
-		 !stream->substream->runtime->no_period_wakeup)
-		/* only inform ALSA for period_wakeup mode */
-		snd_sof_pcm_period_elapsed(stream->substream);
-}
-
-/* DSP notifies host of an XRUN within FW */
-static void ipc_xrun(struct snd_sof_dev *sdev, u32 msg_id)
-{
-	struct snd_soc_component *scomp = sdev->component;
-	struct snd_sof_pcm_stream *stream;
-	struct sof_ipc_stream_posn posn;
-	struct snd_sof_pcm *spcm;
-	int direction, ret;
-
-	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
-	if (!spcm) {
-		dev_err(sdev->dev, "error: XRUN for unknown stream, msg_id %d\n",
-			msg_id);
-		return;
-	}
-
-	stream = &spcm->stream[direction];
-	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
-	if (ret < 0) {
-		dev_warn(sdev->dev, "failed to read overrun position: %d\n", ret);
-		return;
-	}
-
-	dev_dbg(sdev->dev,  "posn XRUN: host %llx comp %d size %d\n",
-		posn.host_posn, posn.xrun_comp_id, posn.xrun_size);
-
-#if defined(CONFIG_SND_SOC_SOF_DEBUG_XRUN_STOP)
-	/* stop PCM on XRUN - used for pipeline debug */
-	memcpy(&stream->posn, &posn, sizeof(posn));
-	snd_pcm_stop_xrun(stream->substream);
-#endif
-}
-
-/* stream notifications from DSP FW */
-static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf)
-{
-	struct sof_ipc_cmd_hdr *hdr = msg_buf;
-	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
-	u32 msg_id = SOF_IPC_MESSAGE_ID(hdr->cmd);
-
-	switch (msg_type) {
-	case SOF_IPC_STREAM_POSITION:
-		ipc_period_elapsed(sdev, msg_id);
-		break;
-	case SOF_IPC_STREAM_TRIG_XRUN:
-		ipc_xrun(sdev, msg_id);
-		break;
-	default:
-		dev_err(sdev->dev, "error: unhandled stream message %#x\n",
-			msg_id);
-		break;
-	}
-}
-
-/* get stream position IPC - use faster MMIO method if available on platform */
-int snd_sof_ipc_stream_posn(struct snd_soc_component *scomp,
-			    struct snd_sof_pcm *spcm, int direction,
-			    struct sof_ipc_stream_posn *posn)
-{
-	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_stream stream;
-	int err;
-
-	/* read position via slower IPC */
-	stream.hdr.size = sizeof(stream);
-	stream.hdr.cmd = SOF_IPC_GLB_STREAM_MSG | SOF_IPC_STREAM_POSITION;
-	stream.comp_id = spcm->stream[direction].comp_id;
-
-	/* send IPC to the DSP */
-	err = sof_ipc_tx_message(sdev->ipc, &stream, sizeof(stream), posn,
-				 sizeof(*posn));
-	if (err < 0) {
-		dev_err(sdev->dev, "error: failed to get stream %d position\n",
-			stream.comp_id);
-		return err;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL(snd_sof_ipc_stream_posn);
-
 /*
  * IPC get()/set() for kcontrols.
  */
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index 2bf7844f01d7..6a09e5a73a50 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -603,7 +603,10 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev);
 void snd_sof_ipc_free(struct snd_sof_dev *sdev);
 void snd_sof_ipc_get_reply(struct snd_sof_dev *sdev);
 void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id);
-void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev);
+static inline void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
+{
+	sdev->ipc->ops->rx_msg(sdev);
+}
 int snd_sof_ipc_valid(struct snd_sof_dev *sdev);
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 		       void *reply_data, size_t reply_bytes);
-- 
2.25.1

