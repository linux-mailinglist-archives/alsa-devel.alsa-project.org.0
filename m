Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635783D4B
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2019 00:21:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F146215E5;
	Wed,  7 Aug 2019 00:21:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F146215E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565130113;
	bh=KcvidpOSre7mmaH6VmvFHfi3TYu0ttA/nkAKieztvu8=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LwRPZsHRb4vqmmZ2EEcpjotcOt/oeTc7fxdaSwa2pMAkF3vC8UH5Ahl5ZAA1MM1vS
	 8/9rewoingVUS+XxlqxzeIVg0X+KxaWIrrAfNu1aiikIQs2TyvGBLNgeDUlmOp+0fy
	 3JqnHwy0IJZdjFhkaHdMGu99EOmxQAABxfX/IOYg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 49F2DF80483;
	Wed,  7 Aug 2019 00:20:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EEC2BF80483; Wed,  7 Aug 2019 00:20:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06F36F8011B
 for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2019 00:20:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06F36F8011B
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Aug 2019 15:19:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,353,1559545200"; d="scan'208";a="185796194"
Received: from ycohen-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.254.108.178])
 by orsmga002.jf.intel.com with ESMTP; 06 Aug 2019 15:19:58 -0700
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: alsa-devel@alsa-project.org
Date: Tue,  6 Aug 2019 15:19:58 -0700
Message-Id: <20190806221958.19180-1-ranjani.sridharan@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, broonie@kernel.org, pierre-louis.bossart@linux.intel.com
Subject: [alsa-devel] [PATCH] ASoC: SOF: Intel: hda: Initialize HDA
	controller after i915 init
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On some platforms, sound card registration fails when a HDMI
monitor is not connected. This is caused by a recent commit
that switched the order in which the HDA controller and the
i915 are initialized. Initializing the i915 before initializing
the HDA controller fixes the problem.

Fixes: be1b577d01787c ("ASoC: SOF: Intel: hda: fix the hda init chip"
Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 79cce20666b6..724a494702fa 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -335,10 +335,23 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->ppcap)
 		dev_dbg(sdev->dev, "PP capability, will probe DSP later.\n");
 
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+	/* init i915 and HDMI codecs */
+	ret = hda_codec_i915_init(sdev);
+	if (ret < 0) {
+		dev_err(sdev->dev, "error: init i915 and HDMI codec failed\n");
+		return ret;
+	}
+#endif
+
+	/* Init HDA controller after i915 init */
 	ret = hda_dsp_ctrl_init_chip(sdev, true);
 	if (ret < 0) {
 		dev_err(bus->dev, "error: init chip failed with ret: %d\n",
 			ret);
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+		hda_codec_i915_exit(sdev);
+#endif
 		return ret;
 	}
 
@@ -346,13 +359,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (bus->mlcap)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
-	/* init i915 and HDMI codecs */
-	ret = hda_codec_i915_init(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: no HDMI audio devices found\n");
-		return ret;
-	}
-
 	/* codec detection */
 	if (!bus->codec_mask) {
 		dev_info(bus->dev, "no hda codecs found!\n");
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
