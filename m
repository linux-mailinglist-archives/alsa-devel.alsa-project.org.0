Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 591987FA135
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Nov 2023 14:38:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F5F0E12;
	Mon, 27 Nov 2023 14:38:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F5F0E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701092304;
	bh=NN1+fdX2oJ1ZVotVY33nFspe1ba3LoskqzQatCBNbSk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MaB1H9pa82rltiETPgLYLumQletjmte/WKC9YzGkuGMLvVaZ26RokV7KUjE00kkeB
	 +BddTOGCNFctvRtls6WOWmclYjzRJHVDxk3Xx5K8qDDlR5neXERqBp12sxupqez2nJ
	 weO62e9d8HUkOQ46pepG8ogpw181x8CgNiPl4GNk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 34F71F806BD; Mon, 27 Nov 2023 14:36:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D5029F806AF;
	Mon, 27 Nov 2023 14:36:26 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFCA7F8067A; Mon, 27 Nov 2023 14:36:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 785DCF801D5
	for <alsa-devel@alsa-project.org>; Mon, 27 Nov 2023 14:35:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 785DCF801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=jyPQ92l6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701092160; x=1732628160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NN1+fdX2oJ1ZVotVY33nFspe1ba3LoskqzQatCBNbSk=;
  b=jyPQ92l6Sp0CpBjxc8an6g4tCWpji/yr4XEc1JNngeCSTvq8o5Tt5duQ
   2hyIvg8oblkaRhDAU4O/GnGe/TEfuMLJIj7fDro2jjGng6lTH6XjDA35k
   9f3iYBguyKQa2/PKKqbkKcLcd5Qe6hVlgoT8bn4ukUB0ONj6/ipnF6MSQ
   P55tsfHZRlT5zDBkXgeIhMhXzC2qmSwclak52ESJ0nrpdvaWPYRZZjUVC
   ECfORjmNQAgI+utApSkbFiNp+d6FINd2RCcTiEWOb/0PK38ein79Ft0C1
   VmEH3Eq7cPHIjfebOnUZvb7sPUlpOp+FSK5G6o/X4bfvN6GS0nSQqlAfy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="391578546"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="391578546"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="891743765"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600";
   d="scan'208";a="891743765"
Received: from acornagl-mobl.ger.corp.intel.com (HELO
 pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 05:34:24 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	cezary.rojewski@intel.com,
	yung-chuan.liao@linux.intel.com,
	ckeepax@opensource.cirrus.com,
	yong.zhi@intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 3/7] ASoC: Intel: sof_sdw: Add rt722 support
Date: Mon, 27 Nov 2023 15:34:44 +0200
Message-ID: <20231127133448.18449-4-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
References: <20231127133448.18449-1-peter.ujfalusi@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BNYJSCH5NP3YCBGFV7E5KX2W732D6374
X-Message-ID-Hash: BNYJSCH5NP3YCBGFV7E5KX2W732D6374
X-MailFrom: peter.ujfalusi@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNYJSCH5NP3YCBGFV7E5KX2W732D6374/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Chao Song <chao.song@linux.intel.com>

RT722 is a multi-function codec which supports headset,
amp, and dmic functions. Each function provides a DAI
which can be used in different dailinks.

The RT711 supports up to 3 SoundWire lanes, but that
should not have any impact in the machine driver:
the lanes are allocated and controlled by the manager
and bandwidth allocation algorithm.

Signed-off-by: Chao Song <chao.song@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig                |  1 +
 sound/soc/intel/boards/Makefile               |  3 +-
 sound/soc/intel/boards/sof_sdw.c              | 30 ++++++
 sound/soc/intel/boards/sof_sdw_common.h       | 12 +++
 sound/soc/intel/boards/sof_sdw_rt722_sdca.c   | 97 +++++++++++++++++++
 .../boards/sof_sdw_rt_sdca_jack_common.c      |  8 ++
 6 files changed, 150 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_rt722_sdca.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 9e427f00deac..99ebe48216ea 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -686,6 +686,7 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT712_SDCA_DMIC_SDW
 	select SND_SOC_RT715_SDW
 	select SND_SOC_RT715_SDCA_SDW
+	select SND_SOC_RT722_SDCA_SDW
 	select SND_SOC_RT1308_SDW
 	select SND_SOC_RT1308
 	select SND_SOC_RT1316_SDW
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index 943bf8b80e01..bbf796a5f7ba 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -41,9 +41,10 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt5682.o sof_sdw_rt700.o	\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
-			sof_sdw_rt715_sdca.o sof_sdw_dmic.o	\
+			sof_sdw_rt715_sdca.o sof_sdw_rt722_sdca.o	\
 			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
 			sof_sdw_cs_amp.o			\
