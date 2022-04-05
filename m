Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36FB14F3CD8
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:31:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC8C184D;
	Tue,  5 Apr 2022 19:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC8C184D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179891;
	bh=Kczb2+zFzjatMwXa7HQ/sgcJFB1Z4tGHhLvlZ5TbtY4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t+2oXlrE/nMO1LlVuL5ahFy8+KIDOwiUNk93m3O/kMqQs3HagVH48ezBbB1MCoA1k
	 joiLmyIM4kbQuLWv2KELM0a6/UpWsbOKzNq+TWB92HwfMEGRF/ODeHjkq4bGVpCnPn
	 KWVtV/YCJSwUnH0nt2QlQQmxhGtJcpnlsvEnL2h4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91D86F80558;
	Tue,  5 Apr 2022 19:27:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D75C0F8014B; Tue,  5 Apr 2022 19:27:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC23CF8051E
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC23CF8051E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="GR2MiolQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179660; x=1680715660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kczb2+zFzjatMwXa7HQ/sgcJFB1Z4tGHhLvlZ5TbtY4=;
 b=GR2MiolQ6W3C1KdynmerkYrCgD009zdq0QXqdZiQbCaD29ioTWWKW2g2
 AhAmCky6qaRZjjHl8/gtCB81YVqmfTbQQdiR4CbM1ALlqo/Ptzs1cgm7e
 bTVKYG5VTXVSl0YCQ3J+i1CZvmg9nVmZZpJS4RuvUWGaca4jsIqWbS7iS
 E9KWekpNsGezoVfUx2bvOVvHPRLinsLIb5ryzsd4Gk3D5vLUeZTh/bAnc
 PmdRwsF41AmwegutbTCxvey3jWLWa5cAXlJWRumGUBYA7cqsY5Ft7GvfD
 V+V3ONL1MNz4aaABfjxBGklN8Q02X+pBfs19YMfgydxbSJskUDKhAJmOt w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986769"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986769"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:25 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140993"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:25 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 11/15] ASoC: SOF: ipc: Switch over to use the tx_msg and
 set_get_data ops
Date: Tue,  5 Apr 2022 10:27:04 -0700
Message-Id: <20220405172708.122168-12-ranjani.sridharan@linux.intel.com>
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

Use the new ops for sending messages and to handle large component data
set get operation.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c | 301 ++++----------------------------------------
 1 file changed, 23 insertions(+), 278 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 39ec4361048a..05c1ba0c2206 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -24,20 +24,6 @@ typedef void (*ipc_rx_callback)(struct snd_sof_dev *sdev, void *msg_buf);
 static void ipc_trace_message(struct snd_sof_dev *sdev, void *msg_buf);
 static void ipc_stream_message(struct snd_sof_dev *sdev, void *msg_buf);
 
-/*
- * IPC message Tx/Rx message handling.
- */
-
-struct sof_ipc_ctrl_data_params {
-	size_t msg_bytes;
-	size_t hdr_bytes;
-	size_t pl_size;
-	size_t elems;
-	u32 num_msg;
-	u8 *src;
-	u8 *dst;
-};
-
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC)
 static void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 {
@@ -242,104 +228,6 @@ static inline void ipc_log_header(struct device *dev, u8 *text, u32 cmd)
 }
 #endif
 
