Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4D165153
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Feb 2020 22:06:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65A9E16AC;
	Wed, 19 Feb 2020 22:05:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65A9E16AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582146372;
	bh=0556/W4oJCT2Llotqt/ikhVTlPFGLryOXw5ErmcBMjY=;
	h=Date:From:To:Subject:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=FL1dQ5LU9LOY0SQj8NB1F7OCNlHZbtZWZi3mSzRJv1sfmu8Ur4nfxLgvrUB6bunyr
	 bq1ySQZQdtw3tL+QgNgI1lQ9YezU7IYt3Tvg2bzQoxirAE0wfxCGy0LRbuUTygPT5M
	 G4Y8z4wSqqFjjYoD2T3XxwwjHBzgornXvO1JN0Xk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 10BDAF80317;
	Wed, 19 Feb 2020 21:57:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 492A9F80317; Wed, 19 Feb 2020 21:57:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id D0D78F80308
 for <alsa-devel@alsa-project.org>; Wed, 19 Feb 2020 21:57:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0D78F80308
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3225F1FB;
 Wed, 19 Feb 2020 12:57:45 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABEED3F68F;
 Wed, 19 Feb 2020 12:57:44 -0800 (PST)
Date: Wed, 19 Feb 2020 20:57:43 +0000
From: Mark Brown <broonie@kernel.org>
To: Dan Murphy <dmurphy@ti.com>
Subject: Applied "ASoC: tas2562: Add support for ISENSE and VSENSE" to the
 asoc tree
In-Reply-To: <20200219134622.22066-1-dmurphy@ti.com>
Message-Id: <applied-20200219134622.22066-1-dmurphy@ti.com>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, Mark Brown <broonie@kernel.org>
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

   ASoC: tas2562: Add support for ISENSE and VSENSE

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

From 69e53129d01317d94e8b97ec11688880106a2f97 Mon Sep 17 00:00:00 2001
From: Dan Murphy <dmurphy@ti.com>
Date: Wed, 19 Feb 2020 07:46:22 -0600
Subject: [PATCH] ASoC: tas2562: Add support for ISENSE and VSENSE

Add additional support for ISENSE and VSENSE feature for the TAS2562.
This feature monitors the output to the loud speaker attempts to
eliminate IR drop errors due to packaging.

This feature is defined in Section 8.4.5 IV Sense of the data sheet.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Link: https://lore.kernel.org/r/20200219134622.22066-1-dmurphy@ti.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/tas2562.c | 32 +++++++++++++++++++++++++++-----
 sound/soc/codecs/tas2562.h |  6 +++---
 2 files changed, 30 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 729acd874c48..b517ada7e809 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -382,18 +382,34 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component =
 					snd_soc_dapm_to_component(w->dapm);
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		dev_info(tas2562->dev, "SND_SOC_DAPM_POST_PMU\n");
+		ret = snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK,
+			TAS2562_MUTE);
+		if (ret)
+			goto end;
 		break;
 	case SND_SOC_DAPM_PRE_PMD:
-		dev_info(tas2562->dev, "SND_SOC_DAPM_PRE_PMD\n");
+		ret = snd_soc_component_update_bits(component,
+			TAS2562_PWR_CTRL,
+			TAS2562_MODE_MASK,
+			TAS2562_SHUTDOWN);
+		if (ret)
+			goto end;
 		break;
 	default:
-		break;
+		dev_err(tas2562->dev, "Not supported evevt\n");
+		return -EINVAL;
 	}
 
+end:
+	if (ret < 0)
+		return ret;
+
 	return 0;
 }
 
@@ -415,7 +431,6 @@ static const struct snd_kcontrol_new tas2562_snd_controls[] = {
 static const struct snd_soc_dapm_widget tas2562_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI1", "ASI1 Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_MUX("ASI1 Sel", SND_SOC_NOPM, 0, 0, &tas2562_asi1_mux),
-	SND_SOC_DAPM_AIF_IN("DAC IN", "Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_DAC_E("DAC", NULL, SND_SOC_NOPM, 0, 0, tas2562_dac_event,
 			   SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_SWITCH("ISENSE", TAS2562_PWR_CTRL, 3, 1, &isense_switch),
@@ -430,7 +445,7 @@ static const struct snd_soc_dapm_route tas2562_audio_map[] = {
 	{"ASI1 Sel", "Left", "ASI1"},
 	{"ASI1 Sel", "Right", "ASI1"},
 	{"ASI1 Sel", "LeftRightDiv2", "ASI1"},
-	{ "DAC", NULL, "DAC IN" },
+	{ "DAC", NULL, "ASI1 Sel" },
 	{ "OUT", NULL, "DAC" },
 	{"ISENSE", "Switch", "IMON"},
 	{"VSENSE", "Switch", "VMON"},
@@ -471,6 +486,13 @@ static struct snd_soc_dai_driver tas2562_dai[] = {
 			.rates      = SNDRV_PCM_RATE_8000_192000,
 			.formats    = TAS2562_FORMATS,
 		},
+		.capture = {
+			.stream_name    = "ASI1 Capture",
+			.channels_min   = 0,
+			.channels_max   = 2,
+			.rates		= SNDRV_PCM_RATE_8000_192000,
+			.formats	= TAS2562_FORMATS,
+		},
 		.ops = &tas2562_speaker_dai_ops,
 	},
 };
diff --git a/sound/soc/codecs/tas2562.h b/sound/soc/codecs/tas2562.h
index 62e659ab786d..6f55ebcf19ea 100644
--- a/sound/soc/codecs/tas2562.h
+++ b/sound/soc/codecs/tas2562.h
@@ -40,7 +40,7 @@
 
 #define TAS2562_RESET	BIT(0)
 
-#define TAS2562_MODE_MASK	0x3
+#define TAS2562_MODE_MASK	GENMASK(1,0)
 #define TAS2562_ACTIVE		0x0
 #define TAS2562_MUTE		0x1
 #define TAS2562_SHUTDOWN	0x2
@@ -73,8 +73,8 @@
 #define TAS2562_TDM_CFG2_RXWLEN_24B	BIT(3)
 #define TAS2562_TDM_CFG2_RXWLEN_32B	(BIT(2) | BIT(3))
 
-#define TAS2562_VSENSE_POWER_EN		BIT(2)
-#define TAS2562_ISENSE_POWER_EN		BIT(3)
+#define TAS2562_VSENSE_POWER_EN		2
+#define TAS2562_ISENSE_POWER_EN		3
 
 #define TAS2562_TDM_CFG5_VSNS_EN	BIT(6)
 #define TAS2562_TDM_CFG5_VSNS_SLOT_MASK	GENMASK(5, 0)
-- 
2.20.1

