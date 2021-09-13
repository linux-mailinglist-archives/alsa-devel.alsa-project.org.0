Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B54654088AB
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Sep 2021 12:01:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF451661;
	Mon, 13 Sep 2021 12:00:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF451661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1631527305;
	bh=OGx3v+Pp6G2sg4R30d0806h5i3AL4FUEdaDUMvyAw1M=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tBxz4kz7YoAZtvOStlqm+ZPa+CGkMXPvwChK36qUnTzoY0dvVTTBnsz8HZ8fqHzaR
	 6Vm3q+tCG1kbQVbQHGH4fHSBFyt8mErf7pobUrkxNZ4Y3a66ZhtwbVb9xSFKOwu6PB
	 9p3THCGa5WmRkvJO2zQJqBInaHrwLcVFHKotosL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA7E1F8032C;
	Mon, 13 Sep 2021 12:00:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3EC60F802E8; Mon, 13 Sep 2021 12:00:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C5B9BF80169
 for <alsa-devel@alsa-project.org>; Mon, 13 Sep 2021 12:00:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C5B9BF80169
X-IronPort-AV: E=McAfee;i="6200,9189,10105"; a="307177652"
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="307177652"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2021 03:00:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,288,1624345200"; d="scan'208";a="582348419"
Received: from macchian-builder.itwn.intel.com ([10.5.253.54])
 by orsmga004.jf.intel.com with ESMTP; 13 Sep 2021 03:00:38 -0700
From: Mac Chiang <mac.chiang@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: boards: add max98390 2/4 speakers support
Date: Mon, 13 Sep 2021 06:00:26 -0400
Message-Id: <20210913100026.19393-1-mac.chiang@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: jairaj.arava@intel.com, mark_hsieh@wistron.com,
 pierre-louis.bossart@linux.intel.com, keith.tzeng@quantatw.com,
 mac.chiang@intel.com, broonie@kernel.org, sathyanarayana.nujella@intel.com,
 bard.liao@intel.com
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

These support 3 hw boards.
1. SSP2 connects max98390, 2 speakers.
2. SSP1 connects max98390, 2 or 4 speakers.

Left/Right speakers and 4 speakers tdm playback
add echo reference capture
add BT_OFFLOAD support
add DMI_OEM_STRING for board varients

Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Signed-off-by: Kieth Tzeng <keith.tzeng@quantatw.com>
---
Changes logs:
    -- add clearer hw boards info
    -- move Kconfig MAX98390 up, correct SSP2 wrong quirk
    -- modify snd_soc_dai_set_tdm_slot() supporting 2/4 dai codecs
    -- aligning topology name: sof-adl-rt5682-ssp0-max98390-ssp2.tplg

 sound/soc/intel/boards/Kconfig                |   1 +
 sound/soc/intel/boards/sof_maxim_common.c     | 170 ++++++++++++++++++
 sound/soc/intel/boards/sof_maxim_common.h     |  16 ++
 sound/soc/intel/boards/sof_rt5682.c           |  69 +++++++
 .../intel/common/soc-acpi-intel-adl-match.c   |  13 ++
 sound/soc/sof/sof-pci-dev.c                   |   9 +
 6 files changed, 278 insertions(+)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 61b71d6c44cf..9723d04cbe74 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -466,6 +466,7 @@ config SND_SOC_INTEL_SOF_RT5682_MACH
 		    (MFD_INTEL_LPSS || COMPILE_TEST)) ||\
 		   (SND_SOC_SOF_BAYTRAIL && (X86_INTEL_LPSS || COMPILE_TEST))
 	select SND_SOC_MAX98373_I2C
+	select SND_SOC_MAX98390
 	select SND_SOC_RT1011
 	select SND_SOC_RT1015
 	select SND_SOC_RT1015P
diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index e66dfe666915..eeaa96648c5a 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -133,6 +133,176 @@ void max_98373_set_codec_conf(struct snd_soc_card *card)
 }
 EXPORT_SYMBOL_NS(max_98373_set_codec_conf, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
+/*
+ * Maxim MAX98390
+ */
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
+EXPORT_SYMBOL_NS(max_98390_tt_dapm_routes, SND_SOC_INTEL_SOF_MAXIM_COMMON);
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
+				struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai;
+	int i;
+
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+
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
+	ret = snd_soc_dapm_new_controls(&card->dapm, max_98390_tt_dapm_widgets,
+						ARRAY_SIZE(max_98390_tt_dapm_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add dapm controls, ret %d\n", ret);
+		/* Don't need to add routes if widget addition failed */
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, max_98390_tt_kcontrols,
+						ARRAY_SIZE(max_98390_tt_kcontrols));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, max_98373_dapm_routes,
+					ARRAY_SIZE(max_98373_dapm_routes));
+	if (ret) {
+		dev_err(rtd->dev, "Speaker Left, Right  map addition failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, max_98390_tt_dapm_routes,
+						ARRAY_SIZE(max_98390_tt_dapm_routes));
+	if (ret)
+		dev_err(rtd->dev, "Tweeter Speaker Left, Right map addition failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS(max_98390_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
+struct snd_soc_ops max_98390_ops = {
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
index 3ff5e8fec4de..412b9dd06bad 100644
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
+extern struct snd_soc_ops max_98390_ops;
+extern const struct snd_soc_dapm_route max_98390_dapm_routes[];
+void max_98390_set_codec_conf(struct snd_soc_card *card, int ch);
+int max_98390_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+
 /*
  * Maxim MAX98357A/MAX98360A
  */
diff --git a/sound/soc/intel/boards/sof_rt5682.c b/sound/soc/intel/boards/sof_rt5682.c
index f096bd6d69be..9acadfe03ef3 100644
--- a/sound/soc/intel/boards/sof_rt5682.c
+++ b/sound/soc/intel/boards/sof_rt5682.c
@@ -49,6 +49,8 @@
 #define SOF_RT1015P_SPEAKER_AMP_PRESENT		BIT(16)
 #define SOF_MAX98373_SPEAKER_AMP_PRESENT	BIT(17)
 #define SOF_MAX98360A_SPEAKER_AMP_PRESENT	BIT(18)
+#define SOF_MAX98390_SPEAKER_AMP_PRESENT	BIT(23)
+#define SOF_MAX98390_TWEETER_SPEAKER_PRESENT	BIT(24)
 
 /* BT audio offload: reserve 3 bits for future */
 #define SOF_BT_OFFLOAD_SSP_SHIFT		19
@@ -176,6 +178,36 @@ static const struct dmi_system_id sof_rt5682_quirk_table[] = {
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
 
@@ -459,6 +491,7 @@ static int sof_card_late_probe(struct snd_soc_card *card)
 		if (err < 0)
 			return err;
 	}
+
 	return hdac_hdmi_jack_port_init(component, &card->dapm);
 }
 
@@ -745,6 +778,21 @@ static struct snd_soc_dai_link *sof_card_dai_links_create(struct device *dev,
 		} else if (sof_rt5682_quirk &
 				SOF_RT1011_SPEAKER_AMP_PRESENT) {
 			sof_rt1011_dai_link(&links[id]);
+		} else if (sof_rt5682_quirk &
+				SOF_MAX98390_SPEAKER_AMP_PRESENT) {
+			if (sof_rt5682_quirk &
+				SOF_MAX98390_TWEETER_SPEAKER_PRESENT) {
+				links[id].codecs = max_98390_4spk_components;
+				links[id].num_codecs = ARRAY_SIZE(max_98390_4spk_components);
+				links[id].init = max_98390_spk_codec_init;
+			} else {
+				links[id].codecs = max_98390_components;
+				links[id].num_codecs = ARRAY_SIZE(max_98390_components);
+				links[id].init = max_98373_spk_codec_init;
+			}
+			links[id].ops = &max_98390_ops;
+			links[id].dpcm_capture = 1;
+
 		} else {
 			max_98357a_dai_link(&links[id]);
 		}
@@ -881,6 +929,14 @@ static int sof_audio_probe(struct platform_device *pdev)
 		sof_rt1011_codec_conf(&sof_audio_card_rt5682);
 	else if (sof_rt5682_quirk & SOF_RT1015P_SPEAKER_AMP_PRESENT)
 		sof_rt1015p_codec_conf(&sof_audio_card_rt5682);
+	else if (sof_rt5682_quirk & SOF_MAX98390_SPEAKER_AMP_PRESENT) {
+		if (sof_rt5682_quirk & SOF_MAX98390_TWEETER_SPEAKER_PRESENT)
+			max_98390_set_codec_conf(&sof_audio_card_rt5682,
+						ARRAY_SIZE(max_98390_4spk_components));
+		else
+			max_98390_set_codec_conf(&sof_audio_card_rt5682,
+						ARRAY_SIZE(max_98390_components));
+	}
 
 	if (sof_rt5682_quirk & SOF_SSP_BT_OFFLOAD_PRESENT)
 		sof_audio_card_rt5682.num_links++;
@@ -1007,6 +1063,18 @@ static const struct platform_device_id board_ids[] = {
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
+
 	{ }
 };
 MODULE_DEVICE_TABLE(platform, board_ids);
@@ -1026,6 +1094,7 @@ MODULE_DESCRIPTION("SOF Audio Machine driver");
 MODULE_AUTHOR("Bard Liao <bard.liao@intel.com>");
 MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(SND_SOC_INTEL_HDA_DSP_COMMON);
 MODULE_IMPORT_NS(SND_SOC_INTEL_SOF_MAXIM_COMMON);
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index a0f6a69c7038..2db152998e4a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -280,6 +280,11 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
+static const struct snd_soc_acpi_codecs adl_max98390_amp = {
+	.num_codecs = 1,
+	.codecs = {"MX98390"}
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	{
 		.id = "10EC5682",
@@ -297,6 +302,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.sof_fw_filename = "sof-adl.ri",
 		.sof_tplg_filename = "sof-adl-max98357a-rt5682.tplg",
 	},
+	{
+		.id = "10EC5682",
+		.drv_name = "adl_max98390_rt5682",
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

