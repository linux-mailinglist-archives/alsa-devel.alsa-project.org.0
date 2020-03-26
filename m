Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE580194736
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:12:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56642167F;
	Thu, 26 Mar 2020 20:11:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56642167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249941;
	bh=KfN5fnvJKuLpqvq9rI2iaowdrlBp6PBjXFSgqJSr+z4=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=voWjXn/onS5qhCYYT398Pd86+GWRImuT2OTQ/OIJQYvgLcCeEsOSCvs/1Oq8EF2KE
	 kJduUO69FCt5IFhtmWQ8Yz5qO45q8Zy491AMddzL9Qk7foOnhVbvN+ljlUWPGtv3XL
	 eC0ZGF86vUAhnZ5AMKG1KkkDhF4IEpzsqrDrDCPQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C878F80303;
	Thu, 26 Mar 2020 20:05:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F04F9F802EA; Thu, 26 Mar 2020 20:05:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id F24E4F802EA
 for <alsa-devel@alsa-project.org>; Thu, 26 Mar 2020 20:05:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F24E4F802EA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED1C77FA;
 Thu, 26 Mar 2020 12:05:28 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6E1F23F71F;
 Thu, 26 Mar 2020 12:05:28 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:26 +0000
From: Mark Brown <broonie@kernel.org>
To: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Subject: Applied "ASoC: Intel: sof_rt5682: Add support for
 tgl-max98373-rt5682" to the asoc tree
In-Reply-To: <20200325213245.28247-4-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325213245.28247-4-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 Jairaj Arava <jairaj.arava@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

The patch

   ASoC: Intel: sof_rt5682: Add support for tgl-max98373-rt5682

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

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

From e2e404a6164e526193f78717de060cd9b27b3b90 Mon Sep 17 00:00:00 2001
From: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Date: Wed, 25 Mar 2020 16:32:44 -0500
Subject: [PATCH] ASoC: Intel: sof_rt5682: Add support for tgl-max98373-rt5682

This patch does the below:
1. Adds the driver data and updates quirk info for TGL
        with Max98373 speaker amp and ALC5682 headset codec.
2. Added max98373 speaker related code to common file for re-use.

