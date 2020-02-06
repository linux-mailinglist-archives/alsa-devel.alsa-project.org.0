Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C457154C9E
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 21:05:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D878A16D5;
	Thu,  6 Feb 2020 21:04:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D878A16D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581019527;
	bh=OnzuZkLDJVDDbhixUiMg/7IgV87TS63rINtntR6dbfM=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=u9MX25Tg67GgalGCXGl+n8XRjeUjATeYPRlEgiL2qM6ei0GJKjhkxIgS38WQkl0w0
	 pit3xUKk/2doXfTFXyfKfa4NKkibIgh4HQBMsamI9AtFWMoEIduqnTblz5qrQxv8oA
	 zbl2hsO33SWO6YuuB7trwOSjULOkgeWZQBVHeBEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8CEA0F80276;
	Thu,  6 Feb 2020 21:02:52 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0AF9F80248; Thu,  6 Feb 2020 21:02:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BE43CF80162
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 21:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BE43CF80162
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Feb 2020 12:02:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,410,1574150400"; d="scan'208";a="255197704"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by fmsmga004.fm.intel.com with ESMTP; 06 Feb 2020 12:02:35 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Thu,  6 Feb 2020 22:02:22 +0200
Message-Id: <20200206200223.7715-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200206200223.7715-1-kai.vehmanen@linux.intel.com>
References: <20200206200223.7715-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, pierre-louis.bossart@linux.intel.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, ranjani.sridharan@linux.intel.com
Subject: [alsa-devel] [PATCH 2/3] ASoC: SOF: Intel: hda: fix ordering bug in
	resume flow
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

When HDA controller is resumed from suspend, i915 HDMI/DP
codec requires that following order of actions is kept:

 - i915 display power up and configuration of link params
 - hda link reset and setup

Current SOF HDA code delegates display codec power control
to the codec driver. This works most of the time, but in
runtime PM sequences, the above constraint may be violated.
On platforms where BIOS values for HDA link parameters do
not match hardware reset defaults, this may lead to errors
in HDA verb transactions after resume.

Fix the issue by explicitly powering the display codec
in the HDA controller resume/suspend calls, thus ensuring
correct ordering. Special handling is needed for the D0i3
flow, where display power must be turned off even though
DSP is left powered.

Now that we have more invocations of the display power helper
functions, the conditional checks surrounding each call have
been moved inside hda_codec_i915_display_power(). The two
special cases of display powering at initial probe are handled
separately. The intent is to avoid powering the display whenever
no display codecs are used.

Note that early powering of display was removed in
commit 687ae9e287b3 ("ASoC: intel: skl: Fix display power regression").
This change was also copied to the SOF driver. No failures
have resulted as hardware default values for link parameters
have worked out of the box. However with recent i915 driver
changes like done in commit 87c1694533c9 ("drm/i915: save
AUD_FREQ_CNTRL state at audio domain suspend"), this does not
hold anymore and errors are hit.

Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 12 ++++++++----
 sound/soc/sof/intel/hda-dsp.c   | 11 +++++++++++
 sound/soc/sof/intel/hda.c       |  2 +-
 3 files changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 9106ab8dac6f..ff45075ef720 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -174,8 +174,10 @@ void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 
-	dev_dbg(bus->dev, "Turning i915 HDAC power %d\n", enable);
-	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, enable);
+	if (HDA_IDISP_CODEC(bus->codec_mask)) {
+		dev_dbg(bus->dev, "Turning i915 HDAC power %d\n", enable);
+		snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, enable);
+	}
 }
 EXPORT_SYMBOL_NS(hda_codec_i915_display_power, SND_SOC_SOF_HDA_AUDIO_CODEC_I915);
 
@@ -189,7 +191,8 @@ int hda_codec_i915_init(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		return ret;
 
-	hda_codec_i915_display_power(sdev, true);
+	/* codec_mask not yet known, power up for probe */
+	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, true);
 
 	return 0;
 }
@@ -200,7 +203,8 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int ret;
 
-	hda_codec_i915_display_power(sdev, false);
+	/* power down unconditionally */
+	snd_hdac_display_power(bus, HDA_CODEC_IDX_CONTROLLER, false);
 
 	ret = snd_hdac_i915_exit(bus);
 
diff --git a/sound/soc/sof/intel/hda-dsp.c b/sound/soc/sof/intel/hda-dsp.c
index 4a4d318f97ff..0848b79967a9 100644
--- a/sound/soc/sof/intel/hda-dsp.c
+++ b/sound/soc/sof/intel/hda-dsp.c
@@ -428,6 +428,9 @@ static int hda_suspend(struct snd_sof_dev *sdev, bool runtime_suspend)
 		return ret;
 	}
 
+	/* display codec can powered off after link reset */
+	hda_codec_i915_display_power(sdev, false);
+
 	return 0;
 }
 
@@ -439,6 +442,9 @@ static int hda_resume(struct snd_sof_dev *sdev, bool runtime_resume)
 #endif
 	int ret;
 
+	/* display codec must be powered before link reset */
+	hda_codec_i915_display_power(sdev, true);
+
 	/*
 	 * clear TCSEL to clear playback on some HD Audio
 	 * codecs. PCI TCSEL is defined in the Intel manuals.
@@ -482,6 +488,8 @@ int hda_dsp_resume(struct snd_sof_dev *sdev)
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 
 	if (sdev->s0_suspend) {
+		hda_codec_i915_display_power(sdev, true);
+
 		/* restore L1SEN bit */
 		if (hda->l1_support_changed)
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
@@ -531,6 +539,9 @@ int hda_dsp_suspend(struct snd_sof_dev *sdev)
 	int ret;
 
 	if (sdev->s0_suspend) {
+		/* we can't keep a wakeref to display driver at suspend */
+		hda_codec_i915_display_power(sdev, false);
+
 		/* enable L1SEN to make sure the system can enter S0Ix */
 		hda->l1_support_changed =
 			snd_sof_dsp_update_bits(sdev, HDA_DSP_HDA_BAR,
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 65b86dd044f1..8fddafb5c1d4 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -381,7 +381,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
 
 	if (!HDA_IDISP_CODEC(bus->codec_mask))
-		hda_codec_i915_display_power(sdev, false);
+		hda_codec_i915_exit(sdev);
 
 	/*
 	 * we are done probing so decrement link counts
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