+			sof_sdw_dmic.o				\
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 13089182dc17..a7cb9ec1f151 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -860,6 +860,36 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x722,
+		.version_id = 3,
+		.dais = {
+			{
+				.direction = {true, true},
+				.dai_name = "rt722-sdca-aif1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_JACK_IN_DAI_ID},
+				.init = sof_sdw_rt_sdca_jack_init,
+				.exit = sof_sdw_rt_sdca_jack_exit,
+			},
+			{
+				.direction = {true, false},
+				.dai_name = "rt722-sdca-aif2",
+				.dai_type = SOF_SDW_DAI_TYPE_AMP,
+				/* No feedback capability is provided by rt722-sdca codec driver*/
+				.dailink = {SDW_AMP_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_rt722_spk_init,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "rt722-sdca-aif3",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.init = sof_sdw_rt722_sdca_dmic_init,
+			},
+		},
+		.dai_num = 3,
+	},
 	{
 		.part_id = 0x8373,
 		.dais = {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 9528f147b719..f16456945edb 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -183,6 +183,18 @@ int sof_sdw_rt715_sdca_init(struct snd_soc_card *card,
 			    struct sof_sdw_codec_info *info,
 			    bool playback);
 
+/* RT722-SDCA support */
+int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
+			   const struct snd_soc_acpi_link_adr *link,
+			   struct snd_soc_dai_link *dai_links,
+			   struct sof_sdw_codec_info *info,
+			   bool playback);
+int sof_sdw_rt722_sdca_dmic_init(struct snd_soc_card *card,
+				 const struct snd_soc_acpi_link_adr *link,
+				 struct snd_soc_dai_link *dai_links,
+				 struct sof_sdw_codec_info *info,
+				 bool playback);
+
 /* MAXIM codec support */
 int sof_sdw_maxim_init(struct snd_soc_card *card,
 		       const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_rt722_sdca.c b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
new file mode 100644
index 000000000000..fe3a2bff95bc
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_rt722_sdca.c
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (c) 2023 Intel Corporation
+
+/*
+ *  sof_sdw_rt722_sdca - Helpers to handle RT722-SDCA from generic machine driver
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
+static const struct snd_soc_dapm_widget rt722_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+};
+
+static const struct snd_soc_dapm_route rt722_spk_map[] = {
+	{ "Speaker", NULL, "rt722 SPK" },
+};
+
+static const struct snd_kcontrol_new rt722_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+};
+
+static int rt722_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s spk:rt722",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_add_card_controls(card, rt722_spk_controls,
+					ARRAY_SIZE(rt722_spk_controls));
+	if (ret) {
+		dev_err(card->dev, "failed to add rt722 spk controls: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, rt722_spk_widgets,
+					ARRAY_SIZE(rt722_spk_widgets));
+	if (ret) {
+		dev_err(card->dev, "failed to add rt722 spk widgets: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, rt722_spk_map, ARRAY_SIZE(rt722_spk_map));
+	if (ret)
+		dev_err(rtd->dev, "failed to add rt722 spk map: %d\n", ret);
+
+	return ret;
+}
+
+int sof_sdw_rt722_spk_init(struct snd_soc_card *card,
+			   const struct snd_soc_acpi_link_adr *link,
+			   struct snd_soc_dai_link *dai_links,
+			   struct sof_sdw_codec_info *info,
+			   bool playback)
+{
+	dai_links->init = rt722_spk_init;
+
+	return 0;
+}
+
+static int rt722_sdca_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_component *component = codec_dai->component;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
+					  "%s mic:%s",
+					  card->components, component->name_prefix);
+	if (!card->components)
+		return -ENOMEM;
+
+	return 0;
+}
+
+int sof_sdw_rt722_sdca_dmic_init(struct snd_soc_card *card,
+				 const struct snd_soc_acpi_link_adr *link,
+				 struct snd_soc_dai_link *dai_links,
+				 struct sof_sdw_codec_info *info,
+				 bool playback)
+{
+	dai_links->init = rt722_sdca_dmic_rtd_init;
+
+	return 0;
+}
diff --git a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
index 65bbcee88d6d..e430be7681d2 100644
--- a/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
+++ b/sound/soc/intel/boards/sof_sdw_rt_sdca_jack_common.c
@@ -63,6 +63,11 @@ static const struct snd_soc_dapm_route rt713_sdca_map[] = {
 	{ "rt713 MIC2", NULL, "Headset Mic" },
 };
 
+static const struct snd_soc_dapm_route rt722_sdca_map[] = {
+	{ "Headphone", NULL, "rt722 HP" },
+	{ "rt722 MIC2", NULL, "Headset Mic" },
+};
+
 static const struct snd_kcontrol_new rt_sdca_jack_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
@@ -117,6 +122,9 @@ static int rt_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd)
 	} else if (strstr(component->name_prefix, "rt713")) {
 		ret = snd_soc_dapm_add_routes(&card->dapm, rt713_sdca_map,
 					      ARRAY_SIZE(rt713_sdca_map));
+	} else if (strstr(component->name_prefix, "rt722")) {
+		ret = snd_soc_dapm_add_routes(&card->dapm, rt722_sdca_map,
+					      ARRAY_SIZE(rt722_sdca_map));
 	} else {
 		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
 		return -EINVAL;
-- 
2.43.0