Signed-off-by: Jairaj Arava <jairaj.arava@intel.com>
Signed-off-by: Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200325213245.28247-4-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig            |  1 +
 sound/soc/intel/boards/Makefile           |  2 +-
 sound/soc/intel/boards/sof_maxim_common.c | 80 +++++++++++++++++++++++
 sound/soc/intel/boards/sof_maxim_common.h | 24 +++++++
 sound/soc/intel/boards/sof_rt5682.c       | 21 ++++++
 5 files changed, 127 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/sof_maxim_common.c
 create mode 100644 sound/soc/intel/boards/sof_maxim_common.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index fb8d83518c47..f18dd9fde973 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -450,6 +450,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 	depends on (SND_SOC_SOF_HDA_LINK && (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	depends on SND_HDA_CODEC_HDMI
+	select SND_SOC_MAX98373
 	select SND_SOC_RT1015
 	select SND_SOC_RT5682
 	select SND_SOC_DMIC
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 781e7ec58e47..e083ceeccdad 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -19,7 +19,7 @@ snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o sof_maxim_common.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o hda_dsp_common.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
new file mode 100644
index 000000000000..463b39a7ccfd
--- /dev/null
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+#include <linux/string.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+#include <uapi/sound/asound.h>
+#include "sof_maxim_common.h"
+
+static const struct snd_soc_dapm_route max_98373_dapm_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
+static struct snd_soc_codec_conf max_98373_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98373_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98373_DEV1_NAME),
+		.name_prefix = "Left",
+	},
+};
+
+struct snd_soc_dai_link_component max_98373_components[] = {
+	{  /* For Left */
+		.name = MAX_98373_DEV0_NAME,
+		.dai_name = MAX_98373_CODEC_DAI,
+	},
+	{  /* For Right */
+		.name = MAX_98373_DEV1_NAME,
+		.dai_name = MAX_98373_CODEC_DAI,
+	},
+};
+
+static int max98373_hw_params(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_dai *codec_dai;
+	int j;
+
+	for_each_rtd_codec_dais(rtd, j, codec_dai) {
+		if (!strcmp(codec_dai->component->name, MAX_98373_DEV0_NAME)) {
+			/* DEV0 tdm slot configuration */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x30, 3, 8, 16);
+		}
+		if (!strcmp(codec_dai->component->name, MAX_98373_DEV1_NAME)) {
+			/* DEV1 tdm slot configuration */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0xC0, 3, 8, 16);
+		}
+	}
+	return 0;
+}
+
+struct snd_soc_ops max_98373_ops = {
+	.hw_params = max98373_hw_params,
+};
+
+int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
+				      ARRAY_SIZE(max_98373_dapm_routes));
+	if (ret)
+		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	return ret;
+}
+
+void sof_max98373_codec_conf(struct snd_soc_card *card)
+{
+	card->codec_conf = max_98373_codec_conf;
+	card->num_configs = ARRAY_SIZE(max_98373_codec_conf);
+}
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
new file mode 100644
index 000000000000..406bf0e81155
--- /dev/null
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright(c) 2020 Intel Corporation.
+ */
+
+/*
+ * This file defines data structures used in Machine Driver for Intel
+ * platforms with Maxim Codecs.
+ */
+#ifndef __SOF_MAXIM_COMMON_H
+#define __SOF_MAXIM_COMMON_H
+
+#include <sound/soc.h>
+
+#define MAX_98373_CODEC_DAI	"max98373-aif1"
+#define MAX_98373_DEV0_NAME	"i2c-MX98373:00"
+#define MAX_98373_DEV1_NAME	"i2c-MX98373:01"
+
+extern struct snd_soc_dai_link_component max_98373_components[2];
+extern struct snd_soc_ops max_98373_ops;
+
+int max98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+void sof_max98373_codec_conf(struct snd_soc_card *card);
+#endif /* __SOF_MAXIM_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 6defe7c85c32..2eeaa14e59c0 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -23,6 +23,7 @@
 #include "../../codecs/hdac_hdmi.h"
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
+#include "sof_maxim_common.h"
 
 #define NAME_SIZE 32
 
@@ -41,6 +42,7 @@
 #define SOF_RT5682_NUM_HDMIDEV(quirk)	\
 	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
 #define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(13)
+#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(14)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -637,6 +639,12 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].num_codecs = ARRAY_SIZE(rt1015_components);
 			links[id].init = speaker_codec_init_lr;
 			links[id].ops = &sof_rt1015_ops;
+		} else if (sof_rt5682_quirk &
+				SOF_MAX98373_SPEAKER_AMP_PRESENT) {
+			links[id].codecs = max_98373_components;
+			links[id].num_codecs = ARRAY_SIZE(max_98373_components);
+			links[id].init = max98373_spk_codec_init;
+			links[id].ops = &max_98373_ops;
 		} else {
 			links[id].codecs = max98357a_component;
 			links[id].num_codecs = ARRAY_SIZE(max98357a_component);
@@ -745,6 +753,9 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (sof_rt5682_quirk & SOF_SPEAKER_AMP_PRESENT)
 		sof_audio_card_rt5682.num_links++;
 
+	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
+		sof_max98373_codec_conf(&sof_audio_card_rt5682);
+
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
 					      dmic_be_num, hdmi_num);
 	if (!dai_links)
@@ -811,6 +822,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT1015_SPEAKER_AMP_PRESENT |
 					SOF_RT5682_SSP_AMP(1)),
 	},
+	{
+		.name = "tgl_max98373_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98373_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{ }
 };
 
@@ -833,3 +853,4 @@ MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_rt5682");
 MODULE_ALIAS("platform:tgl_max98357a_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_rt1015");
+MODULE_ALIAS("platform:tgl_max98373_rt5682");
-- 
2.20.1

