Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF72E4F3CD2
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:29:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8BCB51887;
	Tue,  5 Apr 2022 19:29:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8BCB51887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179791;
	bh=0rHWpX84/YwgX548+7FlRNVCs6IiBjUldIjgakykE+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=szhES/XHjnaPgDJZkKlA8j8uN8aZvHvz3VEAVl3ZSJrONvGSoI8mcoTUmcURjvyRT
	 rwEhb56x2d47wNewxoc16jeZVpxIkFNHqbbW03gI8NEs67C/xi+77pApEu55IFzoIG
	 iOTPo2cCt+ily33x/ldWFlJGf9CnDO2BGkp2HSbs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15BA4F8051C;
	Tue,  5 Apr 2022 19:27:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45D9BF8052E; Tue,  5 Apr 2022 19:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE327F80516
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE327F80516
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="leU5nnIU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179658; x=1680715658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0rHWpX84/YwgX548+7FlRNVCs6IiBjUldIjgakykE+Q=;
 b=leU5nnIULE0lqv+j7PjEjhuisXuT2I6Z5v/C3Q+3F7q/xCekwfYahjDS
 xBrDaTSGpMg1IE4emYg4nfJbmOnD5Op6RMEh8FTEizrvEah4P0FBMMrDW
 sFJyQBZfxgXOaRrY2IjArS9vzHmWVakxw1V+m89egfLZOt2og9o4EzCo5
 kuVcZ4AVvkjialKV7n8Rc6QPBlSj4yQolc1xDL7hVN4Wa69UHdU2FuT6N
 SEUawmZPL/o0WPvMykJ/Or1ivbqSVbJhxFYMV/Mm58FpvjaO/GJm9mfZq
 yX63+DUcn/VeZ961UOj66H4j9VZ39EPXa0ym+GgByIhgWvREiF4ysYXDE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986740"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986740"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140972"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:23 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 06/15] ASoC: SOF: ipc3: Implement the get_reply IPC ops
Date: Tue,  5 Apr 2022 10:26:59 -0700
Message-Id: <20220405172708.122168-7-ranjani.sridharan@linux.intel.com>
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

Add the implementation for the get_reply callback to copy the reply message
from mailbox to msg->reply_data buffer.

The implementation is equivalent to the currently used code in ipc.c

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 55 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 9aa263b4af0a..2ecd3bb061f3 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -217,6 +217,60 @@ static inline void ipc3_log_header(struct device *dev, u8 *text, u32 cmd)
 }
 #endif
 
+static int sof_ipc3_get_reply(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg = sdev->msg;
+	struct sof_ipc_reply *reply;
+	int ret = 0;
+
+	/* get the generic reply */
+	reply = msg->reply_data;
+	snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset, reply, sizeof(*reply));
+
+	if (reply->error < 0)
+		return reply->error;
+
+	if (!reply->hdr.size) {
+		/* Reply should always be >= sizeof(struct sof_ipc_reply) */
+		if (msg->reply_size)
+			dev_err(sdev->dev,
+				"empty reply received, expected %zu bytes\n",
+				msg->reply_size);
+		else
+			dev_err(sdev->dev, "empty reply received\n");
+
+		return -EINVAL;
+	}
+
+	if (msg->reply_size > 0) {
+		if (reply->hdr.size == msg->reply_size) {
+			ret = 0;
+		} else if (reply->hdr.size < msg->reply_size) {
+			dev_dbg(sdev->dev,
+				"reply size (%u) is less than expected (%zu)\n",
+				reply->hdr.size, msg->reply_size);
+
+			msg->reply_size = reply->hdr.size;
+			ret = 0;
+		} else {
+			dev_err(sdev->dev,
+				"reply size (%u) exceeds the buffer size (%zu)\n",
+				reply->hdr.size, msg->reply_size);
+			ret = -EINVAL;
+		}
+
+		/*
+		 * get the full message if reply->hdr.size <= msg->reply_size
+		 * and the reply->hdr.size > sizeof(struct sof_ipc_reply)
+		 */
+		if (!ret && msg->reply_size > sizeof(*reply))
+			snd_sof_dsp_mailbox_read(sdev, sdev->host_box.offset,
+						 msg->reply_data, msg->reply_size);
+	}
+
+	return ret;
+}
+
 /* wait for IPC message reply */
 static int ipc3_wait_tx_done(struct snd_sof_ipc *ipc, void *reply_data)
 {
@@ -453,4 +507,5 @@ const struct sof_ipc_ops ipc3_ops = {
 
 	.tx_msg = sof_ipc3_tx_msg,
 	.set_get_data = sof_ipc3_set_get_data,
+	.get_reply = sof_ipc3_get_reply,
 };
-- 
2.25.1

