Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76423AF119
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 20:34:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8AD2B16C1;
	Tue, 10 Sep 2019 20:33:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8AD2B16C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568140483;
	bh=Unx3MfrGHL/MK3x7PwBRJJshjHTCIyPaPDfCz7MTWho=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pl17yrq9sUGbkvf4i93g3Kf9X//C7IUyVLeMoCUpJ9GIjnt1g5AN7d1fORhhXMr42
	 yPvmqplulMmZ1QEOYlu7AJX96DjQLBAkhqufy1lyF97ibuvbQUNT7TxXhfp+XGap+G
	 WxGAe3w3xFXju84CdMfTJdbqjUNC1y9j9fi8vvrA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FFE5F805FC;
	Tue, 10 Sep 2019 20:29:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8065FF80634; Tue, 10 Sep 2019 20:29:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 46D0BF800A9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 20:29:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46D0BF800A9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 11:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="200340038"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2019 11:29:36 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Tue, 10 Sep 2019 21:29:10 +0300
Message-Id: <20190910182916.29693-5-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v3 04/10] ASoC: SOF: Intel: add support for
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

Change of codec driver affects user-space as the the two
drivers expose different mixer controls. A new kernel
module option "use_common_hdmi" is added to user-space
to indicate which interface should be used. The default
driver can be selected via a Kconfig option.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 sound/soc/sof/intel/Kconfig     | 10 ++++++++++
 sound/soc/sof/intel/hda-codec.c | 19 +++++++++++++++----
 sound/soc/sof/intel/hda.c       |  6 ++++++
 sound/soc/sof/intel/hda.h       |  6 ++++--
 4 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index 479ba249e219..a8f4e69b044d 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -273,6 +273,16 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
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
index 3ca6795a89ba..817ebba00b47 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -84,6 +84,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
+	struct snd_soc_acpi_mach_params *mach_params = 0;
+	struct snd_sof_pdata *pdata = sdev->pdata;
 #endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hdac_device *hdev;
@@ -113,8 +115,16 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	if (ret < 0)
 		return ret;
 
-	/* use legacy bus only for HDA codecs, idisp uses ext bus */
-	if ((resp & 0xFFFF0000) != IDISP_VID_INTEL) {
+	if (pdata->machine)
+		mach_params = (struct snd_soc_acpi_mach_params *)
+			&pdata->machine->mach_params;
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
@@ -155,7 +165,8 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(hda_codec_probe_bus);
 
-#if IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
+	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
 
 void hda_codec_i915_get(struct snd_sof_dev *sdev)
 {
@@ -204,6 +215,6 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(hda_codec_i915_exit);
 
-#endif /* CONFIG_SND_SOC_HDAC_HDMI */
+#endif
 
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index c72e9a09eee1..ee742157516e 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -54,6 +54,11 @@ MODULE_PARM_DESC(use_msi, "SOF HDA use PCI MSI mode");
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
@@ -458,6 +463,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 			&pdata->machine->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
 		mach_params->platform = dev_name(sdev->dev);
+		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
 	}
 
 	/* create codec instances */
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 5591841a1b6f..28640a29e1b6 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -562,7 +562,9 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && \
+	(IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
+	 IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
 
 void hda_codec_i915_get(struct snd_sof_dev *sdev);
 void hda_codec_i915_put(struct snd_sof_dev *sdev);
@@ -576,7 +578,7 @@ static inline void hda_codec_i915_put(struct snd_sof_dev *sdev)  { }
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
