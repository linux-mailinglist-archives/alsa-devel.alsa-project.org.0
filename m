Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB55113707
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Dec 2019 22:24:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 988D91673;
	Wed,  4 Dec 2019 22:23:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 988D91673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575494652;
	bh=QVxPsyax75/VAN1MgPHXcgRStPiSN9nQzGRdcTAv838=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tI4x7sjaVUNPJrn0SfktGfreRfL3F1+0COyOVuGWO5v25uEqXF2x+NN1VH32GrUKT
	 AWfoyFZEQYHys4cKbLOC5xVGQ7GRTt022QHs/uvSy3dHEs/24+ZMgZxS9X7QXm3Hd4
	 2DDiS+SKqnvn1aCjywmEuh+dArjdxjNN3tzUFaQw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 337BAF802A1;
	Wed,  4 Dec 2019 22:16:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D87AF80253; Wed,  4 Dec 2019 22:16:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE3FCF8023E
 for <alsa-devel@alsa-project.org>; Wed,  4 Dec 2019 22:16:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE3FCF8023E
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Dec 2019 13:16:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,278,1571727600"; d="scan'208";a="223378693"
Received: from rgolani-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.153.236])
 by orsmga002.jf.intel.com with ESMTP; 04 Dec 2019 13:16:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Wed,  4 Dec 2019 15:15:56 -0600
Message-Id: <20191204211556.12671-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
References: <20191204211556.12671-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org, Daniel Baluta <daniel.baluta@nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH v2 13/13] ASoC: SOF: nocodec: Amend arguments
	for sof_nocodec_setup()
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

Set the drv_name and tplg_filename for nocodec
machine driver in sof_machine_check().
This means the sof_nocodec_setup() does not
need the mach, plat_data or desc arguments any longer.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof.h       | 3 ---
 sound/soc/sof/nocodec.c   | 9 ---------
 sound/soc/sof/sof-audio.c | 5 ++++-
 3 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/include/sound/sof.h b/include/sound/sof.h
index 96625355aa94..6ea74f1a9ec2 100644
--- a/include/sound/sof.h
+++ b/include/sound/sof.h
@@ -97,8 +97,5 @@ struct sof_dev_desc {
 };
 
 int sof_nocodec_setup(struct device *dev,
-		      struct snd_sof_pdata *sof_pdata,
-		      struct snd_soc_acpi_mach *mach,
-		      const struct sof_dev_desc *desc,
 		      const struct snd_sof_dsp_ops *ops);
 #endif
diff --git a/sound/soc/sof/nocodec.c b/sound/soc/sof/nocodec.c
index 56d887545da3..2233146386cc 100644
--- a/sound/soc/sof/nocodec.c
+++ b/sound/soc/sof/nocodec.c
@@ -63,20 +63,11 @@ static int sof_nocodec_bes_setup(struct device *dev,
 }
 
 int sof_nocodec_setup(struct device *dev,
-		      struct snd_sof_pdata *sof_pdata,
-		      struct snd_soc_acpi_mach *mach,
-		      const struct sof_dev_desc *desc,
 		      const struct snd_sof_dsp_ops *ops)
 {
 	struct snd_soc_dai_link *links;
 	int ret;
 
-	if (!mach)
-		return -EINVAL;
-
-	mach->drv_name = "sof-nocodec";
-	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
-
 	/* create dummy BE dai_links */
 	links = devm_kzalloc(dev, sizeof(struct snd_soc_dai_link) *
 			     ops->num_drv, GFP_KERNEL);
diff --git a/sound/soc/sof/sof-audio.c b/sound/soc/sof/sof-audio.c
index 9c3851bfe788..0d8f65b9ae25 100644
--- a/sound/soc/sof/sof-audio.c
+++ b/sound/soc/sof/sof-audio.c
@@ -396,7 +396,10 @@ int sof_machine_check(struct snd_sof_dev *sdev)
 	if (!mach)
 		return -ENOMEM;
 
-	ret = sof_nocodec_setup(sdev->dev, sof_pdata, mach, desc, desc->ops);
+	mach->drv_name = "sof-nocodec";
+	sof_pdata->tplg_filename = desc->nocodec_tplg_filename;
+
+	ret = sof_nocodec_setup(sdev->dev, desc->ops);
 	if (ret < 0)
 		return ret;
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
