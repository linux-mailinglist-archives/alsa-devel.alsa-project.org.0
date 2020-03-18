Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 019D618BB71
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Mar 2020 16:45:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B3601781;
	Thu, 19 Mar 2020 16:44:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B3601781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584632740;
	bh=iy4O+lSzULUxqqSVvfocEqpimNR1u3hPU9fgF6ClSMY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GsPZM0lcYHPhmIcWhe8xDbo5frLQlSvdBZT3G8y9v26aJAC3OyRwWs95EGhi/0D05
	 0mbFNeSz37zO6C90IdKS04yku4b0FgeeFMVOPx/n7D7GWfpaBNS9pZn1ank61xQTuQ
	 Cs2c7S7Kkh73gFeSEnSn1r/jg9Cqkqr1NDJCWGWE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F4EF80254;
	Thu, 19 Mar 2020 16:43:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1640EF80139; Wed, 18 Mar 2020 05:10:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EF2C4F80058
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 05:10:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EF2C4F80058
IronPort-SDR: VdZzt3qH4RLabFcoTGP/GmLH9CPwgVAOHTrntP+gqmsVPMESNFGynEFOrCe6vCmxmKS9CmJv09
 2+lC6pIyrpzw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 21:10:12 -0700
IronPort-SDR: G0p2Md36hbJ5Vecsp+QLae9VQBhAbeHsjJ7q5vUYAYJq3LXNpuaN99dzpKv6etFNPYIgEKted6
 gVSD6KBkiybQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="268219147"
Received: from macchian.itwn.intel.com ([10.5.230.132])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2020 21:10:10 -0700
From: "mac.chiang@intel.com--cc=pierre-louis.bossart"@linux.intel.com
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: Intel: boards: add stereo playback by woofer speaker
Date: Wed, 18 Mar 2020 12:10:14 +0800
Message-Id: <1584504614-15191-1-git-send-email-mac.chiang@intel.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 19 Mar 2020 16:43:13 +0100
Cc: sathya.prakash.m.r@intel.com, naveen.m@intel.com, mac.chiang@intel.com,
 broonie@kernel.org
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

From: Mac Chiang <mac.chiang@intel.com>

support woofer stereo speakers individually

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
---
Changelog:
  v2:
    - considering woofer speakers settings as general.
    - separate out the tweeter speakers and consistency of woofer+tweeter
      when hardware-specific.
    - check NULL condition if devm_kzalloc is failed
---
 sound/soc/intel/boards/cml_rt1011_rt5682.c | 215 +++++++++++++++++++++++------
 1 file changed, 172 insertions(+), 43 deletions(-)

diff --git a/sound/soc/intel/boards/cml_rt1011_rt5682.c b/sound/soc/intel/boards/cml_rt1011_rt5682.c
index dd80d01..fc822a1 100644
--- a/sound/soc/intel/boards/cml_rt1011_rt5682.c
+++ b/sound/soc/intel/boards/cml_rt1011_rt5682.c
@@ -30,6 +30,35 @@
 #define CML_RT5682_CODEC_DAI "rt5682-aif1"
 #define NAME_SIZE 32
 
