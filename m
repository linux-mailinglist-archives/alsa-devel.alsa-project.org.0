Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F140AF11E
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Sep 2019 20:35:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7D3169D;
	Tue, 10 Sep 2019 20:34:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7D3169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568140534;
	bh=gAyb/IJS/EwIRkD+lQqNmw/4zrgoMZpcoEFfh5p3hYI=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iDqCzTzrm512Y+xyolP8/1reBG/GubTwo7CGI0BviIF+oGNuNxVeResIJRPYL1CIl
	 3EH8gRihW4FWvbAaD7xwdkx32bEmHy6ALV1lkekwqXzlyfcwcI0pXbgnAFoMQ9X4CH
	 32fa/nw3e2tQ66KNpJ6cBtL/dYgLzB63TavsmvXs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA829F80642;
	Tue, 10 Sep 2019 20:29:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1683FF805F9; Tue, 10 Sep 2019 20:29:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6B00FF805F9
 for <alsa-devel@alsa-project.org>; Tue, 10 Sep 2019 20:29:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B00FF805F9
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Sep 2019 11:29:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,490,1559545200"; d="scan'208";a="200340047"
Received: from zeliteleevi.tm.intel.com ([10.237.55.130])
 by fmsmga001.fm.intel.com with ESMTP; 10 Sep 2019 11:29:38 -0700
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: alsa-devel@alsa-project.org,
	tiwai@suse.de
Date: Tue, 10 Sep 2019 21:29:11 +0300
Message-Id: <20190910182916.29693-6-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
References: <20190910182916.29693-1-kai.vehmanen@linux.intel.com>
Cc: libin.yang@intel.com, pierre-louis.bossart@linux.intel.com,
 kai.vehmanen@linux.intel.com
Subject: [alsa-devel] [PATCH v3 05/10] ASoC: Intel: skl-hda-dsp-generic: use
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

Add support for using snd-hda-codec-hdmi driver for HDMI/DP
instead of ASoC hdac-hdmi. This is aligned with how other
HDA codecs are already handled.

When snd-hda-codec-hdmi is used, the PCM device numbers are
parsed from card topology and passed to the codec driver.
This needs to be done at runtime as topology changes may
affect PCM device allocation.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 include/sound/soc-acpi.h                     |  2 +
 sound/soc/intel/boards/hda_dsp_common.h      | 87 ++++++++++++++++++++
 sound/soc/intel/boards/skl_hda_dsp_common.c  | 10 ++-
 sound/soc/intel/boards/skl_hda_dsp_common.h  | 23 ++++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  1 +
 5 files changed, 122 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/hda_dsp_common.h

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 35b38e41e5b2..26d57bc9a91e 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -60,12 +60,14 @@ static inline struct snd_soc_acpi_mach *snd_soc_acpi_codec_list(void *arg)
  * @acpi_ipc_irq_index: used for BYT-CR detection
  * @platform: string used for HDaudio codec support
  * @codec_mask: used for HDAudio support
+ * @common_hdmi_codec_drv: use commom HDAudio HDMI codec driver
  */
 struct snd_soc_acpi_mach_params {
 	u32 acpi_ipc_irq_index;
 	const char *platform;
 	u32 codec_mask;
 	u32 dmic_num;
+	bool common_hdmi_codec_drv;
 };
 
 /**
diff --git a/sound/soc/intel/boards/hda_dsp_common.h b/sound/soc/intel/boards/hda_dsp_common.h
new file mode 100644
index 000000000000..ada560ebff97
--- /dev/null
+++ b/sound/soc/intel/boards/hda_dsp_common.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(c) 2019 Intel Corporation.
+ */
+
+/*
+ * This file defines helper functions used by multiple
+ * Intel HDA based machine drivers.
+ */
+
+#ifndef __HDA_DSP_COMMON_H
+#define __HDA_DSP_COMMON_H
+
+#include <sound/hda_codec.h>
+#include "../../codecs/hdac_hda.h"
+
+/*
+ * Search card topology and return PCM device number
+ * matching Nth HDMI device (zero-based index).
+ */
+static inline struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
+						      int hdmi_idx)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_pcm *spcm;
+	int i = 0;
+
+	for_each_card_rtds(card, rtd) {
+		spcm = rtd->pcm ?
+			rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].pcm : 0;
+		if (spcm && strstr(spcm->id, "HDMI")) {
+			if (i == hdmi_idx)
+				return rtd->pcm;
+			++i;
+		}
+	}
+
+	return 0;
+}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+/*
+ * Search card topology and register HDMI PCM related controls
+ * to codec driver.
+ */
+static inline int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
+					      struct snd_soc_component *comp)
+{
+	struct hdac_hda_priv *hda_pvt;
+	struct hda_codec *hcodec;
+	struct snd_pcm *spcm;
+	struct hda_pcm *hpcm;
+	int err = 0, i = 0;
+
+	if (!comp)
+		return -EINVAL;
+
+	hda_pvt = snd_soc_component_get_drvdata(comp);
+	hcodec = &hda_pvt->codec;
+
+	list_for_each_entry(hpcm, &hcodec->pcm_list_head, list) {
+		spcm = hda_dsp_hdmi_pcm_handle(card, i);
+		if (spcm) {
+			hpcm->pcm = spcm;
+			hpcm->device = spcm->device;
+			dev_dbg(card->dev,
+				"%s: mapping HDMI converter %d to PCM %d (%p)\n",
+				__func__, i, hpcm->device, spcm);
+		}
+		i++;
+	}
+
+	err = snd_hda_codec_build_controls(hcodec);
+	if (err < 0)
+		dev_err(card->dev, "unable to create controls %d\n", err);
+
+	return err;
+}
+#else
+static inline int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
+					      struct snd_soc_component *comp)
+{
+	return -EINVAL;
+}
+#endif
+
+#endif /* __HDA_DSP_COMMON_H */
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.c b/sound/soc/intel/boards/skl_hda_dsp_common.c
index 58409b6e476e..b5c0150f9cb8 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.c
@@ -14,6 +14,9 @@
 #include "../../codecs/hdac_hdmi.h"
 #include "skl_hda_dsp_common.h"
 
