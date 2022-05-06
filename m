Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC7B51D930
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:29:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D40251840;
	Fri,  6 May 2022 15:28:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D40251840
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651843775;
	bh=81ICnZrTHXX+1gQbGHLXKeCze0vykeEgh03pU+8j26Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aQcQeQnz4FvlSCfV10cxkbfbYxp8kdLqe2qJjDztOtTrzGW3oQ5gfOf/rOzEn3MiH
	 wEQGxPrSP6zTPj84HJvHmipDUwgcn460jpP8HCLj8v+NQeCwfqkbK48eW+ybQCVx0g
	 7LLhC3vcmNEUilyEJYroMCJcmU4wzE2+GXyGM14o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81A10F8053A;
	Fri,  6 May 2022 15:26:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDC63F80506; Fri,  6 May 2022 15:26:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9CC11F80506
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CC11F80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CBoRN4Lk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651843604; x=1683379604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=81ICnZrTHXX+1gQbGHLXKeCze0vykeEgh03pU+8j26Y=;
 b=CBoRN4Lk0Np/cKjooZ6QKjK7Qbb/GZTtFtafceFmJ8UPmVKukLyOHI3z
 vuh/7GLDbtIDUUraw4SYL+YvyR0b7MLBIBGHKyoaXrxUgHdtRuKVXylYO
 jZtDoGVS8AYlF4FSqjVylVxTYRkbCJkoDis+KtiufdQl1jXs1B5koqAOk
 x5EqwViUGssaNXJyjGBA5lukt5tG/79+IAgQJoM1Hi2B0Gbmi8+MZcTIu
 BaJpd8Nc3cEQZVk4gFMvUKUfegh4LOKWPWzmNwlOd+LN2B5FyCCOI90b6
 KkoPCP0lQrmQsuKDvUjUgcEhWLKmtFxIUFIRpi+Td++hAYYUijLFvipZm Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="293672824"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293672824"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585971606"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.61.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:39 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 5/8] ASoC: SOF: sof-client: Add support IPC4 message sending
Date: Fri,  6 May 2022 16:26:44 +0300
Message-Id: <20220506132647.18690-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
References: <20220506132647.18690-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, daniel.baluta@nxp.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com
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

In order to be able to send an IPC4 message, the
sof_client_ipc_tx_message() needs to parse the tx message differently to
extract the size.

The IPC notification registration is done by providing the notification
type and the whole message is passed to the client when a match is found.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-client.c | 47 +++++++++++++++++++++++++++++++++-----
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/sof-client.c b/sound/soc/sof/sof-client.c
index ce002815aa44..a664e0eb81fe 100644
--- a/sound/soc/sof/sof-client.c
+++ b/sound/soc/sof/sof-client.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/slab.h>
+#include <sound/sof/ipc4/header.h>
 #include "ops.h"
 #include "sof-client.h"
 #include "sof-priv.h"
@@ -245,10 +246,19 @@ EXPORT_SYMBOL_NS_GPL(sof_client_dev_unregister, SND_SOC_SOF_CLIENT);
 int sof_client_ipc_tx_message(struct sof_client_dev *cdev, void *ipc_msg,
 			      void *reply_data, size_t reply_bytes)
 {
-	struct sof_ipc_cmd_hdr *hdr = ipc_msg;
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+		struct sof_ipc_cmd_hdr *hdr = ipc_msg;
 
-	return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, hdr->size,
-				  reply_data, reply_bytes);
+		return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, hdr->size,
+					  reply_data, reply_bytes);
+	} else if (cdev->sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_msg *msg = ipc_msg;
+
+		return sof_ipc_tx_message(cdev->sdev->ipc, ipc_msg, msg->data_size,
+					  reply_data, reply_bytes);
+	}
+
+	return -EINVAL;
 }
 EXPORT_SYMBOL_NS_GPL(sof_client_ipc_tx_message, SND_SOC_SOF_CLIENT);
 
@@ -358,9 +368,22 @@ EXPORT_SYMBOL_NS_GPL(sof_client_core_module_put, SND_SOC_SOF_CLIENT);
 /* IPC event handling */
 void sof_client_ipc_rx_dispatcher(struct snd_sof_dev *sdev, void *msg_buf)
 {
-	struct sof_ipc_cmd_hdr *hdr = msg_buf;
-	u32 msg_type = hdr->cmd & SOF_GLB_TYPE_MASK;
 	struct sof_ipc_event_entry *event;
+	u32 msg_type;
+
+	if (sdev->pdata->ipc_type == SOF_IPC) {
+		struct sof_ipc_cmd_hdr *hdr = msg_buf;
+
+		msg_type = hdr->cmd & SOF_GLB_TYPE_MASK;
+	} else if (sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		struct sof_ipc4_msg *msg = msg_buf;
+
+		msg_type = SOF_IPC4_NOTIFICATION_TYPE_GET(msg->primary);
+	} else {
+		dev_dbg_once(sdev->dev, "%s: Not supported IPC version: %d\n",
+			     __func__, sdev->pdata->ipc_type);
+		return;
+	}
 
 	mutex_lock(&sdev->client_event_handler_mutex);
 
@@ -379,9 +402,21 @@ int sof_client_register_ipc_rx_handler(struct sof_client_dev *cdev,
 	struct snd_sof_dev *sdev = sof_client_dev_to_sof_dev(cdev);
 	struct sof_ipc_event_entry *event;
 
-	if (!callback || !(ipc_msg_type & SOF_GLB_TYPE_MASK))
+	if (!callback)
 		return -EINVAL;
 
+	if (cdev->sdev->pdata->ipc_type == SOF_IPC) {
+		if (!(ipc_msg_type & SOF_GLB_TYPE_MASK))
+			return -EINVAL;
+	} else if (cdev->sdev->pdata->ipc_type == SOF_INTEL_IPC4) {
+		if (!(ipc_msg_type & SOF_IPC4_NOTIFICATION_TYPE_MASK))
+			return -EINVAL;
+	} else {
+		dev_warn(sdev->dev, "%s: Not supported IPC version: %d\n",
+			 __func__, sdev->pdata->ipc_type);
+		return -EINVAL;
+	}
+
 	event = kmalloc(sizeof(*event), GFP_KERNEL);
 	if (!event)
 		return -ENOMEM;
-- 
2.36.0