+#define SOF_RT1011_SPEAKER_WL		BIT(0)
+#define SOF_RT1011_SPEAKER_WR		BIT(1)
+#define SOF_RT1011_SPEAKER_TL		BIT(2)
+#define SOF_RT1011_SPEAKER_TR		BIT(3)
+#define SPK_CH 4
+
+/* Default: Woofer speakers  */
+static unsigned long sof_rt1011_quirk = SOF_RT1011_SPEAKER_WL | SOF_RT1011_SPEAKER_WR;
+
+static int sof_rt1011_quirk_cb(const struct dmi_system_id *id)
+{
+	sof_rt1011_quirk = (unsigned long)id->driver_data;
+	return 1;
+}
+
+static const struct dmi_system_id sof_rt1011_quirk_table[] = {
+	{
+		.callback = sof_rt1011_quirk_cb,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Google"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Helios"),
+	},
+		.driver_data = (void *)(SOF_RT1011_SPEAKER_WL | SOF_RT1011_SPEAKER_WR |
+					SOF_RT1011_SPEAKER_TL | SOF_RT1011_SPEAKER_TR),
+	},
+	{
+	}
+};
+
 static struct snd_soc_jack hdmi_jack[3];
 
 struct hdmi_pcm {
@@ -48,15 +77,16 @@ struct card_private {
 static const struct snd_kcontrol_new cml_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
-	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
-	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
 	SOC_DAPM_PIN_SWITCH("WL Ext Spk"),
 	SOC_DAPM_PIN_SWITCH("WR Ext Spk"),
 };
 
+static const struct snd_kcontrol_new cml_rt1011_tt_controls[] = {
+	SOC_DAPM_PIN_SWITCH("TL Ext Spk"),
+	SOC_DAPM_PIN_SWITCH("TR Ext Spk"),
+};
+
 static const struct snd_soc_dapm_widget cml_rt1011_rt5682_widgets[] = {
-	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
-	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
 	SND_SOC_DAPM_SPK("WL Ext Spk", NULL),
 	SND_SOC_DAPM_SPK("WR Ext Spk", NULL),
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
@@ -64,10 +94,13 @@ static const struct snd_soc_dapm_widget cml_rt1011_rt5682_widgets[] = {
 	SND_SOC_DAPM_MIC("SoC DMIC", NULL),
 };
 
+static const struct snd_soc_dapm_widget cml_rt1011_tt_widgets[] = {
+	SND_SOC_DAPM_SPK("TL Ext Spk", NULL),
+	SND_SOC_DAPM_SPK("TR Ext Spk", NULL),
+};
+
 static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
-	/*speaker*/
-	{"TL Ext Spk", NULL, "TL SPO"},
-	{"TR Ext Spk", NULL, "TR SPO"},
+	/*WL/WR speaker*/
 	{"WL Ext Spk", NULL, "WL SPO"},
 	{"WR Ext Spk", NULL, "WR SPO"},
 
@@ -82,6 +115,12 @@ static const struct snd_soc_dapm_route cml_rt1011_rt5682_map[] = {
 	{"DMic", NULL, "SoC DMIC"},
 };
 
+static const struct snd_soc_dapm_route cml_rt1011_tt_map[] = {
+	/*TL/TR speaker*/
+	{"TL Ext Spk", NULL, "TL SPO" },
+	{"TR Ext Spk", NULL, "TR SPO" },
+};
+
 static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct card_private *ctx = snd_soc_card_get_drvdata(rtd->card);
@@ -121,6 +160,35 @@ static int cml_rt5682_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 };
 
+static int cml_rt1011_spk_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret = 0;
+	struct snd_soc_card *card = rtd->card;
+
+	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
+				SOF_RT1011_SPEAKER_TR)) {
+
+		ret = snd_soc_add_card_controls(card, cml_rt1011_tt_controls,
+					ARRAY_SIZE(cml_rt1011_tt_controls));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_new_controls(&card->dapm,
+					cml_rt1011_tt_widgets,
+					ARRAY_SIZE(cml_rt1011_tt_widgets));
+		if (ret)
+			return ret;
+
+		ret = snd_soc_dapm_add_routes(&card->dapm, cml_rt1011_tt_map,
+					ARRAY_SIZE(cml_rt1011_tt_map));
+
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
 static int cml_rt5682_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
@@ -192,30 +260,38 @@ static int cml_rt1011_hw_params(struct snd_pcm_substream *substream,
 		 * The feedback is captured for each codec individually.
 		 * Hence all 4 codecs use 1 Tx slot each for feedback.
 		 */
-		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
-			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-						       0x4, 0x1, 4, 24);
-			if (ret < 0)
-				break;
-		}
-		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:02")) {
-			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-						       0x1, 0x1, 4, 24);
-			if (ret < 0)
-				break;
-		}
-		/* TDM Rx slot 2 is used for Right Woofer & Tweeters pair */
-		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
-			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-						       0x8, 0x2, 4, 24);
-			if (ret < 0)
-				break;
+		if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_WL |
+					SOF_RT1011_SPEAKER_WR)) {
+			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:00")) {
+				ret = snd_soc_dai_set_tdm_slot(codec_dai,
+							       0x4, 0x1, 4, 24);
+				if (ret < 0)
+					break;
+			}
+
+			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:01")) {
+				ret = snd_soc_dai_set_tdm_slot(codec_dai,
+							       0x8, 0x2, 4, 24);
+				if (ret < 0)
+					break;
+			}
 		}
-		if (!strcmp(codec_dai->component->name, "i2c-10EC1011:03")) {
-			ret = snd_soc_dai_set_tdm_slot(codec_dai,
-						       0x2, 0x2, 4, 24);
-			if (ret < 0)
-				break;
+
+		if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
+					SOF_RT1011_SPEAKER_TR)) {
+			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:02")) {
+				ret = snd_soc_dai_set_tdm_slot(codec_dai,
+							       0x1, 0x1, 4, 24);
+				if (ret < 0)
+					break;
+			}
+
+			if (!strcmp(codec_dai->component->name, "i2c-10EC1011:03")) {
+				ret = snd_soc_dai_set_tdm_slot(codec_dai,
+							       0x2, 0x2, 4, 24);
+				if (ret < 0)
+					break;
+			}
 		}
 	}
 	if (ret < 0)
@@ -302,10 +378,8 @@ SND_SOC_DAILINK_DEF(ssp1_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("SSP1 Pin")));
 SND_SOC_DAILINK_DEF(ssp1_codec,
 	DAILINK_COMP_ARRAY(
-	/* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
-	/* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI),
-	/* TL */ COMP_CODEC("i2c-10EC1011:02", CML_RT1011_CODEC_DAI),
-	/* TR */ COMP_CODEC("i2c-10EC1011:03", CML_RT1011_CODEC_DAI)));
+       /* WL */ COMP_CODEC("i2c-10EC1011:00", CML_RT1011_CODEC_DAI),
+       /* WR */ COMP_CODEC("i2c-10EC1011:01", CML_RT1011_CODEC_DAI)));
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
@@ -399,6 +473,7 @@ static struct snd_soc_dai_link cml_rt1011_rt5682_dailink[] = {
 		.dpcm_playback = 1,
 		.dpcm_capture = 1, /* Capture stream provides Feedback */
 		.no_pcm = 1,
+		.init = cml_rt1011_spk_init,
 		.ops = &cml_rt1011_ops,
 		SND_SOC_DAILINK_REG(ssp1_pin, ssp1_codec, platform),
 	},
