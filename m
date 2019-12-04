Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A729B113700
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:22:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D6271674;
	Wed,  4 Dec 2019 22:21:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D6271674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494531;
	bh=Mm9V29rwGIwk7KCHN24WyAbJsc7XAu/Hq4tIEmLcEYs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHn1DJIfEZd3dXsNn2SaupO53c0oVnX7pxWxVHyJB8kqpGlvEwLbBs7C8dN/C8/LV
	 gn5igytlK9Os764cyPXoOVn6sQjf9ntnvHxsJ2KSs0gY6bpcLLc2EhX6bb+Kr4t74e
	 P6GSi00R60/tEI5l6/EmT0zmzaxEogCLNflOhQ1E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52AB8F8026A;
	Wed,  4 Dec 2019 22:16:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70CDBF80234; Wed,  4 Dec 2019 22:16:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47491F80216
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47491F80216
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378583"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:15 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:49 -0600
Message-Id: <20191204211556.12671-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 06/13] ASoC: SOF: core: move check for
	runtime callbacks to core
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

From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>

For some platforms, the refcount is explicitly incremented
to prevent it from entering runtime suspend. This
should be be done during probe in the core instead
of being done in the PCM driver.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/core.c | 8 ++++++++
 sound/soc/sof/pcm.c  | 8 --------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
index 6a7f342203e9..d8446fb9fdde 100644
--- a/sound/soc/sof/core.c
+++ b/sound/soc/sof/core.c
@@ -355,6 +355,14 @@ static int sof_probe_continue(struct snd_sof_dev *sdev)
 	dev_dbg(sdev->dev, "created machine %s\n",
 		dev_name(&plat_data->pdev_mach->dev));
 
+	/*
+	 * Some platforms in SOF, ex: BYT, may not have their platform PM
+	 * callbacks set. Increment the usage count so as to
+	 * prevent the device from entering runtime suspend.
+	 */
+	if (!sof_ops(sdev)->runtime_suspend || !sof_ops(sdev)->runtime_resume)
+		pm_runtime_get_noresume(sdev->dev);
+
 	if (plat_data->sof_probe_complete)
 		plat_data->sof_probe_complete(sdev->dev);
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index 9fd73ef08904..a9c47f6bf657 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -741,14 +741,6 @@ static int sof_pcm_probe(struct snd_soc_component *component)
 		return ret;
 	}
 
-	/*
-	 * Some platforms in SOF, ex: BYT, may not have their platform PM
-	 * callbacks set. Increment the usage count so as to
-	 * prevent the device from entering runtime suspend.
-	 */
-	if (!sof_ops(sdev)->runtime_suspend || !sof_ops(sdev)->runtime_resume)
-		pm_runtime_get_noresume(sdev->dev);
-
 	return ret;
 }
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
