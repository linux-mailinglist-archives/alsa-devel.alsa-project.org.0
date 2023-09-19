Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DD67A5728
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Sep 2023 03:53:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 970A5DF1;
	Tue, 19 Sep 2023 03:52:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 970A5DF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695088395;
	bh=jnWIlFtqR6Fa8M9/FlPCZpe674aZSRMk8qe4Gtmt3WU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=epAxe20unO06tuiuNUSTiNVqktLs5GTQ/jgTjcumfWCwpr/KPMYFF6/2qB6u/yWqD
	 CyB0foyRSyKCWYWvZb69fNTnzBMPRszC64Ejonfna8p+7udLLAEdnCpUm5zP2S5TNh
	 hJ7CBJmMrEKg8JhN3rnIispQirMQvyv+Afx0qx10=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93803F8057D; Tue, 19 Sep 2023 03:51:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF3DF80578;
	Tue, 19 Sep 2023 03:51:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 710B4F80551; Tue, 19 Sep 2023 03:51:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BA04F801F5
	for <alsa-devel@alsa-project.org>; Tue, 19 Sep 2023 03:51:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BA04F801F5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RV3HJ64i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695088278; x=1726624278;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jnWIlFtqR6Fa8M9/FlPCZpe674aZSRMk8qe4Gtmt3WU=;
  b=RV3HJ64iUAuzHeiXbzQC3qi8YLkMZpGcuZefneLqAUFm6PStelldWfCS
   Lh9ohlakq26eX3HsQXylomshz6vL8Ln3gW5c3eKTvM97JjLP+5P6UsYST
   6oUTRIw5CU/uuJ+l0IURgNCrZxpa98Qt5nKYaNvvm+N+VujcbzpI3jsrQ
   vNIXlncFkDfTIT08T5wTWUZWwfeh4RdAYHkHmP6GZ61Y1fDu4g6/n7Gdt
   M+QvnjI+6inq0cyYo4x45YYEYAEoKnWsAg5yAFZrYXEAwBggpU9ojkfxr
   Bqdlze4/tQxrHRNkE2ut54d3vgwRfWceI83d0oyepDw9yKCPz8L1D6yzV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="377136205"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="377136205"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 18:51:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811545618"
X-IronPort-AV: E=Sophos;i="6.02,158,1688454000";
   d="scan'208";a="811545618"
Received: from bard-ubuntu.sh.intel.com ([10.239.185.57])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 18:50:59 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: alsa-devel@alsa-project.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 1/2] ASoC: intel: sof_sdw: Add CS42L43 CODEC support
Date: Tue, 19 Sep 2023 10:00:10 +0800
Message-Id: <20230919020011.1896041-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230919020011.1896041-1-yung-chuan.liao@linux.intel.com>
References: <20230919020011.1896041-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5XPM4C2J6ROL4VXDB6X6OICOZTQ3YEHF
X-Message-ID-Hash: 5XPM4C2J6ROL4VXDB6X6OICOZTQ3YEHF
X-MailFrom: yung-chuan.liao@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5XPM4C2J6ROL4VXDB6X6OICOZTQ3YEHF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add support for the Cirrus Logic CS42L43 using SoundWire.

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/Kconfig           |   4 +
 sound/soc/intel/boards/Makefile          |   3 +-
 sound/soc/intel/boards/sof_sdw.c         |  27 +++++
 sound/soc/intel/boards/sof_sdw_common.h  |  13 ++
 sound/soc/intel/boards/sof_sdw_cs42l43.c | 145 +++++++++++++++++++++++
 5 files changed, 191 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/intel/boards/sof_sdw_cs42l43.c

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 16d66eed80f4..fa3252b6f1bf 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -689,6 +689,10 @@ config SND_SOC_INTEL_SOUNDWIRE_SOF_MACH
 	select SND_SOC_RT1318_SDW
 	select SND_SOC_RT5682_SDW
 	select SND_SOC_CS42L42_SDW
