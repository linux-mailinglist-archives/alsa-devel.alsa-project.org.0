Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A0840DA7B
	for <lists+alsa-devel@lfdr.de>; Thu, 16 Sep 2021 14:59:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D37B189D;
	Thu, 16 Sep 2021 14:58:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D37B189D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631797148;
	bh=y5m3R60MYg+QzH/uzr6LUTyIny5lkkzoExpN2Zp6QwQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tm/lOZpbJGOcHFuI1CqdHAwQEVFfB3+/sQ+5m0Q67EC3JpKGK/BeuD6Q/A6QQB36/
	 gjqHN20jXo4X2C+yO+ZaFfrpprfMM9DsO1285JUxg/WJKarD4i2iQ650xWtRfXlsc8
	 54H0yqQV/jGY+/aoO9swAOQpAj9P48JpyelE0NUw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 847FBF80271;
	Thu, 16 Sep 2021 14:57:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2769AF8025E; Thu, 16 Sep 2021 14:57:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3753EF800D3
 for <alsa-devel@alsa-project.org>; Thu, 16 Sep 2021 14:57:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3753EF800D3
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="244934288"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="244934288"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 05:57:29 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; d="scan'208";a="509294579"
Received: from gkapusti-mobl.ccr.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.35.152])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 05:57:27 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH] ASoC: SOF: ipc: Remove redundant error check from
 sof_ipc_tx_message_unlocked
Date: Thu, 16 Sep 2021 15:57:25 +0300
Message-Id: <20210916125725.25934-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.33.0
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

If the snd_sof_dsp_send_msg() failed then we have already returned from
sof_ipc_tx_message_unlocked() with the error message.

There is no need to check if ret is really 0 after this and we can return
directly the return value from tx_wait_done()

At the same time make the remaining checks for error (ret) to match.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/ipc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/ipc.c b/sound/soc/sof/ipc.c
index a4fe007a0e4d..969b017e68d4 100644
--- a/sound/soc/sof/ipc.c
+++ b/sound/soc/sof/ipc.c
@@ -286,7 +286,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 
 	spin_unlock_irq(&sdev->ipc_lock);
 
-	if (ret < 0) {
+	if (ret) {
 		dev_err_ratelimited(sdev->dev,
 				    "error: ipc tx failed with error %d\n",
 				    ret);
@@ -296,10 +296,7 @@ static int sof_ipc_tx_message_unlocked(struct snd_sof_ipc *ipc, u32 header,
 	ipc_log_header(sdev->dev, "ipc tx", msg->header);
 
 	/* now wait for completion */
-	if (!ret)
-		ret = tx_wait_done(ipc, msg, reply_data);
-
-	return ret;
+	return tx_wait_done(ipc, msg, reply_data);
 }
 
 /* send IPC message from host to DSP */
-- 
2.33.0

