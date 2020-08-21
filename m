Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0092124E1D7
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Aug 2020 22:07:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9FF99166F;
	Fri, 21 Aug 2020 22:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9FF99166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598040429;
	bh=ywLfKmS0x8bT0AOgpLIP2jYoPqbc6pKlxWNqS0stO94=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hvuvy1zZ+xnjqGXGL7ycDfvxxc+mUJBeBPi/I2+st2/ddQj09tUxa7SnSFaCxOgIf
	 QWz24CD0gM0zICMPNQ9o0l1ro/TMeTOrTDg7SMynlsgCmvKhCayS/Jo+ca7Q9b7gJL
	 pdFZgk1YHVl9ex1i57w4P3Q/0lMYjaM4uYeby/bY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35657F8034F;
	Fri, 21 Aug 2020 21:57:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F2823F802FF; Fri, 21 Aug 2020 21:56:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 426CFF802DB
 for <alsa-devel@alsa-project.org>; Fri, 21 Aug 2020 21:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 426CFF802DB
IronPort-SDR: rrnHAgrn27nuhxWTK/8gPLrrbKHSkZHO7BuhsKzIUBItOErG7p6YMqAzPS1fumqNbi0dZ9//NV
 G3AigRkzyYwA==
X-IronPort-AV: E=McAfee;i="6000,8403,9720"; a="217158577"
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="217158577"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:26 -0700
IronPort-SDR: m4df3fDcECLophNuSCORLf21USbdPQ5FoIhqvEqodm8DmB4F5DYWibhLiW1mNvrcNwzaBfGKiF
 2U2dYhioTfNA==
X-IronPort-AV: E=Sophos;i="5.76,338,1592895600"; d="scan'208";a="279002450"
Received: from pahnn-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com)
 ([10.254.176.176])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2020 12:56:25 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 13/14] ASoC: Intel: sof_sdw: add rt711 rt1316 rt714 SDCA codec
 support.
Date: Fri, 21 Aug 2020 14:56:02 -0500
Message-Id: <20200821195603.215535-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
References: <20200821195603.215535-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 tiwai@suse.de, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 vinod.koul@intel.com, broonie@kernel.org,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Add rt711, rt1316, and rt714 SDCA codecs support in sof_sdw machine driver.

Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig              |   3 +
 sound/soc/intel/boards/Makefile             |   7 +-
 sound/soc/intel/boards/sof_sdw.c            |  37 +++++
 sound/soc/intel/boards/sof_sdw_common.h     |  19 +++
 sound/soc/intel/boards/sof_sdw_rt1316.c     | 113 +++++++++++++
 sound/soc/intel/boards/sof_sdw_rt711_sdca.c | 174 ++++++++++++++++++++
 sound/soc/intel/boards/sof_sdw_rt715_sdca.c |  42 +++++
 7 files changed, 392 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt1316.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt711_sdca.c
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt715_sdca.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index d96fc1313434..12dd41796e82 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -569,9 +569,12 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_MAX98373_SDW
 	select SND_SOC_RT700_SDW
 	select SND_SOC_RT711_SDW
+	select SND_SOC_RT711_SDCA_SDW
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
+	select SND_SOC_RT1316_SDW
 	select SND_SOC_RT715_SDW
+	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_DMIC
         help
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index dc04acb911b6..de7cc9b86354 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -35,9 +35,10 @@ snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
 snd-soc-ehl-rt5660-objs := ehl_rt5660.o hda_dsp_common.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_max98373.o			\
-			sof_sdw_rt711.o sof_sdw_rt700.o		\
-			sof_sdw_rt1308.o sof_sdw_rt715.o	\
-			sof_sdw_rt5682.o			\
+			sof_sdw_rt1308.o sof_sdw_rt1316.o	\
+			sof_sdw_rt5682.o sof_sdw_rt700.o	\
+			sof_sdw_rt711.o sof_sdw_rt711_sdca.o 	\
+			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
 			sof_maxim_common.o                      \
 			sof_sdw_dmic.o sof_sdw_hdmi.o hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 44d06fa48b24..00d10e83872a 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -141,6 +141,10 @@ static struct snd_soc_codec_conf codec_conf[] = {
 		.dlc = COMP_CODEC_CONF("sdw:0:25d:711:0"),
 		.name_prefix = "rt711",
 	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:0:25d:711:1"),
+		.name_prefix = "rt711",
+	},
 	/* rt1308 w/ I2S connection */
 	{
 		.dlc = COMP_CODEC_CONF("i2c-10EC1308:00"),
@@ -187,6 +191,18 @@ static struct snd_soc_codec_conf codec_conf[] = {
 		.dlc = COMP_CODEC_CONF("sdw:2:25d:5682:0"),
 		.name_prefix = "rt5682",
 	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:1:25d:1316:1"),
+		.name_prefix = "rt1316-1",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:2:25d:1316:1"),
+		.name_prefix = "rt1316-2",
+	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:3:25d:714:1"),
+		.name_prefix = "rt714",
+	},
 };
 
 static struct snd_soc_dai_link_component dmic_component[] = {
@@ -228,6 +244,15 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 	},
 	{
 		.part_id = 0x711,
+		.version_id = 3,
+		.direction = {true, true},
+		.dai_name = "rt711-sdca-aif1",
+		.init = sof_sdw_rt711_sdca_init,
+		.exit = sof_sdw_rt711_sdca_exit,
+	},
+	{
+		.part_id = 0x711,
+		.version_id = 2,
 		.direction = {true, true},
 		.dai_name = "rt711-aif1",
 		.init = sof_sdw_rt711_init,
@@ -241,6 +266,18 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.ops = &sof_sdw_rt1308_i2s_ops,
 		.init = sof_sdw_rt1308_init,
 	},
