Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B30EB184C5A
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 17:22:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40166181F;
	Fri, 13 Mar 2020 17:21:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40166181F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584116529;
	bh=MOnyjburcnRoqchr+wCKJHzyGTo8y+04JSZ3bVwdqa8=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=mk7ggg4Y9Z9X7XPfj7cQSu/JApI+AffE9PCCyKOGFcsGligS1aNfsrqFvdc8bH0lG
	 ZOSNwsvRIrPQAPnsG2ukVgsM/HCTdv5BlMNJgnHEB5OQVDjap/sd37IxtQ4miPo+M3
	 jlwixM1qjzujMJjGJ1Y8P827Uc1Vx4/Oo800S4nk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C47ACF802C2;
	Fri, 13 Mar 2020 17:17:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2ECDF80290; Fri, 13 Mar 2020 17:17:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS, SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 39A62F80090
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 17:17:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39A62F80090
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 200841045;
 Fri, 13 Mar 2020 09:17:35 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 96E913F6CF;
 Fri, 13 Mar 2020 09:17:34 -0700 (PDT)
Date: Fri, 13 Mar 2020 16:17:33 +0000
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
Subject: Applied "ASoC: Intel: sof_da7219_max98373: Add support for max98360a
 speaker amp" to the asoc tree
In-Reply-To: 
Message-Id: 
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
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

The patch

   ASoC: Intel: sof_da7219_max98373: Add support for max98360a speaker amp

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 3f32e596b03ef50fd2c49f2e13d42e1931525f35 Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Thu, 12 Mar 2020 14:48:57 -0500
Subject: [PATCH] ASoC: Intel: sof_da7219_max98373: Add support for max98360a
 speaker amp

Add Maxim MAX98360A plug-and-play Class-D amplifier support on SSP1,
new card ID is sofda7219max98360a, name sof-da7219max98360a.

Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Link: https://lore.kernel.org/r/20200312194859.4051-9-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/Kconfig                |  4 +-
 sound/soc/intel/boards/sof_da7219_max98373.c  | 74 +++++++++++++++++--
 .../intel/common/soc-acpi-intel-jsl-match.c   | 19 ++++-
 3 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/boards/Kconfig b/sound/soc/intel/boards/Kconfig
index 6833ef548710..ab4ce652cc1a 100644
--- a/sound/soc/intel/boards/Kconfig
+++ b/sound/soc/intel/boards/Kconfig
@@ -507,7 +507,7 @@ endif ## SND_SOC_SOF_COMETLAKE_LP && SND_SOC_SOF_HDA_LINK
 if SND_SOC_SOF_JASPERLAKE
 
 config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
-	tristate "SOF with DA7219 and MAX98373 in I2S Mode"
+	tristate "SOF with DA7219 and MAX98373/MAX98360A in I2S Mode"
 	depends on I2C && ACPI
 	depends on MFD_INTEL_LPSS || COMPILE_TEST
 	depends on SND_HDA_CODEC_HDMI
@@ -516,7 +516,7 @@ config SND_SOC_INTEL_SOF_DA7219_MAX98373_MACH
 	select SND_SOC_DMIC
 	help
 	  This adds support for ASoC machine driver for SOF platforms
-	  with DA7219 + MAX98373 I2S audio codec.
+	  with DA7219 + MAX98373/MAX98360A I2S audio codec.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 8c657da5fcf0..7847dd44f41b 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -2,7 +2,7 @@
 // Copyright(c) 2019 Intel Corporation.
 
 /*
- * Intel SOF Machine driver for DA7219 + MAX98373 codec
+ * Intel SOF Machine driver for DA7219 + MAX98373/MAX98360A codec
  */
 
 #include <linux/input.h>
@@ -69,11 +69,14 @@ static const struct snd_kcontrol_new controls[] = {
 	SOC_DAPM_PIN_SWITCH("Right Spk"),
 };
 
+static const struct snd_kcontrol_new m98360a_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
 static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
 			    SND_SOC_DAPM_PRE_PMU),
@@ -83,15 +86,23 @@ static const struct snd_soc_dapm_route audio_map[] = {
 	{ "Headphone Jack", NULL, "HPL" },
 	{ "Headphone Jack", NULL, "HPR" },
 
-	{ "Left Spk", NULL, "Left BE_OUT" },
-	{ "Right Spk", NULL, "Right BE_OUT" },
-
 	{ "MIC", NULL, "Headset Mic" },
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
 };
 
+/* For MAX98373 amp */
+static const struct snd_soc_dapm_widget max98373_widgets[] = {
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+};
+
+static const struct snd_soc_dapm_route max98373_map[] = {
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
+};
+
 static struct snd_soc_jack headset;
 
 static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
