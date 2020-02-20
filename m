Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAFA166417
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 18:13:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3B02316C7;
	Thu, 20 Feb 2020 18:12:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3B02316C7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582218829;
	bh=DbjSktjnjF9bWwOa0q/jkJTobpw9HwhfaF9UduxOIXs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rxyAN1Njgz3zKh6FewULPRxRx4hYFBaLN6EnLOAdkKByTCkpF4NpC7G4JyLPtkueT
	 Xxh+JvDhOYE7zYruChjKazpCiPlSA2+UQCv6JAeEMKVCinjfK7Vs+uXp3cKHkGBrMJ
	 AFkPPRqyONYsiN+Bu9GxAJKlcyFbL9EJhvknkMzU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D104F8028A;
	Thu, 20 Feb 2020 18:11:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65F54F80145; Thu, 20 Feb 2020 18:11:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1E4F9F80114
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 18:10:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1E4F9F80114
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Feb 2020 09:10:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,465,1574150400"; d="scan'208";a="408850003"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga005.jf.intel.com with ESMTP; 20 Feb 2020 09:10:38 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ASoC: SOF: Intel: hda: allow operation without i915 gfx
Date: Thu, 20 Feb 2020 19:10:28 +0200
Message-Id: <20200220171028.22023-3-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200220171028.22023-1-kai.vehmanen@linux.intel.com>
References: <20200220171028.22023-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, ranjani.sridharan@linux.intel.com
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

Add support to configure the HDA controller with an external HDA
codec even if iDisp codec in i915 is not available.

This can happen for multiple reasons:
 - internal graphics is disabled on the system
 - i915 driver is not enabled in kernel or it fails to init
 - i915 codec reports error in HDA codec probe
 - HDA codec driver probe fails

Address all these scenarios, but keep using the existing topology.
In case failures occur, HDMI PCM nodes are created, but they will
report error if application tries to use them. No ALSA mixer controls
are created. If the external HDA codec init fails as well, SOF probe
will return error as before.

BugLink: https://github.com/thesofproject/linux/issues/1658
BugLink: https://bugzilla.opensuse.org/show_bug.cgi?id=1163677
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=206085
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 11 ++++++++++-
 sound/soc/sof/intel/hda.c       | 22 ++++++++--------------
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index ff45075ef720..3041fbbb010a 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -113,8 +113,14 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (ret < 0)
 		return ret;
 
-	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL)
+	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL) {
+		if (!hdev->bus->audio_component) {
+			dev_dbg(sdev->dev,
+				"iDisp hw present but no driver\n");
+			return -ENOENT;
+		}
 		hda_priv->need_display_power = true;
+	}
 
 	/*
 	 * if common HDMI codec driver is not used, codec load
@@ -203,6 +209,9 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
+	if (!bus->audio_component)
+		return 0;
+
 	/* power down unconditionally */
 	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 35a61b19a8e2..6539fa63ea7a 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -520,10 +520,8 @@ static int hda_init(struct snd_sof_dev *sdev)
 
 	/* init i915 and HDMI codecs */
 	ret = hda_codec_i915_init(sdev);
-	if (ret < 0) {
-		dev_err(sdev->dev, "error: init i915 and HDMI codec failed\n");
-		return ret;
-	}
+	if (ret < 0)
+		dev_warn(sdev->dev, "init of i915 and HDMI codec failed\n");
 
 	/* get controller capabilities */
 	ret = hda_dsp_ctrl_get_caps(sdev);
@@ -600,9 +598,6 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	if (ret < 0) {
 		dev_err(bus->dev, "error: init chip failed with ret: %d\n",
 			ret);
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-		hda_codec_i915_exit(sdev);
-#endif
 		return ret;
 	}
 
@@ -642,7 +637,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
 
 	if (!HDA_IDISP_CODEC(bus->codec_mask))
-		hda_codec_i915_exit(sdev);
+		hda_codec_i915_display_power(sdev, false);
 
 	/*
 	 * we are done probing so decrement link counts
@@ -971,12 +966,11 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 		/*
 		 * If no machine driver is found, then:
 		 *
-		 * hda machine driver is used if :
-		 * 1. there is one HDMI codec and one external HDAudio codec
-		 * 2. only HDMI codec
+		 * generic hda machine driver can handle:
+		 *  - one HDMI codec, and/or
+		 *  - one external HDAudio codec
 		 */
-		if (!pdata->machine && codec_num <= 2 &&
-		    HDA_IDISP_CODEC(bus->codec_mask)) {
+		if (!pdata->machine && codec_num <= 2) {
 			hda_mach = snd_soc_acpi_intel_hda_machines;
 
 			/* topology: use the info from hda_machines */
@@ -986,7 +980,7 @@ static int hda_generic_machine_select(struct snd_sof_dev *sdev)
 			dev_info(bus->dev, "using HDA machine driver %s now\n",
 				 hda_mach->drv_name);
 
-			if (codec_num == 1)
+			if (codec_num == 1 && HDA_IDISP_CODEC(bus->codec_mask))
 				idisp_str = "-idisp";
 			else
 				idisp_str = "";
-- 
2.17.1