+#include <sound/hda_codec.h>
+#include "../../codecs/hdac_hda.h"
+
 #define NAME_SIZE	32
 
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device)
@@ -136,14 +139,19 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 	char jack_name[NAME_SIZE];
 	int err;
 
+	if (ctx->common_hdmi_codec_drv)
+		return skl_hda_hdmi_build_controls(card);
+
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
+		if (!pcm)
+			continue;
+
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
 			 "HDMI/DP, pcm=%d Jack", pcm->device);
 		err = snd_soc_card_jack_new(card, jack_name,
 					    SND_JACK_AVOUT, &pcm->hdmi_jack,
 					    NULL, 0);
-
 		if (err)
 			return err;
 
diff --git a/sound/soc/intel/boards/skl_hda_dsp_common.h b/sound/soc/intel/boards/skl_hda_dsp_common.h
index daa582e513b2..bbe6e2acfda3 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_common.h
+++ b/sound/soc/intel/boards/skl_hda_dsp_common.h
@@ -14,6 +14,9 @@
 #include <linux/platform_device.h>
 #include <sound/core.h>
 #include <sound/jack.h>
+#include <sound/hda_codec.h>
+#include "../../codecs/hdac_hda.h"
+#include "hda_dsp_common.h"
 
 #define HDA_DSP_MAX_BE_DAI_LINKS 7
 
@@ -29,10 +32,30 @@ struct skl_hda_private {
 	int pcm_count;
 	int dai_index;
 	const char *platform_name;
+	bool common_hdmi_codec_drv;
 };
 
 extern struct snd_soc_dai_link skl_hda_be_dai_links[HDA_DSP_MAX_BE_DAI_LINKS];
 int skl_hda_hdmi_jack_init(struct snd_soc_card *card);
 int skl_hda_hdmi_add_pcm(struct snd_soc_card *card, int device);
 
+/*
+ * Search card topology and register HDMI PCM related controls
+ * to codec driver.
+ */
+static inline int skl_hda_hdmi_build_controls(struct snd_soc_card *card)
+{
+	struct skl_hda_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component;
+	struct skl_hda_hdmi_pcm *pcm;
+
+	pcm = list_first_entry(&ctx->hdmi_pcm_list, struct skl_hda_hdmi_pcm,
+			       head);
+	component = pcm->codec_dai->component;
+	if (!component)
+		return -EINVAL;
+
+	return hda_dsp_hdmi_build_controls(card, component);
+}
+
 #endif /* __SOUND_SOC_HDA_DSP_COMMON_H */
diff --git a/sound/soc/intel/boards/skl_hda_dsp_generic.c b/sound/soc/intel/boards/skl_hda_dsp_generic.c
index 1778acdc367c..b4e2bec576f0 100644
--- a/sound/soc/intel/boards/skl_hda_dsp_generic.c
+++ b/sound/soc/intel/boards/skl_hda_dsp_generic.c
@@ -178,6 +178,7 @@ static int skl_hda_audio_probe(struct platform_device *pdev)
 	ctx->pcm_count = hda_soc_card.num_links;
 	ctx->dai_index = 1; /* hdmi codec dai name starts from index 1 */
 	ctx->platform_name = mach->mach_params.platform;
+	ctx->common_hdmi_codec_drv = mach->mach_params.common_hdmi_codec_drv;
 
 	hda_soc_card.dev = &pdev->dev;
 	snd_soc_card_set_drvdata(&hda_soc_card, ctx);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
