Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A07B64F3CD3
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Apr 2022 19:30:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C82F1897;
	Tue,  5 Apr 2022 19:29:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C82F1897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649179809;
	bh=YNKv9+iwUHW0laU8wEcyKLwmD5Puk8ohvQZR9y8ivlQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JdqlvM2ho2qq6sBYn2ieF3QA9jcbsTPUW2EUlh9WNlkJPoMQY136+WEFKZVd2mWF5
	 bE7n/ZXK8QYvdDpWLVUxoU3ShYxbVtfw35Sh0WKxuclzIOE+PD1nPULYWmTvOUsWKw
	 xwJYhp8wbW5Y1ILlWHGUS+DIsX5Gljmsk8FIvgKU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49B5FF80534;
	Tue,  5 Apr 2022 19:27:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6D4E8F8016A; Tue,  5 Apr 2022 19:27:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2FD6F8016A
 for <alsa-devel@alsa-project.org>; Tue,  5 Apr 2022 19:27:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2FD6F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="kZb4ZH2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649179655; x=1680715655;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YNKv9+iwUHW0laU8wEcyKLwmD5Puk8ohvQZR9y8ivlQ=;
 b=kZb4ZH2c4/nvsd+3rc8iox1YATAkRmHBtJpIVq57nAarYs8bFMXgEyXS
 JgBOqrxr5c569eoYaHW84exAvOM8Cy9kWYGdbSVvITImId2JxyA0qoRgw
 Za5SIT4UglcPYbgIcd/UjFVA03iBmYuCUT24W005isMhKkQ2xB0pJyjId
 rCI6SpulHfI3nBVmG1V1qZJSwHnn3ZIAQ1owFXfNwD2FrOatHZN/xYFL5
 b62iT25sFX1MLc4OFP4jsTlXhRfoU6NBpzOts640w4hj8ePa/Cw5yqU6X
 C4MgBA+pAcbfXtzIWhUII0IBpDFQI0Q8lMCxSFjCALdxUCmFxGOLyhXqs A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="323986734"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="323986734"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="722140961"
Received: from reginari-mobl7.amr.corp.intel.com (HELO
 rsridh2-mobl1.localdomain) ([10.254.28.131])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:27:22 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 04/15] ASoC: SOF: ipc3: Use sof_ipc3_tx_msg() internally for
 message sending
Date: Tue,  5 Apr 2022 10:26:57 -0700
Message-Id: <20220405172708.122168-5-ranjani.sridharan@linux.intel.com>
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

Instead of using sof_ipc_tx_message() for sending message, use the
sof_ipc3_tx_msg() directly within ipc3.c

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/ipc3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/ipc3.c b/sound/soc/sof/ipc3.c
index 7f80035d3a88..6b59d4d0727f 100644
--- a/sound/soc/sof/ipc3.c
+++ b/sound/soc/sof/ipc3.c
@@ -325,8 +325,8 @@ static int sof_ipc3_ctx_ipc(struct snd_sof_dev *sdev, int cmd)
 	struct sof_ipc_reply reply;
 
 	/* send ctx save ipc to dsp */
-	return sof_ipc_tx_message(sdev->ipc, &pm_ctx, sizeof(pm_ctx),
-				  &reply, sizeof(reply));
+	return sof_ipc3_tx_msg(sdev, &pm_ctx, sizeof(pm_ctx),
+			       &reply, sizeof(reply), false);
 }
 
 static int sof_ipc3_ctx_save(struct snd_sof_dev *sdev)
-- 
2.25.1

