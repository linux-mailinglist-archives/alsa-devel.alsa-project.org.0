Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FFD34F3CCE
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:29:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE8811863;
	Tue,  5 Apr 2022 19:28:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE8811863
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179758;
	bh=w8RuaLcpsLc0lYi4rhENS5/zgdN6D8afkOBg6fn5ifI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XBepTUhQg3XdJIjP6LarnxXlzVpN85BXfVjkKFvv34fck3/5LN3EXdqDzl3fDA4H/
	 gIn8iajAoB4V2Ul5xj1tLfmhFP4EktpTnPYNdpox90xiaiSu6Ojz3qNUH6Ud6CBXPv
	 Ydt7+3rrNQVsJzB33dBagMM2mg8M7lyRYEi9znek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D62EF80520;
	Tue,  5 Apr 2022 19:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7101CF8051C; Tue,  5 Apr 2022 19:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5ABBF800D2
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5ABBF800D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="aD0Ag/CM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179651; x=1680715651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w8RuaLcpsLc0lYi4rhENS5/zgdN6D8afkOBg6fn5ifI=;
 b=aD0Ag/CMvJRSHky8vlMzd4ingVVw2U85q93qrqwNJ6GDQKBLKTeIQX9s
 ad9Jvf4D4G4cIG4Gv2RXN7fSwPVRtCvW/NhXRzPDeY2a/mPff9s9/iURD
 joeVEA7vBNgSZq/hEpYEJLzoYdEQK0MMKl6YPmxs/m3flkxOmao4n+ZdZ
 p2KQ2y33C3dUbyVr9NE7cx89ubh1PM7pNO4dBP6ybpWqrmtQNP5zJQsmu
 23KgT0ZReOW/ieWR+O3w0UVWFfBxheGK++DS9M5rDnfvHPNt+QuuE7I/x
 oRCxpI7YKXwpdYDHVK5iY2bS7Ahg+xMvyTL2W/G8fmNdBIhJ9AqJO2Fp3 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986719"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986719"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140949"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:21 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/15] ASoC: SOF: Add helper function to prepare and send an
 IPC message
Date: Tue,  5 Apr 2022 10:26:54 -0700
Message-Id: <20220405172708.122168-2-ranjani.sridharan@linux.intel.com>
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

The new sof_ipc_send_msg() can be used by IPC dependent code to prepare
the ipc->msg for a new message transmission and then call in to platform
code to send the message.

Higher level code should be handling the completion and reply.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 53 ++++++++++++++++++++++++++++++++++++++++
 sound/soc/sof/sof-priv.h |  2 ++
 2 files changed, 55 insertions(+)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 17dd51d342cf..a78b74514438 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -340,6 +340,59 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc,
 	return tx_wait_done(ipc, msg, reply_data);
 }
 
+/**
+ * sof_ipc_send_msg - generic function to prepare and send one IPC message
+ * @sdev:		pointer to SOF core device struct
+ * @msg_data:		pointer to a message to send
+ * @msg_bytes:		number of bytes in the message
+ * @reply_bytes:	number of bytes available for the reply.
+ *			The buffer for the reply data is not passed to this
+ *			function, the available size is an information for the
+ *			reply handling functions.
+ *
+ * On success the function returns 0, otherwise negative error number.
+ *
+ * Note: higher level sdev->ipc->tx_mutex must be held to make sure that
+ *	 transfers are synchronized.
+ */
+int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
+		     size_t reply_bytes)
+{
+	struct snd_sof_ipc *ipc = sdev->ipc;
+	struct snd_sof_ipc_msg *msg;
+	int ret;
+
+	if (ipc->disable_ipc_tx || sdev->fw_state != SOF_FW_BOOT_COMPLETE)
+		return -ENODEV;
+
+	/*
+	 * The spin-lock is needed to protect message objects against other
+	 * atomic contexts.
+	 */
+	spin_lock_irq(&sdev->ipc_lock);
+
+	/* initialise the message */
+	msg = &ipc->msg;
+
+	/* attach message data */
+	msg->msg_data = msg_data;
+	msg->msg_size = msg_bytes;
+
+	msg->reply_size = reply_bytes;
+	msg->reply_error = 0;
+
+	sdev->msg = msg;
+
+	ret = snd_sof_dsp_send_msg(sdev, msg);
+	/* Next reply that we receive will be related to this message */
+	if (!ret)
+		msg->ipc_complete = false;
+
+	spin_unlock_irq(&sdev->ipc_lock);
+
+	return ret;
+}
+
 /* send IPC message from host to DSP */
 int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 		       void *reply_data, size_t reply_bytes)
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index df19d58d8894..f6ae28a21482 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -588,6 +588,8 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes
 		       void *reply_data, size_t reply_bytes);
 int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes);
+int sof_ipc_send_msg(struct snd_sof_dev *sdev, void *msg_data, size_t msg_bytes,
+		     size_t reply_bytes);
 int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev);
 static inline void snd_sof_ipc_process_reply(struct snd_sof_dev *sdev, u32 msg_id)
 {
-- 
2.25.1

