Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B2E1933A0
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 23:11:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 999191671;
	Wed, 25 Mar 2020 23:10:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 999191671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585174284;
	bh=zYMjXgOi/14c35w0Z8CEVBaewD/rdWC5aGxY9wQkogA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ehvZbyNGgpd2aV2Wd6pqZzejbKPrYRyERXC/Syo4qkkd3fMGu6+Dfn/BDObPnLCq3
	 fxn7JLXlpqnArmeErjqTsu1crYC/kZp63Zo9TxWB37tF3lrp+3p+Iab4n08qG1lLX1
	 87zzpCVDAiCSX651Wwp7vhq4MMbRKyn16R5Hhenw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 586EFF80299;
	Wed, 25 Mar 2020 23:08:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 941F8F8028B; Wed, 25 Mar 2020 23:08:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B488F80158
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 23:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B488F80158
IronPort-SDR: 7Ld/+kUmpMKtKYeefhEZqvj1cRGp+5TjIad2ZauKmxC3iokf5XIUhJviYazX+JBYbaxcbmVEfb
 cmJOws4XjYEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 15:07:53 -0700
IronPort-SDR: hGyvhjHyENBXiJ7hA2mDUOBsGL/fuF0H7yyhAZj5c0yGamRH0Xd/6Bpx3u6BWk2OSYiuBGo2y3
 jKZeB4YkB2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="238634756"
Received: from abeljans.amr.corp.intel.com (HELO
 pbossart-mobl3.amr.corp.intel.com) ([10.251.233.195])
 by fmsmga007.fm.intel.com with ESMTP; 25 Mar 2020 15:07:52 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 4/4] ASoC: Intel: sof_sdw: Add Volteer support with RT5682
 SNDW helper function
Date: Wed, 25 Mar 2020 17:07:46 -0500
Message-Id: <20200325220746.29601-5-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
References: <20200325220746.29601-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Naveen Manohar <naveen.m@intel.com>, broonie@kernel.org,
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

From: Naveen Manohar <naveen.m@intel.com>

Add support for Google Volteer device. As per new unified soundwire machine
driver, add rt5682-sdw helper function, which configures codec to Link0.

Signed-off-by: Naveen Manohar <naveen.m@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig          |   1 +
 sound/soc/intel/boards/Makefile         |   1 +
 sound/soc/intel/boards/sof_sdw.c        |  18 ++++
 sound/soc/intel/boards/sof_sdw_common.h |   6 ++
 sound/soc/intel/boards/sof_sdw_rt5682.c | 126 ++++++++++++++++++++++++
 5 files changed, 152 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt5682.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 4110ae5db65f..556c3104e641 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -538,6 +538,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
 	select SND_SOC_RT715_SDW
+	select SND_SOC_RT5682_SDW
 	select SND_SOC_DMIC
         help
 	  Add support for Intel SoundWire-based platforms connected to
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index c4ff5166a042..1ef6e60bc2a0 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -34,6 +34,7 @@ snd-soc-sof_da7219_max98373-objs := sof_da7219_max98373.o hda_dsp_common.o
 snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt700.o		\
 			sof_sdw_rt1308.o sof_sdw_rt715.o	\
+			sof_sdw_rt5682.o			\
 			sof_sdw_dmic.o sof_sdw_hdmi.o hda_dsp_common.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_HASWELL_MACH) += snd-soc-sst-haswell.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8ed6d2079dee..a64dc563b47e 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -91,6 +91,14 @@ static const struct dmi_system_id sof_sdw_quirk_table[] = {
 		},
 		.driver_data = (void *)SOF_SDW_PCH_DMIC,
 	},
+	{
+		.callback = sof_sdw_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Volteer"),
+		},
+		.driver_data = (void *)(SOF_SDW_TGL_HDMI | SOF_SDW_PCH_DMIC),
+	},
 
 	{}
 };
@@ -128,6 +136,10 @@ static struct snd_soc_codec_conf codec_conf[] = {
 		.dlc = COMP_CODEC_CONF("sdw:3:25d:715:0"),
 		.name_prefix = "rt715",
 	},
+	{
+		.dlc = COMP_CODEC_CONF("sdw:0:25d:5682:0"),
+		.name_prefix = "rt5682",
+	},
 };
 
 static struct snd_soc_dai_link_component dmic_component[] = {
@@ -187,6 +199,12 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		.dai_name = "rt715-aif2",
 		.init = sof_sdw_rt715_init,
 	},
+	{
+		.id = 0x5682,
+		.direction = {true, true},
+		.dai_name = "rt5682-sdw",
+		.init = sof_sdw_rt5682_init,
+	},
 };
 
 static inline int find_codec_info_part(unsigned int part_id)
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 0d738e234bc5..dd593ff3575b 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -105,4 +105,10 @@ int sof_sdw_rt715_init(const struct snd_soc_acpi_link_adr *link,
 		       struct sof_sdw_codec_info *info,
 		       bool playback);
 
+/* RT5682 support */
+int sof_sdw_rt5682_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback);
+
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_rt5682.c b/sound/soc/intel/boards/sof_sdw_rt5682.c
new file mode 100644
index 000000000000..5aa6211a1ed9
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt5682.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2020 Intel Corporation
+
+/*
+ *  sof_sdw_rt5682 - Helpers to handle RT5682 from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/jack.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget rt5682_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route rt5682_map[] = {
+	/*Headphones*/
+	{ "Headphone", NULL, "rt5682 HPOL" },
+	{ "Headphone", NULL, "rt5682 HPOR" },
+	{ "rt5682 IN1P", NULL, "Headset Mic" },
+};
+
+static const struct snd_kcontrol_new rt5682_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_jack_pin rt5682_jack_pins[] = {
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
+static int rt5682_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_component *component = rtd->codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:rt5682",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt5682_controls,
+					ARRAY_SIZE(rt5682_controls));
+	if (ret) {
+		dev_err(card->dev, "rt5682 control addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt5682_widgets,
+					ARRAY_SIZE(rt5682_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt5682 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt5682_map,
+				      ARRAY_SIZE(rt5682_map));
+
+	if (ret) {
+		dev_err(card->dev, "rt5682 map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(rtd->card, "Headset Jack",
+				    SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				    SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+				    SND_JACK_BTN_3,
+				    &ctx->sdw_headset,
+				    rt5682_jack_pins,
+				    ARRAY_SIZE(rt5682_jack_pins));
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
+int sof_sdw_rt5682_init(const struct snd_soc_acpi_link_adr *link,
+			struct snd_soc_dai_link *dai_links,
+			struct sof_sdw_codec_info *info,
+			bool playback)
+{
+	/*
+	 * headset should be initialized once.
+	 * Do it with dai link for playback.
+	 */
+	if (!playback)
+		return 0;
+
+	dai_links->init = rt5682_rtd_init;
+
+	return 0;
+}
-- 
2.20.1

