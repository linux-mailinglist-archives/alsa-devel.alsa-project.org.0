Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E73720A3F
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 22:26:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E1F2E822;
	Fri,  2 Jun 2023 22:25:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E1F2E822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685737593;
	bh=oVrOBSS66Bij0I1B34r7vNB04BUrl38FR1n9yhmYFYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LvltnNI7NMeZRdaihWSmvxgjmStfdPrzplQvOtwE2WaBOoBBfHuq4KA9oPJhwQ2mL
	 YnuqKSngn7IGz0W8P9w5NIoRXt3nt7PPuor0jWEvktDT+VMseny9p26mr5bCMN8tNM
	 XrkMJRJy74t5GBKOseCuowKTy+NholzzlkEFc+DI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FABBF805E6; Fri,  2 Jun 2023 22:23:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E4AB8F8057C;
	Fri,  2 Jun 2023 22:23:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93E7AF805E3; Fri,  2 Jun 2023 22:23:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F049FF80548
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 22:23:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F049FF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SwR6PB1k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685737390; x=1717273390;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oVrOBSS66Bij0I1B34r7vNB04BUrl38FR1n9yhmYFYU=;
  b=SwR6PB1k1g3UIv7HPT9mShXu7bcezxxO8QaybMaEWFNNjdV47nlvjxTY
   sAuP0NjWvPnhaSzxQve8hZp3Y1gotedxodAi+aNCWNrUpw3rz9QQpwUN8
   n2JkeYSOgU7bVLe66x9TMSAmN8KhMt+MVR/d9yj74bT8tbJ8jGJofFzIi
   EAuO6jirji+ZwXQjj7xNBCfYydIkhiJafrFUmiHRzSRDb8AVbzkPdr5N8
   6lbM8mEs7i6dJGomAmJYRB/nf2pRHQqgrbnYhYUGtRBgBGvdBASBrK6ZB
   hinDolp1us2KqE1qT10fDZf5W7T7kR8nSvv2xgm/I7r80rCSuMew0b8SK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="354811247"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="354811247"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="773020017"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400";
   d="scan'208";a="773020017"
Received: from clatorre-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.212.190.110])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2023 13:22:51 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 10/28] ASoC: Intel: sof_sdw: add rt712 support
Date: Fri,  2 Jun 2023 15:22:07 -0500
Message-Id: <20230602202225.249209-11-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
References: <20230602202225.249209-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IS6RLR4OYDGDREPQWBFSGLAT6R75D42Z
X-Message-ID-Hash: IS6RLR4OYDGDREPQWBFSGLAT6R75D42Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IS6RLR4OYDGDREPQWBFSGLAT6R75D42Z/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Bard Liao <yung-chuan.liao@linux.intel.com>

