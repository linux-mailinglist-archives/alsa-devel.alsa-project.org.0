Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 700096101C8
	for <lists+alsa-devel@lfdr.de>; Thu, 27 Oct 2022 21:37:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDD022DCC;
	Thu, 27 Oct 2022 21:36:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDD022DCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666899451;
	bh=VxFccdJ8eFX8YQpbBjOx217t3AgYTLeNa00RZgnlJ9g=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SVF1O3nmnATJuJfx5I1UcZIxQhgzOSWJnw2e7RbaM+nb/BlcTMc5wPyC8rmVXGjXa
	 FP2Ll2zWCZkOvclbWsWK4E9nFa/IULkywNEgD7T26y7qcGzfDntMI4k+rNaiinZOt+
	 dXF/3RJVXCXc2aPEN5LPAAHXgkmAnm8MknSVuUUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E84A3F80557;
	Thu, 27 Oct 2022 21:36:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C5A5F80553; Thu, 27 Oct 2022 21:36:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 935A6F80100
 for <alsa-devel@alsa-project.org>; Thu, 27 Oct 2022 21:36:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 935A6F80100
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="OREeyn8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666899368; x=1698435368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VxFccdJ8eFX8YQpbBjOx217t3AgYTLeNa00RZgnlJ9g=;
 b=OREeyn8mFS0nvVJTfZKDne5unIXwe7FdFFBAbiYL7a/Tlg5/X839PWAl
 o5DdYwgzPsTjpi8YrhdvFzH2sYuBhPF0shb7vvHaNTeuV5EVVmSChJxYR
 9YVhzSfnY7cFWssR2+J0K3lV6FG4aeWTXeE5rH8FfsJ+CbqCSd/fB6Sfa
 KTjiKYBMn8ajkvxYRWU4BT/Zk1DUuVo+z3Hu6lqhCRmcefnXYmO/n7SSk
 MYRsqGN390RxMixUzvbVD9yU2mvpr8lDrlYCGJupngcPEqGtL7xX+gWnk
 6/memQE61LrvtCtljE+uRnzy4Qj2zUjzF+PFmz+UJd9Z0mIEE2pCJhnoP Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="334957798"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="334957798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:03 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10513"; a="632526944"
X-IronPort-AV: E=Sophos;i="5.95,218,1661842800"; d="scan'208";a="632526944"
Received: from vmehta-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.212.6.254])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2022 12:36:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 01/21] ASoC: SOF: Intel: remove option to disable the
 common_hdmi handling
Date: Thu, 27 Oct 2022 15:35:20 -0400
Message-Id: <20221027193540.259520-2-pierre-louis.bossart@linux.intel.com>
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

We've been using the same option for quite some time now, it's time to
remove the kernel parameter to disable the common HDaudio codec
handling.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-codec.c | 12 +++---------
 sound/soc/sof/intel/hda.c       | 10 ++--------
 sound/soc/sof/intel/hda.h       |  6 ++----
 3 files changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/intel/hda-codec.c b/sound/soc/sof/intel/hda-codec.c
index f2ec2a6c2e0f..d5242b6e1552 100644
--- a/sound/soc/sof/intel/hda-codec.c
+++ b/sound/soc/sof/intel/hda-codec.c
@@ -133,8 +133,7 @@ static struct hda_codec *hda_codec_device_init(struct hdac_bus *bus, int addr, i
 }
 
 /* probe individual codec */
