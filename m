Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4036426706
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Oct 2021 11:39:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F0591670;
	Fri,  8 Oct 2021 11:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F0591670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633685999;
	bh=gjg2XJ00c+FgV0sHos7j5fUIPgUlJM2E5myixI2cJWA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cX6XJsUzBbI7l/14ukPcm66Xt2cjK1tj2cHMHcZchdOv1klKQneqjqYjPB7JOBo6X
	 3Xe5DnoINzbPQgmviZTnyhkNwzKgExMYb+PEUBThni5Bdo1bfDBv3/s9d8MKuVanBH
	 nYHeiY1oMNIfteA6R/P7lFItKB+grjW3VXrE1bFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91B71F80229;
	Fri,  8 Oct 2021 11:38:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AE9D4F80229; Fri,  8 Oct 2021 11:38:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0E95F80229
 for <alsa-devel@alsa-project.org>; Fri,  8 Oct 2021 11:38:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0E95F80229
X-IronPort-AV: E=McAfee;i="6200,9189,10130"; a="312671024"
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="312671024"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:38:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,357,1624345200"; d="scan'208";a="478916599"
Received: from dhruvkum-mobl.gar.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.208.187])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2021 02:38:28 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, rander.wang@intel.com
Subject: [PATCH] ASoC: SOF: prepare code to allocate IPC messages in fw_ready
Date: Fri,  8 Oct 2021 12:38:36 +0300
Message-Id: <20211008093836.28210-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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

From: Rander Wang <rander.wang@intel.com>

The fixed maximum size of IPC message does not allow for large
transfers, e.g. for filter data. Currently such messages will
be divided into smaller pieces and sent to firmware in multiple
chunks. For future IPC, this strategy is not suitable.

The maximum IPC message size is limited by host box size which
can be known when firmware is ready, so the fw_ready callback
can allocate IPC messages with platform-specific sizes instead
of the current fixed-size.

To be compatible with released firmware, current platforms will
still use SOF_IPC_MSG_MAX_SIZE. For future platforms, there will
be a new fw_ready function and the platform-specific allocation
will take place there.

Signed-off-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc.c      | 27 ++++++++++++++++-----------
 sound/soc/sof/loader.c   |  3 ++-
 sound/soc/sof/sof-priv.h |  1 +
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index b2e556b64994..e6c53c6c470e 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -919,6 +919,22 @@ int snd_sof_ipc_valid(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(snd_sof_ipc_valid);
 
+int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev)
+{
+	struct snd_sof_ipc_msg *msg;
+
+	msg = &sdev->ipc->msg;
+	msg->msg_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!msg->msg_data)
+		return -ENOMEM;
+
+	msg->reply_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	if (!msg->reply_data)
+		return -ENOMEM;
+
+	return 0;
+}
+
 struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_ipc *ipc;
@@ -935,17 +951,6 @@ struct snd_sof_ipc *snd_sof_ipc_init(struct snd_sof_dev *sdev)
 	/* indicate that we aren't sending a message ATM */
 	msg->ipc_complete = true;
 
-	/* pre-allocate message data */
-	msg->msg_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE,
-				     GFP_KERNEL);
-	if (!msg->msg_data)
-		return NULL;
-
-	msg->reply_data = devm_kzalloc(sdev->dev, SOF_IPC_MSG_MAX_SIZE,
-				       GFP_KERNEL);
-	if (!msg->reply_data)
-		return NULL;
-
 	init_waitqueue_head(&msg->waitq);
 
 	return ipc;
diff --git a/sound/soc/sof/loader.c b/sound/soc/sof/loader.c
index 54aa7764d2b3..c04646647637 100644
--- a/sound/soc/sof/loader.c
+++ b/sound/soc/sof/loader.c
@@ -13,6 +13,7 @@
 #include <linux/firmware.h>
 #include <sound/sof.h>
 #include <sound/sof/ext_manifest.h>
+#include "sof-priv.h"
 #include "ops.h"
 
 static int get_ext_windows(struct snd_sof_dev *sdev,
@@ -517,7 +518,7 @@ int sof_fw_ready(struct snd_sof_dev *sdev, u32 msg_id)
 
 	sof_get_windows(sdev);
 
-	return 0;
+	return sof_ipc_init_msg_memory(sdev);
 }
 EXPORT_SYMBOL(sof_fw_ready);
 
diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
index efaec2989a27..ba341b1bda0c 100644
--- a/sound/soc/sof/sof-priv.h
+++ b/sound/soc/sof/sof-priv.h
@@ -526,6 +526,7 @@ int sof_ipc_tx_message(struct snd_sof_ipc *ipc, u32 header,
 int sof_ipc_tx_message_no_pm(struct snd_sof_ipc *ipc, u32 header,
 			     void *msg_data, size_t msg_bytes,
 			     void *reply_data, size_t reply_bytes);
+int sof_ipc_init_msg_memory(struct snd_sof_dev *sdev);
 
 /*
  * Trace/debug
-- 
2.33.0

