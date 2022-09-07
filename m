Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D945B0189
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Sep 2022 12:17:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 03E691687;
	Wed,  7 Sep 2022 12:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 03E691687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662545844;
	bh=7fMGZsHrUkanG1P92mPlVcUdOm+xsIxE2oJ00mjYTQc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QQPReueWfpu7DKSDi1+ZILiDgpj8jhIWy0pD/q081C/Av7V9zkCsWnI4lsRoNpTV5
	 BzbjdxGBBpZC1Bt+R1BtFckm6A6XsHNprJtOcnz/NGDgW6KUJSeO6mN62FYNKg2vPS
	 qKkW0BNzOZwZPe+0Sb7fl63phBJUW8SSzeu90IG8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B138DF80589;
	Wed,  7 Sep 2022 12:14:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D38B2F80533; Wed,  7 Sep 2022 12:14:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 28519F80533;
 Wed,  7 Sep 2022 12:14:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28519F80533
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="YVgoR3D7"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2877rCJs005930;
 Wed, 7 Sep 2022 05:14:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=Gp/uTF8GDKPfyMeYGc1Hdj6y6PqGS+VgIG+UYR8B8FI=;
 b=YVgoR3D7kVWQjD+AOI9dk/3aSCFFDAFS0d6X4Tk5P+vVREuYDnUmmcMXf32moX0Rcxup
 SDYTXKsG4tC85yuYO565v4dfNc2C4j3NIJjEUN03fNmm43NZs73jVqWkXArm1BOlIPkE
 1I0ktAm8QzJj47Ft4qSWIv1TqL6DHQZQ/3hTwmhyco1K91JezrAqDl0ax0jBZg9jfwT2
 ms/02XIiPRKmXbHJ9qIm9H+b+/qfwH5IS0Q0PLUtJkQTwUBeKC6/uG+COIaR4fNxIzgn
 b4e3eaa1Z4os/BQcKNy8olSmKBrFq04+Xtryec42I1u4zNngVCbESOMPpGWE5o26JQ0d 9w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3jc3bpw4sr-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Sep 2022 05:14:15 -0500
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.12; Wed, 7 Sep
 2022 05:14:14 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.12 via Frontend Transport; Wed, 7 Sep 2022 05:14:14 -0500
Received: from debianA11184.ad.cirrus.com (unknown [198.61.65.149])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 88D7E7C;
 Wed,  7 Sep 2022 10:14:13 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <vkoul@kernel.org>, <yung-chuan.liao@linux.intel.com>,
 <pierre-louis.bossart@linux.intel.com>, <lgirdwood@gmail.com>,
 <peter.ujfalusi@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
 <kai.vehmanen@linux.intel.com>, <daniel.baluta@nxp.com>,
 <sanyog.r.kale@intel.com>, <broonie@kernel.org>
Subject: [PATCH 3/7] ASoC: SOF: Intel: Don't disable Soundwire interrupt
 before the bus has shut down
Date: Wed, 7 Sep 2022 11:13:58 +0100
Message-ID: <20220907101402.4685-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220907101402.4685-1-rf@opensource.cirrus.com>
References: <20220907101402.4685-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Hg_XoDk6Sv5Mpmkzh2SnQIEICaF7KUDS
X-Proofpoint-ORIG-GUID: Hg_XoDk6Sv5Mpmkzh2SnQIEICaF7KUDS
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

Until the Soundwire child drivers have been removed and the bus driver has
shut down any of them can still be actively doing something. And any of
them may need bus transactions to shut down their hardware. So the
Soundwire interrupt must not be disabled until the point that nothing can
be using it.

Normally it is up to the driver using the interrupt to ensure that it
doesn't break if there is an interrupt while it is shutting down. However,
the design of the Intel drivers means that the Soundwire bus driver doesn't
have control of its own interrupt - instead its interrupt handler is called
externally by the code in hda.c. Therefore hda.c must shutdown the bus
before disabling the interrupt and freeing the context memory.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/sof/intel/hda.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index ee67e21e739f..34f5de052bc0 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -236,17 +236,25 @@ int hda_sdw_startup(struct snd_sof_dev *sdev)
 static int hda_sdw_exit(struct snd_sof_dev *sdev)
 {
 	struct sof_intel_hda_dev *hdev;
+	void *tmp_sdw;
 
 	hdev = sdev->pdata->hw_pdata;
-
-	hda_sdw_int_enable(sdev, false);
-
-	if (hdev->sdw) {
+	if (hdev->sdw)
 		sdw_intel_exit(hdev->sdw);
-		sdw_intel_remove(hdev->sdw);
-	}
+
+	/* The bus has now stopped so the interrupt can be disabled */
+	hda_sdw_int_enable(sdev, false);
+
+	/* Wait for last run of irq handler to complete */
+	synchronize_irq(sdev->ipc_irq);
+
+	/* Stop using the pointer */
+	tmp_sdw = hdev->sdw;
 	hdev->sdw = NULL;
 
+	if (tmp_sdw)
+		sdw_intel_remove(tmp_sdw);
+
 	return 0;
 }
 
-- 
2.30.2