-static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
-			   bool hda_codec_use_common_hdmi)
+static int hda_codec_probe(struct snd_sof_dev *sdev, int address)
 {
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
 	struct hdac_hda_priv *hda_priv;
@@ -164,10 +163,6 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 	if (!hda_priv)
 		return -ENOMEM;
 
-	/* only probe ASoC codec drivers for HDAC-HDMI */
-	if (!hda_codec_use_common_hdmi && (resp & 0xFFFF0000) == IDISP_VID_INTEL)
-		type = HDA_DEV_ASOC;
-
 	codec = hda_codec_device_init(&hbus->core, address, type);
 	ret = PTR_ERR_OR_ZERO(codec);
 	if (ret < 0)
@@ -215,8 +210,7 @@ static int hda_codec_probe(struct snd_sof_dev *sdev, int address,
 }
 
 /* Codec initialization */
-void hda_codec_probe_bus(struct snd_sof_dev *sdev,
-			 bool hda_codec_use_common_hdmi)
+void hda_codec_probe_bus(struct snd_sof_dev *sdev)
 {
 	struct hdac_bus *bus = sof_to_bus(sdev);
 	int i, ret;
@@ -227,7 +221,7 @@ void hda_codec_probe_bus(struct snd_sof_dev *sdev,
 		if (!(bus->codec_mask & (1 << i)))
 			continue;
 
-		ret = hda_codec_probe(sdev, i, hda_codec_use_common_hdmi);
+		ret = hda_codec_probe(sdev, i);
 		if (ret < 0) {
 			dev_warn(bus->dev, "codec #%d probe error, ret: %d\n",
 				 i, ret);
diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 79c32d948b2d..fe0e8221534e 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -383,12 +383,6 @@ static int mclk_id_override = -1;
 module_param_named(mclk_id, mclk_id_override, int, 0444);
 MODULE_PARM_DESC(mclk_id, "SOF SSP mclk_id");
 
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA)
-static bool hda_codec_use_common_hdmi = IS_ENABLED(CONFIG_SND_HDA_CODEC_HDMI);
-module_param_named(use_common_hdmi, hda_codec_use_common_hdmi, bool, 0444);
-MODULE_PARM_DESC(use_common_hdmi, "SOF HDA use common HDMI codec driver");
-#endif
-
 static const struct hda_dsp_msg_code hda_dsp_rom_fw_error_texts[] = {
 	{HDA_DSP_ROM_CSE_ERROR, "error: cse error"},
 	{HDA_DSP_ROM_CSE_WRONG_RESPONSE, "error: cse wrong response"},
@@ -929,7 +923,7 @@ static int hda_init_caps(struct snd_sof_dev *sdev)
 		snd_hdac_ext_bus_get_ml_capabilities(bus);
 
 	/* create codec instances */
-	hda_codec_probe_bus(sdev, hda_codec_use_common_hdmi);
+	hda_codec_probe_bus(sdev);
 
 	if (!HDA_IDISP_CODEC(bus->codec_mask))
 		hda_codec_i915_display_power(sdev, false);
@@ -1335,7 +1329,7 @@ static void hda_generic_machine_select(struct snd_sof_dev *sdev,
 	if (*mach) {
 		mach_params = &(*mach)->mach_params;
 		mach_params->codec_mask = bus->codec_mask;
-		mach_params->common_hdmi_codec_drv = hda_codec_use_common_hdmi;
+		mach_params->common_hdmi_codec_drv = true;
 	}
 }
 #else
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index 17ed7e60cae8..e715bae32cad 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -714,8 +714,7 @@ void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev);
 /*
  * HDA Codec operations.
  */
-void hda_codec_probe_bus(struct snd_sof_dev *sdev,
-			 bool hda_codec_use_common_hdmi);
+void hda_codec_probe_bus(struct snd_sof_dev *sdev);
 void hda_codec_jack_wake_enable(struct snd_sof_dev *sdev, bool enable);
 void hda_codec_jack_check(struct snd_sof_dev *sdev);
 
@@ -731,8 +730,7 @@ int hda_codec_i915_exit(struct snd_sof_dev *sdev);
 
 #else
 
-static inline void hda_codec_i915_display_power(struct snd_sof_dev *sdev,
-						bool enable) { }
+static inline void hda_codec_i915_display_power(struct snd_sof_dev *sdev, bool enable) { }
 static inline int hda_codec_i915_init(struct snd_sof_dev *sdev) { return 0; }
 static inline int hda_codec_i915_exit(struct snd_sof_dev *sdev) { return 0; }
 
-- 
2.34.1

