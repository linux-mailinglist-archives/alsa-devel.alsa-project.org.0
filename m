Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C240F478
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Sep 2021 11:00:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0B93417CD;
	Fri, 17 Sep 2021 10:59:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0B93417CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631869228;
	bh=uChnu/Y4fatw+cJRXVpxBJKN86FIWXktfbhrAAdm1/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cZTi1V7smMfEmhBnXwGFT7kSJ1lFkbU+yTTemdl6wDBDjF4RfgV215iEYYyAGHapt
	 dEryxlfg6LrzCRdFaDsiMToirOCSVvqYR3V/aRejveRYjSCMa/dx+/8WU2KFg8W69M
	 M+O0kNZT5yeMvoZUaAmsjV1tkI+88/Jeyi8RCuAI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01ECDF8032C;
	Fri, 17 Sep 2021 10:58:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1360EF804BD; Fri, 17 Sep 2021 10:58:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D281BF80152
 for <alsa-devel@alsa-project.org>; Fri, 17 Sep 2021 10:58:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D281BF80152
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="308300247"
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="308300247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 01:58:30 -0700
X-IronPort-AV: E=Sophos;i="5.85,300,1624345200"; d="scan'208";a="473064383"
Received: from akostadi-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.216.45])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 01:58:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: ipc: Clarify the parameter name for
 ipc_trace_message()
Date: Fri, 17 Sep 2021 11:58:22 +0300
Message-Id: <20210917085823.27222-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917085823.27222-1-peter.ujfalusi@linux.intel.com>
References: <20210917085823.27222-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com,
 daniel.baluta@nxp.com, bard.liao@intel.com
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

ipc_trace_message() receives the type not the ID.
Use the same naming as the ipc_stream_message() function: msg_type to
help the reader to follow the code.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
---
 sound/soc/sof/ipc.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a4fe007a0e4d..2d7e942a3c70 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -18,7 +18,7 @@
 #include "sof-audio.h"
 #include "ops.h"
 
-static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id);
+static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_type);
 static void ipc_stream_message(struct snd_sof_dev *sdev, u32 msg_cmd);
 
 /*
@@ -454,19 +454,18 @@ EXPORT_SYMBOL(snd_sof_ipc_msgs_rx);
  * IPC trace mechanism.
  */
 
-static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_id)
+static void ipc_trace_message(struct snd_sof_dev *sdev, u32 msg_type)
 {
 	struct sof_ipc_dma_trace_posn posn;
 
-	switch (msg_id) {
+	switch (msg_type) {
 	case SOF_IPC_TRACE_DMA_POSITION:
 		/* read back full message */
 		snd_sof_ipc_msg_data(sdev, NULL, &posn, sizeof(posn));
 		snd_sof_trace_update_pos(sdev, &posn);
 		break;
 	default:
-		dev_err(sdev->dev, "error: unhandled trace message %x\n",
-			msg_id);
+		dev_err(sdev->dev, "error: unhandled trace message %x\n", msg_type);
 		break;
 	}
 }
-- 
2.33.0

