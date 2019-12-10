Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A1289117CB1
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 01:53:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2308C1681;
	Tue, 10 Dec 2019 01:52:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2308C1681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575939212;
	bh=NlbFGpxKOenzubCuvgMwOxjqtHcmCgEshkB5HpyyIaQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rjcfEIuLKCZ5CxC/xzUaBFJbI1POMsPFnOtMlYx7Nk1FxVdWk3PZ+CrbNUJcvoM7h
	 FMMRQQDUhzRSBH2BquoM1pEj3ljH+34c2X8ZJob0J0ymhd30QzCQQhSXW5ynCxuHz9
	 0rxL7wF83O2pOZcuWfOuOruuHYmATlIc6MoEtrMg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7EC04F80272;
	Tue, 10 Dec 2019 01:49:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C815FF8025F; Tue, 10 Dec 2019 01:49:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 99B92F80257
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 01:49:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 99B92F80257
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 16:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,297,1571727600"; d="scan'208";a="215398965"
Received: from sneuhier-mobl.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.254.188.78])
 by orsmga003.jf.intel.com with ESMTP; 09 Dec 2019 16:49:09 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Mon,  9 Dec 2019 18:48:53 -0600
Message-Id: <20191210004854.16845-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
References: <20191210004854.16845-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Cc: tiwai@suse.de, broonie@kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] [PATCH 7/8] ASoC: SOF: Intel: byt: fixup topology
	filename for BYT-CR
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

On Baytrail-CR, SSP0 needs to be used instead of SSP2.  The
substitution is assumed to be done in the topology file.

When Baytrail-CR is detected, add -ssp0 suffix to the topology file
name so that the topology code picks up the correct file.

Tested on Asus T100TAF

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/byt.c | 47 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index d0db581348af..d43098a962c0 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -18,6 +18,7 @@
 #include "../ops.h"
 #include "shim.h"
 #include "../sof-audio.h"
+#include "../../intel/common/soc-intel-quirks.h"
 
 /* DSP memories */
 #define IRAM_OFFSET		0x0C0000
@@ -384,11 +385,37 @@ static int byt_reset(struct snd_sof_dev *sdev)
 	return 0;
 }
 
+static const char *fixup_tplg_name(struct snd_sof_dev *sdev,
+				   const char *sof_tplg_filename,
+				   const char *ssp_str)
+{
+	const char *tplg_filename = NULL;
+	char *filename;
+	char *split_ext;
+
+	filename = devm_kstrdup(sdev->dev, sof_tplg_filename, GFP_KERNEL);
+	if (!filename)
+		return NULL;
+
+	/* this assumes a .tplg extension */
+	split_ext = strsep(&filename, ".");
+	if (split_ext) {
+		tplg_filename = devm_kasprintf(sdev->dev, GFP_KERNEL,
+					       "%s-%s.tplg",
+					       split_ext, ssp_str);
+		if (!tplg_filename)
+			return NULL;
+	}
+	return tplg_filename;
+}
+
 static void byt_machine_select(struct snd_sof_dev *sdev)
 {
 	struct snd_sof_pdata *sof_pdata = sdev->pdata;
 	const struct sof_dev_desc *desc = sof_pdata->desc;
 	struct snd_soc_acpi_mach *mach;
+	struct platform_device *pdev;
+	const char *tplg_filename;
 
 	mach = snd_soc_acpi_find_machine(desc->machines);
 	if (!mach) {
@@ -396,7 +423,25 @@ static void byt_machine_select(struct snd_sof_dev *sdev)
 		return;
 	}
 
-	sof_pdata->tplg_filename = mach->sof_tplg_filename;
+	pdev = to_platform_device(sdev->dev);
+	if (soc_intel_is_byt_cr(pdev)) {
+		dev_dbg(sdev->dev,
+			"BYT-CR detected, SSP0 used instead of SSP2\n");
+
+		tplg_filename = fixup_tplg_name(sdev,
+						mach->sof_tplg_filename,
+						"ssp0");
+	} else {
+		tplg_filename = mach->sof_tplg_filename;
+	}
+
+	if (!tplg_filename) {
+		dev_dbg(sdev->dev,
+			"error: no topology filename\n");
+		return;
+	}
+
+	sof_pdata->tplg_filename = tplg_filename;
 	mach->mach_params.acpi_ipc_irq_index = desc->irqindex_host_ipc;
 	sof_pdata->machine = mach;
 }
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
