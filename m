Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E94D6571978
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 14:10:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F0EC166A;
	Tue, 12 Jul 2022 14:09:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F0EC166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657627831;
	bh=eDBQXFtU9rYNg57EWdjtL78HYQA0m60zKAU+FQbNfEY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g+zVfUrJn1hSXRaDOQhZEQFaB+bXj8b+7Z2HIVzjdEebrp19PA8/FFdGUCnCDWqux
	 2yKVJoxxlranzSaXv3+Z6cALGV3P3WpIedVkGNi0A0cr9B39D8MqHR+w/zx3LZeai8
	 tobuiy8SeB3t7lWM0+Fn+orcCi9lUvf1dk3frW/s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C15AF804FF;
	Tue, 12 Jul 2022 14:09:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2109F80279; Tue, 12 Jul 2022 14:08:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58841F8023B
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 14:08:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58841F8023B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="U/lE1TSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657627736; x=1689163736;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eDBQXFtU9rYNg57EWdjtL78HYQA0m60zKAU+FQbNfEY=;
 b=U/lE1TSEqj/DlBYT7/977malDPkdL3+GFbXN6jy41WLztQOo1CePWytm
 O1FyLqk4W4dNo5opvreIuqf8Q0zNa1v2+TeRHumN5+M3uke9YeShQjX3X
 I9OicDoTZ3laps+a6I3v2anKV1gf0qn3gBsy7A9qe3LWBDyuGgK/mzfOI
 9MQDS0DyxSp4vceYZV+20bZrfIwYo8STw6A+DEOpLyCClISY1iJJ1ekZL
 atRNsm+BXC1aAmU5hTZM2gF4mF/imjCspr7AQOk0O7qSjPbJ3uyYRDR8n
 JgYxlSzzRM6DzPgj1f6Ddqa8pnXabhTaDf/ZVcFCR0r4RjvcSYwVWHfOF w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="371225548"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="371225548"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:08:53 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="545403352"
Received: from ahedstro-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.249.254.175])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 05:08:50 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com, broonie@kernel.org,
 pierre-louis.bossart@linux.intel.com
Subject: [PATCH 1/2] ASoC: SOF: Intel: hda: Introduce skip_imr_boot flag
Date: Tue, 12 Jul 2022 15:09:35 +0300
Message-Id: <20220712120936.28072-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220712120936.28072-1-peter.ujfalusi@linux.intel.com>
References: <20220712120936.28072-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com
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

Use a dedicated flag instead of directly checking the
sdev->system_suspend_target to decide if we need to skip IMR boot due to
too deep sleep state where the memory used for IMR booting will not retain
its content.

The skip_imr_boot flag will be set true during suspend if the target state
is deeper than S3 and reset back to false on successful boot to re-enable
IMR booting in shallower sleep states.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-dsp.c    |  7 +++++++
 sound/soc/sof/intel/hda-loader.c | 10 ++++++----
 sound/soc/sof/intel/hda.h        |  1 +
 3 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 2afaee91b982..eddfd77ad90f 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -617,6 +617,13 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 #endif
 	int ret, j;
 
+	/*
+	 * The memory used for IMR boot loses its content in deeper than S3 state
+	 * We must not try IMR boot on next power up (as it will fail).
+	 */
+	if (sdev->system_suspend_target > SOF_SUSPEND_S3)
+		hda->skip_imr_boot = true;
+
 	hda_sdw_int_enable(sdev, false);
 
 	/* disable IPC interrupts */
diff --git a/sound/soc/sof/intel/hda-loader.c b/sound/soc/sof/intel/hda-loader.c
index 819b3b08c655..eb22eb3f6fee 100644
--- a/sound/soc/sof/intel/hda-loader.c
+++ b/sound/soc/sof/intel/hda-loader.c
@@ -395,8 +395,7 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	struct snd_dma_buffer dmab;
 	int ret, ret1, i;
 
-	if (sdev->system_suspend_target < SOF_SUSPEND_S4 &&
-	    hda->imrboot_supported && !sdev->first_boot) {
+	if (hda->imrboot_supported && !sdev->first_boot && !hda->skip_imr_boot) {
 		dev_dbg(sdev->dev, "IMR restore supported, booting from IMR directly\n");
 		hda->boot_iteration = 0;
 		ret = hda_dsp_boot_imr(sdev);
@@ -480,11 +479,14 @@ int hda_dsp_cl_boot_firmware(struct snd_sof_dev *sdev)
 	 */
 	hda->boot_iteration = HDA_FW_BOOT_ATTEMPTS;
 	ret = hda_cl_copy_fw(sdev, hext_stream);
-	if (!ret)
+	if (!ret) {
 		dev_dbg(sdev->dev, "Firmware download successful, booting...\n");
-	else
+		hda->skip_imr_boot = false;
+	} else {
 		snd_sof_dsp_dbg_dump(sdev, "Firmware download failed",
 				     SOF_DBG_DUMP_PCI | SOF_DBG_DUMP_MBOX);
+		hda->skip_imr_boot = true;
+	}
 
 cleanup:
 	/*
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index dc713c20ba1d..2b4d23af6054 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -419,6 +419,7 @@ enum sof_hda_D0_substate {
 /* represents DSP HDA controller frontend - i.e. host facing control */
 struct sof_intel_hda_dev {
 	bool imrboot_supported;
+	bool skip_imr_boot;
 
 	int boot_iteration;
 
-- 
2.37.0

