Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77219473C
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Mar 2020 20:13:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56FD21666;
	Thu, 26 Mar 2020 20:12:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56FD21666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585249981;
	bh=U+d05L90CS4C2u2NA4pUjfD5/as61Wcl73FmxUyFcXc=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=EDgV3b24ves8slwrhfifY+q4ToJh1YLfgEGHR/A68cVm+j5d8JN8wlL7a+oDmgqX0
	 7eK4o/7BWMXJxlZLgeHYWXR/08YWPWX8c733S+1cTmGPwa5K+FkPKJksoDZthShG2i
	 07SqGGMBUsxRGI5QfJ5tYCnyZ9abwdR5tcHWDOaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7B61BF80308;
	Thu, 26 Mar 2020 20:05:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76BA2F80306; Thu, 26 Mar 2020 20:05:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 19129F802FE;
 Thu, 26 Mar 2020 20:05:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 19129F802FE
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 671767FA;
 Thu, 26 Mar 2020 12:05:33 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DEAFC3F71F;
 Thu, 26 Mar 2020 12:05:32 -0700 (PDT)
Date: Thu, 26 Mar 2020 19:05:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Yong Zhi <yong.zhi@intel.com>
Subject: Applied "ASoC: intel: sof_da7219_max98373: Add speaker switch" to the
 asoc tree
In-Reply-To: <20200325213245.28247-3-pierre-louis.bossart@linux.intel.com>
Message-Id: <applied-20200325213245.28247-3-pierre-louis.bossart@linux.intel.com>
X-Patchwork-Hint: ignore
Cc: Bhat@alsa-project.org, alsa-devel@alsa-project.org, tiwai@suse.de,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Uday M <uday.m.bhat@intel.com>
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

   ASoC: intel: sof_da7219_max98373: Add speaker switch

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

From 90c49d6a1f2446ae61b3631b4d8950842a4b3edf Mon Sep 17 00:00:00 2001
From: Yong Zhi <yong.zhi@intel.com>
Date: Wed, 25 Mar 2020 16:32:43 -0500
Subject: [PATCH] ASoC: intel: sof_da7219_max98373: Add speaker switch

Add "Spk Switch" and associated widget, route to max98360a
speaker amp for power saving, also remove the speaker_amp_init()
callback with complete separated tables for max98373 and max98360a.

Signed-off-by: Bhat, Uday M <uday.m.bhat@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Yong Zhi <yong.zhi@intel.com>
Link: https://lore.kernel.org/r/20200325213245.28247-3-pierre-louis.bossart@linux.intel.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/intel/boards/sof_da7219_max98373.c | 67 +++++++++++---------
 1 file changed, 37 insertions(+), 30 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219_max98373.c b/sound/soc/intel/boards/sof_da7219_max98373.c
index 6d210ba06d19..239d8ffdbccd 100644
--- a/sound/soc/intel/boards/sof_da7219_max98373.c
+++ b/sound/soc/intel/boards/sof_da7219_max98373.c
@@ -72,11 +72,17 @@ static const struct snd_kcontrol_new controls[] = {
 static const struct snd_kcontrol_new m98360a_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
 	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Spk"),
 };
 