@@ -133,6 +144,21 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
+static int speaker_amp_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+
+	/* Add widgets */
+	ret = snd_soc_dapm_new_controls(&rtd->card->dapm, max98373_widgets,
+					ARRAY_SIZE(max98373_widgets));
+	if (ret)
+		return ret;
+
+	/* Add routes */
+	return snd_soc_dapm_add_routes(&rtd->card->dapm, max98373_map,
+				       ARRAY_SIZE(max98373_map));
+}
+
 static int ssp1_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
@@ -223,6 +249,8 @@ SND_SOC_DAILINK_DEF(ssp1_amps,
 	DAILINK_COMP_ARRAY(
 	/* Left */	COMP_CODEC(MAXIM_DEV0_NAME, MAX98373_CODEC_DAI),
 	/* Right */	COMP_CODEC(MAXIM_DEV1_NAME, MAX98373_CODEC_DAI)));
+/* For the driver-less spk amp */
+SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
@@ -254,6 +282,7 @@ static struct snd_soc_dai_link dais[] = {
 		.id = 0,
 		.ignore_pmdown_time = 1,
 		.no_pcm = 1,
+		.init = speaker_amp_init,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1, /* IV feedback */
 		.ops = &ssp1_ops,
@@ -320,6 +349,21 @@ static struct snd_soc_card card_da7219_m98373 = {
 	.late_probe = card_late_probe,
 };
 
+static struct snd_soc_card card_da7219_m98360a = {
+	.name = "da7219max98360a",
+	.owner = THIS_MODULE,
+	.dai_link = dais,
+	.num_links = ARRAY_SIZE(dais),
+	.controls = m98360a_controls,
+	.num_controls = ARRAY_SIZE(m98360a_controls),
+	.dapm_widgets = widgets,
+	.num_dapm_widgets = ARRAY_SIZE(widgets),
+	.dapm_routes = audio_map,
+	.num_dapm_routes = ARRAY_SIZE(audio_map),
+	.fully_routed = true,
+	.late_probe = card_late_probe,
+};
+
 static int audio_probe(struct platform_device *pdev)
 {
 	static struct snd_soc_card *card;
@@ -331,6 +375,17 @@ static int audio_probe(struct platform_device *pdev)
 	if (!ctx)
 		return -ENOMEM;
 
+	/* By default dais[0] is configured for max98373 */
+	if (!strcmp(pdev->name, "sof_da7219_max98360a")) {
+		dais[0] = (struct snd_soc_dai_link) {
+			.name = "SSP1-Codec",
+			.id = 0,
+			.no_pcm = 1,
+			.dpcm_playback = 1,
+			.ignore_pmdown_time = 1,
+			SND_SOC_DAILINK_REG(ssp1_pin, dummy, platform) };
+	}
+
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
 	card = (struct snd_soc_card *)pdev->id_entry->driver_data;
 	card->dev = &pdev->dev;
@@ -351,13 +406,17 @@ static const struct platform_device_id board_ids[] = {
 		.name = "sof_da7219_max98373",
 		.driver_data = (kernel_ulong_t)&card_da7219_m98373,
 	},
+	{
+		.name = "sof_da7219_max98360a",
+		.driver_data = (kernel_ulong_t)&card_da7219_m98360a,
+	},
 	{ }
 };
 
 static struct platform_driver audio = {
 	.probe = audio_probe,
 	.driver = {
-		.name = "sof_da7219_max98373",
+		.name = "sof_da7219_max98_360a_373",
 		.pm = &snd_soc_pm_ops,
 	},
 	.id_table = board_ids,
@@ -368,4 +427,5 @@ module_platform_driver(audio)
 MODULE_DESCRIPTION("ASoC Intel(R) SOF Machine driver");
 MODULE_AUTHOR("Yong Zhi <yong.zhi@intel.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:sof_da7219_max98360a");
 MODULE_ALIAS("platform:sof_da7219_max98373");
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index ed2b125f6a11..70f01495a166 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -9,13 +9,30 @@
 #include <sound/soc-acpi.h>
 #include <sound/soc-acpi-intel-match.h>
 
+static struct snd_soc_acpi_codecs jsl_7219_98373_codecs = {
+	.num_codecs = 1,
+	.codecs = {"MX98373"}
+};
+
+/*
+ * When adding new entry to the snd_soc_acpi_intel_jsl_machines array,
+ * use .quirk_data member to distinguish different machine driver,
+ * and keep ACPI .id field unchanged for the common codec.
+ */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "DLGS7219",
 		.drv_name = "sof_da7219_max98373",
-		.machine_quirk = snd_soc_acpi_codec_list,
 		.sof_fw_filename = "sof-jsl.ri",
 		.sof_tplg_filename = "sof-jsl-da7219.tplg",
+		.machine_quirk = snd_soc_acpi_codec_list,
+		.quirk_data = &jsl_7219_98373_codecs,
+	},
+	{
+		.id = "DLGS7219",
+		.drv_name = "sof_da7219_max98360a",
+		.sof_fw_filename = "sof-jsl.ri",
+		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
 	},
 	{},
 };
-- 
2.20.1

