Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5EF117524
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Dec 2019 20:02:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7389F167B;
	Mon,  9 Dec 2019 20:01:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7389F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575918134;
	bh=WZITaSV2lacziK9VWAN5e6r7Gs0ktGI6aBgioDRDeOQ=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Uj1i3FQyJv8rRCwhfEk2db3a0RG/KTL0H+3xgSDcmX+dvi0TFHOz87qJqBZDfl04a
	 rBl9oqKelBOUx9Wu7BgdkviIFRBRpdI34mAAgSjHqHa/U6qY2sxEFWzlscZxwI4oRh
	 zsI5fqpff+Ic0tzqqBzyAKu3rO7S1fuJGvTtRkwA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3F3E2F80266;
	Mon,  9 Dec 2019 19:58:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF061F80260; Mon,  9 Dec 2019 19:58:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 7222CF80234
 for <alsa-devel@alsa-project.org>; Mon,  9 Dec 2019 19:58:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7222CF80234
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8AFE1045;
 Mon,  9 Dec 2019 10:58:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 580213F6CF;
 Mon,  9 Dec 2019 10:58:45 -0800 (PST)
Date: Mon, 09 Dec 2019 18:58:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
In-Reply-To: <20191204211556.12671-10-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20191204211556.12671-10-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [alsa-devel] Applied "ASoC: SOF: intel: hda: Modify signature for
	hda_codec_probe_bus()" to the asoc tree
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

   ASoC: SOF: intel: hda: Modify signature for hda_codec_probe_bus()

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

From 80acdd4f8ff763183dc1cd7f1cd31db9eaaecdc8 Mon Sep 17 00:00:00 2001
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Date: Wed, 4 Dec 2019 15:15:52 -0600
Subject: [PATCH] ASoC: SOF: intel: hda: Modify signature for
 hda_codec_probe_bus()

The machine driver selection for HDA platforms will be
consolidated and moved out of the SOF DSP
probe callback. In preparation for that, modify the
signature for hda_codec_probe_bus() to pass the
hda_codec_use_common_hdmi as a variable while probing the
HDA codecs.

Signed-off-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191204211556.12671-10-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/hda-codec.c | 16 ++++++----------
 sound/soc/sof/intel/hda.c       |  2 +-
 sound/soc/sof/intel/hda.h       |  3 ++-
 3 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 827f84a0722e..65761e095184 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -80,12 +80,11 @@ EXPORT_SYMBOL(hda_codec_jack_wake_enable);
 EXPORT_SYMBOL(hda_codec_jack_check);
 
 /* probe individual codec */
-static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
+static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
+			   bool hda_codec_use_common_hdmi)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
-	struct snd_soc_acpi_mach_params *mach_params = NULL;
-	struct snd_sof_pdata *pdata = sdev->pdata;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_device *hdev;
@@ -115,10 +114,6 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	if (ret < 0)
 		return ret;
 
-	if (pdata->machine)
-		mach_params = (struct snd_soc_acpi_mach_params *)
-			&pdata->machine->mach_params;
-
 	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL)
 		hda_priv->need_display_power = true;
 
@@ -126,7 +121,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	 * if common HDMI codec driver is not used, codec load
 	 * is skipped here and hdac_hdmi is used instead
 	 */
-	if ((mach_params && mach_params->common_hdmi_codec_drv) ||
+	if (hda_codec_use_common_hdmi ||
 	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
 		hdev->type = HDA_DEV_LEGACY;
 		hda_codec_load_module(&hda_priv->codec);
@@ -145,7 +140,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 }
 
 /* Codec initialization */
-int hda_codec_probe_bus(struct snd_sof_dev *sdev)
+int hda_codec_probe_bus(struct snd_sof_dev *sdev,
+			bool hda_codec_use_common_hdmi)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int i, ret;
@@ -156,7 +152,7 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev)
 		if (!(bus->codec_mask & (1 << i)))
 			continue;
 
-		ret = hda_codec_probe(sdev, i);
+		ret = hda_codec_probe(sdev, i, hda_codec_use_common_hdmi);
 		if (ret < 0) {
 			dev_err(bus->dev, "error: codec #%d probe error, ret: %d\n",
 				i, ret);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 98512a338748..bfdb817b3780 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -476,7 +476,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 	}
 
 	/* create codec instances */
-	hda_codec_probe_bus(sdev);
+	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
 
 	hda_codec_i915_put(sdev);
 
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 63df888dddb6..4a6f76572658 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -575,7 +575,8 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 /*
  * HDA Codec operations.
  */
-int hda_codec_probe_bus(struct snd_sof_dev *sdev);
+int hda_codec_probe_bus(struct snd_sof_dev *sdev,
+			bool hda_codec_use_common_hdmi);
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