+	select SND_SOC_CS42L43
+	select SND_SOC_CS42L43_SDW
+	select MFD_CS42L43
+	select MFD_CS42L43_SDW
 	select SND_SOC_CS35L56_SDW
 	select SND_SOC_DMIC
 	select SND_SOC_INTEL_HDA_DSP_COMMON
diff --git a/sound/soc/intel/boards/Makefile b/sound/soc/intel/boards/Makefile
index be60ce5ab5b0..ae78e4aa69fc 100644
--- a/sound/soc/intel/boards/Makefile
+++ b/sound/soc/intel/boards/Makefile
@@ -42,7 +42,8 @@ snd-soc-sof-sdw-objs += sof_sdw.o				\
 			sof_sdw_rt711.o sof_sdw_rt_sdca_jack_common.o	\
 			sof_sdw_rt712_sdca.o sof_sdw_rt715.o	\
 			sof_sdw_rt715_sdca.o sof_sdw_dmic.o	\
-			sof_sdw_cs42l42.o sof_sdw_cs_amp.o	\
+			sof_sdw_cs42l42.o sof_sdw_cs42l43.o	\
+			sof_sdw_cs_amp.o			\
 			sof_sdw_hdmi.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_RT5682_MACH) += snd-soc-sof_rt5682.o
 obj-$(CONFIG_SND_SOC_INTEL_SOF_CS42L42_MACH) += snd-soc-sof_cs42l42.o
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 752bfce1ea01..b36cdf374a82 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -915,6 +915,33 @@ static struct sof_sdw_codec_info codec_info_list[] = {
 		},
 		.dai_num = 1,
 	},
