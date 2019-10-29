Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F747E89DD
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 14:45:40 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 269A62254;
	Tue, 29 Oct 2019 14:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 269A62254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572356740;
	bh=ZsQ52DDucxO2bIvUSSlAWcyzKz/yr+0dn3EgIJVcBqo=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LjbijONcqDNTDLSVBcG7b5UaZIlrXIhCVSwEdGwzfYuie6ZzHm+AjmzniWF1wVNT9
	 ngXPHyuIvu6cRiisDy887maiB0Fwn7PIn6+dnR6Rmmk7ok+gPNMNYHxYOJ+cXxnlJi
	 qDr5W3wxnvir+p5dMEYYFNjWwq2bSEfXVE+TK6c4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C1411F80649;
	Tue, 29 Oct 2019 14:40:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4110F805FE; Tue, 29 Oct 2019 14:40:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09555F805FE
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 14:40:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09555F805FE
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Oct 2019 06:40:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,244,1569308400"; d="scan'208";a="205472589"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by FMSMGA003.fm.intel.com with ESMTP; 29 Oct 2019 06:40:33 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	broonie@kernel.org
Date: Tue, 29 Oct 2019 15:40:13 +0200
Message-Id: <20191029134017.18901-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
References: <20191029134017.18901-1-kai.vehmanen@linux.intel.com>
Cc: tiwai@suse.de, libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com, julia.lawall@lip6.fr
Subject: [alsa-devel] [PATCH v8 5/9] ASoC: SOF: Intel: add support for
	snd-hda-codec-hdmi
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

Add support to implement HDMI/DP audio by using the common
snd-hda-codec-hdmi driver.

Change of codec driver affects user-space as the two
drivers expose different mixer controls. A new kernel
module option "use_common_hdmi" is added to user-space
to indicate which interface should be used. The default
driver can be selected via a Kconfig option.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
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
index 52a87a47029d..3185c5378964 100644
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
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
