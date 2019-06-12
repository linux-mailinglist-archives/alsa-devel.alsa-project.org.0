Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1835242CDE
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2019 19:00:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7511785;
	Wed, 12 Jun 2019 19:00:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7511785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560358851;
	bh=uAXMRFk4BN9Ma5EPFQaUQz9npTonFqqoizNL+FTYlgM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G0ra06wN8FhpVvYoomA2aAljSdfenjW3/zqzGmR38BRWGB+m8X6S2Ee2hOBgAHOSC
	 tgq8+JcBAi1KTtw4A9cJGAAAWhauF7NBuEAFcmsPuCkaL8EltsI98U7jIVJIlMQl3w
	 sr538SXM9gUZ1XoA1dE9x5JPFuXCg9ytq/hV47nE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 846B7F89738;
	Wed, 12 Jun 2019 18:57:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09474F89728; Wed, 12 Jun 2019 18:57:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 859E7F896E0
 for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2019 18:57:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 859E7F896E0
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jun 2019 09:57:12 -0700
X-ExtLoop1: 1
Received: from adorrell-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.251.133.122])
 by orsmga002.jf.intel.com with ESMTP; 12 Jun 2019 09:57:11 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed, 12 Jun 2019 11:57:04 -0500
Message-Id: <20190612165705.1858-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
References: <20190612165705.1858-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
Subject: [alsa-devel] [PATCH 4/5] ASoC: SOF: ignore unrecoverable CTX_SAVE
	IPC errors at suspend
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Kai Vehmanen <kai.vehmanen@linux.intel.com>

As part of the suspend flow, a context save IPC message is
sent to the firmware before powering down the DSP. If errors
are met, the suspend flow is aborted with current code.

Change the behaviour such that if firmware returns -EBUSY or
-EAGAIN, return the error codes to PM core as before. The device
is left in active state in this case.

If other errors are reported, print a warning but do not block the
suspend flow. As per interface specification, no valid error can be
returned in this scenario. If the hardware has hit a fatal error and
is not able to respond successfully, best recovery method is to
proceed with suspend and power off the DSP.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/pm.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/pm.c b/sound/soc/sof/pm.c
index 8ef1d51025d8..b7843f02ef67 100644
--- a/sound/soc/sof/pm.c
+++ b/sound/soc/sof/pm.c
@@ -343,11 +343,20 @@ static int sof_suspend(struct device *dev, bool runtime_suspend)
 #endif
 	/* notify DSP of upcoming power down */
 	ret = sof_send_pm_ipc(sdev, SOF_IPC_PM_CTX_SAVE);
-	if (ret < 0) {
+	if (ret == -EBUSY || ret == -EAGAIN) {
+		/*
+		 * runtime PM has logic to handle -EBUSY/-EAGAIN so
+		 * pass these errors up
+		 */
 		dev_err(sdev->dev,
 			"error: ctx_save ipc error during suspend %d\n",
 			ret);
 		return ret;
+	} else if (ret < 0) {
+		/* FW in unexpected state, continue to power down */
+		dev_warn(sdev->dev,
+			 "ctx_save ipc error %d, proceeding with suspend\n",
+			 ret);
 	}
 
 	/* power down all DSP cores */
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
