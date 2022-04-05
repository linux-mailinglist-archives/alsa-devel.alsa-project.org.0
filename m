Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 709F14F3CD4
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:30:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F40A3189E;
	Tue,  5 Apr 2022 19:29:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F40A3189E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179822;
	bh=qRysDrBS9T0TBtIelkz3j0wn5km0i90qDpTNyzMI8Hw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qbNaVjalnwaNYaSZShOVb4hsVpQk1UvwAh8CZOHy0TM2eEE73jlaHgNbLntrd3naP
	 bXZ+fRRBwo7KBRMiocSNavKjobpxYWbk/fwgWggDtdWbNTXvFNJ8cWOwmg5Toilh5l
	 5Ed6Nkx+DeV7OBeTnxdpgc9q/kAScFG+tLR/CXSI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA4C2F800D2;
	Tue,  5 Apr 2022 19:27:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04D3FF80533; Tue,  5 Apr 2022 19:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23AC7F80482
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23AC7F80482
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mH4U2tuM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179655; x=1680715655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qRysDrBS9T0TBtIelkz3j0wn5km0i90qDpTNyzMI8Hw=;
 b=mH4U2tuMsgHaLMGB/mCGQFQ1LluBwIfZWUehTgv0gTx4Dr3DzsbfeY2p
 JvANYuCmRpq60K1j3DP384a/tdoAjzOlcz92S3kroqNwDtTZIQ7ZjpYkX
 N4RU10a6B0SCPUEIiYkkR5SR77taEIMkhcGTpkjYlO8ME9rvwIuPT8ydt
 Fjvi7J8t7lgKw5bTPT9h9RpzzATb/RxxJq4STTMd14zegRFO41TO7+tYD
 DCOSZCM21qulz2nGckexh8ERIFADWmD5qSMMugbodshTMiqa5GW7ARYq6
 iXhiJrEd/cs4d2kgsx3qMB3nrS7EesS8giFeOQ0/OeZFwa55y5KRSkRik g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986728"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986728"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140955"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/15] ASoC: SOF: ipc3: Implement the tx_msg IPC ops
Date: Tue,  5 Apr 2022 10:26:56 -0700
Message-Id: <20220405172708.122168-4-ranjani.sridharan@linux.intel.com>
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

Add the implementation for the IPC3 tx_msg callback for sending a single
IPC message.

The implementation is equivalent to the currently used code in ipc.c

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 308 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 308 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index a7289804efda..7f80035d3a88 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -9,6 +9,312 @@
 
 #include "sof-priv.h"
 #include "ipc3-ops.h"
