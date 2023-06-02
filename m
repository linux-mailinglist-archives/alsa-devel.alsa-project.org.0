Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FDB720A4D
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:29:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 52EA9823;
	Fri,  2 Jun 2023 22:29:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 52EA9823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737797;
	bh=UAaoo98f6otS+nW7oFksKfAiVJomtcvVs5m/z5vtlW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=guO7GT97T7+thyp8fSu2Nw3fMZUxNAZPkho6dpnbOlCOg+RqIFWVi8jvHFa5he0Bx
	 VS4jP83JjG9qWBieVWtSwR1d5Xpsu/3DdglLGeLDrErO47qU4/+wwluX6tGAelgCJJ
	 yBvxFkklTtFxF0CCjzYu08caXYSZIRhrqnyelFW4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E9E6F8067F; Fri,  2 Jun 2023 22:24:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B51E4F80679;
	Fri,  2 Jun 2023 22:24:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 39F54F80617; Fri,  2 Jun 2023 22:24:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F14BF80564
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F14BF80564
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BB2C329u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737396; x=1717273396;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UAaoo98f6otS+nW7oFksKfAiVJomtcvVs5m/z5vtlW8=;
  b=BB2C329uY7ffXPjVbdeCOMcUylJ5rfh3BkIMr6SkZBO1atVi8thsALw5
   0JHzHimv46GimtViHmNy5zwp1Xxay7BCmRi/tSVaQ8K7ipmSw0xTajpQ/
   HP9acM8FN2D+MMnQOCS4AwqITqee2YO3qxjRNS+RTx6jN1/QV3rTCmCW4
   Y8s9ZsmpkiDFKvXW+q7Gabi+orsS9nHIt9C+mSy4W+0LNfdkMrSPGnTQ6
   oVzZGgeIiKZLu2qBmZ3DMYTp2ob5pj80G6ceUIMXy6QqSaSGCJ/ZS0djp
   24EaOKq0e+dsg36hsLy2I6fBl1HdllXmwnEkNdUowaoENv+3I/cdVmyd4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811323"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811323"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020046"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020046"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:23:01 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Yong Zhi <yong.zhi@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 23/28] ASoC: Intel: sof_sdw: Add helper function for cs42l42
 codec
Date: Fri,  2 Jun 2023 15:22:20 -0500
Message-Id: <20230602202225.249209-24-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: F45OF7HPIVDAORSUM2EKWN6SM3O7ODRI
X-Message-ID-Hash: F45OF7HPIVDAORSUM2EKWN6SM3O7ODRI
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F45OF7HPIVDAORSUM2EKWN6SM3O7ODRI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Uday M Bhat <uday.m.bhat@intel.com>

Helper functions added to support CS42l42 soundwire codec.
Build configuration is updated to include this codec.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Uday M Bhat <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig           |   1 +
 sound/soc/intel/boards/Makefile          |   1 +
 sound/soc/intel/boards/sof_sdw.c         |  13 +++
 sound/soc/intel/boards/sof_sdw_common.h  |   7 ++
 sound/soc/intel/boards/sof_sdw_cs42l42.c | 131 +++++++++++++++++++++++
 5 files changed, 153 insertions(+)
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs42l42.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3f9fa1c78675..799a51f23b84 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -676,6 +676,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT715_SDW
 	select SND_SOC_RT715_SDCA_SDW
 	select SND_SOC_RT5682_SDW
+	select SND_SOC_CS42L42_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
 	select SND_SOC_INTEL_SOF_MAXIM_COMMON
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 50f0191076e3..2de930b1ef31 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -42,6 +42,7 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
 			sof_sdw_rt715_sdca.o sof_sdw_dmic.o	\
+			sof_sdw_cs42l42.o \
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 50e672caccb3..60ce8100e1dc 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -823,6 +823,19 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x4242,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "cs42l42-sdw",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.init = sof_sdw_cs42l42_init,
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.version_id = 0,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 0d7b1be3a2d0..f98d1ded5b1a 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -196,4 +196,11 @@ int sof_sdw_rt5682_init(struct snd_soc_card *card,
 			struct sof_sdw_codec_info *info,
 			bool playback);
 
+/* CS42L42 support */
+int sof_sdw_cs42l42_init(struct snd_soc_card *card,
+			 const struct snd_soc_acpi_link_adr *link,
+			 struct snd_soc_dai_link *dai_links,
+			 struct sof_sdw_codec_info *info,
+			 bool playback);
+
 #endif
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l42.c b/sound/soc/intel/boards/sof_sdw_cs42l42.c
new file mode 100644
index 000000000000..c4a16e4c9f69
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_cs42l42.c
@@ -0,0 +1,131 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Intel Corporation
+
+/*
+ *  sof_sdw_cs42l42 - Helpers to handle CS42L42 from generic machine driver
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
+static const struct snd_soc_dapm_widget cs42l42_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route cs42l42_map[] = {
+	/* HP jack connectors - unknown if we have jack detection */
+	{"Headphone", NULL, "cs42l42 HP"},
+
+	/* other jacks */
+	{"cs42l42 HS", NULL, "Headset Mic"},
+};
+
+static const struct snd_kcontrol_new cs42l42_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static struct snd_soc_jack_pin cs42l42_jack_pins[] = {
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
+static int cs42l42_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(card);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+	struct snd_soc_jack *jack;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s hs:cs42l42",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, cs42l42_controls,
+					ARRAY_SIZE(cs42l42_controls));
+	if (ret) {
+		dev_err(card->dev, "cs42l42 control addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l42_widgets,
+					ARRAY_SIZE(cs42l42_widgets));
+	if (ret) {
+		dev_err(card->dev, "cs42l42 widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l42_map,
+				      ARRAY_SIZE(cs42l42_map));
+
+	if (ret) {
+		dev_err(card->dev, "cs42l42 map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 &ctx->sdw_headset,
+					 cs42l42_jack_pins,
+					 ARRAY_SIZE(cs42l42_jack_pins));
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
+int sof_sdw_cs42l42_init(struct snd_soc_card *card,
+			 const struct snd_soc_acpi_link_adr *link,
+			 struct snd_soc_dai_link *dai_links,
+			 struct sof_sdw_codec_info *info,
+			 bool playback)
+{
+	/*
+	 * headset should be initialized once.
+	 * Do it with dai link for playback.
+	 */
+	if (!playback)
+		return 0;
+
+	dai_links->init = cs42l42_rtd_init;
+
+	return 0;
+}
-- 
2.37.2

