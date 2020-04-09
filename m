Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A32C1A39F2
	for <lists+alsa-devel@lfdr.de>; Thu,  9 Apr 2020 20:47:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E50C61692;
	Thu,  9 Apr 2020 20:46:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E50C61692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586458051;
	bh=f0yU0CuR/ZMjd39XKLnPTvknW9m4vwkLPdqnMig48Fo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mlcION9/aF6MC2c/jwUyig6UWbdjikDelPmQkBVciQGOz3arsr9/VJQkAoH2zgn7B
	 0fuxAOssZzhHTXgIopH4AARfJGlpmlgdoZgsrSCHOzQBcAP/dSgjCex4xeygUb9Huq
	 gUyWV1dAVN7J445zbUrbLeeeG16Wcbq7LJKGPW3c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EA21F8028A;
	Thu,  9 Apr 2020 20:44:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1243CF80213; Thu,  9 Apr 2020 20:44:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E836BF80107
 for <alsa-devel@alsa-project.org>; Thu,  9 Apr 2020 20:44:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E836BF80107
IronPort-SDR: Y35IEx9wqOaaeaFrObhHvmRgWWMcJ6c9vXAxOaARTZU6DgYfGDUCFqxWiq4KXZgPfMl3x+Gz5e
 i/85LPIQ6y9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2020 11:44:32 -0700
IronPort-SDR: UaQIZ+qNSLSpJc/jGL/r5ptXRBQFT94RZ/NXwyIK0Tp8Whl4+ODhISjrXvmMuqhs7r9f2EdoQV
 PRPFTRhj8dXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; d="scan'208";a="251981342"
Received: from davidadu-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.212.151.218])
 by orsmga003.jf.intel.com with ESMTP; 09 Apr 2020 11:44:31 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: SOF: Intel: hda: reduce verbosity on SoundWire
 detection
Date: Thu,  9 Apr 2020 13:44:14 -0500
Message-Id: <20200409184416.15591-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200409184416.15591-1-pierre-louis.bossart@linux.intel.com>
References: <20200409184416.15591-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, broonie@kernel.org
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

No need to report an error when SoundWire is not detected (not present
in hardware or not exposed in ACPI). Move to dev_dbg to state that
SoundWire is skipped.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 211e91e79eae..6cbe2edc868c 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -135,10 +135,8 @@ static int hda_sdw_acpi_scan(struct snd_sof_dev *sdev)
 	hdev = sdev->pdata->hw_pdata;
 
 	ret = sdw_intel_acpi_scan(handle, &hdev->info);
-	if (ret < 0) {
-		dev_err(sdev->dev, "%s failed\n", __func__);
+	if (ret < 0)
 		return -EINVAL;
-	}
 
 	return 0;
 }
@@ -604,7 +602,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	/* scan SoundWire capabilities exposed by DSDT */
 	ret = hda_sdw_acpi_scan(sdev);
 	if (ret < 0) {
-		dev_dbg(sdev->dev, "skipping SoundWire, ACPI scan error\n");
+		dev_dbg(sdev->dev, "skipping SoundWire, not detected with ACPI scan\n");
 		goto skip_soundwire;
 	}
 
-- 
2.20.1

