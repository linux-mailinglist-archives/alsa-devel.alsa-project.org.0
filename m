Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2484B0B92
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Feb 2022 11:57:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34E821833;
	Thu, 10 Feb 2022 11:56:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34E821833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1644490649;
	bh=kNx55RY7X0IIBJcH0/hbI5dhEt5+Ybz6eMFNnHsll1c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OCCorq04ft49/Yp3rUqzwVNtNEw6VynQIPVIzxSMs6yOlUlwqMUpJKH7YlJvoq356
	 5RpqwhBWb2BZgZQcw03Uf4efaUjQG9pPPIQX5pvubcxoxnd1PA/M8uOc/m4RTp7C7B
	 y1kQ/RUj8PydbDXDhzKrLdj7aKdxVZgGTiOBUkDo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8C1B6F80515;
	Thu, 10 Feb 2022 11:55:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EED88F80517; Thu, 10 Feb 2022 11:55:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0CB2F800A7
 for <alsa-devel@alsa-project.org>; Thu, 10 Feb 2022 11:55:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0CB2F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="nVI85FvS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644490534; x=1676026534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kNx55RY7X0IIBJcH0/hbI5dhEt5+Ybz6eMFNnHsll1c=;
 b=nVI85FvSTkUFT27zNKnVqtsYlbmdiC308wnBCkOC4sBxAEyOrcRwo+d9
 1c6ZtzQkudK1ty82U/Si3qCaI7jJmfpjZxcYPF6zOZNIhQbLyjlTq5d+e
 u5Sjy3LyNyq8Sf24QBh4/NQfG9+MDMjYMc7iUAwdiIfrwdAxBY5stCU1F
 kwbSrs84NjwJwo5pKlCn40dmZQkn3Zvtbfraod8K3z/uRWh9Pz7VFLuTL
 fGEHqwraI2ux1StUNs6ORxr58ZcqXnZroKwMES4sFFN0M7FZDZENB0gR7
 CWltYkwtLyWEeTzAEhxNtwg4GiL6WrTiNNFcj+f3LD6+kHYF+kkxFUxSA A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10253"; a="310202849"
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="310202849"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,358,1635231600"; d="scan'208";a="679106849"
Received: from barabano-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.41.18])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 02:55:29 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [PATCH 3/9] ASoC: SOF: ipc: Read and pass the whole message to
 handlers for IPC events
Date: Thu, 10 Feb 2022 12:55:13 +0200
Message-Id: <20220210105519.19795-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
References: <20220210105519.19795-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, fred.oh@linux.intel.com, daniel.baluta@nxp.com
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

Change the parameter list for the firmware initiated message (IPC event)
handler functions to:
handler(struct snd_sof_dev *sdev, void *full_msg);

Allocate memory and read the whole message in snd_sof_ipc_msgs_rx() then
pass the pointer to the function handling the message.
Do this only if we actually have a function which is tasked to process the
given type.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 85 +++++++++++++++++++++++----------------------
 1 file changed, 44 insertions(+), 41 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 16a0d7a059f3..ee56d4fa4053 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -18,8 +18,10 @@
 #include "sof-audio.h"
 #include "ops.h"
 
-static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_type);
-static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd);
+typedef void (*ipc_rx_callback)(struct snd_sof_dev *sdev, void *msg_buf);
+
+static void ipc_trace_message(struct snd_sof_dev *sdev, void *msg_buf);
+static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf);
 
 /*
  * IPC message Tx/Rx message handling.
@@ -477,44 +479,30 @@ void snd_sof_ipc_reply(struct snd_sof_dev *sdev, u32 msg_id)
 }
 EXPORT_SYMBOL(snd_sof_ipc_reply);
 
-static void ipc_comp_notification(struct snd_sof_dev *sdev,
-				  struct sof_ipc_cmd_hdr *hdr)
+static void ipc_comp_notification(struct snd_sof_dev *sdev, void *msg_buf)
 {
+	struct sof_ipc_cmd_hdr *hdr = msg_buf;
 	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
-	struct sof_ipc_ctrl_data *cdata;
-	int ret;
 
 	switch (msg_type) {
 	case SOF_IPC_COMP_GET_VALUE:
 	case SOF_IPC_COMP_GET_DATA:
-		cdata = kmalloc(hdr->size, GFP_KERNEL);
-		if (!cdata)
-			return;
-
-		/* read back full message */
-		ret = snd_sof_ipc_msg_data(sdev, NULL, cdata, hdr->size);
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"error: failed to read component event: %d\n", ret);
-			goto err;
-		}
 		break;
 	default:
 		dev_err(sdev->dev, "error: unhandled component message %#x\n", msg_type);
 		return;
 	}
 