-/* wait for IPC message reply */
-static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
-			void *reply_data)
-{
-	struct snd_sof_dev *sdev = ipc->sdev;
-	struct sof_ipc_cmd_hdr *hdr = msg->msg_data;
-	int ret;
-
-	/* wait for DSP IPC completion */
-	ret = wait_event_timeout(msg->waitq, msg->ipc_complete,
-				 msecs_to_jiffies(sdev->ipc_timeout));
-
-	if (ret == 0) {
-		dev_err(sdev->dev,
-			"ipc tx timed out for %#x (msg/reply size: %d/%zu)\n",
-			hdr->cmd, hdr->size, msg->reply_size);
-		snd_sof_handle_fw_exception(ipc->sdev);
-		ret = -ETIMEDOUT;
-	} else {
-		ret = msg->reply_error;
-		if (ret < 0) {
-			dev_err(sdev->dev,
-				"ipc tx error for %#x (msg/reply size: %d/%zu): %d\n",
-				hdr->cmd, hdr->size, msg->reply_size, ret);
-		} else {
-			ipc_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
-			if (msg->reply_size)
-				/* copy the data returned from DSP */
-				memcpy(reply_data, msg->reply_data,
-				       msg->reply_size);
-		}
-
-		/* re-enable dumps after successful IPC tx */
-		if (sdev->ipc_dump_printed) {
-			sdev->dbg_dump_printed = false;
-			sdev->ipc_dump_printed = false;
-		}
-	}
-
-	return ret;
-}
-
-/* send IPC message from host to DSP */
-static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc,
-				       void *msg_data, size_t msg_bytes,
-				       void *reply_data, size_t reply_bytes)
-{
-	struct sof_ipc_cmd_hdr *hdr = msg_data;
-	struct snd_sof_dev *sdev = ipc->sdev;
-	struct snd_sof_ipc_msg *msg;
-	int ret;
-
-	if (!msg_data || msg_bytes < sizeof(*hdr)) {
-		dev_err_ratelimited(sdev->dev, "No IPC message to send\n");
-		return -EINVAL;
-	}
-
-	if (ipc->disable_ipc_tx || sdev->fw_state != SOF_FW_BOOT_COMPLETE)
-		return -ENODEV;
-
-	/*
-	 * The spin-lock is also still needed to protect message objects against
-	 * other atomic contexts.
-	 */
-	spin_lock_irq(&sdev->ipc_lock);
-
-	/* initialise the message */
-	msg = &ipc->msg;
-
-	/* attach message data */
-	msg->msg_data = msg_data;
-	msg->msg_size = msg_bytes;
-
-	msg->reply_size = reply_bytes;
-	msg->reply_error = 0;
-
-	sdev->msg = msg;
-
-	ret = snd_sof_dsp_send_msg(sdev, msg);
-	/* Next reply that we receive will be related to this message */
-	if (!ret)
-		msg->ipc_complete = false;
-
-	spin_unlock_irq(&sdev->ipc_lock);
-
-	if (ret) {
-		dev_err_ratelimited(sdev->dev,
-				    "error: ipc tx failed with error %d\n",
-				    ret);
-		return ret;
-	}
-
-	ipc_log_header(sdev->dev, "ipc tx", hdr->cmd);
-
-	/* now wait for completion */
-	return tx_wait_done(ipc, msg, reply_data);
-}
-
 /**
  * sof_ipc_send_msg - generic function to prepare and send one IPC message
  * @sdev:		pointer to SOF core device struct
@@ -397,20 +285,12 @@ int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 		       void *reply_data, size_t reply_bytes)
 {
-	const struct sof_dsp_power_state target_state = {
-		.state = SOF_DSP_PM_D0,
-	};
-	int ret;
-
-	/* ensure the DSP is in D0 before sending a new IPC */
-	ret = snd_sof_dsp_set_power_state(ipc->sdev, &target_state);
-	if (ret < 0) {
-		dev_err(ipc->sdev->dev, "error: resuming DSP %d\n", ret);
-		return ret;
-	}
+	if (msg_bytes > ipc->max_payload_size ||
+	    reply_bytes > ipc->max_payload_size)
+		return -ENOBUFS;
 
-	return sof_ipc_tx_message_no_pm(ipc, msg_data, msg_bytes,
-					reply_data, reply_bytes);
+	return ipc->ops->tx_msg(ipc->sdev, msg_data, msg_bytes, reply_data,
+				reply_bytes, false);
 }
 EXPORT_SYMBOL(sof_ipc_tx_message);
 
@@ -422,21 +302,12 @@ EXPORT_SYMBOL(sof_ipc_tx_message);
 int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes)
 {
-	int ret;
-
 	if (msg_bytes > ipc->max_payload_size ||
 	    reply_bytes > ipc->max_payload_size)
 		return -ENOBUFS;
 
-	/* Serialise IPC TX */
-	mutex_lock(&ipc->tx_mutex);
-
-	ret = sof_ipc_tx_message_unlocked(ipc, msg_data, msg_bytes,
-					  reply_data, reply_bytes);
-
-	mutex_unlock(&ipc->tx_mutex);
-
-	return ret;
+	return ipc->ops->tx_msg(ipc->sdev, msg_data, msg_bytes, reply_data,
+				reply_bytes, true);
 }
 EXPORT_SYMBOL(sof_ipc_tx_message_no_pm);
 
