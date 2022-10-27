Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CF16101CA
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:38:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F21EE1AF8;
	Thu, 27 Oct 2022 21:37:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F21EE1AF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899487;
	bh=H6MdnLg8ogXu6qOFu0PPB0Wao3poFku9mww6l93r1ec=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fkn0RQaBVnXUPaZLcvhODInahT3vTGfDFdPelGey7ilRhmSYLo6o1uAU2Zz52iXmo
	 OyHNonEZXy/mii5kex3bUqohTpIiRjdzJIb2gawZeYMUP5zLtFdjz9yp+OG2xjRJnR
	 fwb041J1c9GNkBK6QN9eU861AaZTRAvrH1PkXFBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D4F4F8056F;
	Thu, 27 Oct 2022 21:36:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C21BFF80579; Thu, 27 Oct 2022 21:36:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B088EF80095
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B088EF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="gsXCf8mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899369; x=1698435369;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H6MdnLg8ogXu6qOFu0PPB0Wao3poFku9mww6l93r1ec=;
 b=gsXCf8muoPSVLMDEWaYW8GldEUls7RgFgyf4G4f5txplfVO8rx/b49by
 CHI2PdyVaSa2bfKBMMxumaJLya2+aSzvU38KhhtgPrlJHGzgJlzZBlEQQ
 Mne0yV25zQHUQQa6vEGgbW8vJmKFdcwH2Wl2TxiOejQulg0+qFB6LegiY
 Aqj+JnXcxhR75ftNCzd1x5ECpQQfVGCm/WsOKs4sZJfnFmht3oFNsu9IR
 KqKoFBuBHoH8vLNoYJygmZLkFpzx5IPJdPIVKh7lxqrmfkJRG4p4MMu7y
 1sIr5aeTv4sBTXN4ZZmS0Ufy2oir5jZbRs+Und25CcCHB3Men/2wdfV/r A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957810"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957810"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:06 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526964"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526964"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:05 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 03/21] ASoC: SOF: Intel: hda-codec: simplify
 SND_SOC_SOF_HDA_AUDIO_CODEC handling
Date: Thu, 27 Oct 2022 15:35:22 -0400
Message-Id: <20221027193540.259520-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
References: <20221027193540.259520-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.de,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>, broonie@kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

Now that we have removed the dependency on SND_SOC_HDAC_HDMI, we can
simplify the code and make the code conditional on a single #ifdef.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 37 +++++++++++----------------------
 sound/soc/sof/intel/hda.h       | 10 +++++++--
 2 files changed, 20 insertions(+), 27 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index 7feaf2ccb642..3b2ccf10be43 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -16,13 +16,12 @@
 #include <sound/sof.h>
 #include "../ops.h"
 #include "hda.h"
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #include "../../codecs/hdac_hda.h"
-#endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
 #define CODEC_PROBE_RETRIES	3
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 #define IDISP_VID_INTEL	0x80860000
 
 /* load the legacy HDA codec driver */
@@ -80,6 +79,7 @@ void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable)
 
 	snd_hdac_chip_updatew(bus, WAKEEN, STATESTS_INT_MASK, mask);
 }
+EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 /* check jack status after resuming from suspend mode */
 void hda_codec_jack_check(struct snd_sof_dev *sdev)
@@ -95,11 +95,6 @@ void hda_codec_jack_check(struct snd_sof_dev *sdev)
 		if (codec->jacktbl.used)
 			pm_request_resume(&codec->core.dev);
 }
-#else
-void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable) {}
-void hda_codec_jack_check(struct snd_sof_dev *sdev) {}
-#endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
-EXPORT_SYMBOL_NS(hda_codec_jack_wake_enable, SND_SOC_SOF_HDA_AUDIO_CODEC);
 EXPORT_SYMBOL_NS(hda_codec_jack_check, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
 #if IS_ENABLED(CONFIG_SND_HDA_GENERIC)
@@ -135,10 +130,7 @@ static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, i
 /* probe individual codec */
 static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
-	int type = HDA_DEV_LEGACY;
-#endif
 	struct hda_bus *hbus = sof_to_hbus(sdev);
 	struct hda_codec *codec;
 	u32 hda_cmd = (address << 28) | (AC_NODE_ROOT << 20) |
@@ -158,12 +150,11 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	dev_dbg(sdev->dev, "HDA codec #%d probed OK: response: %x\n",
 		address, resp);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	hda_priv = devm_kzalloc(sdev->dev, sizeof(*hda_priv), GFP_KERNEL);
 	if (!hda_priv)
 		return -ENOMEM;
 
-	codec = hda_codec_device_init(&hbus->core, address, type);
+	codec = hda_codec_device_init(&hbus->core, address, HDA_DEV_LEGACY);
 	ret = PTR_ERR_OR_ZERO(codec);
 	if (ret < 0)
 		return ret;
@@ -186,25 +177,19 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 	else
 		codec->probe_id = 0;
 
-	if (type == HDA_DEV_LEGACY) {
-		ret = hda_codec_load_module(codec);
-		/*
-		 * handle ret==0 (no driver bound) as an error, but pass
-		 * other return codes without modification
-		 */
-		if (ret == 0)
-			ret = -ENOENT;
-	}
+	ret = hda_codec_load_module(codec);
+	/*
+	 * handle ret==0 (no driver bound) as an error, but pass
+	 * other return codes without modification
+	 */
+	if (ret == 0)
+		ret = -ENOENT;
 
 out:
 	if (ret < 0) {
 		snd_hdac_device_unregister(&codec->core);
 		put_device(&codec->core.dev);
 	}
-#else
-	codec = hda_codec_device_init(&hbus->core, address, HDA_DEV_ASOC);
-	ret = PTR_ERR_OR_ZERO(codec);
-#endif
 
 	return ret;
 }
@@ -231,6 +216,8 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 }
 EXPORT_SYMBOL_NS(hda_codec_probe_bus, SND_SOC_SOF_HDA_AUDIO_CODEC);
 
+#endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
+
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
 
 void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable)
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 7a3184ed8b70..0506c0a8afac 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -710,7 +710,7 @@ void hda_dsp_ctrl_stop_chip(struct snd_sof_dev *sdev);
  */
 void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 /*
  * HDA Codec operations.
  */
@@ -718,7 +718,13 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev);
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
-#endif /* CONFIG_SND_SOC_SOF_HDA */
+#else
+
+static inline void hda_codec_probe_bus(struct snd_sof_dev *sdev) { }
+static inline void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable) { }
+static inline void hda_codec_jack_check(struct snd_sof_dev *sdev) { }
+
+#endif /* CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC */
 
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC) && IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI)
 
-- 
2.34.1

