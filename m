Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC06AD74A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Sep 2019 12:53:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DE541688;
	Mon,  9 Sep 2019 12:52:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DE541688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1568026422;
	bh=oQFNgGwSVPkDmXiIMhN/b5keuMyNHx/80RKcs3WkgHc=;
	h=From:To:In-Reply-To:Date:Cc:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=DgjAMHyrF1lvLrgrumjWbYFLvYotQ95va4qEAPNAyeKyE31izRM3tWF8SufqQq6BG
	 7XIPey2BgL0tjwLd7kQCjk+ae6GTHycqW7DmWGPHqUUlFHfoTbRkfpqtoOv84RJaOI
	 5VFey89XJy4qKCUK8y/fQnzSfKURjSbfNMxTSoNU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A9DEBF80771;
	Mon,  9 Sep 2019 12:39:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AA6CCF80323; Mon,  9 Sep 2019 12:35:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1CF1F804CF
 for <alsa-devel@alsa-project.org>; Mon,  9 Sep 2019 12:35:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1CF1F804CF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="SMbhGbPG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=zX7d5tNh9pcuT2TAK18zG/gSN+A4mBlh5BXib2G7T7M=; b=SMbhGbPGVEOR
 6ExVZ5Czk6At2nP4YJZMJsV+H+Mt4jFvFrYHtd+54QHfevbmQvMtto0pRQmM9uPHYiI2ZzJK0vBjU
 o53o61ykCw7YpZQCt/VhH4lutejnjx5rMJZsjFbs+EEsSXDJxQbIJyx8dyumKVwkdp8vTCGTYPZNG
 j5r3k=;
Received: from [148.69.85.38] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1i7GZq-0001sL-4p; Mon, 09 Sep 2019 10:07:18 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 7F4E7D02D5A; Mon,  9 Sep 2019 11:07:17 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
In-Reply-To: <20190907111650.15440-1-jmkrzyszt@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190909100717.7F4E7D02D5A@fitzroy.sirena.org.uk>
Date: Mon,  9 Sep 2019 11:07:17 +0100 (BST)
Cc: alsa-devel@alsa-project.org, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>,
 linux-omap@vger.kernel.org
Subject: [alsa-devel] Applied "ASoC: ams-delta: Take control over audio mute
	GPIO pins" to the asoc tree
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

   ASoC: ams-delta: Take control over audio mute GPIO pins

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From 73681f4f1426847b421649c6aa6c2dc303acc7c8 Mon Sep 17 00:00:00 2001
From: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Date: Sat, 7 Sep 2019 13:16:50 +0200
Subject: [PATCH] ASoC: ams-delta: Take control over audio mute GPIO pins

Since commit 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused
GPIOs"), on-board audio has appeared muted.  It has been discovered that
believed to be unused GPIO pins "hookflash1" and "hookflash2" need to be
set low for audible sound in handsfree and handset mode respectively.

According to Amstrad E3 wiki, the purpose of both pins hasn't been
clearly identified.  Original Amstrad software used to produce a high
pulse on them when the phone was taken off hook or recall was pressed.
With the current findings, we can assume the pins provide a kind of
audio mute function, separately for handset and handsfree operation
modes.