+	{
+		.part_id = 0x1316,
+		.direction = {true, true},
+		.dai_name = "rt1316-aif",
+		.init = sof_sdw_rt1316_init,
+	},
+	{
+		.part_id = 0x714,
+		.direction = {false, true},
+		.dai_name = "rt715-aif2",
+		.init = sof_sdw_rt715_sdca_init,
+	},
 	{
 		.part_id = 0x715,
 		.direction = {false, true},
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index ce0680a7b180..6a5d46589baf 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -96,6 +96,13 @@ int sof_sdw_rt711_init(const struct snd_soc_acpi_link_adr *link,
 		       bool playback);
 int sof_sdw_rt711_exit(struct device *dev, struct snd_soc_dai_link *dai_link);
 
+/* RT711-SDCA support */
+int sof_sdw_rt711_sdca_init(const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links,
+			    struct sof_sdw_codec_info *info,
+			    bool playback);
+int sof_sdw_rt711_sdca_exit(struct device *dev, struct snd_soc_dai_link *dai_link);
+
 /* RT700 support */
 int sof_sdw_rt700_init(const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
@@ -110,12 +117,24 @@ int sof_sdw_rt1308_init(const struct snd_soc_acpi_link_adr *link,
 			struct sof_sdw_codec_info *info,
 			bool playback);
 
+/* RT1316 support */
+int sof_sdw_rt1316_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback);
+
 /* RT715 support */
 int sof_sdw_rt715_init(const struct snd_soc_acpi_link_adr *link,
 		       struct snd_soc_dai_link *dai_links,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
+/* RT715-SDCA support */
+int sof_sdw_rt715_sdca_init(const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links,
+			    struct sof_sdw_codec_info *info,
+			    bool playback);
+
 /* MAX98373 support */
 int sof_sdw_mx8373_init(const struct snd_soc_acpi_link_adr *link,
 			struct snd_soc_dai_link *dai_links,
diff --git a/sound/soc/intel/boards/sof_sdw_rt1316.c b/sound/soc/intel/boards/sof_sdw_rt1316.c
new file mode 100644
index 000000000000..2c566330f236
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt1316.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt1316 - Helpers to handle RT1316 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget rt1316_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+/*
+ * dapm routes for rt1316 will be registered dynamically according
+ * to the number of rt1316 used. The first two entries will be registered
+ * for one codec case, and the last two entries are also registered
+ * if two 1316s are used.
+ */
+static const struct snd_soc_dapm_route rt1316_map[] = {
+	{ "Speaker", NULL, "rt1316-1 SPOL" },
+	{ "Speaker", NULL, "rt1316-1 SPOR" },
+	{ "Speaker", NULL, "rt1316-2 SPOL" },
+	{ "Speaker", NULL, "rt1316-2 SPOR" },
+};
+
+static const struct snd_kcontrol_new rt1316_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int first_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_add_card_controls(card, rt1316_controls,
+					ARRAY_SIZE(rt1316_controls));
+	if (ret) {
+		dev_err(card->dev, "rt1316 controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt1316_widgets,
+					ARRAY_SIZE(rt1316_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt1316 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1316_map, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add first SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static int second_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt1316_map + 2, 2);
+	if (ret)
+		dev_err(rtd->dev, "failed to add second SPK map: %d\n", ret);
+
+	return ret;
+}
+
+static int all_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	ret = first_spk_init(rtd);
+	if (ret)
+		return ret;
+
+	return second_spk_init(rtd);
+}
+
+int sof_sdw_rt1316_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback)
+{
+	/* Count amp number and do init on playback link only. */
+	if (!playback)
+		return 0;
+
+	info->amp_num++;
+	if (info->amp_num == 1)
+		dai_links->init = first_spk_init;
+
+	if (info->amp_num == 2) {
+		/*
+		 * if two 1316s are in one dai link, the init function
+		 * in this dai link will be first set for the first speaker,
+		 * and it should be reset to initialize all speakers when
+		 * the second speaker is found.
+		 */
+		if (dai_links->init)
+			dai_links->init = all_spk_init;
+		else
+			dai_links->init = second_spk_init;
+	}
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt711_sdca.c b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
new file mode 100644
index 000000000000..19496f0f9110
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt711_sdca.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt711_sdca - Helpers to handle RT711-SDCA from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include <sound/jack.h>
+#include "sof_sdw_common.h"
+
+/*
+ * Note this MUST be called before snd_soc_register_card(), so that the props
+ * are in place before the codec component driver's probe function parses them.
+ */
+static int rt711_sdca_add_codec_device_props(const char *sdw_dev_name)
+{
+	struct property_entry props[MAX_NO_PROPS] = {};
+	struct device *sdw_dev;
+	int ret;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL, sdw_dev_name);
+	if (!sdw_dev)
+		return -EPROBE_DEFER;
+
+	if (SOF_RT711_JDSRC(sof_sdw_quirk)) {
+		props[0] = PROPERTY_ENTRY_U32("realtek,jd-src",
+					      SOF_RT711_JDSRC(sof_sdw_quirk));
+	}
+
+	ret = device_add_properties(sdw_dev, props);
+	put_device(sdw_dev);
+
+	return ret;
+}
+
+static const struct snd_soc_dapm_widget rt711_sdca_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route rt711_sdca_map[] = {
+	/* Headphones */
+	{ "Headphone", NULL, "rt711 HP" },
+	{ "rt711 MIC2", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new rt711_sdca_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_jack_pin rt711_sdca_jack_pins[] = {
+	{
+		.pin    = "Headphone",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+static int rt711_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:rt711-sdca",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt711_sdca_controls,
+					ARRAY_SIZE(rt711_sdca_controls));
+	if (ret) {
+		dev_err(card->dev, "rt711-sdca controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt711_sdca_widgets,
+					ARRAY_SIZE(rt711_sdca_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt711-sdca widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt711_sdca_map,
+				      ARRAY_SIZE(rt711_sdca_map));
+
+	if (ret) {
+		dev_err(card->dev, "rt711-sdca map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->sdw_headset,
+				    rt711_sdca_jack_pins,
+				    ARRAY_SIZE(rt711_sdca_jack_pins));
+	if (ret) {
+		dev_err(rtd->card->dev, "Headset Jack creation failed: %d\n",
+			ret);
+		return ret;
+	}
+
+	jack = &ctx->sdw_headset;
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+
+	if (ret)
+		dev_err(rtd->card->dev, "Headset Jack call-back failed: %d\n",
+			ret);
+
+	return ret;
+}
+
+int sof_sdw_rt711_sdca_exit(struct device *dev, struct snd_soc_dai_link *dai_link)
+{
+	struct device *sdw_dev;
+
+	sdw_dev = bus_find_device_by_name(&sdw_bus_type, NULL,
+					  dai_link->codecs[0].name);
+	if (!sdw_dev)
+		return -EINVAL;
+
+	device_remove_properties(sdw_dev);
+	put_device(sdw_dev);
+
+	return 0;
+}
+
+int sof_sdw_rt711_sdca_init(const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links,
+			    struct sof_sdw_codec_info *info,
+			    bool playback)
+{
+	int ret;
+
+	/*
+	 * headset should be initialized once.
+	 * Do it with dai link for playback.
+	 */
+	if (!playback)
+		return 0;
+
+	ret = rt711_sdca_add_codec_device_props(dai_links->codecs[0].name);
+	if (ret < 0)
+		return ret;
+
+	dai_links->init = rt711_sdca_rtd_init;
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt715_sdca.c b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
new file mode 100644
index 000000000000..c056e56a139b
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt715_sdca.c
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt715_sdca - Helpers to handle RT715-SDCA from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include "sof_sdw_common.h"
+
+static int rt715_sdca_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:rt715-sdca",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int sof_sdw_rt715_sdca_init(const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links,
+			    struct sof_sdw_codec_info *info,
+			    bool playback)
+{
+	/*
+	 * DAI ID is fixed at SDW_DMIC_DAI_ID for 715-SDCA to
+	 * keep sdw DMIC and HDMI setting static in UCM
+	 */
+	if (sof_sdw_quirk & SOF_RT715_DAI_ID_FIX)
+		dai_links->id = SDW_DMIC_DAI_ID;
+
+	dai_links->init = rt715_sdca_rtd_init;
+
+	return 0;
+}
-- 
2.25.1

