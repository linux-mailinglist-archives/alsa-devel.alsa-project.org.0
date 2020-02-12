Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C4A15B59F
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Feb 2020 01:03:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4C521693;
	Thu, 13 Feb 2020 01:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4C521693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581552232;
	bh=UvV07tqN7ppIRdm369P2Uai3sg/LiQkk9n2tm1UAk48=;
	h=Date:From:To:In-Reply-To:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=djqWl22WnWOuJgUUZT/TFN15M0cbsnLiHFeFLr4DqfG1RWCJFVfnPo1Ko1y72MpdK
	 Ii/AlCAzcw+Jl2MLqJ8tYvtQ4O0vT2E3OxqYUdV7FAavGiu6CzkjuTB7xRBvgCd2b+
	 /geGOeM32aFsoZ7plKXhut72DR38h6GfUbFk7dLM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CC7AF802E1;
	Thu, 13 Feb 2020 00:57:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94A53F802D2; Thu, 13 Feb 2020 00:57:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id E43C6F802C3
 for <alsa-devel@alsa-project.org>; Thu, 13 Feb 2020 00:57:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E43C6F802C3
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7BD2106F;
 Wed, 12 Feb 2020 15:57:30 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2BFBD3F68E;
 Wed, 12 Feb 2020 15:57:30 -0800 (PST)
Date: Wed, 12 Feb 2020 23:57:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
In-Reply-To: <20200212124608.1.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
Message-Id: <applied-20200212124608.1.I73b26b5e319de173d05823e79f5861bf1826261c@changeid>
X-Patchwork-Hint: ignore
Cc: alsa-devel@alsa-project.org, cychiang@google.com, jiaxin.yu@mediatek.com,
 tzungbi@google.com, Mark Brown <broonie@kernel.org>, dgreid@google.com
Subject: [alsa-devel] Applied "ASoC: max98357a: move control of SD_MODE to
	DAPM" to the asoc tree
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch

   ASoC: max98357a: move control of SD_MODE to DAPM

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

From 128f825aeab79ebff9679a84f49105eda85ecf2c Mon Sep 17 00:00:00 2001
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Wed, 12 Feb 2020 13:55:16 +0800
Subject: [PATCH] ASoC: max98357a: move control of SD_MODE to DAPM

Some machine may share the same I2S lines for multiple codecs. For
example, mediatek/mt8183/mt8183-da7219-max98357 shares the same lines
between max98357a and da7219.  When writing audio data through the I2S
lines, all codecs on the lines would try to generate sound if they
accepts DO line.  As a result, multiple codecs generate sound at a
time.

Moves control of SD_MODE to DAPM so that machine drivers have chances
to manipulate DAPM widget to turn on/off max98357a.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Link: https://lore.kernel.org/r/20200212124608.1.I73b26b5e319de173d05823e79f5861bf1826261c@changeid
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/max98357a.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/max98357a.c b/sound/soc/codecs/max98357a.c
index 16313b973eaa..74f20114297c 100644
--- a/sound/soc/codecs/max98357a.c
+++ b/sound/soc/codecs/max98357a.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
@@ -24,26 +25,24 @@ struct max98357a_priv {
 	unsigned int sdmode_delay;
 };
 
-static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
-		int cmd, struct snd_soc_dai *dai)
+static int max98357a_sdmode_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
 {
-	struct max98357a_priv *max98357a = snd_soc_dai_get_drvdata(dai);
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct max98357a_priv *max98357a =
+		snd_soc_component_get_drvdata(component);
 
 	if (!max98357a->sdmode)
 		return 0;
 
-	switch (cmd) {
-	case SNDRV_PCM_TRIGGER_START:
-	case SNDRV_PCM_TRIGGER_RESUME:
-	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		mdelay(max98357a->sdmode_delay);
+	if (event & SND_SOC_DAPM_POST_PMU) {
+		msleep(max98357a->sdmode_delay);
 		gpiod_set_value(max98357a->sdmode, 1);
-		break;
-	case SNDRV_PCM_TRIGGER_STOP:
-	case SNDRV_PCM_TRIGGER_SUSPEND:
-	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		dev_dbg(component->dev, "set sdmode to 1");
+	} else if (event & SND_SOC_DAPM_PRE_PMD) {
 		gpiod_set_value(max98357a->sdmode, 0);
-		break;
+		dev_dbg(component->dev, "set sdmode to 0");
 	}
 
 	return 0;
@@ -51,10 +50,14 @@ static int max98357a_daiops_trigger(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dapm_widget max98357a_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("Speaker"),
+	SND_SOC_DAPM_OUT_DRV_E("SD_MODE", SND_SOC_NOPM, 0, 0, NULL, 0,
+			max98357a_sdmode_event,
+			SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 };
 
 static const struct snd_soc_dapm_route max98357a_dapm_routes[] = {
-	{"Speaker", NULL, "HiFi Playback"},
+	{"SD_MODE", NULL, "HiFi Playback"},
+	{"Speaker", NULL, "SD_MODE"},
 };
 
 static const struct snd_soc_component_driver max98357a_component_driver = {
@@ -68,10 +71,6 @@ static const struct snd_soc_component_driver max98357a_component_driver = {
 	.non_legacy_dai_naming	= 1,
 };
 
-static const struct snd_soc_dai_ops max98357a_dai_ops = {
-	.trigger	= max98357a_daiops_trigger,
-};
-
 static struct snd_soc_dai_driver max98357a_dai_driver = {
 	.name = "HiFi",
 	.playback = {
@@ -91,7 +90,6 @@ static struct snd_soc_dai_driver max98357a_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 2,
 	},
-	.ops    = &max98357a_dai_ops,
 };
 
 static int max98357a_platform_probe(struct platform_device *pdev)
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
