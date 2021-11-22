Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB17458EC1
	for <lists+alsa-devel@lfdr.de>; Mon, 22 Nov 2021 13:54:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C012E1688;
	Mon, 22 Nov 2021 13:53:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C012E1688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637585653;
	bh=2q/4MyLBOi9RaSOCoTjo0gGkPGSIGSRWiVVwMXIuzTc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TZQ111GinbjBUUtmt/ig+dGNPTPKkGzBsGPfB+EASbz0Vpcxf5XS1RVkNidcAn9Ej
	 vtWGn7ytBEBOqJXUxsOxXds0Ok5qQ+07xXnI2Lb2tgO1UUkKyl2yGvB7gdRvN2fKGl
	 osQz9lXuvmFbZXfeKNNuM9jJCoRvAOmJ3z9SnbbI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A925F80245;
	Mon, 22 Nov 2021 13:52:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 692C7F80212; Mon, 22 Nov 2021 13:52:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B19C3F80141
 for <alsa-devel@alsa-project.org>; Mon, 22 Nov 2021 13:52:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19C3F80141
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="235012820"
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="235012820"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 04:52:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,254,1631602800"; d="scan'208";a="456627390"
Received: from macchian-builder.itwn.intel.com ([10.5.253.188])
 by orsmga006.jf.intel.com with ESMTP; 22 Nov 2021 04:52:37 -0800
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Subject: [RESEND,v3] ASoC: Intel: boards: add max98390 2/4 speakers support
Date: Mon, 22 Nov 2021 07:50:02 -0500
Message-Id: <20211122125002.3206-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: kai.vehmanen@linux.intel.com, yang.jie@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 mac.chiang@intel.com, broonie@kernel.org, bard.liao@intel.com
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

support 2 hw boards.
1. SSP2 connects max98390, 2 speakers.
2. SSP1 connects max98390, 2/4 speakers.

2 or 4 speakers playback
add echo reference capture
add bt offload support
add DMI_OEM_STRING for board variants
add ALC5682I-VS support

Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Kieth Tzeng <keith.tzeng@quantatw.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
---
changes in resend v3:
  - use .comp_ids to scan acpi support ALC5682I-VD or ALC5682I-VS
---
 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_maxim_common.c     | 180 ++++++++++++++++++
 sound/soc/intel/boards/sof_maxim_common.h     |  16 ++
 sound/soc/intel/boards/sof_rt5682.c           |  84 ++++++++
 .../intel/common/soc-acpi-intel-adl-match.c   |  21 ++
 sound/soc/sof/sof-pci-dev.c                   |   9 +
 6 files changed, 311 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 849445fcc05d..34ccefcc30c7 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -467,6 +467,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_MAX98373_I2C
+	select SND_SOC_MAX98390
 	select SND_SOC_RT1011
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index e66dfe666915..9171d9cd179e 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -5,6 +5,7 @@
 #include <linux/string.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
+#include <sound/soc-acpi.h>
 #include <sound/soc-dai.h>
 #include <sound/soc-dapm.h>
 #include <uapi/sound/asound.h>
