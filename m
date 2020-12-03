Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D480F2CDA75
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Dec 2020 16:57:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5A3211838;
	Thu,  3 Dec 2020 16:56:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5A3211838
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607011031;
	bh=byBZFeagDPxXcrri3WtPbU3E9nXyMzW3G4+GismsWOg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LySLShaL5e0PKfnvj6AvhegFJzrnEHvvU0vnFM2MRYdweXe8Vc+BdwvbukFpPjaE3
	 zoDuG2IVhZQmiZz1U6hH6utev/wviXZHAXJ/acatyjp2ybiviMa6dsW3TqTj/bxhwP
	 hBodWbM9TLXmOBMlYueIEFmT9Ak1Bu4VfPwhiPJA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 875A5F80254;
	Thu,  3 Dec 2020 16:55:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61CCAF80254; Thu,  3 Dec 2020 16:55:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1C7D9F800E8
 for <alsa-devel@alsa-project.org>; Thu,  3 Dec 2020 16:55:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C7D9F800E8
IronPort-SDR: 7hSdHEH6uDs1tt3bth1fSitO/chsJ2OrqCWF9f+04QzKdXs4rp6ijrHRPtROCYDftaxKQi/Zfk
 ueXacJ1EOXLw==
X-IronPort-AV: E=McAfee;i="6000,8403,9824"; a="152466200"
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="152466200"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2020 07:55:18 -0800
IronPort-SDR: AmxfOvxMXsoKaWBp8dSBmL/RGJbPsnKSBTc2rB8ux2wFXyKyospR8ohpdxLPIbB95ku7wHsaIp
 5UGzzpduTCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,389,1599548400"; d="scan'208";a="330869669"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by orsmga003.jf.intel.com with ESMTP; 03 Dec 2020 07:55:14 -0800
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: intel: sof_rt5682: Add support for tgl_rt1011_rt5682
Date: Thu,  3 Dec 2020 23:40:10 +0800
Message-Id: <20201203154010.29464-1-brent.lu@intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Dharageswari R <dharageswari.r@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Sathyanarayana Nujella <sathyanarayana.nujella@intel.com>,
 Fred Oh <fred.oh@linux.intel.com>, Naveen Manohar <naveen.m@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Brent Lu <brent.lu@intel.com>,
 Yong Zhi <yong.zhi@intel.com>
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

This patch adds the driver data for two rt1011 speaker amplifiers on
SSP1 and rt5682 on SSP0 for TGL platform. DAI format for rt1011 is
leveraged from cml_rt1011_rt5682 which is 4-slot tdm with 100fs bclk.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/Makefile               |   2 +-
 sound/soc/intel/boards/sof_realtek_common.c   | 138 ++++++++++++++++++
 sound/soc/intel/boards/sof_realtek_common.h   |  24 +++
 sound/soc/intel/boards/sof_rt5682.c           |  26 +++-
 .../intel/common/soc-acpi-intel-tgl-match.c   |  17 ++-
 6 files changed, 201 insertions(+), 7 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_realtek_common.c
 create mode 100644 sound/soc/intel/boards/sof_realtek_common.h

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index dddb672a6d55..b58b9b60d37e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -443,6 +443,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_MAX98373_I2C
+	select SND_SOC_RT1011
 	select SND_SOC_RT1015
 	select SND_SOC_RT5682_I2C
 	select SND_SOC_DMIC
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index a58e4d22e9c8..5f03e484b215 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -18,7 +18,7 @@ snd-soc-sst-byt-cht-cx2072x-objs := bytcht_cx2072x.o
 snd-soc-sst-byt-cht-da7213-objs := bytcht_da7213.o
 snd-soc-sst-byt-cht-es8316-objs := bytcht_es8316.o
 snd-soc-sst-byt-cht-nocodec-objs := bytcht_nocodec.o
-snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o sof_maxim_common.o
+snd-soc-sof_rt5682-objs := sof_rt5682.o hda_dsp_common.o sof_maxim_common.o sof_realtek_common.o
 snd-soc-cml_rt1011_rt5682-objs := cml_rt1011_rt5682.o hda_dsp_common.o
 snd-soc-kbl_da7219_max98357a-objs := kbl_da7219_max98357a.o
 snd-soc-kbl_da7219_max98927-objs := kbl_da7219_max98927.o
