Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495C41A9E5
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Sep 2021 09:37:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 140AE16A5;
	Tue, 28 Sep 2021 09:36:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 140AE16A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632814667;
	bh=lZTMBcv+X4Bihnd/SWLCip09NSLQW0M9MEiAwotnDF8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LlCOK8rfh70icU5C3/qakBGL6DgsEMCbPAca+4V+xBmue97WWNJSOeDEte/3139KX
	 PaH4XHgHAtduS7Wfspv8f4QHJAnZYU4WOrgOfkYfRJCEf3ATKT19kpokWdndQajrq9
	 ceRjbJQvdQzdEVi0LyYOWPUi2R+kg9p5hetBs46U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F4FFF804BC;
	Tue, 28 Sep 2021 09:36:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7AD0BF804AD; Tue, 28 Sep 2021 09:36:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0DEBF80161
 for <alsa-devel@alsa-project.org>; Tue, 28 Sep 2021 09:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0DEBF80161
X-IronPort-AV: E=McAfee;i="6200,9189,10120"; a="310187399"
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="310187399"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 00:36:14 -0700
X-IronPort-AV: E=Sophos;i="5.85,328,1624345200"; d="scan'208";a="476192196"
Received: from elisabal-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.251.220.25])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2021 00:36:11 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com, daniel.baluta@nxp.com
Subject: [PATCH] ASoC: SOF: ipc: Make the error prints consistent in
 tx_wait_done()
Date: Tue, 28 Sep 2021 10:36:15 +0300
Message-Id: <20210928073615.29574-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, paul.olaru@oss.nxp.com
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

If we get an error on reply (msg->reply_error) then we should print the
error value out.

At the same time extend the print to include the message size as well and
do the same in case of a timeout.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index 5d41924f37a6..95b1d875c3c0 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -249,15 +249,17 @@ static int tx_wait_done(struct snd_sof_ipc *ipc, struct snd_sof_ipc_msg *msg,
 				 msecs_to_jiffies(sdev->ipc_timeout));
 
 	if (ret == 0) {
-		dev_err(sdev->dev, "error: ipc timed out for 0x%x size %d\n",
-			hdr->cmd, hdr->size);
+		dev_err(sdev->dev,
+			"ipc tx timed out for %#x (msg/reply size: %d/%zu)\n",
+			hdr->cmd, hdr->size, msg->reply_size);
 		snd_sof_handle_fw_exception(ipc->sdev);
 		ret = -ETIMEDOUT;
 	} else {
 		ret = msg->reply_error;
 		if (ret < 0) {
-			dev_err(sdev->dev, "error: ipc error for 0x%x size %zu\n",
-				hdr->cmd, msg->reply_size);
+			dev_err(sdev->dev,
+				"ipc tx error for %#x (msg/reply size: %d/%zu): %d\n",
+				hdr->cmd, hdr->size, msg->reply_size, ret);
 		} else {
 			ipc_log_header(sdev->dev, "ipc tx succeeded", hdr->cmd);
 			if (msg->reply_size)
-- 
2.33.0