+/* For MAX98373 amp */
 static const struct snd_soc_dapm_widget widgets[] = {
 	SND_SOC_DAPM_HP("Headphone Jack", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+
+	SND_SOC_DAPM_SPK("Left Spk", NULL),
+	SND_SOC_DAPM_SPK("Right Spk", NULL),
+
 	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
 			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
 			    SND_SOC_DAPM_PRE_PMU),
@@ -90,17 +96,33 @@ static const struct snd_soc_dapm_route audio_map[] = {
 
 	{ "Headphone Jack", NULL, "Platform Clock" },
 	{ "Headset Mic", NULL, "Platform Clock" },
+
+	{ "Left Spk", NULL, "Left BE_OUT" },
+	{ "Right Spk", NULL, "Right BE_OUT" },
 };
 
-/* For MAX98373 amp */
-static const struct snd_soc_dapm_widget max98373_widgets[] = {
-	SND_SOC_DAPM_SPK("Left Spk", NULL),
-	SND_SOC_DAPM_SPK("Right Spk", NULL),
+/* For MAX98360A amp */
+static const struct snd_soc_dapm_widget max98360a_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+
+	SND_SOC_DAPM_SPK("Spk", NULL),
+
+	SND_SOC_DAPM_SUPPLY("Platform Clock", SND_SOC_NOPM, 0, 0,
+			    platform_clock_control, SND_SOC_DAPM_POST_PMD |
+			    SND_SOC_DAPM_PRE_PMU),
 };
 
-static const struct snd_soc_dapm_route max98373_map[] = {
-	{ "Left Spk", NULL, "Left BE_OUT" },
-	{ "Right Spk", NULL, "Right BE_OUT" },
+static const struct snd_soc_dapm_route max98360a_map[] = {
+	{ "Headphone Jack", NULL, "HPL" },
+	{ "Headphone Jack", NULL, "HPR" },
+
+	{ "MIC", NULL, "Headset Mic" },
+
+	{ "Headphone Jack", NULL, "Platform Clock" },
+	{ "Headset Mic", NULL, "Platform Clock" },
+
+	{"Spk", NULL, "Speaker"},
 };
 
 static struct snd_soc_jack headset;
@@ -144,21 +166,6 @@ static int da7219_codec_init(struct snd_soc_pcm_runtime *rtd)
 	return ret;
 }
 
-static int speaker_amp_init(struct snd_soc_pcm_runtime *rtd)
-{
-	int ret;
-
-	/* Add widgets */
-	ret = snd_soc_dapm_new_controls(&rtd->card->dapm, max98373_widgets,
-					ARRAY_SIZE(max98373_widgets));
-	if (ret)
-		return ret;
-
-	/* Add routes */
-	return snd_soc_dapm_add_routes(&rtd->card->dapm, max98373_map,
-				       ARRAY_SIZE(max98373_map));
-}
-
 static int ssp1_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
@@ -249,8 +256,9 @@ SND_SOC_DAILINK_DEF(ssp1_amps,
 	DAILINK_COMP_ARRAY(
 	/* Left */	COMP_CODEC(MAXIM_DEV0_NAME, MAX98373_CODEC_DAI),
 	/* Right */	COMP_CODEC(MAXIM_DEV1_NAME, MAX98373_CODEC_DAI)));
-/* For the driver-less spk amp */
-SND_SOC_DAILINK_DEF(dummy, DAILINK_COMP_ARRAY(COMP_DUMMY()));
+
+SND_SOC_DAILINK_DEF(ssp1_m98360a,
+	DAILINK_COMP_ARRAY(COMP_CODEC("MX98360A:00", "HiFi")));
 
 SND_SOC_DAILINK_DEF(dmic_pin,
 	DAILINK_COMP_ARRAY(COMP_CPU("DMIC01 Pin")));
@@ -282,7 +290,6 @@ static struct snd_soc_dai_link dais[] = {
 		.id = 0,
 		.ignore_pmdown_time = 1,
 		.no_pcm = 1,
-		.init = speaker_amp_init,
 		.dpcm_playback = 1,
 		.dpcm_capture = 1, /* IV feedback */
 		.ops = &ssp1_ops,
@@ -356,10 +363,10 @@ static struct snd_soc_card card_da7219_m98360a = {
 	.num_links = ARRAY_SIZE(dais),
 	.controls = m98360a_controls,
 	.num_controls = ARRAY_SIZE(m98360a_controls),
-	.dapm_widgets = widgets,
-	.num_dapm_widgets = ARRAY_SIZE(widgets),
-	.dapm_routes = audio_map,
-	.num_dapm_routes = ARRAY_SIZE(audio_map),
+	.dapm_widgets = max98360a_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(max98360a_widgets),
+	.dapm_routes = max98360a_map,
+	.num_dapm_routes = ARRAY_SIZE(max98360a_map),
 	.fully_routed = true,
 	.late_probe = card_late_probe,
 };
@@ -383,7 +390,7 @@ static int audio_probe(struct platform_device *pdev)
 			.no_pcm = 1,
 			.dpcm_playback = 1,
 			.ignore_pmdown_time = 1,
-			SND_SOC_DAILINK_REG(ssp1_pin, dummy, platform) };
+			SND_SOC_DAILINK_REG(ssp1_pin, ssp1_m98360a, platform) };
 	}
 
 	INIT_LIST_HEAD(&ctx->hdmi_pcm_list);
-- 
2.20.1

