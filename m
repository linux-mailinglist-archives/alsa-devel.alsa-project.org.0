Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D904F3CD5
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 367731888;
	Tue,  5 Apr 2022 19:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 367731888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179846;
	bh=sQ9TybXRKhpdRKOeKQGgfCEDqYR376p1MAcp92+CNAg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SZQw3/5Durjd7JYIVda+22PIm00xRIrkac30FDY2ylCtP4iKi85t8CtIWJwpcWK5h
	 Btsgm736D0Jra8gBXq6y4pOvuhK+vtk9cOO3C+WRv6tUNScg9nS/FXLaNz3/P9+B6N
	 464Vpdu5hsLItsngnusMocaNVySlJh2bEy/udBbg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 428F0F80542;
	Tue,  5 Apr 2022 19:27:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B42F6F80533; Tue,  5 Apr 2022 19:27:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B20F80518
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B20F80518
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WT7kcMt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179658; x=1680715658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sQ9TybXRKhpdRKOeKQGgfCEDqYR376p1MAcp92+CNAg=;
 b=WT7kcMt04hP7imCXviOttv+zRkliKI0C09eAnRBwfwluFih1BOK93nx0
 +C66WNVBeSgZzS4YmmQK7vMp+3Ctm9JtiXy87uMXBBsa4cWOX+DZRDrld
 A6w6x1PVrN5oFR9sHTqcUndZC4Mm6HKniIICTR0ZaiD+Y9yeLOr8t2Ukr
 LFNrhog7gngN5QzsUUJ3jVPXu2yoGABOTbz2q8hKGyFf4klnSdrSwE9rr
 Q36K1ooTHyRcC/dxdg3SYJWlUrNFh6c5koQDPTw0v0umOFN2kVgk5Hi+X
 HMvuI2nQPS1tK2J1wpf2cXkfXpk2nAZVoRkQLsSkg4bFcIdy2FYuhitC1 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986743"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986743"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140977"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:24 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 07/15] ASoC: SOF: ipc3: Implement rx_msg IPC ops
Date: Tue,  5 Apr 2022 10:27:00 -0700
Message-Id: <20220405172708.122168-8-ranjani.sridharan@linux.intel.com>
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

Add the implementation for the rx_msg callback to handle message reception
for IPC3.

The implementation is equivalent to the currently used code in ipc.c

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 212 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 2ecd3bb061f3..8480a1b5733a 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -10,9 +10,12 @@
 #include <sound/sof/stream.h>
 #include <sound/sof/control.h>
 #include "sof-priv.h"
+#include "sof-audio.h"
 #include "ipc3-ops.h"
 #include "ops.h"
 