diff --git a/sound/soc/intel/boards/sof_realtek_common.c b/sound/soc/intel/boards/sof_realtek_common.c
new file mode 100644
index 000000000000..f3cf73c620ba
--- /dev/null
+++ b/sound/soc/intel/boards/sof_realtek_common.c
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// Copyright(c) 2020 Intel Corporation. All rights reserved.
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/soc-dai.h>
+#include <sound/soc-dapm.h>
+#include <uapi/sound/asound.h>
+#include "../../codecs/rt1011.h"
+#include "sof_realtek_common.h"
+
+/*
+ * Current only 2-amp configuration is supported for rt1011
+ */
+static const struct snd_soc_dapm_route rt1011_dapm_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Left SPO" },
+	{ "Right Spk", NULL, "Right SPO" },
+};
+
+/*
+ * Make sure device's Unique ID follows this configuration:
+ *
+ * Two speakers:
+ *         0: left, 1: right
+ * Four speakers:
+ *         0: Woofer left, 1: Woofer right
+ *         2: Tweeter left, 3: Tweeter right
+ */
+static struct snd_soc_codec_conf rt1011_codec_confs[] = {
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(RT1011_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
+static struct snd_soc_dai_link_component rt1011_dai_link_components[] = {
+	{
+		.name = RT1011_DEV0_NAME,
+		.dai_name = RT1011_CODEC_DAI,
+	},
+	{
+		.name = RT1011_DEV1_NAME,
+		.dai_name = RT1011_CODEC_DAI,
+	},
+};
+
+static const struct {
+	unsigned int tx;
+	unsigned int rx;
+} rt1011_tdm_mask[] = {
+	{.tx = 0x4, .rx = 0x1},
+	{.tx = 0x8, .rx = 0x2},
+};
+
+static int rt1011_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int srate, i, ret = 0;
+
+	srate = params_rate(params);
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		/* 100 Fs to drive 24 bit data */
+		ret = snd_soc_dai_set_pll(codec_dai, 0, RT1011_PLL1_S_BCLK,
+					  100 * srate, 256 * srate);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set pll, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		ret = snd_soc_dai_set_sysclk(codec_dai, RT1011_FS_SYS_PRE_S_PLL1,
+					     256 * srate, SND_SOC_CLOCK_IN);
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set sysclk, ret %d\n",
+				ret);
+			return ret;
+		}
+
+		if (i >= ARRAY_SIZE(rt1011_tdm_mask)) {
+			dev_err(codec_dai->dev, "invalid codec index %d\n",
+				i);
+			return -ENODEV;
+		}
+
+		ret = snd_soc_dai_set_tdm_slot(codec_dai, rt1011_tdm_mask[i].tx,
+					       rt1011_tdm_mask[i].rx, 4,
+					       params_width(params));
+		if (ret < 0) {
+			dev_err(codec_dai->dev, "fail to set tdm slot, ret %d\n",
+				ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops rt1011_ops = {
+	.hw_params = rt1011_hw_params,
+};
+
+static int rt1011_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1011_dapm_routes,
+				      ARRAY_SIZE(rt1011_dapm_routes));
+	if (ret)
+		dev_err(rtd->dev, "Speaker map addition failed: %d\n", ret);
+	return ret;
+}
+
+void sof_rt1011_dai_link(struct snd_soc_dai_link *link)
+{
+	link->codecs = rt1011_dai_link_components;
+	link->num_codecs = ARRAY_SIZE(rt1011_dai_link_components);
+	link->init = rt1011_init;
+	link->ops = &rt1011_ops;
+}
+
+void sof_rt1011_codec_conf(struct snd_soc_card *card)
+{
+	card->codec_conf = rt1011_codec_confs;
+	card->num_configs = ARRAY_SIZE(rt1011_codec_confs);
+}
diff --git a/sound/soc/intel/boards/sof_realtek_common.h b/sound/soc/intel/boards/sof_realtek_common.h
new file mode 100644
index 000000000000..87cb3812b926
--- /dev/null
+++ b/sound/soc/intel/boards/sof_realtek_common.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright(c) 2020 Intel Corporation.
+ */
+
+/*
+ * This file defines data structures used in Machine Driver for Intel
+ * platforms with Realtek Codecs.
+ */
+#ifndef __SOF_REALTEK_COMMON_H
+#define __SOF_REALTEK_COMMON_H
+
+#include <sound/soc.h>
+
+#define RT1011_CODEC_DAI	"rt1011-aif"
+#define RT1011_DEV0_NAME	"i2c-10EC1011:00"
+#define RT1011_DEV1_NAME	"i2c-10EC1011:01"
+#define RT1011_DEV2_NAME	"i2c-10EC1011:02"
+#define RT1011_DEV3_NAME	"i2c-10EC1011:03"
+
+void sof_rt1011_dai_link(struct snd_soc_dai_link *link);
+void sof_rt1011_codec_conf(struct snd_soc_card *card);
+
+#endif /* __SOF_REALTEK_COMMON_H */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index 891f908659f5..8b1ca2da9bb9 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -24,6 +24,7 @@
 #include "../common/soc-intel-quirks.h"
 #include "hda_dsp_common.h"
 #include "sof_maxim_common.h"
