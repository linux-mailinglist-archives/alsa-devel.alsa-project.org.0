Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F34CF51D920
	for <lists+alsa-devel@lfdr.de>; Fri,  6 May 2022 15:28:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 943AE180D;
	Fri,  6 May 2022 15:27:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 943AE180D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651843722;
	bh=QUPrONxRj5sKJn9TAlZi2ATo395H8YXBRGtmK1hMq0Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f1+4MKGiRLj3EHhReDXfyu08lskrqZshm10f+eFz3T5kWAML3Ccz1AJby5dHKLQYc
	 +9ws29x59giIRSGxfwcXCk6KL9Lw3H15ooo+57tTYL4/hb9MGpegfNgPVsRWjGUr5G
	 mf2CDe9B1SgZC+NdJs3FfATqZr40pIiqjUc4YONw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0637F80511;
	Fri,  6 May 2022 15:26:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DE9BF80508; Fri,  6 May 2022 15:26:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F083F800E3
 for <alsa-devel@alsa-project.org>; Fri,  6 May 2022 15:26:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F083F800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HOIjZNoQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651843599; x=1683379599;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QUPrONxRj5sKJn9TAlZi2ATo395H8YXBRGtmK1hMq0Y=;
 b=HOIjZNoQH1w9wM3s6Ct3jGKBB1YCZaXA+K4iqOUj7Rwi2vyUVpYnUa87
 hn24HaEGrfNuWwQx7OT9IVWEEZQQllUKMrmqUjlFxmU+mxJEwKprEjaW5
 QSdmDGS2Ltc73Y9krW9LSuMq4GPxjfgtQY5FTuw56BEauAZclPeTyabn5
 uOD8bQrCKY34hQ9cQhRNvBiFoFOE/IJRC44VIe2C8nkaOb0jkCw3dK2Ri
 g4geYZ4/kviM8FVJyOO2e6tYUPJ52rOOlvme/DUsplbYjd1xIxHqUGIzH
 KC8XxW8zLJ2uTHePoCUb7//NSTavi/TpLmRFqggpQVntGxfgkpwUKv6oN g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="293672803"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="293672803"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="585971589"
Received: from oelagadx-mobl2.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.61.230])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 06:26:33 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, yung-chuan.liao@linux.intel.com,
 rander.wang@intel.com
Subject: [PATCH 3/8] ASoC: SOF: sof-client-probes: Query the maximum IPC
 payload size
Date: Fri,  6 May 2022 16:26:42 +0300
Message-Id: <20220506132647.18690-4-peter.ujfalusi@linux.intel.com>
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

Instead of using the SOF_IPC_MSG_MAX_SIZE as the maximum payload size for
and IPC message, use the provided API to query it.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/sof/sof-client-probes.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/sof-client-probes.c b/sound/soc/sof/sof-client-probes.c
index c4c6e03c8133..34e6bd356e71 100644
--- a/sound/soc/sof/sof-client-probes.c
+++ b/sound/soc/sof/sof-client-probes.c
@@ -132,6 +132,7 @@ static int sof_probes_deinit(struct sof_client_dev *cdev)
 static int sof_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
 			   void **params, size_t *num_params)
 {
+	size_t max_msg_size = sof_client_get_ipc_max_payload_size(cdev);
 	struct sof_ipc_probe_info_params msg = {{{0}}};
 	struct sof_ipc_probe_info_params *reply;
 	size_t bytes;
@@ -140,13 +141,13 @@ static int sof_probes_info(struct sof_client_dev *cdev, unsigned int cmd,
 	*params = NULL;
 	*num_params = 0;
 
-	reply = kzalloc(SOF_IPC_MSG_MAX_SIZE, GFP_KERNEL);
+	reply = kzalloc(max_msg_size, GFP_KERNEL);
 	if (!reply)
 		return -ENOMEM;
 	msg.rhdr.hdr.size = sizeof(msg);
 	msg.rhdr.hdr.cmd = SOF_IPC_GLB_PROBE | cmd;
 
-	ret = sof_client_ipc_tx_message(cdev, &msg, reply, SOF_IPC_MSG_MAX_SIZE);
+	ret = sof_client_ipc_tx_message(cdev, &msg, reply, max_msg_size);
 	if (ret < 0 || reply->rhdr.error < 0)
 		goto exit;
 
-- 
2.36.0