+	{
+		.part_id = 0x4243,
+		.codec_name = "cs42l43-codec",
+		.dais = {
+			{
+				.direction = {true, false},
+				.dai_name = "cs42l43-dp5",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_JACK_OUT_DAI_ID, SDW_UNUSED_DAI_ID},
+				.init = sof_sdw_cs42l43_hs_init,
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp1",
+				.dai_type = SOF_SDW_DAI_TYPE_JACK,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_JACK_IN_DAI_ID},
+			},
+			{
+				.direction = {false, true},
+				.dai_name = "cs42l43-dp2",
+				.dai_type = SOF_SDW_DAI_TYPE_MIC,
+				.dailink = {SDW_UNUSED_DAI_ID, SDW_DMIC_DAI_ID},
+				.init = sof_sdw_cs42l43_dmic_init,
+			}
+		},
+		.dai_num = 3,
+	},
 	{
 		.part_id = 0xaaaa, /* generic codec mockup */
 		.version_id = 0,
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 270aded488e1..bfdeab4be1a7 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -210,6 +210,19 @@ int sof_sdw_cs42l42_init(struct snd_soc_card *card,
 			 struct sof_sdw_codec_info *info,
 			 bool playback);
 
+/* CS42L43 support */
+int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card,
+			    const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links,
+			    struct sof_sdw_codec_info *info,
+			    bool playback);
+
+int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card,
+			      const struct snd_soc_acpi_link_adr *link,
+			      struct snd_soc_dai_link *dai_links,
+			      struct sof_sdw_codec_info *info,
+			      bool playback);
+
 /* CS AMP support */
 int sof_sdw_cs_amp_init(struct snd_soc_card *card,
 			const struct snd_soc_acpi_link_adr *link,
diff --git a/sound/soc/intel/boards/sof_sdw_cs42l43.c b/sound/soc/intel/boards/sof_sdw_cs42l43.c
new file mode 100644
index 000000000000..e34750b75d76
--- /dev/null
+++ b/sound/soc/intel/boards/sof_sdw_cs42l43.c
@@ -0,0 +1,145 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Based on sof_sdw_rt5682.c
+// Copyright (c) 2023 Intel Corporation
+
+/*
+ *  sof_sdw_cs42l43 - Helpers to handle CS42L43 from generic machine driver
+ */
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/input.h>
+#include <sound/jack.h>
+#include <linux/soundwire/sdw.h>
+#include <linux/soundwire/sdw_type.h>
+#include <sound/cs42l43.h>
+#include <sound/control.h>
+#include <sound/soc.h>
+#include <sound/soc-acpi.h>
+#include <sound/soc-dapm.h>
+#include "sof_sdw_common.h"
+
+static const struct snd_soc_dapm_widget cs42l43_hs_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+};
+
+static const struct snd_soc_dapm_route cs42l43_hs_map[] = {
+	{ "Headphone", NULL, "cs42l43 AMP3_OUT" },
+	{ "Headphone", NULL, "cs42l43 AMP4_OUT" },
+	{ "cs42l43 ADC1_IN1_P", NULL, "Headset Mic" },
+	{ "cs42l43 ADC1_IN1_N", NULL, "Headset Mic" },
+};
+
+static const struct snd_soc_dapm_widget cs42l43_dmic_widgets[] = {
+	SND_SOC_DAPM_MIC("DMIC", NULL),
+};
+
+static const struct snd_soc_dapm_route cs42l43_dmic_map[] = {
+	{ "cs42l43 PDM1_DIN", NULL, "DMIC" },
+	{ "cs42l43 PDM2_DIN", NULL, "DMIC" },
+};
+
+static int cs42l43_hs_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct mc_private *ctx = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &ctx->sdw_headset;
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s hs:cs42l43", card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_hs_widgets,
+					ARRAY_SIZE(cs42l43_hs_widgets));
+	if (ret) {
+		dev_err(card->dev, "cs42l43 hs widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_hs_map,
+				      ARRAY_SIZE(cs42l43_hs_map));
+
+	if (ret) {
+		dev_err(card->dev, "cs42l43 hs map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new(card, "Headphone Jack",
+				    SND_JACK_MECHANICAL | SND_JACK_AVOUT |
+				    SND_JACK_HEADSET | SND_JACK_LINEOUT |
+				    SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				    SND_JACK_BTN_2 | SND_JACK_BTN_3,
+				    jack);
+	if (ret) {
+		dev_err(card->dev, "Failed to create jack: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(card->dev, "Failed to register jack: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_sysclk(component, CS42L43_SYSCLK, CS42L43_SYSCLK_SDW,
+					   0, SND_SOC_CLOCK_IN);
+	if (ret)
+		dev_err(card->dev, "Failed to set sysclk: %d\n", ret);
+
+	return ret;
+}
+
+int sof_sdw_cs42l43_hs_init(struct snd_soc_card *card, const struct snd_soc_acpi_link_adr *link,
+			    struct snd_soc_dai_link *dai_links, struct sof_sdw_codec_info *info,
+			    bool playback)
+{
+	/*
+	 * No need to test if (!playback) like other codecs as cs42l43 uses separated dai for
+	 * playback and capture, and sof_sdw_cs42l43_init is only linked to the playback dai.
+	 */
+
+	dai_links->init = cs42l43_hs_rtd_init;
+
+	return 0;
+}
+
+static int cs42l43_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	card->components = devm_kasprintf(card->dev, GFP_KERNEL, "%s mic:cs42l43-dmic",
+					  card->components);
+	if (!card->components)
+		return -ENOMEM;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, cs42l43_dmic_widgets,
+					ARRAY_SIZE(cs42l43_dmic_widgets));
+	if (ret) {
+		dev_err(card->dev, "cs42l43 dmic widgets addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, cs42l43_dmic_map,
+				      ARRAY_SIZE(cs42l43_dmic_map));
+
+	if (ret)
+		dev_err(card->dev, "cs42l43 dmic map addition failed: %d\n", ret);
+
+	return ret;
+}
+
+int sof_sdw_cs42l43_dmic_init(struct snd_soc_card *card, const struct snd_soc_acpi_link_adr *link,
+			      struct snd_soc_dai_link *dai_links, struct sof_sdw_codec_info *info,
+			      bool playback)
+{
+	dai_links->init = cs42l43_dmic_rtd_init;
+	return 0;
+}
-- 
2.25.1