@@ -133,6 +134,185 @@ void max_98373_set_codec_conf(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
+/*
+ * Maxim MAX98390
+ */
+const struct snd_soc_dapm_route max_98390_dapm_routes[] = {
+	/* speaker */
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
+static const struct snd_kcontrol_new max_98390_tt_kcontrols[] = {
+	SOC_DAPM_PIN_SWITCH("TL Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Spk"),
+};
+
+static const struct snd_soc_dapm_widget max_98390_tt_dapm_widgets[] = {
+	SND_SOC_DAPM_SPK("TL Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Spk", NULL),
+};
+
+const struct snd_soc_dapm_route max_98390_tt_dapm_routes[] = {
+	/* Tweeter speaker */
+	{ "TL Spk", NULL, "Tweeter Left BE_OUT" },
+	{ "TR Spk", NULL, "Tweeter Right BE_OUT" },
+};
+
+static struct snd_soc_codec_conf max_98390_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
+		.name_prefix = "Left",
+	},
+};
+
+static struct snd_soc_codec_conf max_98390_4spk_codec_conf[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV0_NAME),
+		.name_prefix = "Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV1_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV2_NAME),
+		.name_prefix = "Tweeter Right",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX_98390_DEV3_NAME),
+		.name_prefix = "Tweeter Left",
+	},
+};
+
+struct snd_soc_dai_link_component max_98390_components[] = {
+	{
+		.name = MAX_98390_DEV0_NAME,
+		.dai_name = MAX_98390_CODEC_DAI,
+	},
+	{
+		.name = MAX_98390_DEV1_NAME,
+		.dai_name = MAX_98390_CODEC_DAI,
+	},
+};
+EXPORT_SYMBOL_NS(max_98390_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+struct snd_soc_dai_link_component max_98390_4spk_components[] = {
+	{
+		.name = MAX_98390_DEV0_NAME,
+		.dai_name = MAX_98390_CODEC_DAI,
+	},
+	{
+		.name = MAX_98390_DEV1_NAME,
+		.dai_name = MAX_98390_CODEC_DAI,
+	},
+	{
+		.name = MAX_98390_DEV2_NAME,
+		.dai_name = MAX_98390_CODEC_DAI,
+	},
+	{
+		.name = MAX_98390_DEV3_NAME,
+		.dai_name = MAX_98390_CODEC_DAI,
+	},
+};
+EXPORT_SYMBOL_NS(max_98390_4spk_components, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+static int max_98390_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		if (i >= ARRAY_SIZE(max_98390_4spk_components)) {
+			dev_err(codec_dai->dev, "invalid codec index %d\n", i);
+			return -ENODEV;
+		}
+
+		if (!strcmp(codec_dai->component->name, MAX_98390_DEV0_NAME)) {
+			/* DEV0 tdm slot configuration Right */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x01, 3, 4, 32);
+		}
+		if (!strcmp(codec_dai->component->name, MAX_98390_DEV1_NAME)) {
+			/* DEV1 tdm slot configuration Left */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x02, 3, 4, 32);
+		}
+
+		if (!strcmp(codec_dai->component->name, MAX_98390_DEV2_NAME)) {
+			/* DEVi2 tdm slot configuration Tweeter Right */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x04, 3, 4, 32);
+		}
+		if (!strcmp(codec_dai->component->name, MAX_98390_DEV3_NAME)) {
+			/* DEV3 tdm slot configuration Tweeter Left */
+			snd_soc_dai_set_tdm_slot(codec_dai, 0x08, 3, 4, 32);
+		}
+	}
+	return 0;
+}
+
+int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret;
+
+	/* add regular speakers dapm route */
+	ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_dapm_routes,
+				      ARRAY_SIZE(max_98390_dapm_routes));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Left/Right Speaker dapm, ret %d\n", ret);
+		return ret;
+	}
+
+	/* add widgets/controls/dapm for tweeter speakers */
+	if (acpi_dev_present("MX98390", "3", -1)) {
+		ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
+						ARRAY_SIZE(max_98390_tt_dapm_widgets));
+
+		if (ret) {
+			dev_err(rtd->dev, "unable to add tweeter dapm controls, ret %d\n", ret);
+			/* Don't need to add routes if widget addition failed */
+			return ret;
+		}
+
+		ret = snd_soc_add_card_controls(card, max_98390_tt_kcontrols,
+						ARRAY_SIZE(max_98390_tt_kcontrols));
+		if (ret) {
+			dev_err(rtd->dev, "unable to add tweeter card controls, ret %d\n", ret);
+			return ret;
+		}
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
+					      ARRAY_SIZE(max_98390_tt_dapm_routes));
+		if (ret)
+			dev_err(rtd->dev,
+				"unable to add Tweeter Left/Right Speaker dapm, ret %d\n", ret);
+	}
+	return ret;
+}
+EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+const struct snd_soc_ops max_98390_ops = {
+	.hw_params = max_98390_hw_params,
+};
+EXPORT_SYMBOL_NS(max_98390_ops, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+void max_98390_set_codec_conf(struct snd_soc_card *card, int ch)
+{
+	if (ch == ARRAY_SIZE(max_98390_4spk_codec_conf)) {
+		card->codec_conf = max_98390_4spk_codec_conf;
+		card->num_configs = ARRAY_SIZE(max_98390_4spk_codec_conf);
+	} else {
+		card->codec_conf = max_98390_codec_conf;
+		card->num_configs = ARRAY_SIZE(max_98390_codec_conf);
+	}
+}
+EXPORT_SYMBOL_NS(max_98390_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
 /*
  * Maxim MAX98357A/MAX98360A
  */
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 3ff5e8fec4de..7a8c53049e4d 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -24,6 +24,22 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
 void max_98373_set_codec_conf(struct snd_soc_card *card);
 int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
+/*
+ * Maxim MAX98390
+ */
+#define MAX_98390_CODEC_DAI     "max98390-aif1"
+#define MAX_98390_DEV0_NAME     "i2c-MX98390:00"
+#define MAX_98390_DEV1_NAME     "i2c-MX98390:01"
+#define MAX_98390_DEV2_NAME     "i2c-MX98390:02"
+#define MAX_98390_DEV3_NAME     "i2c-MX98390:03"
+
+extern struct snd_soc_dai_link_component max_98390_components[2];
+extern struct snd_soc_dai_link_component max_98390_4spk_components[4];
+extern const struct snd_soc_ops max_98390_ops;
+
+void max_98390_set_codec_conf(struct snd_soc_card *card, int ch);
+int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+
 /*
  * Maxim MAX98357A/MAX98360A
  */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index c41f386b4138..3869b38274b9 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -59,6 +59,9 @@
 	(((quirk) << SOF_BT_OFFLOAD_SSP_SHIFT) & SOF_BT_OFFLOAD_SSP_MASK)
 #define SOF_SSP_BT_OFFLOAD_PRESENT		BIT(22)
 #define SOF_RT5682S_HEADPHONE_CODEC_PRESENT	BIT(23)
+#define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(24)
+#define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(25)
+
 
 /* Default: MCLK on, MCLK 19.2M, SSP0  */
 static unsigned long sof_rt5682_quirk = SOF_RT5682_MCLK_EN |
@@ -179,6 +182,36 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98390_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(2) |
+					SOF_RT5682_NUM_HDMIDEV(4)),
+	},
+	{
+		.callback = sof_rt5682_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S_4SPK"),
+		},
+		.driver_data = (void *)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98390_SPEAKER_AMP_PRESENT |
+					SOF_MAX98390_TWEETER_SPEAKER_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+
+	},
 	{}
 };
 