@@ -413,14 +488,6 @@ static struct snd_soc_codec_conf rt1011_conf[] = {
 		.dlc = COMP_CODEC_CONF("i2c-10EC1011:01"),
 		.name_prefix = "WR",
 	},
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1011:02"),
-		.name_prefix = "TL",
-	},
-	{
-		.dlc = COMP_CODEC_CONF("i2c-10EC1011:03"),
-		.name_prefix = "TR",
-	},
 };
 
 /* Cometlake audio machine driver for RT1011 and RT5682 */
@@ -442,10 +509,12 @@ static struct snd_soc_card snd_soc_card_cml = {
 
 static int snd_cml_rt1011_probe(struct platform_device *pdev)
 {
+	struct snd_soc_dai_link_component *rt1011_dais_components;
+	struct snd_soc_codec_conf *rt1011_dais_confs;
 	struct card_private *ctx;
 	struct snd_soc_acpi_mach *mach;
 	const char *platform_name;
-	int ret;
+	int ret, i;
 
 	ctx = devm_kzalloc(&pdev->dev, sizeof(*ctx), GFP_ATOMIC);
 	if (!ctx)
@@ -456,6 +525,65 @@ static int snd_cml_rt1011_probe(struct platform_device *pdev)
 	snd_soc_card_cml.dev = &pdev->dev;
 	platform_name = mach->mach_params.platform;
 
+	dmi_check_system(sof_rt1011_quirk_table);
+
+	dev_info(&pdev->dev, "sof_rt1011_quirk = %lx\n", sof_rt1011_quirk);
+
+	if (sof_rt1011_quirk & (SOF_RT1011_SPEAKER_TL |
+				SOF_RT1011_SPEAKER_TR)) {
+		rt1011_dais_confs = devm_kzalloc(&pdev->dev,
+					sizeof(struct snd_soc_codec_conf) *
+					SPK_CH, GFP_KERNEL);
+
+		if (!rt1011_dais_confs)
+			return -ENOMEM;
+
+		rt1011_dais_components = devm_kzalloc(&pdev->dev,
+					sizeof(struct snd_soc_dai_link_component) *
+					SPK_CH, GFP_KERNEL);
+
+		if (!rt1011_dais_components)
+			return -ENOMEM;
+
+		for (i = 0; i < SPK_CH; i++) {
+			rt1011_dais_confs[i].dlc.name = devm_kasprintf(&pdev->dev,
+								GFP_KERNEL,
+								"i2c-10EC1011:0%d",
+								i);
+			switch (i) {
+			case 0:
+				rt1011_dais_confs[i].name_prefix = "WL";
+				break;
+
+			case 1:
+				rt1011_dais_confs[i].name_prefix = "WR";
+				break;
+			case 2:
+				rt1011_dais_confs[i].name_prefix = "TL";
+				break;
+			case 3:
+				rt1011_dais_confs[i].name_prefix = "TR";
+				break;
+			}
+			rt1011_dais_components[i].name = devm_kasprintf(&pdev->dev,
+								GFP_KERNEL,
+								"i2c-10EC1011:0%d",
+								i);
+			rt1011_dais_components[i].dai_name = CML_RT1011_CODEC_DAI;
+		}
+
+		snd_soc_card_cml.codec_conf = rt1011_dais_confs;
+		snd_soc_card_cml.num_configs = SPK_CH;
+
+		for (i = 0; i < ARRAY_SIZE(cml_rt1011_rt5682_dailink); i++) {
+			if (!strcmp(cml_rt1011_rt5682_dailink[i].codecs->dai_name,
+					CML_RT1011_CODEC_DAI)) {
+				cml_rt1011_rt5682_dailink[i].codecs = rt1011_dais_components;
+				cml_rt1011_rt5682_dailink[i].num_codecs = SPK_CH;
+			}
+		}
+	}
+
 	/* set platform name for each dailink */
 	ret = snd_soc_fixup_dai_links_platform_name(&snd_soc_card_cml,
 						    platform_name);
@@ -483,5 +611,6 @@ MODULE_DESCRIPTION("Cometlake Audio Machine driver - RT1011 and RT5682 in I2S mo
 MODULE_AUTHOR("Naveen Manohar <naveen.m@intel.com>");
 MODULE_AUTHOR("Sathya Prakash M R <sathya.prakash.m.r@intel.com>");
 MODULE_AUTHOR("Shuming Fan <shumingf@realtek.com>");
+MODULE_AUTHOR("Mac Chiang <mac.chiang@intel.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:cml_rt1011_rt5682");
-- 
2.7.4