+#include "ops.h"
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC)
+static void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
+{
+	u8 *str;
+	u8 *str2 = NULL;
+	u32 glb;
+	u32 type;
+	bool vdbg = false;
+
+	glb = cmd & SOF_GLB_TYPE_MASK;
+	type = cmd & SOF_CMD_TYPE_MASK;
+
+	switch (glb) {
+	case SOF_IPC_GLB_REPLY:
+		str = "GLB_REPLY"; break;
+	case SOF_IPC_GLB_COMPOUND:
+		str = "GLB_COMPOUND"; break;
+	case SOF_IPC_GLB_TPLG_MSG:
+		str = "GLB_TPLG_MSG";
+		switch (type) {
+		case SOF_IPC_TPLG_COMP_NEW:
+			str2 = "COMP_NEW"; break;
+		case SOF_IPC_TPLG_COMP_FREE:
+			str2 = "COMP_FREE"; break;
+		case SOF_IPC_TPLG_COMP_CONNECT:
+			str2 = "COMP_CONNECT"; break;
+		case SOF_IPC_TPLG_PIPE_NEW:
+			str2 = "PIPE_NEW"; break;
+		case SOF_IPC_TPLG_PIPE_FREE:
+			str2 = "PIPE_FREE"; break;
+		case SOF_IPC_TPLG_PIPE_CONNECT:
+			str2 = "PIPE_CONNECT"; break;
+		case SOF_IPC_TPLG_PIPE_COMPLETE:
+			str2 = "PIPE_COMPLETE"; break;
+		case SOF_IPC_TPLG_BUFFER_NEW:
+			str2 = "BUFFER_NEW"; break;
+		case SOF_IPC_TPLG_BUFFER_FREE:
+			str2 = "BUFFER_FREE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_PM_MSG:
+		str = "GLB_PM_MSG";
+		switch (type) {
+		case SOF_IPC_PM_CTX_SAVE:
+			str2 = "CTX_SAVE"; break;
+		case SOF_IPC_PM_CTX_RESTORE:
+			str2 = "CTX_RESTORE"; break;
+		case SOF_IPC_PM_CTX_SIZE:
+			str2 = "CTX_SIZE"; break;
+		case SOF_IPC_PM_CLK_SET:
+			str2 = "CLK_SET"; break;
+		case SOF_IPC_PM_CLK_GET:
+			str2 = "CLK_GET"; break;
+		case SOF_IPC_PM_CLK_REQ:
+			str2 = "CLK_REQ"; break;
+		case SOF_IPC_PM_CORE_ENABLE:
+			str2 = "CORE_ENABLE"; break;
+		case SOF_IPC_PM_GATE:
+			str2 = "GATE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_COMP_MSG:
+		str = "GLB_COMP_MSG";
+		switch (type) {
+		case SOF_IPC_COMP_SET_VALUE:
+			str2 = "SET_VALUE"; break;
+		case SOF_IPC_COMP_GET_VALUE:
+			str2 = "GET_VALUE"; break;
+		case SOF_IPC_COMP_SET_DATA:
+			str2 = "SET_DATA"; break;
+		case SOF_IPC_COMP_GET_DATA:
+			str2 = "GET_DATA"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_STREAM_MSG:
+		str = "GLB_STREAM_MSG";
+		switch (type) {
+		case SOF_IPC_STREAM_PCM_PARAMS:
+			str2 = "PCM_PARAMS"; break;
+		case SOF_IPC_STREAM_PCM_PARAMS_REPLY:
+			str2 = "PCM_REPLY"; break;
+		case SOF_IPC_STREAM_PCM_FREE:
+			str2 = "PCM_FREE"; break;
+		case SOF_IPC_STREAM_TRIG_START:
+			str2 = "TRIG_START"; break;
+		case SOF_IPC_STREAM_TRIG_STOP:
+			str2 = "TRIG_STOP"; break;
+		case SOF_IPC_STREAM_TRIG_PAUSE:
+			str2 = "TRIG_PAUSE"; break;
+		case SOF_IPC_STREAM_TRIG_RELEASE:
+			str2 = "TRIG_RELEASE"; break;
+		case SOF_IPC_STREAM_TRIG_DRAIN:
+			str2 = "TRIG_DRAIN"; break;
+		case SOF_IPC_STREAM_TRIG_XRUN:
+			str2 = "TRIG_XRUN"; break;
+		case SOF_IPC_STREAM_POSITION:
+			vdbg = true;
+			str2 = "POSITION"; break;
+		case SOF_IPC_STREAM_VORBIS_PARAMS:
+			str2 = "VORBIS_PARAMS"; break;
+		case SOF_IPC_STREAM_VORBIS_FREE:
+			str2 = "VORBIS_FREE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_FW_READY:
+		str = "FW_READY"; break;
+	case SOF_IPC_GLB_DAI_MSG:
+		str = "GLB_DAI_MSG";
+		switch (type) {
+		case SOF_IPC_DAI_CONFIG:
+			str2 = "CONFIG"; break;
+		case SOF_IPC_DAI_LOOPBACK:
+			str2 = "LOOPBACK"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_TRACE_MSG:
+		str = "GLB_TRACE_MSG";
+		switch (type) {
+		case SOF_IPC_TRACE_DMA_PARAMS:
+			str2 = "DMA_PARAMS"; break;
+		case SOF_IPC_TRACE_DMA_POSITION:
+			str2 = "DMA_POSITION"; break;
+		case SOF_IPC_TRACE_DMA_PARAMS_EXT:
+			str2 = "DMA_PARAMS_EXT"; break;
+		case SOF_IPC_TRACE_FILTER_UPDATE:
+			str2 = "FILTER_UPDATE"; break;
+		case SOF_IPC_TRACE_DMA_FREE:
+			str2 = "DMA_FREE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_TEST_MSG:
+		str = "GLB_TEST_MSG";
+		switch (type) {
+		case SOF_IPC_TEST_IPC_FLOOD:
+			str2 = "IPC_FLOOD"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_DEBUG:
+		str = "GLB_DEBUG";
+		switch (type) {
+		case SOF_IPC_DEBUG_MEM_USAGE:
+			str2 = "MEM_USAGE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	case SOF_IPC_GLB_PROBE:
+		str = "GLB_PROBE";
+		switch (type) {
+		case SOF_IPC_PROBE_INIT:
+			str2 = "INIT"; break;
+		case SOF_IPC_PROBE_DEINIT:
+			str2 = "DEINIT"; break;
+		case SOF_IPC_PROBE_DMA_ADD:
+			str2 = "DMA_ADD"; break;
+		case SOF_IPC_PROBE_DMA_INFO:
+			str2 = "DMA_INFO"; break;
+		case SOF_IPC_PROBE_DMA_REMOVE:
+			str2 = "DMA_REMOVE"; break;
+		case SOF_IPC_PROBE_POINT_ADD:
+			str2 = "POINT_ADD"; break;
+		case SOF_IPC_PROBE_POINT_INFO:
+			str2 = "POINT_INFO"; break;
+		case SOF_IPC_PROBE_POINT_REMOVE:
+			str2 = "POINT_REMOVE"; break;
+		default:
+			str2 = "unknown type"; break;
+		}
+		break;
+	default:
+		str = "unknown GLB command"; break;
+	}
+
+	if (str2) {
+		if (vdbg)
+			dev_vdbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
+		else
+			dev_dbg(dev, "%s: 0x%x: %s: %s\n", text, cmd, str, str2);
+	} else {
+		dev_dbg(dev, "%s: 0x%x: %s\n", text, cmd, str);
+	}
+}
+#else
+static inline void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
+{
+	if ((cmd & SOF_GLB_TYPE_MASK) != SOF_IPC_GLB_TRACE_MSG)
+		dev_dbg(dev, "%s: 0x%x\n", text, cmd);
+}
+#endif
+
+/* wait for IPC message reply */
+static int ipc3_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
+{
+	struct snd_sof_ipc_msg *msg = &ipc->msg;
+	struct sof_ipc_cmd_hdr *hdr = msg->msg_data;
+	struct snd_sof_dev *sdev = ipc->sdev;
+	int ret;
+
+	/* wait for DSP IPC completion */
+	ret = wait_event_timeout(msg->waitq, msg->ipc_complete,
+				 msecs_to_jiffies(sdev->ipc_timeout));
+
+	if (ret == 0) {
+		dev_err(sdev->dev,
+			"ipc tx timed out for %#x (msg/reply size: %d/%zu)\n",
+			hdr->cmd, hdr->size, msg->reply_size);
+		snd_sof_handle_fw_exception(ipc->sdev);
+		ret = -ETIMEDOUT;
+	} else {
+		ret = msg->reply_error;
+		if (ret < 0) {
+			dev_err(sdev->dev,
+				"ipc tx error for %#x (msg/reply size: %d/%zu): %d\n",
+				hdr->cmd, hdr->size, msg->reply_size, ret);
+		} else {
+			ipc3_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
+			if (msg->reply_size)
+				/* copy the data returned from DSP */
+				memcpy(reply_data, msg->reply_data,
+				       msg->reply_size);
+		}
+
+		/* re-enable dumps after successful IPC tx */
+		if (sdev->ipc_dump_printed) {
+			sdev->dbg_dump_printed = false;
+			sdev->ipc_dump_printed = false;
+		}
+	}
+
+	return ret;
+}
+
+/* send IPC message from host to DSP */
+static int ipc3_tx_msg_unlocked(struct snd_sof_ipc *ipc,
+				void *msg_data, size_t msg_bytes,
+				void *reply_data, size_t reply_bytes)
+{
+	struct sof_ipc_cmd_hdr *hdr = msg_data;
+	struct snd_sof_dev *sdev = ipc->sdev;
+	int ret;
+
+	ret = sof_ipc_send_msg(sdev, msg_data, msg_bytes, reply_bytes);
+
+	if (ret) {
+		dev_err_ratelimited(sdev->dev,
+				    "%s: ipc message send for %#x failed: %d\n",
+				    __func__, hdr->cmd, ret);
+		return ret;
+	}
+
+	ipc3_log_header(sdev->dev, "ipc tx", hdr->cmd);
+
+	/* now wait for completion */
+	return ipc3_wait_tx_done(ipc, reply_data);
+}
+
+static int sof_ipc3_tx_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
+			   void *reply_data, size_t reply_bytes, bool no_pm)
+{
+	struct snd_sof_ipc *ipc = sdev->ipc;
+	int ret;
+
+	if (!msg_data || msg_bytes < sizeof(struct sof_ipc_cmd_hdr)) {
+		dev_err_ratelimited(sdev->dev, "No IPC message to send\n");
+		return -EINVAL;
+	}
+
+	if (!no_pm) {
+		const struct sof_dsp_power_state target_state = {
+			.state = SOF_DSP_PM_D0,
+		};
+
+		/* ensure the DSP is in D0 before sending a new IPC */
+		ret = snd_sof_dsp_set_power_state(sdev, &target_state);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: resuming DSP failed: %d\n",
+				__func__, ret);
+			return ret;
+		}
+	}
+
+	/* Serialise IPC TX */
+	mutex_lock(&ipc->tx_mutex);
+
+	ret = ipc3_tx_msg_unlocked(ipc, msg_data, msg_bytes, reply_data, reply_bytes);
+
+	mutex_unlock(&ipc->tx_mutex);
+
+	return ret;
+}
 
 static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
@@ -42,4 +348,6 @@ const struct sof_ipc_ops ipc3_ops = {
 	.tplg = &ipc3_tplg_ops,
 	.pm = &ipc3_pm_ops,
 	.pcm = &ipc3_pcm_ops,
+
+	.tx_msg = sof_ipc3_tx_msg,
 };
-- 
2.25.1