@@ -486,6 +519,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 		if (err < 0)
 			return err;
 	}
+
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
@@ -784,6 +818,20 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		} else if (sof_rt5682_quirk &
 				SOF_RT1011_SPEAKER_AMP_PRESENT) {
 			sof_rt1011_dai_link(&links[id]);
+		} else if (sof_rt5682_quirk &
+				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
+			if (sof_rt5682_quirk &
+				SOF_MAX98390_TWEETER_SPEAKER_PRESENT) {
+				links[id].codecs = max_98390_4spk_components;
+				links[id].num_codecs = ARRAY_SIZE(max_98390_4spk_components);
+			} else {
+				links[id].codecs = max_98390_components;
+				links[id].num_codecs = ARRAY_SIZE(max_98390_components);
+			}
+			links[id].init = max_98390_spk_codec_init;
+			links[id].ops = &max_98390_ops;
+			links[id].dpcm_capture = 1;
+
 		} else {
 			max_98357a_dai_link(&links[id]);
 		}
@@ -868,6 +916,10 @@ static int sof_audio_probe(struct platform_device *pdev)
 	if (acpi_dev_present("RTL5682", NULL, -1))
 		sof_rt5682_quirk |= SOF_RT5682S_HEADPHONE_CODEC_PRESENT;
 