Commit 2afdb4c41d78 ("ARM: OMAP1: ams-delta: Fix audio permanently
muted") attempted to fix the issue temporarily by hogging the GPIO pin
"hookflash1" renamed to "audio_mute", however the fix occurred
incomplete as it restored audible sound only for handsfree mode.

Stop hogging that pin, rename the pins to "handsfree_mute" and
"handset_mute" respectively and implement appropriate DAPM event
callbacks for "Speaker" and "Earpiece" DAPM widgets.

Fixes: 1137ceee76ba ("ARM: OMAP1: ams-delta: Don't request unused GPIOs")
Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
Link: https://lore.kernel.org/r/20190907111650.15440-1-jmkrzyszt@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/mach-omap1/board-ams-delta.c | 10 +++++----
 sound/soc/ti/ams-delta.c              | 31 +++++++++++++++++++++++++--
 2 files changed, 35 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-omap1/board-ams-delta.c b/arch/arm/mach-omap1/board-ams-delta.c
index 36498ea1b2f3..c2affc727967 100644
--- a/arch/arm/mach-omap1/board-ams-delta.c
+++ b/arch/arm/mach-omap1/board-ams-delta.c
@@ -245,8 +245,8 @@ static struct platform_device latch2_gpio_device = {
 #define LATCH2_PIN_SCARD_CMDVCC		11
 #define LATCH2_PIN_MODEM_NRESET		12
 #define LATCH2_PIN_MODEM_CODEC		13
-#define LATCH2_PIN_AUDIO_MUTE		14
-#define LATCH2_PIN_HOOKFLASH		15
+#define LATCH2_PIN_HANDSFREE_MUTE	14
+#define LATCH2_PIN_HANDSET_MUTE		15
 
 static struct regulator_consumer_supply modem_nreset_consumers[] = {
 	REGULATOR_SUPPLY("RESET#", "serial8250.1"),
@@ -475,6 +475,10 @@ static struct gpiod_lookup_table ams_delta_audio_gpio_table = {
 			    "hook_switch", 0),
 		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_MODEM_CODEC,
 			    "modem_codec", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSFREE_MUTE,
+			    "handsfree_mute", 0),
+		GPIO_LOOKUP(LATCH2_LABEL, LATCH2_PIN_HANDSET_MUTE,
+			    "handset_mute", 0),
 		{ },
 	},
 };
@@ -589,8 +593,6 @@ static int gpiochip_match_by_label(struct gpio_chip *chip, void *data)
 static struct gpiod_hog ams_delta_gpio_hogs[] = {
 	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_KEYBRD_DATAOUT, "keybrd_dataout",
 		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
-	GPIO_HOG(LATCH2_LABEL, LATCH2_PIN_AUDIO_MUTE, "audio_mute",
-		 GPIO_ACTIVE_HIGH, GPIOD_OUT_LOW),
 	{},
 };
 
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index dee8fc70a64f..8e2fb81ad05c 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -23,14 +23,31 @@
 #include "omap-mcbsp.h"
 #include "../codecs/cx20442.h"
 
+static struct gpio_desc *handset_mute;
+static struct gpio_desc *handsfree_mute;
+
+static int ams_delta_event_handset(struct snd_soc_dapm_widget *w,
+				   struct snd_kcontrol *k, int event)
+{
+	gpiod_set_value_cansleep(handset_mute, !SND_SOC_DAPM_EVENT_ON(event));
+	return 0;
+}
+
+static int ams_delta_event_handsfree(struct snd_soc_dapm_widget *w,
+				     struct snd_kcontrol *k, int event)
+{
+	gpiod_set_value_cansleep(handsfree_mute, !SND_SOC_DAPM_EVENT_ON(event));
+	return 0;
+}
+
 /* Board specific DAPM widgets */
 static const struct snd_soc_dapm_widget ams_delta_dapm_widgets[] = {
 	/* Handset */
 	SND_SOC_DAPM_MIC("Mouthpiece", NULL),
-	SND_SOC_DAPM_HP("Earpiece", NULL),
+	SND_SOC_DAPM_HP("Earpiece", ams_delta_event_handset),
 	/* Handsfree/Speakerphone */
 	SND_SOC_DAPM_MIC("Microphone", NULL),
-	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_SPK("Speaker", ams_delta_event_handsfree),
 };
 
 /* How they are connected to codec pins */
@@ -542,6 +559,16 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 	card->dev = &pdev->dev;
 
+	handset_mute = devm_gpiod_get(card->dev, "handset_mute",
+				      GPIOD_OUT_HIGH);
+	if (IS_ERR(handset_mute))
+		return PTR_ERR(handset_mute);
+
+	handsfree_mute = devm_gpiod_get(card->dev, "handsfree_mute",
+					GPIOD_OUT_HIGH);
+	if (IS_ERR(handsfree_mute))
+		return PTR_ERR(handsfree_mute);
+
 	ret = snd_soc_register_card(card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
-- 
2.20.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
