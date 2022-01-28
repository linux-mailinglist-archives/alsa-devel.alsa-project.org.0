Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B5F49FAE4
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Jan 2022 14:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2143E179B;
	Fri, 28 Jan 2022 14:36:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2143E179B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643377058;
	bh=eyx6H1VvatgSmNQzlVZl1UaQ4gXSBeyarXx3ZnDNeu0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ANUvksxtxOWNrF0tUbK01Znv9mSoqydJv1BLTmLSquj/R6h0VXuga0x7Q9HzKcKBk
	 wSbcjnRUTd+596J6r381tPsFplxBZ3tWSkkVH/ANizROpCmCzL9UYjRtefvBXykALw
	 pEMZ7CA07Wvpm9x0q61ZbL5QMKzpnlT5nTBWKjTo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 615D7F80515;
	Fri, 28 Jan 2022 14:36:07 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF331F80516; Fri, 28 Jan 2022 14:36:05 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3CFFEF8023B
 for <alsa-devel@alsa-project.org>; Fri, 28 Jan 2022 14:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3CFFEF8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Js/FU7aA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643376958; x=1674912958;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eyx6H1VvatgSmNQzlVZl1UaQ4gXSBeyarXx3ZnDNeu0=;
 b=Js/FU7aAGY8f460ep3/qD9KbxvQMLsJQ6iSIuqDGFgOZeJNeGGx47hZv
 +sEq91O0x8P6JilpydxPErWpQ3YVAUMPqyfIKpy60/MFDarsDHNmrgPHH
 W0oKvuYu6U/fOoDK0fjFSnxvuAqzrM9/eOQ91CBrYlrKXN7WpRtz/0Ayv
 U00OmXS6mdm3yQtxTEGi2y5Z5aPzi6QsRL3G5ImI/WpHVuHa5u14fc/jx
 GXrNNdzVYRte/5cF8JLlBn8L++0JBAE0ExtG++9W9iWxzEktZvjMPBSmV
 q1EecvW2MALZkmBZ939vnBzfsB53cAxmGP7fVfUixPzfVOEFTlW5M/wff g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10240"; a="227790500"
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="227790500"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:35:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,324,1635231600"; d="scan'208";a="536132833"
Received: from dlita-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.43.152])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2022 05:35:51 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 2/3] ASoC: SOF: ipc: Drop header parameter from
 sof_ipc_tx_message_unlocked()
Date: Fri, 28 Jan 2022 15:36:19 +0200
Message-Id: <20220128133620.9411-3-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128133620.9411-1-peter.ujfalusi@linux.intel.com>
References: <20220128133620.9411-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, rander.wang@intel.com,
 daniel.baluta@nxp.com
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

The snd_sof_ipc_msg.header is not used by platform code, there is no need
to update it and the 'header' parameter for sof_ipc_tx_message_unlocked()
can be dropped at the same time.

Instead of using the header parameter passed by the caller (which does by
setting it to the hdr->cmd) use the hdr->cmd directly when logging.

At the same time make sure that there is a message passed to the tx_message
function.
All instances of the tx_message passes an IPC message, this check is placed
to make sure the future users can not introduce bugs.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5bcf906d90af..ec51daed8b31 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -294,14 +294,20 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 }
 
 /* send IPC message from host to DSP */
-static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
+static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc,
 				       void *msg_data, size_t msg_bytes,
 				       void *reply_data, size_t reply_bytes)
 {
+	struct sof_ipc_cmd_hdr *hdr = msg_data;
 	struct snd_sof_dev *sdev = ipc->sdev;
 	struct snd_sof_ipc_msg *msg;
 	int ret;
 
+	if (!msg_data || msg_bytes < sizeof(*hdr)) {
+		dev_err_ratelimited(sdev->dev, "No IPC message to send\n");
+		return -EINVAL;
+	}
+
 	if (ipc->disable_ipc_tx || sdev->fw_state != SOF_FW_BOOT_COMPLETE)
 		return -ENODEV;
 
@@ -314,15 +320,13 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	/* initialise the message */
 	msg = &ipc->msg;
 
-	msg->header = header;
+	/* attach message data */
+	memcpy(msg->msg_data, msg_data, msg_bytes);
 	msg->msg_size = msg_bytes;
+
 	msg->reply_size = reply_bytes;
 	msg->reply_error = 0;
 
-	/* attach any data */
-	if (msg_bytes)
-		memcpy(msg->msg_data, msg_data, msg_bytes);
-
 	sdev->msg = msg;
 
 	ret = snd_sof_dsp_send_msg(sdev, msg);
@@ -339,7 +343,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 		return ret;
 	}
 
-	ipc_log_header(sdev->dev, "ipc tx", msg->header);
+	ipc_log_header(sdev->dev, "ipc tx", hdr->cmd);
 
 	/* now wait for completion */
 	return tx_wait_done(ipc, msg, reply_data);
@@ -385,7 +389,7 @@ int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
 	/* Serialise IPC TX */
 	mutex_lock(&ipc->tx_mutex);
 
-	ret = sof_ipc_tx_message_unlocked(ipc, header, msg_data, msg_bytes,
+	ret = sof_ipc_tx_message_unlocked(ipc, msg_data, msg_bytes,
 					  reply_data, reply_bytes);
 
 	mutex_unlock(&ipc->tx_mutex);
@@ -789,7 +793,6 @@ static int sof_set_get_large_ctrl_data(struct snd_sof_dev *sdev,
 			memcpy(sparams->dst, sparams->src + offset, send_bytes);
 
 		err = sof_ipc_tx_message_unlocked(sdev->ipc,
-						  partdata->rhdr.hdr.cmd,
 						  partdata,
 						  partdata->rhdr.hdr.size,
 						  partdata,
-- 
2.35.0

