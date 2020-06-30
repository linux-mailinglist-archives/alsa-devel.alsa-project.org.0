Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87020EEA3
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jun 2020 08:39:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31A0E1614;
	Tue, 30 Jun 2020 08:38:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31A0E1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593499148;
	bh=by+GYVoe+hV6UVWjL36CFDPgudh9kahkOCtBW4a9XRo=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=lKxWKEQeWIu9iRmVZhHjaJCzZapUBu5p+J9UklJBsq3CUPc5FgLWyFUog2pMgwYJn
	 nemFF535230MXeninUp70r46nJBOM41vwR/HIwIIn749/ecab1nA6zRvrdD56Wmbhn
	 i64r8hXK2mWq1brUxmaVD1z75knSNBj29+zAY5ME=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C0F0F8013E;
	Tue, 30 Jun 2020 08:37:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 830CBF801F2; Tue, 30 Jun 2020 08:37:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64646F8013E
 for <alsa-devel@alsa-project.org>; Tue, 30 Jun 2020 08:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64646F8013E
IronPort-SDR: XrCGOF2VLLC1ZvAfW2yetOOe+T7FjogM9wvyB3UqHlF4Im+0qmiWpSwtvkIk/Gw7/7CXqTeyWK
 StIyfd97apYA==
X-IronPort-AV: E=McAfee;i="6000,8403,9666"; a="211224094"
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="211224094"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2020 23:37:13 -0700
IronPort-SDR: Id1b9LUdRv0jr27N7ZjFhoSD9J+C6WE5exCoS/fB3XJmLM7pPPbY66tSR1b82D29aeNdLamhyV
 /M7QDM99xfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,296,1589266800"; d="scan'208";a="480822274"
Received: from brentlu-desk0.itwn.intel.com ([10.5.253.11])
 by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2020 23:37:03 -0700
From: Brent Lu <brent.lu@intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: Intel: bxt-da7219-max98357a: support MAX98390 speaker
 amp
Date: Tue, 30 Jun 2020 14:32:02 +0800
Message-Id: <1593498722-7074-1-git-send-email-brent.lu@intel.com>
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
 sound/soc/intel/boards/Kconfig                    |  20 ++++
 sound/soc/intel/boards/bxt_da7219_max98357a.c     | 129 ++++++++++++++++++++--
 sound/soc/intel/common/soc-acpi-intel-cml-match.c |   4 +-
 3 files changed, 139 insertions(+), 14 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 3d820e1..b3b863e 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -291,9 +291,17 @@ config SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
 	select SND_SOC_DMIC
 	select SND_SOC_HDAC_HDMI
 
+config SND_SOC_INTEL_DA7219_MAX98390_GENERIC
+	tristate
+	select SND_SOC_DA7219
+	select SND_SOC_MAX98390
+	select SND_SOC_DMIC
+	select SND_SOC_HDAC_HDMI
+
 config SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
 	tristate
 	select SND_SOC_INTEL_DA7219_MAX98357A_GENERIC
+	select SND_SOC_INTEL_DA7219_MAX98390_GENERIC
 
 if SND_SOC_INTEL_APL
 
@@ -309,6 +317,18 @@ config SND_SOC_INTEL_BXT_DA7219_MAX98357A_MACH
 	   Say Y or m if you have such a device. This is a recommended option.
 	   If unsure select "N".
 
+config SND_SOC_INTEL_BXT_DA7219_MAX98390_MACH
+	tristate "Broxton with DA7219 and MAX98390 in I2S Mode"
+	depends on I2C && ACPI && GPIOLIB
+	depends on MFD_INTEL_LPSS || COMPILE_TEST
+	depends on SND_HDA_CODEC_HDMI
+	select SND_SOC_INTEL_BXT_DA7219_MAX98357A_COMMON
+	help
+	   This adds support for ASoC machine driver for Broxton-P platforms
+	   with DA7219 + MAX98390 I2S audio codec.
+	   Say Y or m if you have such a device. This is a recommended option.
+	   If unsure select "N".
+
 config SND_SOC_INTEL_BXT_RT298_MACH
 	tristate "Broxton with RT298 I2S mode"
 	depends on I2C && ACPI && GPIOLIB
diff --git a/sound/soc/intel/boards/bxt_da7219_max98357a.c b/sound/soc/intel/boards/bxt_da7219_max98357a.c
index 44016c1..12f07e1 100644
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
+	int num_controls, num_widgets, num_routes, ret, i = 0;
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
+	ret = snd_soc_dapm_new_controls(&card->dapm, widgets, num_widgets);
+	if (ret) {
+		dev_err(card->dev, "Fail to new widgets\n");
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, controls, num_controls);
+	if (ret) {
+		dev_err(card->dev, "Fail to add controls\n");
+		return ret;
+	}
+
+	ret = snd_soc_dapm_add_routes(&card->dapm, routes, num_routes);
+	if (ret) {
+		dev_err(card->dev, "Fail to add routes\n");
+		return ret;
+	}
+
 	if (soc_intel_is_glk())
 		snd_soc_dapm_add_routes(&card->dapm, gemini_map,
 					ARRAY_SIZE(gemini_map));
@@ -631,17 +719,17 @@ static int bxt_card_late_probe(struct snd_soc_card *card)
 		component = pcm->codec_dai->component;
 		snprintf(jack_name, sizeof(jack_name),
 			"HDMI/DP, pcm=%d Jack", pcm->device);
-		err = snd_soc_card_jack_new(card, jack_name,
+		ret = snd_soc_card_jack_new(card, jack_name,
 					SND_JACK_AVOUT, &broxton_hdmi[i],
 					NULL, 0);
 
-		if (err)
-			return err;
+		if (ret)
+			return ret;
 
-		err = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
+		ret = hdac_hdmi_jack_init(pcm->codec_dai, pcm->device,
 						&broxton_hdmi[i]);
-		if (err < 0)
-			return err;
+		if (ret < 0)
+			return ret;
 
 		i++;
 	}
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
index cdea0c0..7dc9ba9 100644
--- a/sound/soc/intel/common/soc-acpi-intel-cml-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-cml-match.c
@@ -15,8 +15,8 @@ static struct snd_soc_acpi_codecs rt1011_spk_codecs = {
 };
 
 static struct snd_soc_acpi_codecs max98357a_spk_codecs = {
-	.num_codecs = 1,
-	.codecs = {"MX98357A"}
+	.num_codecs = 2,
+	.codecs = {"MX98357A", "MX98390"}
 };
 
 /*
-- 
2.7.4

