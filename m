Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 549635B017B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:16:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F8CC1673;
	Wed,  7 Sep 2022 12:15:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F8CC1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545793;
	bh=nW6saLcJ60MMn8DeEdAs0wb1aFO3efpuE7f3R0tN3sQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dA72WPGwDbPg3n3FFbhX2ABDHj5DvatQLhkGMLbIYcjzPTMl2A45D+YKEB5vDx7aE
	 DeQtkdWcm7nOpHNF1i7vr0AxtXxnL0IQMdJ9ab0SB3bxUwpOV/lGPZCol835oiEW3k
	 e+85aXpsdERE3I6T4+ObQUyEM4RxccEppbbJQ7ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1EEE5F8054A;
	Wed,  7 Sep 2022 12:14:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F079F8053C; Wed,  7 Sep 2022 12:14:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F2A8DF804FC;
 Wed,  7 Sep 2022 12:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F2A8DF804FC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="V7QWk7sO"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2877rCJr005930;
 Wed, 7 Sep 2022 05:14:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=ot1Tl8QTYVtsDuCHedMkmJ33fXe9BMeDLR0TIH+3JGU=;
 b=V7QWk7sO38uS86TS+NlahQceUBlCHvX/8rcq6rqKmo/2fOKoClg5XwVgUwt4F4y4GLxg
 PmKM5kTNRY0Ux/iX5Jfs8B1cq8AWwrVBe4DsHiTu6UY+xvhqbwb2PfXucZc6mvBaSld3
 5yq8dUBXF3jtcS1ijJ87JloUIxA61D36noN36zHPwZPOPBuuPcD9+0ktYiANPL2AEY5D
 BMqN4JF8rwegpM8/y7TWifZQHUYqkTy1QMpnQMuXFzL5r3srm72WTpWLin54EBaaTD0m
 vMGI8JHhynhQp61vXDksSxrkRIXus8ESzBRnndRUKJvFSObmAkZK7W9ve3qL3EXrUPfS qg== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bpw4sr-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 05:14:15 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 05:14:13 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Wed, 7 Sep 2022 05:14:13 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id E36A5B10;
 Wed,  7 Sep 2022 10:14:12 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
 <sanyog.r.kale@intel.com>, <broonie@kernel.org>
Subject: [PATCH 2/7] soundwire: intel_init: Separate shutdown and cleanup
Date: Wed, 7 Sep 2022 11:13:57 +0100
Message-ID: <20220907101402.4685-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907101402.4685-1-rf@opensource.cirrus.com>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vWiTgViV4BfLhGN_tzoikE6XHgslZvo6
X-Proofpoint-ORIG-GUID: vWiTgViV4BfLhGN_tzoikE6XHgslZvo6
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org,
 sound-open-firmware@alsa-project.org
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

Move the freeing of context data out of sdw_intel_exit() into a new
exported function sdw_intel_remove().

This splits shutdown and cleanup into separate stages, allowing the
calling code to perform its own shutdown after the bus has shutdown but
before the context has been deleted.

The struct sdw_intel_ctx pointer is passed to the calling code by
sdw_intel_probe() and the calling code passes it back as an opaque token.
When the caller is removed it must have the opportunity to teardown its
use of this token after the bus driver has stopped but before the
context memory has been freed. It should not be doing its teardown
before calling sdw_intel_exit() because that will break any bus activity
currently in progress and the removal of child drivers.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/intel_init.c      | 24 ++++++++++++++++++++----
 include/linux/soundwire/sdw_intel.h |  2 ++
 sound/soc/sof/intel/hda.c           |  4 +++-
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/drivers/soundwire/intel_init.c b/drivers/soundwire/intel_init.c
index d091513919df..078e01f67830 100644
--- a/drivers/soundwire/intel_init.c
+++ b/drivers/soundwire/intel_init.c
@@ -292,6 +292,13 @@ static struct sdw_intel_ctx
 	return NULL;
 }
 
+static void sdw_intel_remove_controller(struct sdw_intel_ctx *ctx)
+{
+	kfree(ctx->ids);
+	kfree(ctx->ldev);
+	kfree(ctx);
+}
+
 static int
 sdw_intel_startup_controller(struct sdw_intel_ctx *ctx)
 {
@@ -360,6 +367,18 @@ struct sdw_intel_ctx
 }
 EXPORT_SYMBOL_NS(sdw_intel_probe, SOUNDWIRE_INTEL_INIT);
 
+/**
+ * sdw_intel_remove() - SoundWire Intel remove routine
+ * @ctx: SoundWire context allocated in the probe
+ *
+ * Free all the context created by sdw_intel_probe.
+ */
+void sdw_intel_remove(struct sdw_intel_ctx *ctx)
+{
+	return sdw_intel_remove_controller(ctx);
+}
+EXPORT_SYMBOL_NS(sdw_intel_remove, SOUNDWIRE_INTEL_INIT);
+
 /**
  * sdw_intel_startup() - SoundWire Intel startup
  * @ctx: SoundWire context allocated in the probe
@@ -376,14 +395,11 @@ EXPORT_SYMBOL_NS(sdw_intel_startup, SOUNDWIRE_INTEL_INIT);
  * sdw_intel_exit() - SoundWire Intel exit
  * @ctx: SoundWire context allocated in the probe
  *
- * Delete the controller instances created and cleanup
+ * Stop the controller instances.
  */
 void sdw_intel_exit(struct sdw_intel_ctx *ctx)
 {
 	sdw_intel_cleanup(ctx);
-	kfree(ctx->ids);
-	kfree(ctx->ldev);
-	kfree(ctx);
 }
 EXPORT_SYMBOL_NS(sdw_intel_exit, SOUNDWIRE_INTEL_INIT);
 
diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 2e9fd91572d4..7f7327cab712 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -282,6 +282,8 @@ void sdw_intel_process_wakeen_event(struct sdw_intel_ctx *ctx);
 struct sdw_intel_ctx *
 sdw_intel_probe(struct sdw_intel_res *res);
 
+void sdw_intel_remove(struct sdw_intel_ctx *ctx);
+
 int sdw_intel_startup(struct sdw_intel_ctx *ctx);
 
 void sdw_intel_exit(struct sdw_intel_ctx *ctx);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 8639ea63a10d..ee67e21e739f 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -241,8 +241,10 @@ static int hda_sdw_exit(struct snd_sof_dev *sdev)
 
 	hda_sdw_int_enable(sdev, false);
 
-	if (hdev->sdw)
+	if (hdev->sdw) {
 		sdw_intel_exit(hdev->sdw);
+		sdw_intel_remove(hdev->sdw);
+	}
 	hdev->sdw = NULL;
 
 	return 0;
-- 
2.30.2

