Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C541E8E6A
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2019 18:40:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A22F0228E;
	Tue, 29 Oct 2019 18:39:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A22F0228E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572370818;
	bh=jzv3uWpJfNbfPnJeWBcmeMKNizQNtKuhkK3YDJifeRw=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=A49myj8iLocViMAgkBN4zJWh/L2SzftuhpBpJs2aCtGUbTAhN6P3LYoGsL0BDI/JB
	 7YxBJ5vljX39lQ+3DMnxX/Q32nORmKDAH7vSB9mHiARvh+kyPvTUCldsnp9YhgTr0K
	 60eIuiccpxfiEhi8HIyDLtV0Ht9g8KDYpDYy545A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6480FF8063C;
	Tue, 29 Oct 2019 18:34:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6F2DF803D7; Tue, 29 Oct 2019 18:34:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D959AF80392
 for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2019 18:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D959AF80392
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="hVFVvhC0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=vpaHlG+B/eeh0Z6vMfqEwVml+rLAuIRmthdFtLHUu4k=; b=hVFVvhC0xBpV
 +gysGyTNWRkeqx54J3brH/nn8xTCdEAKAOlaDuTSMYS0l5DwSMG2iypTaubdTRELUw6YHZeIWKoDZ
 BqEbpz/uFYRK2n34BHD64BKbwBgPLhE/7U47K5oKb2sMyzZhDv2Getd1gDYyKKY3i81BLvVFF0ofr
 azI/g=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=ypsilon.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.co.uk>)
 id 1iPVNt-0002kd-2e; Tue, 29 Oct 2019 17:34:21 +0000
Received: by ypsilon.sirena.org.uk (Postfix, from userid 1000)
 id 934E727428D8; Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
In-Reply-To: <20191029134017.18901-4-kai.vehmanen@linux.intel.com>
X-Patchwork-Hint: ignore
Message-Id: <20191029173420.934E727428D8@ypsilon.sirena.org.uk>
Date: Tue, 29 Oct 2019 17:34:20 +0000 (GMT)
Cc: libin.yang@intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, tiwai@suse.de,
 pierre-louis.bossart@linux.intel.com, julia.lawall@lip6.fr,
 Mark Brown <broonie@kernel.org>
Subject: [alsa-devel] Applied "ASoC: Intel: skl-hda-dsp-generic: use
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

   ASoC: Intel: skl-hda-dsp-generic: use snd-hda-codec-hdmi

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

From 7de9a47c8971bdec07cc9a62e948382003c5908f Mon Sep 17 00:00:00 2001
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Date: Tue, 29 Oct 2019 15:40:11 +0200
Subject: [PATCH] ASoC: Intel: skl-hda-dsp-generic: use snd-hda-codec-hdmi

Add support for using snd-hda-codec-hdmi driver for HDMI/DP
instead of ASoC hdac-hdmi. This is aligned with how other
HDA codecs are already handled.

When snd-hda-codec-hdmi is used, the PCM device numbers are
parsed from card topology and passed to the codec driver.
This needs to be done at runtime as topology changes may
affect PCM device allocation.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Takashi Iwai <tiwai@suse.de>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20191029134017.18901-4-kai.vehmanen@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 include/sound/soc-acpi.h                     |  2 +
 sound/soc/intel/boards/Makefile              |  2 +-
 sound/soc/intel/boards/hda_dsp_common.c      | 85 ++++++++++++++++++++
 sound/soc/intel/boards/hda_dsp_common.h      | 32 ++++++++
 sound/soc/intel/boards/skl_hda_dsp_common.c  |  6 ++
 sound/soc/intel/boards/skl_hda_dsp_common.h  | 23 ++++++
 sound/soc/intel/boards/skl_hda_dsp_generic.c |  1 +
 7 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/hda_dsp_common.c
 create mode 100644 sound/soc/intel/boards/hda_dsp_common.h

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index c0fb71c7b3ad..c4c997bd0379 100644
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
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 6445f90ea542..52e990b16b0d 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -24,7 +24,7 @@ snd-soc-kbl_rt5663_max98927-objs := kbl_rt5663_max98927.o
 snd-soc-kbl_rt5663_rt5514_max98927-objs := kbl_rt5663_rt5514_max98927.o
 snd-soc-kbl_rt5660-objs := kbl_rt5660.o
 snd-soc-skl_rt286-objs := skl_rt286.o
-snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o
+snd-soc-skl_hda_dsp-objs := skl_hda_dsp_generic.o skl_hda_dsp_common.o hda_dsp_common.o
 snd-skl_nau88l25_max98357a-objs := skl_nau88l25_max98357a.o
 snd-soc-skl_nau88l25_ssm4567-objs := skl_nau88l25_ssm4567.o
 
diff --git a/sound/soc/intel/boards/hda_dsp_common.c b/sound/soc/intel/boards/hda_dsp_common.c
new file mode 100644
index 000000000000..ed36b68d6705
--- /dev/null
+++ b/sound/soc/intel/boards/hda_dsp_common.c
@@ -0,0 +1,85 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright(c) 2019 Intel Corporation. All rights reserved.
+
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/hda_codec.h>
+#include <sound/hda_i915.h>
+#include "../../codecs/hdac_hda.h"
+
+#include "hda_dsp_common.h"
+
+/*
+ * Search card topology and return PCM device number
+ * matching Nth HDMI device (zero-based index).
+ */
+struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
+					int hdmi_idx)
+{
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_pcm *spcm;
+	int i = 0;
+
+	for_each_card_rtds(card, rtd) {
+		spcm = rtd->pcm ?
+			rtd->pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].pcm : NULL;
+		if (spcm && strstr(spcm->id, "HDMI")) {
+			if (i == hdmi_idx)
+				return rtd->pcm;
+			++i;
+		}
+	}
+
+	return NULL;
+}
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+/*
+ * Search card topology and register HDMI PCM related controls
+ * to codec driver.
+ */
+int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
+				struct snd_soc_component *comp)
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
+		} else {
+			hpcm->pcm = 0;
+			hpcm->device = SNDRV_PCM_INVALID_DEVICE;
+			dev_warn(card->dev,
+				 "%s: no PCM in topology for HDMI converter %d\n\n",
+				 __func__, i);
+		}
+		i++;
+	}
+	snd_hdac_display_power(hcodec->core.bus,
+			       HDA_CODEC_IDX_CONTROLLER, true);
+	err = snd_hda_codec_build_controls(hcodec);
+	if (err < 0)
+		dev_err(card->dev, "unable to create controls %d\n", err);
+	snd_hdac_display_power(hcodec->core.bus,
+			       HDA_CODEC_IDX_CONTROLLER, false);
+
+	return err;
+}
+
+#endif
diff --git a/sound/soc/intel/boards/hda_dsp_common.h b/sound/soc/intel/boards/hda_dsp_common.h
new file mode 100644
index 000000000000..431f7f09dccb
--- /dev/null
+++ b/sound/soc/intel/boards/hda_dsp_common.h
@@ -0,0 +1,32 @@
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
+#include <sound/hda_i915.h>
+#include "../../codecs/hdac_hda.h"
+
+struct snd_pcm *hda_dsp_hdmi_pcm_handle(struct snd_soc_card *card,
+					int hdmi_idx);
+
+#if IS_ENABLED(CONFIG_SND_SOC_SOF_HDA_AUDIO_CODEC)
+int hda_dsp_hdmi_build_controls(struct snd_soc_card *card,
+				struct snd_soc_component *comp);
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
index 58409b6e476e..eb419e1ec42b 100644
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
@@ -136,6 +139,9 @@ int skl_hda_hdmi_jack_init(struct snd_soc_card *card)
 	char jack_name[NAME_SIZE];
 	int err;
 
+	if (ctx->common_hdmi_codec_drv)
+		return skl_hda_hdmi_build_controls(card);
+
 	list_for_each_entry(pcm, &ctx->hdmi_pcm_list, head) {
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
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
index e8d676c192f6..4e45901e3a2f 100644
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
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