-	snd_sof_control_notify(sdev, cdata);
-
-err:
-	kfree(cdata);
+	snd_sof_control_notify(sdev, msg_buf);
 }
 
 /* DSP firmware has sent host a message  */
 void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 {
+	ipc_rx_callback rx_callback = NULL;
 	struct sof_ipc_cmd_hdr hdr;
-	u32 cmd, type;
+	void *msg_buf;
+	u32 cmd;
 	int err;
 
 	/* read back header */
@@ -523,10 +511,15 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 		dev_warn(sdev->dev, "failed to read IPC header: %d\n", err);
 		return;
 	}
+
+	if (hdr.size < sizeof(hdr)) {
+		dev_err(sdev->dev, "The received message size is invalid\n");
+		return;
+	}
+
 	ipc_log_header(sdev->dev, "ipc rx", hdr.cmd);
 
 	cmd = hdr.cmd & SOF_GLB_TYPE_MASK;
-	type = hdr.cmd & SOF_CMD_TYPE_MASK;
 
 	/* check message type */
 	switch (cmd) {
@@ -551,20 +544,35 @@ void snd_sof_ipc_msgs_rx(struct snd_sof_dev *sdev)
 	case SOF_IPC_GLB_PM_MSG:
 		break;
 	case SOF_IPC_GLB_COMP_MSG:
-		ipc_comp_notification(sdev, &hdr);
+		rx_callback = ipc_comp_notification;
 		break;
 	case SOF_IPC_GLB_STREAM_MSG:
-		/* need to pass msg id into the function */
-		ipc_stream_message(sdev, hdr.cmd);
+		rx_callback = ipc_stream_message;
 		break;
 	case SOF_IPC_GLB_TRACE_MSG:
-		ipc_trace_message(sdev, type);
+		rx_callback = ipc_trace_message;
 		break;
 	default:
-		dev_err(sdev->dev, "error: unknown DSP message 0x%x\n", cmd);
+		dev_err(sdev->dev, "%s: Unknown DSP message: 0x%x\n", __func__, cmd);
 		break;
 	}
 
+	if (rx_callback) {
+		/* read the full message as we have rx handler for it */
+		msg_buf = kmalloc(hdr.size, GFP_KERNEL);
+		if (!msg_buf)
+			return;
+
+		err = snd_sof_ipc_msg_data(sdev, NULL, msg_buf, hdr.size);
+		if (err < 0)
+			dev_err(sdev->dev, "%s: Failed to read message: %d\n",
+				__func__, err);
+		else
+			rx_callback(sdev, msg_buf);
+
+		kfree(msg_buf);
+	}
+
 	ipc_log_header(sdev->dev, "ipc rx done", hdr.cmd);
 }
 EXPORT_SYMBOL(snd_sof_ipc_msgs_rx);
@@ -573,19 +581,14 @@ EXPORT_SYMBOL(snd_sof_ipc_msgs_rx);
  * IPC trace mechanism.
  */
 
-static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_type)
+static void ipc_trace_message(struct snd_sof_dev *sdev, void *msg_buf)
 {
-	struct sof_ipc_dma_trace_posn posn;
-	int ret;
+	struct sof_ipc_cmd_hdr *hdr = msg_buf;
+	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
 
 	switch (msg_type) {
 	case SOF_IPC_TRACE_DMA_POSITION:
-		/* read back full message */
-		ret = snd_sof_ipc_msg_data(sdev, NULL, &posn, sizeof(posn));
-		if (ret < 0)
-			dev_warn(sdev->dev, "failed to read trace position: %d\n", ret);
-		else
-			snd_sof_trace_update_pos(sdev, &posn);
+		snd_sof_trace_update_pos(sdev, msg_buf);
 		break;
 	default:
 		dev_err(sdev->dev, "error: unhandled trace message %#x\n", msg_type);
@@ -667,11 +670,11 @@ static void ipc_xrun(struct snd_sof_dev *sdev, u32 msg_id)
 }
 
 /* stream notifications from DSP FW */
-static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd)
+static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf)
 {
-	/* get msg cmd type and msd id */
-	u32 msg_type = msg_cmd & SOF_CMD_TYPE_MASK;
-	u32 msg_id = SOF_IPC_MESSAGE_ID(msg_cmd);
+	struct sof_ipc_cmd_hdr *hdr = msg_buf;
+	u32 msg_type = hdr->cmd & SOF_CMD_TYPE_MASK;
+	u32 msg_id = SOF_IPC_MESSAGE_ID(hdr->cmd);
 
 	switch (msg_type) {
 	case SOF_IPC_STREAM_POSITION:
-- 
2.35.1

