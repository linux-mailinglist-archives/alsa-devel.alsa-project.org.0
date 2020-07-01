Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 11689210878
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Jul 2020 11:43:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3416167B;
	Wed,  1 Jul 2020 11:42:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3416167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593596623;
	bh=KkB/kR57sAaPEtn6Gep51X9I56cZr2K/wDSDLvQI7kA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TumrMsSskgDnu+KNUq1kqbbWjFr9xpW4S6miMAerUrbvIdL4D3F1/Ox7+9lt8+uIE
	 JY5NhDWR9tH/YtKK867/p/97u0UcncqUZF32c+uqsOsePiNYgEfwhZQ17kgp61FaIs
	 FqhNZnIVVCOJzlTpm/njHuG4tKljqT8Qy8P4u5tk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0499F800EA;
	Wed,  1 Jul 2020 11:42:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22734F80217; Wed,  1 Jul 2020 11:42:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30C59F800EA
 for <alsa-devel@alsa-project.org>; Wed,  1 Jul 2020 11:41:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30C59F800EA
IronPort-SDR: yIQ6ghFHxYxLjVm/dyX6pwf8xxQKvzD/U8f2QZmdoBiTOqpD4WTEHSHt449PMxUtVMxzca4GEI
 +AomahNbTPRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9668"; a="145595617"
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="145595617"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2020 02:41:51 -0700
IronPort-SDR: fQsraumZCzt9xmgPSBDWyeZOHhpVHdyrsV3kzRxXE0n9D8VbaKic6DcdQbWR9p06an8aOIqITz
 ffT7xzhPM+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,299,1589266800"; d="scan'208";a="386958801"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2020 02:41:46 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: bxt-da7219-max98357a: support MAX98390
 speaker amp
Date: Wed,  1 Jul 2020 17:36:51 +0800
Message-Id: <1593596211-28344-1-git-send-email-brent.lu@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Jie Yang <yang.jie@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mac Chiang <mac.chiang@intel.com>, Amery Song <chao.song@intel.com>,
 Libin Yang <libin.yang@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>, Yong Zhi <yong.zhi@intel.com>,
 Mark Brown <broonie@kernel.org>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Naveen Manohar <naveen.m@intel.com>, Brent Lu <brent.lu@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jason Yan <yanaijie@huawei.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org
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

Support MAX98390 speaker amplifier on cometlake platform. Driver now
detects amplifier type in the probe function and installs corresponding
controls and DAPM widgets/routes in the late_probe function.

Signed-off-by: Brent Lu <brent.lu@intel.com>
---
 sound/soc/intel/boards/Kconfig                    |   5 +-
 sound/soc/intel/boards/bxt_da7219_max98357a.c     | 117 ++++++++++++++++++++--
 sound/soc/intel/common/soc-acpi-intel-cml-match.c |  13 +++
 3 files changed, 127 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3d820e1..f176df2 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -288,6 +288,7 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	tristate
 	select SND_SOC_DA7219
 	select SND_SOC_MAX98357A
+	select SND_SOC_MAX98390
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 
@@ -298,14 +299,14 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 if SND_SOC_INTEL_APL
 
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
-	tristate "Broxton with DA7219 and MAX98357A in I2S Mode"
+	tristate "Broxton with DA7219 and MAX98357A/MAX98390 in I2S Mode"
 	depends on I2C && ACPI && GPIOLIB
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
 	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	help
 	   This adds support for ASoC machine driver for Broxton-P platforms
-	   with DA7219 + MAX98357A I2S audio codec.
+	   with DA7219 + MAX98357A/MAX98390 I2S audio codec.
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 44016c1..4d39253 100644
--- a/sound/soc/intel/boards/bxt_da7219_max98357a.c
+++ b/sound/soc/intel/boards/bxt_da7219_max98357a.c
@@ -25,9 +25,14 @@
 
 #define BXT_DIALOG_CODEC_DAI	"da7219-hifi"
 #define BXT_MAXIM_CODEC_DAI	"HiFi"
+#define MAX98390_DEV0_NAME	"i2c-MX98390:00"
+#define MAX98390_DEV1_NAME	"i2c-MX98390:01"
 #define DUAL_CHANNEL		2
 #define QUAD_CHANNEL		4
 
+#define SPKAMP_MAX98357A	1
+#define SPKAMP_MAX98390	2
+
 static struct snd_soc_jack broxton_headset;
 static struct snd_soc_jack broxton_hdmi[3];
 