Rt712 is a multi function codec which shpports headset, amp, and dmic
functions. Rt712 has two sdw interfaces and codec drivers, one for jack
and amp, the other for dmic. part id 0x712 is for jack and amp, and 0x1712
is for dmic.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |   2 +
 sound/soc/intel/boards/Makefile               |   5 +-
 sound/soc/intel/boards/sof_sdw.c              |  36 +++++++
 sound/soc/intel/boards/sof_sdw_common.h       |  18 ++++
 sound/soc/intel/boards/sof_sdw_rt712_sdca.c   | 102 ++++++++++++++++++
 .../boards/sof_sdw_rt_sdca_jack_common.c      |   9 +-
 6 files changed, 169 insertions(+), 3 deletions(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt712_sdca.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 99308ed85277..3f9fa1c78675 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -667,6 +667,8 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT700_SDW
 	select SND_SOC_RT711_SDW
 	select SND_SOC_RT711_SDCA_SDW
+	select SND_SOC_RT712_SDCA_SDW
+	select SND_SOC_RT712_SDCA_DMIC_SDW
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
 	select SND_SOC_RT1316_SDW
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 7fa45569cfb1..50f0191076e3 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -40,8 +40,9 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_max98373.o sof_sdw_rt_amp.o	\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
-			sof_sdw_rt715.o	sof_sdw_rt715_sdca.o 	\
-			sof_sdw_dmic.o sof_sdw_hdmi.o
+			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
+			sof_sdw_rt715_sdca.o sof_sdw_dmic.o	\
+			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_ES8336_MACH) += snd-soc-sof_es8336.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 8310fb094d15..4ab7cd7f9178 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -604,6 +604,42 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x712,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {true, true},
+				.dai_name = "rt712-sdca-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.init = sof_sdw_rt_sdca_jack_init,
+				.exit = sof_sdw_rt_sdca_jack_exit,
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt712-sdca-aif2",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_rt712_spk_init,
+			},
+		},
+		.dai_num = 2,
+	},
+	{
+		.part_id = 0x1712,
+		.version_id = 3,
+		.dais =	{
+			{
+				.direction = {false, true},
+				.dai_name = "rt712-sdca-dmic-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.init = sof_sdw_rt712_sdca_dmic_init,
+			},
+		},
+		.dai_num = 1,
+	},
 	{
 		.part_id = 0x1308,
 		.acpi_id = "10EC1308",
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index bc9dfa626c32..0d7b1be3a2d0 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -130,6 +130,24 @@ int sof_sdw_rt_sdca_jack_init(struct snd_soc_card *card,
 			      bool playback);
 int sof_sdw_rt_sdca_jack_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
 
+/* RT712-SDCA support */
+int sof_sdw_rt712_sdca_init(struct snd_soc_card *card,
+			    const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links,
+			    struct sof_sdw_codec_info *info,
+			    bool playback);
+int sof_sdw_rt712_sdca_exit(struct snd_soc_card *card, struct snd_soc_dai_link *dai_link);
+int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
+			   const struct snd_soc_acpi_link_adr *link,
+			   struct snd_soc_dai_link *dai_links,
+			   struct sof_sdw_codec_info *info,
+			   bool playback);
+int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
+				 const struct snd_soc_acpi_link_adr *link,
+				 struct snd_soc_dai_link *dai_links,
+				 struct sof_sdw_codec_info *info,
+				 bool playback);
+
 /* RT700 support */
 int sof_sdw_rt700_init(struct snd_soc_card *card,
 		       const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_rt712_sdca.c b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
new file mode 100644
index 000000000000..84c8025d24e3
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt712_sdca.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Intel Corporation
+
+/*
+ *  sof_sdw_rt712_sdca - Helpers to handle RT712-SDCA from generic machine driver
+ */
+
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget rt712_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+/*
+ * dapm routes for rt712 spk will be registered dynamically according
+ * to the number of rt712 spk used. The first two entries will be registered
+ * for one codec case, and the last two entries are also registered
+ * if two rt712s are used.
+ */
+static const struct snd_soc_dapm_route rt712_spk_map[] = {
+	{ "Speaker", NULL, "rt712 SPOL" },
+	{ "Speaker", NULL, "rt712 SPOR" },
+};
+
+static const struct snd_kcontrol_new rt712_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int rt712_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:rt712",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt712_spk_controls,
+					ARRAY_SIZE(rt712_spk_controls));
+	if (ret) {
+		dev_err(card->dev, "rt712 spk controls addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt712_spk_widgets,
+					ARRAY_SIZE(rt712_spk_widgets));
+	if (ret) {
+		dev_err(card->dev, "rt712 spk widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt712_spk_map, ARRAY_SIZE(rt712_spk_map));
+	if (ret)
+		dev_err(rtd->dev, "failed to add SPK map: %d\n", ret);
+
+	return ret;
+}
+
+int sof_sdw_rt712_spk_init(struct snd_soc_card *card,
+			   const struct snd_soc_acpi_link_adr *link,
+			   struct snd_soc_dai_link *dai_links,
+			   struct sof_sdw_codec_info *info,
+			   bool playback)
+{
+	dai_links->init = rt712_spk_init;
+
+	return 0;
+}
+
+static int rt712_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:rt712-sdca-dmic",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int sof_sdw_rt712_sdca_dmic_init(struct snd_soc_card *card,
+				 const struct snd_soc_acpi_link_adr *link,
+				 struct snd_soc_dai_link *dai_links,
+				 struct sof_sdw_codec_info *info,
+				 bool playback)
+{
+	dai_links->init = rt712_sdca_dmic_rtd_init;
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 399f28a79110..623e3bebb888 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -49,11 +49,15 @@ static const struct snd_soc_dapm_widget rt_sdca_jack_widgets[] = {
 };
 
 static const struct snd_soc_dapm_route rt711_sdca_map[] = {
-	/* Headphones */
 	{ "Headphone", NULL, "rt711 HP" },
 	{ "rt711 MIC2", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_route rt712_sdca_map[] = {
+	{ "Headphone", NULL, "rt712 HP" },
+	{ "rt712 MIC2", NULL, "Headset Mic" },
+};
+
 static const struct snd_kcontrol_new rt_sdca_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -102,6 +106,9 @@ static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	if (strstr(component->name_prefix, "rt711")) {
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt711_sdca_map,
 					      ARRAY_SIZE(rt711_sdca_map));
+	} else if (strstr(component->name_prefix, "rt712")) {
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt712_sdca_map,
+					      ARRAY_SIZE(rt712_sdca_map));
 	} else {
 		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
 		return -EINVAL;
-- 
2.37.2