+	/* Detect the headset codec variant to support machines in DMI quirk */
+	if (acpi_dev_present("RTL5682", NULL, -1))
+		sof_rt5682_quirk |= SOF_RT5682S_HEADPHONE_CODEC_PRESENT;
+
 	if (soc_intel_is_byt() || soc_intel_is_cht()) {
 		is_legacy_cpu = 1;
 		dmic_be_num = 0;
@@ -924,6 +976,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
+	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
+		if (sof_rt5682_quirk & SOF_MAX98390_TWEETER_SPEAKER_PRESENT)
+			max_98390_set_codec_conf(&sof_audio_card_rt5682,
+						 ARRAY_SIZE(max_98390_4spk_components));
+		else
+			max_98390_set_codec_conf(&sof_audio_card_rt5682,
+						 ARRAY_SIZE(max_98390_components));
+	}
 
 	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_audio_card_rt5682.num_links++;
@@ -1050,6 +1110,29 @@ static const struct platform_device_id board_ids[] = {
 					SOF_RT5682_SSP_AMP(2) |
 					SOF_RT5682_NUM_HDMIDEV(4)),
 	},
+	{
+		.name = "adl_max98390_rt5682",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98390_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
+	{
+		.name = "adl_mx98390_rt5682s",
+		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
+					SOF_RT5682_SSP_CODEC(0) |
+					SOF_RT5682S_HEADPHONE_CODEC_PRESENT |
+					SOF_SPEAKER_AMP_PRESENT |
+					SOF_MAX98390_SPEAKER_AMP_PRESENT |
+					SOF_RT5682_SSP_AMP(1) |
+					SOF_RT5682_NUM_HDMIDEV(4) |
+					SOF_BT_OFFLOAD_SSP(2) |
+					SOF_SSP_BT_OFFLOAD_PRESENT),
+	},
 	{
 		.name = "adl_mx98360_rt5682",
 		.driver_data = (kernel_ulong_t)(SOF_RT5682_MCLK_EN |
@@ -1080,6 +1163,7 @@ MODULE_DESCRIPTION("SOF Audio Machine driver");
 MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
 MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index fde310e5724b..0d04166b9d64 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -379,6 +379,11 @@ static const struct snd_soc_acpi_codecs adl_rt1019p_amp = {
 	.codecs = {"RTL1019"}
 };
 
+static const struct snd_soc_acpi_codecs adl_max98390_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98390"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.comp_ids = &adl_rt5682_rt5682s_hp,
@@ -434,6 +439,22 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-nau8825.tplg",
 	},
+	{
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_max98390_rt5682",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98390_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
+	},
+	{
+		.comp_ids = &adl_rt5682_rt5682s_hp,
+		.drv_name = "adl_mx98390_rt5682s",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &adl_max98390_amp,
+		.sof_fw_filename = "sof-adl.ri",
+		.sof_tplg_filename = "sof-adl-max98390-rt5682.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_adl_machines);
diff --git a/sound/soc/sof/sof-pci-dev.c b/sound/soc/sof/sof-pci-dev.c
index bc9e70765678..be90a5f79766 100644
--- a/sound/soc/sof/sof-pci-dev.c
+++ b/sound/soc/sof/sof-pci-dev.c
@@ -59,6 +59,15 @@ static const struct dmi_system_id sof_tplg_table[] = {
 		},
 		.driver_data = "sof-adl-rt5682-ssp0-max98373-ssp2.tplg",
 	},
+	{
+		.callback = sof_tplg_cb,
+		.matches = {
+			DMI_MATCH(DMI_PRODUCT_FAMILY, "Google_Brya"),
+			DMI_MATCH(DMI_OEM_STRING, "AUDIO-MAX98390_ALC5682I_I2S"),
+		},
+		.driver_data = "sof-adl-max98390-ssp2-rt5682-ssp0.tplg",
+	},
+
 	{}
 };
 
-- 
2.20.1

