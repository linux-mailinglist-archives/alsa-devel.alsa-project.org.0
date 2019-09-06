Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86126ABB11
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Sep 2019 16:35:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0FA5F15F9;
	Fri,  6 Sep 2019 16:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0FA5F15F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567780533;
	bh=6mG3sXuO5rkuSkPbl50+6yvkd9uBlzzPBV1pr8nlugs=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KggENpCYGuyj0tCM7f8s7SBHIqn9JOfuvmqfMsJJ66v27IpGvMMh/0s1nWrAtqKdj
	 ndo2cw6gFWjaNBDHW8ClmGV+dHOnBXUQ0Z4i+KMmFcdj22ELtSmXHVH/0Mg5tNWV3u
	 71Yoweu1q6LE7FRdeJQz8WXZJJcETD8NWc7wNS5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88A88F80642;
	Fri,  6 Sep 2019 16:29:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD020F8063D; Fri,  6 Sep 2019 16:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B60FFF805F6
 for <alsa-devel@alsa-project.org>; Fri,  6 Sep 2019 16:29:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B60FFF805F6
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Sep 2019 07:29:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,473,1559545200"; d="scan'208";a="384228457"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2019 07:29:41 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Fri,  6 Sep 2019 17:29:09 +0300
Message-Id: <20190906142909.770-7-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
References: <20190906142909.770-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [RFC PATCH v2 6/6] ASoC: SOF: Intel: add support for
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
 sound/soc/sof/intel/hda-codec.c | 14 ++++++++++----
 sound/soc/sof/intel/hda.h       |  6 ++++--
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/Kconfig b/sound/soc/sof/intel/Kconfig
index dd14ce92fe10..1cf292eb59a7 100644
--- a/sound/soc/sof/intel/Kconfig
+++ b/sound/soc/sof/intel/Kconfig
@@ -241,6 +241,16 @@ config SND_SOC_SOF_HDA_AUDIO_CODEC
 	  Say Y if you want to enable HDAudio codecs with SOF.
 	  If unsure select "N".
 
+config SND_SOC_SOF_HDA_COMMON_HDMI_CODEC
+	bool "SOF common HDA HDMI codec driver"
+	depends on SND_SOC_SOF_HDA_LINK
+	depends on SND_HDA_CODEC_HDMI
+	help
+	  This adds support for enabling HDMI audio by using the common
+	  HDMI/DisplayPort codec driver.
+	  Say Y if you want to use the common codec driver with SOF.
+	  If unsure select "Y".
+
 endif ## SND_SOC_SOF_HDA_COMMON
 
 config SND_SOC_SOF_HDA_LINK_BASELINE
diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index b8b37f082309..571614049f10 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -19,6 +19,11 @@
 #include "../../codecs/hdac_hda.h"
 #endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
+static bool hda_codec_use_common_hdmi =
+	IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_COMMON_HDMI_CODEC);
+module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
+MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #define IDISP_VID_INTEL	0x80860000
 
@@ -74,8 +79,8 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	if (ret < 0)
 		return ret;
 
-	/* use legacy bus only for HDA codecs, idisp uses ext bus */
-	if ((resp & 0xFFFF0000) != IDISP_VID_INTEL) {
+	if (hda_codec_use_common_hdmi ||
+	    (resp & 0xFFFF0000) != IDISP_VID_INTEL) {
 		hdev->type = HDA_DEV_LEGACY;
 		hda_codec_load_module(&hda_priv->codec);
 	}
@@ -117,7 +122,8 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(hda_codec_probe_bus);
 
-#if IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
+	IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
 
 void hda_codec_i915_get(struct snd_sof_dev *sdev)
 {
@@ -166,6 +172,6 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL(hda_codec_i915_exit);
 
-#endif /* CONFIG_SND_SOC_HDAC_HDMI */
+#endif
 
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 75b096050fa2..d2d4a04c087c 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -559,7 +559,9 @@ int hda_codec_probe_bus(struct snd_sof_dev *sdev);
 
 #endif /* CONFIG_SND_SOC_SOF_HDA */
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA) && \
+	(IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI) || \
+	 IS_ENABLED(CONFIG_SND_SOC_HDAC_HDMI))
 
 void hda_codec_i915_get(struct snd_sof_dev *sdev);
 void hda_codec_i915_put(struct snd_sof_dev *sdev);
@@ -573,7 +575,7 @@ static inline void hda_codec_i915_put(struct snd_sof_dev *sdev)  { }
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
