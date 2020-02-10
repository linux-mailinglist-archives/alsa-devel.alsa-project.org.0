Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B52157D14
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Feb 2020 15:10:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8315B16C5;
	Mon, 10 Feb 2020 15:09:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8315B16C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581343835;
	bh=IYcnCeJgG2eeDspZPy5xjjoMCuGiDLSdIIepSPKwByg=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Wu4DW3RK8jApPEMNeKXvCichTXEIvOhpCNOOd1Nr82sgezJvNgzqtWjSa6Z5aAbot
	 qXIYDrkhS2WpE//linX2t2CLmM2wNFOuoNpWEOx8YpbXJIBo7Z4vJAY2yp583Xy1hk
	 mjaR4qHfUNc/s+ZYxK6lJWiCwO1ZosRgXXupPUeU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EB215F8027B;
	Mon, 10 Feb 2020 15:07:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D874F80257; Mon, 10 Feb 2020 15:07:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 PRX_BODY_76, SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 55DA8F800FD
 for <alsa-devel@alsa-project.org>; Mon, 10 Feb 2020 15:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55DA8F800FD
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2F70E1045;
 Mon, 10 Feb 2020 06:07:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A76973F68E;
 Mon, 10 Feb 2020 06:07:29 -0800 (PST)
Date: Mon, 10 Feb 2020 14:07:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20200206200223.7715-2-kai.vehmanen@linux.intel.com>
Message-Id: <applied-20200206200223.7715-2-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: hda: fix ordering bug in
	resume flow" to the asoc tree
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

The patch

   ASoC: SOF: Intel: hda: fix ordering bug in resume flow

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.6

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 816938b272b0ac0203e25ce50483bd284ea4a2db Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Thu, 6 Feb 2020 22:02:22 +0200
Subject: [PATCH] ASoC: SOF: Intel: hda: fix ordering bug in resume flow

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
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Link: https://lore.kernel.org/r/20200206200223.7715-2-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