+#include "sof_realtek_common.h"
 
 #define NAME_SIZE 32
 
@@ -41,10 +42,11 @@
 #define SOF_RT5682_NUM_HDMIDEV_MASK		(GENMASK(12, 10))
 #define SOF_RT5682_NUM_HDMIDEV(quirk)	\
 	((quirk << SOF_RT5682_NUM_HDMIDEV_SHIFT) & SOF_RT5682_NUM_HDMIDEV_MASK)
-#define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(13)
-#define SOF_RT1015_SPEAKER_AMP_100FS		BIT(14)
-#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(15)
-#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(16)
+#define SOF_RT1011_SPEAKER_AMP_PRESENT		BIT(13)
+#define SOF_RT1015_SPEAKER_AMP_PRESENT		BIT(14)
+#define SOF_RT1015_SPEAKER_AMP_100FS		BIT(15)
+#define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(16)
+#define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(17)
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -741,6 +743,9 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 			links[id].codecs = max98360a_component;
 			links[id].num_codecs = ARRAY_SIZE(max98360a_component);
 			links[id].init = speaker_codec_init;
+		} else if (sof_rt5682_quirk &
+				SOF_RT1011_SPEAKER_AMP_PRESENT) {
+			sof_rt1011_dai_link(&links[id]);
 		} else {
 			links[id].codecs = max98357a_component;
 			links[id].num_codecs = ARRAY_SIZE(max98357a_component);
@@ -851,6 +856,8 @@ static int sof_audio_probe(struct platform_device *pdev)
 
 	if (sof_rt5682_quirk & SOF_MAX98373_SPEAKER_AMP_PRESENT)
 		sof_max98373_codec_conf(&sof_audio_card_rt5682);
+	else if (sof_rt5682_quirk & SOF_RT1011_SPEAKER_AMP_PRESENT)
+		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
 
 	dai_links = sof_card_dai_links_create(&pdev->dev, ssp_codec, ssp_amp,
 					      dmic_be_num, hdmi_num);
@@ -931,6 +938,15 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT1015_SPEAKER_AMP_100FS |
 					SOF_RT5682_SSP_AMP(1)),
 	},
+	{
+		.name = "tgl_rt1011_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_RT1011_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
 	{ }
 };
 
@@ -948,6 +964,7 @@ module_platform_driver(sof_audio)
 MODULE_DESCRIPTION("SOF Audio Machine driver");
 MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
 MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:sof_rt5682");
 MODULE_ALIAS("platform:tgl_max98357a_rt5682");
@@ -955,3 +972,4 @@ MODULE_ALIAS("platform:jsl_rt5682_rt1015");
 MODULE_ALIAS("platform:tgl_max98373_rt5682");
 MODULE_ALIAS("platform:jsl_rt5682_max98360a");
 MODULE_ALIAS("platform:cml_rt1015_rt5682");
+MODULE_ALIAS("platform:tgl_rt1011_rt5682");
diff --git a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
index 9f243e60b95c..98196e9fad62 100644
--- a/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-tgl-match.c
@@ -9,7 +9,7 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
-static struct snd_soc_acpi_codecs tgl_codecs = {
+static const struct snd_soc_acpi_codecs tgl_codecs = {
 	.num_codecs = 1,
 	.codecs = {"MX98357A"}
 };
@@ -305,11 +305,16 @@ static const struct snd_soc_acpi_link_adr tgl_3_in_1_sdca[] = {
 	{}
 };
 
-static struct snd_soc_acpi_codecs tgl_max98373_amp = {
+static const struct snd_soc_acpi_codecs tgl_max98373_amp = {
 	.num_codecs = 1,
 	.codecs = {"MX98373"}
 };
 
+static const struct snd_soc_acpi_codecs tgl_rt1011_amp = {
+	.num_codecs = 1,
+	.codecs = {"10EC1011"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 	{
 		.id = "10EC1308",
@@ -335,6 +340,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_tgl_machines[] = {
 		.sof_fw_filename = "sof-tgl.ri",
 		.sof_tplg_filename = "sof-tgl-max98373-rt5682.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "tgl_rt1011_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &tgl_rt1011_amp,
+		.sof_fw_filename = "sof-tgl.ri",
+		.sof_tplg_filename = "sof-tgl-rt1011-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_tgl_machines);
-- 
2.17.1