@@ -718,103 +589,6 @@ int snd_sof_ipc_stream_posn(struct snd_soc_component *scomp,
 }
 EXPORT_SYMBOL(snd_sof_ipc_stream_posn);
 
-static int sof_get_ctrl_copy_params(enum sof_ipc_ctrl_type ctrl_type,
-				    struct sof_ipc_ctrl_data *src,
-				    struct sof_ipc_ctrl_data *dst,
-				    struct sof_ipc_ctrl_data_params *sparams)
-{
-	switch (ctrl_type) {
-	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
-	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
-		sparams->src = (u8 *)src->chanv;
-		sparams->dst = (u8 *)dst->chanv;
-		break;
-	case SOF_CTRL_TYPE_DATA_GET:
-	case SOF_CTRL_TYPE_DATA_SET:
-		sparams->src = (u8 *)src->data->data;
-		sparams->dst = (u8 *)dst->data->data;
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* calculate payload size and number of messages */
-	sparams->pl_size = SOF_IPC_MSG_MAX_SIZE - sparams->hdr_bytes;
-	sparams->num_msg = DIV_ROUND_UP(sparams->msg_bytes, sparams->pl_size);
-
-	return 0;
-}
-
-static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
-				       struct sof_ipc_ctrl_data *cdata,
-				       struct sof_ipc_ctrl_data_params *sparams,
-				       bool set)
-{
-	struct sof_ipc_ctrl_data *partdata;
-	size_t send_bytes;
-	size_t offset = 0;
-	size_t msg_bytes;
-	size_t pl_size;
-	int err;
-	int i;
-
-	/* allocate max ipc size because we have at least one */
-	partdata = kzalloc(SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
-	if (!partdata)
-		return -ENOMEM;
-
-	if (set)
-		err = sof_get_ctrl_copy_params(cdata->type, cdata, partdata,
-					       sparams);
-	else
-		err = sof_get_ctrl_copy_params(cdata->type, partdata, cdata,
-					       sparams);
-	if (err < 0) {
-		kfree(partdata);
-		return err;
-	}
-
-	msg_bytes = sparams->msg_bytes;
-	pl_size = sparams->pl_size;
-
-	/* copy the header data */
-	memcpy(partdata, cdata, sparams->hdr_bytes);
-
-	/* Serialise IPC TX */
-	mutex_lock(&sdev->ipc->tx_mutex);
-
-	/* copy the payload data in a loop */
-	for (i = 0; i < sparams->num_msg; i++) {
-		send_bytes = min(msg_bytes, pl_size);
-		partdata->num_elems = send_bytes;
-		partdata->rhdr.hdr.size = sparams->hdr_bytes + send_bytes;
-		partdata->msg_index = i;
-		msg_bytes -= send_bytes;
-		partdata->elems_remaining = msg_bytes;
-
-		if (set)
-			memcpy(sparams->dst, sparams->src + offset, send_bytes);
-
-		err = sof_ipc_tx_message_unlocked(sdev->ipc,
-						  partdata,
-						  partdata->rhdr.hdr.size,
-						  partdata,
-						  partdata->rhdr.hdr.size);
-		if (err < 0)
-			break;
-
-		if (!set)
-			memcpy(sparams->dst + offset, sparams->src, send_bytes);
-
-		offset += pl_size;
-	}
-
-	mutex_unlock(&sdev->ipc->tx_mutex);
-
-	kfree(partdata);
-	return err;
-}
-
 /*
  * IPC get()/set() for kcontrols.
  */
@@ -823,14 +597,11 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct sof_ipc_ctrl_data *cdata = scontrol->ipc_control_data;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
-	struct sof_ipc_fw_ready *ready = &sdev->fw_ready;
-	struct sof_ipc_fw_version *v = &ready->version;
-	struct sof_ipc_ctrl_data_params sparams;
+	const struct sof_ipc_ops *iops = sdev->ipc->ops;
 	enum sof_ipc_ctrl_type ctrl_type;
 	struct snd_sof_widget *swidget;
 	bool widget_found = false;
-	u32 ipc_cmd;
-	int err;
+	u32 ipc_cmd, msg_bytes;
 
 	list_for_each_entry(swidget, &sdev->widget_list, list) {
 		if (swidget->comp_id == scontrol->comp_id) {
@@ -840,7 +611,8 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
 	}
 
 	if (!widget_found) {
-		dev_err(sdev->dev, "error: can't find widget with id %d\n", scontrol->comp_id);
+		dev_err(sdev->dev, "%s: can't find widget with id %d\n", __func__,
+			scontrol->comp_id);
 		return -EINVAL;
 	}
 
@@ -875,55 +647,28 @@ int snd_sof_ipc_set_get_comp_data(struct snd_sof_control *scontrol, bool set)
 	switch (cdata->type) {
 	case SOF_CTRL_TYPE_VALUE_CHAN_GET:
 	case SOF_CTRL_TYPE_VALUE_CHAN_SET:
-		sparams.msg_bytes = scontrol->num_channels *
-			sizeof(struct sof_ipc_ctrl_value_chan);
-		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data);
-		sparams.elems = scontrol->num_channels;
+		cdata->num_elems = scontrol->num_channels;
+
+		msg_bytes = scontrol->num_channels *
+			    sizeof(struct sof_ipc_ctrl_value_chan);
+		msg_bytes += sizeof(struct sof_ipc_ctrl_data);
 		break;
 	case SOF_CTRL_TYPE_DATA_GET:
 	case SOF_CTRL_TYPE_DATA_SET:
-		sparams.msg_bytes = cdata->data->size;
-		sparams.hdr_bytes = sizeof(struct sof_ipc_ctrl_data) +
-			sizeof(struct sof_abi_hdr);
-		sparams.elems = cdata->data->size;
+		cdata->num_elems = cdata->data->size;
+
+		msg_bytes = cdata->data->size;
+		msg_bytes += sizeof(struct sof_ipc_ctrl_data) +
+			     sizeof(struct sof_abi_hdr);
 		break;
 	default:
 		return -EINVAL;
 	}
 
-	cdata->rhdr.hdr.size = sparams.msg_bytes + sparams.hdr_bytes;
-	cdata->num_elems = sparams.elems;
+	cdata->rhdr.hdr.size = msg_bytes;
 	cdata->elems_remaining = 0;
 
-	/* send normal size ipc in one part */
-	if (cdata->rhdr.hdr.size <= SOF_IPC_MSG_MAX_SIZE) {
-		err = sof_ipc_tx_message(sdev->ipc, cdata, cdata->rhdr.hdr.size,
-					 cdata, cdata->rhdr.hdr.size);
-
-		if (err < 0)
-			dev_err(sdev->dev, "error: set/get ctrl ipc comp %d\n",
-				cdata->comp_id);
-
-		return err;
-	}
-
-	/* data is bigger than max ipc size, chop into smaller pieces */
-	dev_dbg(sdev->dev, "large ipc size %u, control size %u\n",
-		cdata->rhdr.hdr.size, scontrol->size);
-
-	/* large messages is only supported from ABI 3.3.0 onwards */
-	if (v->abi_version < SOF_ABI_VER(3, 3, 0)) {
-		dev_err(sdev->dev, "error: incompatible FW ABI version\n");
-		return -EINVAL;
-	}
-
-	err = sof_set_get_large_ctrl_data(sdev, cdata, &sparams, set);
-
-	if (err < 0)
-		dev_err(sdev->dev, "error: set/get large ctrl ipc comp %d\n",
-			cdata->comp_id);
-
-	return err;
+	return iops->set_get_data(sdev, cdata, cdata->rhdr.hdr.size, set);
 }
 EXPORT_SYMBOL(snd_sof_ipc_set_get_comp_data);
 
-- 
2.25.1

