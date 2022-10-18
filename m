Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E62D602B69
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 14:13:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30E683FFC;
	Tue, 18 Oct 2022 14:12:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30E683FFC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666095201;
	bh=/OrsMGgNbcw0aPpY+4FXeVq9ye7nQn+4OqOdKHM8WkY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F1fE5mZAIi6gnGqcfU/UtovCpsrFaudKLNXs+uIb1dsDyMGYijkjVEyThiA3I/4Pr
	 Nsjfq001zSEzkemq43rgR8LwxjqbiiSzaYg13jvZ3WlUbAnA3ziU1oqAV5m+4h7KYX
	 7M00FL49BmpnVTvZqBo4OJ9kE6nCCXzeOr00ZAZ4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49BB4F805B6;
	Tue, 18 Oct 2022 14:09:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7FB50F80571; Tue, 18 Oct 2022 14:09:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2FCC6F8057E
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 14:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2FCC6F8057E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="dBIFBJtl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666094973; x=1697630973;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/OrsMGgNbcw0aPpY+4FXeVq9ye7nQn+4OqOdKHM8WkY=;
 b=dBIFBJtlgAuBkv8ToKHIwJme3bvS7WPTXZ6XSHFQfkFlM7gLLYAbniRY
 z75wvRWdFAiJMTt9Hg5ucp9GyMBsfVxYoe+KIB5/urjwJCX26rq6b6+7k
 mTtBjPeFseUaijRhVvdnZOv+kUY1hCg/tw/JzAwb/ziciyUqBV9WyRCMP
 7/ObzzNQZBGxUe0Nohs2qoDOU99Qu2z4uQJbbOQ0xsPMV8/Tt/DeQfv+t
 a2WllUUu084n2YGExr7bsN8Bu6rw+80VlkoOutgxoP+St1k/rjqWLrvKg
 /R92jZErcAc6w08O5ywSNl4JOuMd2md6plGnSWXVhG9FYkoej4xx4OyAS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="293452993"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="293452993"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:31 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="579758022"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="579758022"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.27.127])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 05:09:29 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 14/19] ASoC: SOF: Intel: hda: Add flag to indicate that the
 firmware is IMR booted
Date: Tue, 18 Oct 2022 15:09:11 +0300
Message-Id: <20221018120916.19820-15-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: chao.song@intel.com, alsa-devel@alsa-project.org,
 pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com
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

Dynamic loading of external libraries should not be done if the firmware
was booted from IMR since in that case the libraries will be restored along
with the basefw.

The booted_from_imr flag is introduced and set to true if the IMR boot was
successful and to false if cold booting is executed.

The reason for the new flag is that guessing from existing flags, used to
decide if we should try booting from IMR or not is not going to be robust
as the IMR boot itself can fail and in that case a full, cold boot is
executed.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Chao Song <chao.song@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-loader.c | 6 +++++-
 sound/soc/sof/intel/hda.h        | 1 +
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 147ddc5ee932..5ed524e166d2 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -396,12 +396,16 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
 		hda->boot_iteration = 0;
 		ret = hda_dsp_boot_imr(sdev);
-		if (!ret)
+		if (!ret) {
+			hda->booted_from_imr = true;
 			return 0;
+		}
 
 		dev_warn(sdev->dev, "IMR restore failed, trying to cold boot\n");
 	}
 
+	hda->booted_from_imr = false;
+
 	chip_info = desc->chip_info;
 
 	if (sdev->basefw.fw->size <= sdev->basefw.payload_offset) {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 2ab3c3840b92..d004bcbb6326 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -481,6 +481,7 @@ enum sof_hda_D0_substate {
 struct sof_intel_hda_dev {
 	bool imrboot_supported;
 	bool skip_imr_boot;
+	bool booted_from_imr;
 
 	int boot_iteration;
 
-- 
2.38.0