@@ -40,6 +45,7 @@ struct bxt_hdmi_pcm {
 struct bxt_card_private {
 	struct list_head hdmi_pcm_list;
 	bool common_hdmi_codec_drv;
+	int spkamp;
 };
 
 enum {
@@ -85,13 +91,20 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 static const struct snd_kcontrol_new broxton_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+static const struct snd_kcontrol_new max98357a_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Spk"),
 };
 
+static const struct snd_kcontrol_new max98390_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Left Spk"),
+	SOC_DAPM_PIN_SWITCH("Right Spk"),
+};
+
 static const struct snd_soc_dapm_widget broxton_widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Spk", NULL),
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 	SND_SOC_DAPM_SPK("HDMI1", NULL),
 	SND_SOC_DAPM_SPK("HDMI2", NULL),
@@ -100,14 +113,20 @@ static const struct snd_soc_dapm_widget broxton_widgets[] = {
 			platform_clock_control,	SND_SOC_DAPM_POST_PMD|SND_SOC_DAPM_PRE_PMU),
 };
 
+static const struct snd_soc_dapm_widget max98357a_widgets[] = {
+	SND_SOC_DAPM_SPK("Spk", NULL),
+};
+
+static const struct snd_soc_dapm_widget max98390_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
 static const struct snd_soc_dapm_route audio_map[] = {
 	/* HP jack connectors - unknown if we have jack detection */
 	{"Headphone Jack", NULL, "HPL"},
 	{"Headphone Jack", NULL, "HPR"},
 
-	/* speaker */
-	{"Spk", NULL, "Speaker"},
-
 	/* other jacks */
 	{"MIC", NULL, "Headset Mic"},
 
@@ -134,6 +153,17 @@ static const struct snd_soc_dapm_route audio_map[] = {
 	{ "Headset Mic", NULL, "Platform Clock" },
 };
 
+static const struct snd_soc_dapm_route max98357a_routes[] = {
+	/* speaker */
+	{"Spk", NULL, "Speaker"},
+};
+
+static const struct snd_soc_dapm_route max98390_routes[] = {
+	/* Speaker */
+	{"Left Spk", NULL, "Left BE_OUT"},
+	{"Right Spk", NULL, "Right BE_OUT"},
+};
+
 static const struct snd_soc_dapm_route broxton_map[] = {
 	{"HiFi Playback", NULL, "ssp5 Tx"},
 	{"ssp5 Tx", NULL, "codec0_out"},
@@ -404,6 +434,10 @@ SND_SOC_DAILINK_DEF(ssp5_pin,
 SND_SOC_DAILINK_DEF(ssp5_codec,
 	DAILINK_COMP_ARRAY(COMP_CODEC("MX98357A:00",
 				      BXT_MAXIM_CODEC_DAI)));
+SND_SOC_DAILINK_DEF(max98390_codec,
+	DAILINK_COMP_ARRAY(
+	/* Left */	COMP_CODEC(MAX98390_DEV0_NAME, "max98390-aif1"),
+	/* Right */	COMP_CODEC(MAX98390_DEV1_NAME, "max98390-aif1")));
 
 SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
@@ -601,15 +635,69 @@ static struct snd_soc_dai_link broxton_dais[] = {
 	},
 };
 
+static struct snd_soc_codec_conf max98390_codec_confs[] = {
+	{
+		.dlc = COMP_CODEC_CONF(MAX98390_DEV0_NAME),
+		.name_prefix = "Left",
+	},
+	{
+		.dlc = COMP_CODEC_CONF(MAX98390_DEV1_NAME),
+		.name_prefix = "Right",
+	},
+};
+
 #define NAME_SIZE	32
 static int bxt_card_late_probe(struct snd_soc_card *card)
 {
 	struct bxt_card_private *ctx = snd_soc_card_get_drvdata(card);
 	struct bxt_hdmi_pcm *pcm;
 	struct snd_soc_component *component = NULL;
-	int err, i = 0;
+	const struct snd_kcontrol_new *controls;
+	const struct snd_soc_dapm_widget *widgets;
+	const struct snd_soc_dapm_route *routes;
+	int num_controls, num_widgets, num_routes, err, i = 0;
 	char jack_name[NAME_SIZE];
 
+	switch (ctx->spkamp) {
+	case SPKAMP_MAX98357A:
+		controls = max98357a_controls;
+		num_controls = ARRAY_SIZE(max98357a_controls);
+		widgets = max98357a_widgets;
+		num_widgets = ARRAY_SIZE(max98357a_widgets);
+		routes = max98357a_routes;
+		num_routes = ARRAY_SIZE(max98357a_routes);
+		break;
+	case SPKAMP_MAX98390:
+		controls = max98390_controls;
+		num_controls = ARRAY_SIZE(max98390_controls);
+		widgets = max98390_widgets;
+		num_widgets = ARRAY_SIZE(max98390_widgets);
+		routes = max98390_routes;
+		num_routes = ARRAY_SIZE(max98390_routes);
+		break;
+	default:
+		dev_err(card->dev, "Invalid speaker amplifier %d\n", ctx->spkamp);
+		break;
+	}
+
+	err = snd_soc_dapm_new_controls(&card->dapm, widgets, num_widgets);
+	if (err) {
+		dev_err(card->dev, "Fail to new widgets\n");
+		return err;
+	}
+
+	err = snd_soc_add_card_controls(card, controls, num_controls);
+	if (err) {
+		dev_err(card->dev, "Fail to add controls\n");
+		return err;
+	}
+
+	err = snd_soc_dapm_add_routes(&card->dapm, routes, num_routes);
+	if (err) {
+		dev_err(card->dev, "Fail to add routes\n");
+		return err;
+	}
+
 	if (soc_intel_is_glk())
 		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
 					ARRAY_SIZE(gemini_map));
@@ -678,6 +766,11 @@ static int broxton_audio_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 
+	if (acpi_dev_present("MX98390", NULL, -1))
+		ctx->spkamp = SPKAMP_MAX98390;
+	else
+		ctx->spkamp = SPKAMP_MAX98357A;
+
 	broxton_audio_card.dev = &pdev->dev;
 	snd_soc_card_set_drvdata(&broxton_audio_card, ctx);
 	if (soc_intel_is_glk()) {
@@ -702,7 +795,13 @@ static int broxton_audio_probe(struct platform_device *pdev)
 	} else if (soc_intel_is_cml()) {
 		unsigned int i;
 
-		broxton_audio_card.name = "cmlda7219max";
+		if (ctx->spkamp == SPKAMP_MAX98390) {
+			broxton_audio_card.name = "cml_max98390_da7219";
+
+			broxton_audio_card.codec_conf = max98390_codec_confs;
+			broxton_audio_card.num_configs = ARRAY_SIZE(max98390_codec_confs);
+		} else
+			broxton_audio_card.name = "cmlda7219max";
 
 		for (i = 0; i < ARRAY_SIZE(broxton_dais); i++) {
 			/* MAXIM_CODEC is connected to SSP1. */
@@ -710,6 +809,11 @@ static int broxton_audio_probe(struct platform_device *pdev)
 					BXT_MAXIM_CODEC_DAI)) {
 				broxton_dais[i].name = "SSP1-Codec";
 				broxton_dais[i].cpus->dai_name = "SSP1 Pin";
+
+				if (ctx->spkamp == SPKAMP_MAX98390) {
+					broxton_dais[i].codecs = max98390_codec;
+					broxton_dais[i].num_codecs = ARRAY_SIZE(max98390_codec);
+				}
 			}
 			/* DIALOG_CODEC is connected to SSP0 */
 			else if (!strcmp(broxton_dais[i].codecs->dai_name,
@@ -759,6 +863,7 @@ MODULE_AUTHOR("Harsha Priya <harshapriya.n@intel.com>");
 MODULE_AUTHOR("Conrad Cooke <conrad.cooke@intel.com>");
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
+MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:bxt_da7219_max98357a");
 MODULE_ALIAS("platform:glk_da7219_max98357a");
diff --git a/sound/soc/intel/common/soc-acpi-intel-cml-match.c b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
index cdea0c0..dee1f0f 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -19,6 +19,11 @@ static struct snd_soc_acpi_codecs max98357a_spk_codecs = {
 	.codecs = {"MX98357A"}
 };
 
+static struct snd_soc_acpi_codecs max98390_spk_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98390"}
+};
+
 /*
  * The order of the three entries with .id = "10EC5682" matters
  * here, because DSDT tables expose an ACPI HID for the MAX98357A
@@ -55,6 +60,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_cml_machines[] = {
 		.sof_fw_filename = "sof-cml.ri",
 		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
 	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "cml_da7219_max98357a",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &max98390_spk_codecs,
+		.sof_fw_filename = "sof-cml.ri",
+		.sof_tplg_filename = "sof-cml-da7219-max98357a.tplg",
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_cml_machines);
-- 
2.7.4