+typedef void (*ipc3_rx_callback)(struct snd_sof_dev *sdev, void *msg_buf);
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC)
 static void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 {
@@ -472,6 +475,214 @@ static int sof_ipc3_set_get_data(struct snd_sof_dev *sdev, void *data, size_t da
 	return ret;
 }
 
+/* IPC stream position. */
+static void ipc3_period_elapsed(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct snd_soc_component *scomp = sdev->component;
+	struct snd_sof_pcm_stream *stream;
+	struct sof_ipc_stream_posn posn;
+	struct snd_sof_pcm *spcm;
+	int direction, ret;
+
+	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
+	if (!spcm) {
+		dev_err(sdev->dev, "period elapsed for unknown stream, msg_id %d\n",
+			msg_id);
+		return;
+	}
+
+	stream = &spcm->stream[direction];
+	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	if (ret < 0) {
+		dev_warn(sdev->dev, "failed to read stream position: %d\n", ret);
+		return;
+	}
+
+	dev_vdbg(sdev->dev, "posn : host 0x%llx dai 0x%llx wall 0x%llx\n",
+		 posn.host_posn, posn.dai_posn, posn.wallclock);
+
+	memcpy(&stream->posn, &posn, sizeof(posn));
+
+	if (spcm->pcm.compress)
+		snd_sof_compr_fragment_elapsed(stream->cstream);
+	else if (stream->substream->runtime &&
+		 !stream->substream->runtime->no_period_wakeup)
+		/* only inform ALSA for period_wakeup mode */
+		snd_sof_pcm_period_elapsed(stream->substream);
+}
+
+/* DSP notifies host of an XRUN within FW */
+static void ipc3_xrun(struct snd_sof_dev *sdev, u32 msg_id)
+{
+	struct snd_soc_component *scomp = sdev->component;
+	struct snd_sof_pcm_stream *stream;
+	struct sof_ipc_stream_posn posn;
+	struct snd_sof_pcm *spcm;
+	int direction, ret;
+
+	spcm = snd_sof_find_spcm_comp(scomp, msg_id, &direction);
+	if (!spcm) {
+		dev_err(sdev->dev, "XRUN for unknown stream, msg_id %d\n",
+			msg_id);
+		return;
+	}
+
+	stream = &spcm->stream[direction];
+	ret = snd_sof_ipc_msg_data(sdev, stream->substream, &posn, sizeof(posn));
+	if (ret < 0) {
+		dev_warn(sdev->dev, "failed to read overrun position: %d\n", ret);
+		return;
+	}
+
+	dev_dbg(sdev->dev,  "posn XRUN: host %llx comp %d size %d\n",
+		posn.host_posn, posn.xrun_comp_id, posn.xrun_size);
+
+#if defined(CONFIG_SND_SOC_SOF_DEBUG_XRUN_STOP)
+	/* stop PCM on XRUN - used for pipeline debug */
+	memcpy(&stream->posn, &posn, sizeof(posn));
+	snd_pcm_stop_xrun(stream->substream);
+#endif
+}
+
+/* stream notifications from firmware */
+static void ipc3_stream_message(struct snd_sof_dev *sdev, void *msg_buf)
+{
+	struct sof_ipc_cmd_hdr *hdr = msg_buf;
+	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
+	u32 msg_id = SOF_IPC_MESSAGE_ID(hdr->cmd);
+
+	switch (msg_type) {
+	case SOF_IPC_STREAM_POSITION:
+		ipc3_period_elapsed(sdev, msg_id);
+		break;
+	case SOF_IPC_STREAM_TRIG_XRUN:
+		ipc3_xrun(sdev, msg_id);
+		break;
+	default:
+		dev_err(sdev->dev, "unhandled stream message %#x\n",
+			msg_id);
+		break;
+	}
+}
+
+/* component notifications from firmware */
+static void ipc3_comp_notification(struct snd_sof_dev *sdev, void *msg_buf)
+{
+	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
+	struct sof_ipc_cmd_hdr *hdr = msg_buf;
+	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
+
+	switch (msg_type) {
+	case SOF_IPC_COMP_GET_VALUE:
+	case SOF_IPC_COMP_GET_DATA:
+		break;
+	default:
+		dev_err(sdev->dev, "unhandled component message %#x\n", msg_type);
+		return;
+	}
+
+	if (tplg_ops->control->update)
+		tplg_ops->control->update(sdev, msg_buf);
+}
+
+static void ipc3_trace_message(struct snd_sof_dev *sdev, void *msg_buf)
+{
+	struct sof_ipc_cmd_hdr *hdr = msg_buf;
+	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
+
+	switch (msg_type) {
+	case SOF_IPC_TRACE_DMA_POSITION:
+		snd_sof_trace_update_pos(sdev, msg_buf);
+		break;
+	default:
+		dev_err(sdev->dev, "unhandled trace message %#x\n", msg_type);
+		break;
+	}
+}
+
+/* DSP firmware has sent host a message  */
+static void sof_ipc3_rx_msg(struct snd_sof_dev *sdev)
+{
+	ipc3_rx_callback rx_callback = NULL;
+	struct sof_ipc_cmd_hdr hdr;
+	void *msg_buf;
+	u32 cmd;
+	int err;
+
+	/* read back header */
+	err = snd_sof_ipc_msg_data(sdev, NULL, &hdr, sizeof(hdr));
+	if (err < 0) {
+		dev_warn(sdev->dev, "failed to read IPC header: %d\n", err);
+		return;
+	}
+
+	if (hdr.size < sizeof(hdr)) {
+		dev_err(sdev->dev, "The received message size is invalid\n");
+		return;
+	}
+
+	ipc3_log_header(sdev->dev, "ipc rx", hdr.cmd);
+
+	cmd = hdr.cmd & SOF_GLB_TYPE_MASK;
+
+	/* check message type */
+	switch (cmd) {
+	case SOF_IPC_GLB_REPLY:
+		dev_err(sdev->dev, "ipc reply unknown\n");
+		break;
+	case SOF_IPC_FW_READY:
+		/* check for FW boot completion */
+		if (sdev->fw_state == SOF_FW_BOOT_IN_PROGRESS) {
+			err = sof_ops(sdev)->fw_ready(sdev, cmd);
+			if (err < 0)
+				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_FAILED);
+			else
+				sof_set_fw_state(sdev, SOF_FW_BOOT_READY_OK);
+
+			/* wake up firmware loader */
+			wake_up(&sdev->boot_wait);
+		}
+		break;
+	case SOF_IPC_GLB_COMPOUND:
+	case SOF_IPC_GLB_TPLG_MSG:
+	case SOF_IPC_GLB_PM_MSG:
+		break;
+	case SOF_IPC_GLB_COMP_MSG:
+		rx_callback = ipc3_comp_notification;
+		break;
+	case SOF_IPC_GLB_STREAM_MSG:
+		rx_callback = ipc3_stream_message;
+		break;
+	case SOF_IPC_GLB_TRACE_MSG:
+		rx_callback = ipc3_trace_message;
+		break;
+	default:
+		dev_err(sdev->dev, "%s: Unknown DSP message: 0x%x\n", __func__, cmd);
+		break;
+	}
+
+	/* read the full message */
+	msg_buf = kmalloc(hdr.size, GFP_KERNEL);
+	if (!msg_buf)
+		return;
+
+	err = snd_sof_ipc_msg_data(sdev, NULL, msg_buf, hdr.size);
+	if (err < 0) {
+		dev_err(sdev->dev, "%s: Failed to read message: %d\n", __func__, err);
+	} else {
+		/* Call local handler for the message */
+		if (rx_callback)
+			rx_callback(sdev, msg_buf);
+
+		/* Notify registered clients */
+		sof_client_ipc_rx_dispatcher(sdev, msg_buf);
+	}
+
+	kfree(msg_buf);
+
+	ipc3_log_header(sdev->dev, "ipc rx done", hdr.cmd);
+}
+
 static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 {
 	struct sof_ipc_pm_ctx pm_ctx = {
@@ -506,6 +717,7 @@ const struct sof_ipc_ops ipc3_ops = {
 	.pcm = &ipc3_pcm_ops,
 
 	.tx_msg = sof_ipc3_tx_msg,
+	.rx_msg = sof_ipc3_rx_msg,
 	.set_get_data = sof_ipc3_set_get_data,
 	.get_reply = sof_ipc3_get_reply,
 };
-- 
2.25.1

