Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 492A5E8E7C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 18:41:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FAC4228E;
	Tue, 29 Oct 2019 18:40:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FAC4228E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572370879;
	bh=YnbY+BHTJAxBTUjXrl7ts3XN8VakyDMi/9nEaG9JI1Q=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FJ0CL/xCNuAslKyHRiyajZBvCHB11ZWPMqIa+Wd/z7Yb++tVcfeq/pR6P5w/XQD7a
	 ATHiVNUgVmjEAAUX+O5VZ5ofrOwgbH01Gnc4h4vTgSB/LTyyFAvTOVUdAud03pKrKx
	 hJq0GvLxXf8P6CR14C2SrJYZqFePxMgJlCLkpL1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C7EDEF80672;
	Tue, 29 Oct 2019 18:34:43 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA2F4F80534; Tue, 29 Oct 2019 18:34:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11766F805AE
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 18:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11766F805AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="V3BLEywe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=dr8wm7+v1Br+zzY4QFtz9b3DQnpqQUaUkHgX4GqwOoM=; b=V3BLEyweWSOf
 hK6CO0baHNNJO4Lg5G0tpPkMjaMUf9/mDezbNLoR5cLlXvPtkT7xAKMcqJ6N7vGDaVweJQ/LD7rTY
 mdAbYII+/slYpLLw+cp/QoNflzngwGksb2z+WDBclw7xxXfagws+/NR7F36Bi2vloZsTs24qiEFvG
 QHWds=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPVNs-0002kU-Vu; Tue, 29 Oct 2019 17:34:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 2918F27429C0; Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191029134017.18901-6-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191029173420.2918F27429C0@ypsilon.sirena.org.uk>
Date: Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, julia.lawall@lip6.fr,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: SOF: Intel: add support for
	snd-hda-codec-hdmi" to the asoc tree
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

   ASoC: SOF: Intel: add support for snd-hda-codec-hdmi

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.5

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

From 139c7febad1afa221c687f3314560284e482a1f4 Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 29 Oct 2019 15:40:13 +0200
Subject: [PATCH] ASoC: SOF: Intel: add support for snd-hda-codec-hdmi

Add support to implement HDMI/DP audio by using the common
snd-hda-codec-hdmi driver.

Change of codec driver affects user-space as the two
drivers expose different mixer controls. A new kernel
module option "use_common_hdmi" is added to user-space
to indicate which interface should be used. The default
driver can be selected via a Kconfig option.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191029134017.18901-6-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/sof/intel/Kconfig     | 10 ++++++++++
 sound/soc/sof/intel/hda-codec.c | 22 ++++++++++++++++++----
 sound/soc/sof/intel/hda.c       |  6 ++++++
 sound/soc/sof/intel/hda.h       |  6 ++++--
 4 files changed, 38 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 342f22a7c64f..d52298946c00 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -299,6 +299,16 @@ config SND_SOC_SOF_HDA_ALWAYS_ENABLE_DMI_L1
 	  Say Y if you want to enable DMI Link L1
 	  If unsure, select "N".
 
+config SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
+	bool "SOF common HDA HDMI codec driver"
+	depends on SND_SOC_SOF_HDA_LINK
+	depends on SND_HDA_CODEC_HDMI
+	help
+	  This adds support for HDMI audio by using the common HDA
+	  HDMI/DisplayPort codec driver.
+	  Say Y if you want to use the common codec driver with SOF.
+	  If unsure select "Y".
+
 endif ## SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 3ca6795a89ba..827f84a0722e 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -84,6 +84,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
+	struct snd_soc_acpi_mach_params *mach_params = NULL;
+	struct snd_sof_pdata *pdata = sdev->pdata;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_device *hdev;
@@ -113,8 +115,19 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	if (ret < 0)
 		return ret;
 
-	/* use legacy bus only for HDA codecs, idisp uses ext bus */
-	if ((resp & 0xFFFF0000) != IDISP_VID_INTEL) {
+	if (pdata->machine)
+		mach_params = (struct snd_soc_acpi_mach_params *)
+			&pdata->machine->mach_params;
+
+	if ((resp & 0xFFFF0000) == IDISP_VID_INTEL)
+		hda_priv->need_display_power = true;
+
+	/*
+	 * if common HDMI codec driver is not used, codec load
+	 * is skipped here and hdac_hdmi is used instead
+	 */
+	if ((mach_params && mach_params->common_hdmi_codec_drv) ||
+	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
 		hdev->type = HDA_DEV_LEGACY;
 		hda_codec_load_module(&hda_priv->codec);
 	}
@@ -155,7 +168,8 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(hda_codec_probe_bus);
 
-#if IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
+	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
 
 void hda_codec_i915_get(struct snd_sof_dev *sdev)
 {
@@ -204,6 +218,6 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(hda_codec_i915_exit);
 
-#endif /* CONFIG_SND_SOC_HDAC_HDMI */
+#endif
 
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 103f4273c4d3..7dc0018dc4c3 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -53,6 +53,11 @@ MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
 static int hda_dmic_num = -1;
 module_param_named(dmic_num, hda_dmic_num, int, 0444);
 MODULE_PARM_DESC(dmic_num, "SOF HDA DMIC number");
+
+static bool hda_codec_use_common_hdmi =
+	IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_COMMON_HDMI_CODEC);
+module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
+MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
 #endif
 
 static const struct hda_dsp_msg_code hda_dsp_rom_msg[] = {
@@ -459,6 +464,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 			&pdata->machine->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
 		mach_params->platform = dev_name(sdev->dev);
+		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
 	}
 
 	/* create codec instances */
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 16376f55e420..5ad73a34b09c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -577,7 +577,9 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && \
+	(IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
+	 IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
 
 void hda_codec_i915_get(struct snd_sof_dev *sdev);
 void hda_codec_i915_put(struct snd_sof_dev *sdev);
@@ -591,7 +593,7 @@ static inline void hda_codec_i915_put(struct snd_sof_dev *sdev)  { }
 static inline int hda_codec_i915_init(struct snd_sof_dev *sdev) { return 0; }
 static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
-#endif /* CONFIG_SND_SOC_SOF_HDA && CONFIG_SND_SOC_HDAC_HDMI */
+#endif
 
 /*
  * Trace Control.
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
