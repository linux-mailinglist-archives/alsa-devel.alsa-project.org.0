Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F9C23E048
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Aug 2020 20:26:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEDBC82E;
	Thu,  6 Aug 2020 20:25:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEDBC82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596738373;
	bh=FHA57+AhyuwFu169uBnI07bF7rlOue//dBxLIpuhG/A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rop8LhUdeVHKmiXF5LI1cp8658qYUwXv4LM6Q2bolbl9cxgeJ0Xc/YFLXFKJAR6UE
	 ncvZyGQdz1N+rO9WWRJxmTfJRUmiIc24toOzcOq3uk9+k0ap5OVR/gxxEqO3prEHeD
	 IiVPIPyQTRxXpPVryZW8/iQNdYOy4+3yJu4SOeek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 261E6F802DD;
	Thu,  6 Aug 2020 20:23:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 60775F802DD; Thu,  6 Aug 2020 20:23:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: ***
X-Spam-Status: No, score=3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID, DKIM_VALID_AU, RCVD_IN_SBL_CSS, SPF_HELO_NONE, SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53673F80254
 for <alsa-devel@alsa-project.org>; Thu,  6 Aug 2020 20:23:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53673F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Rs2aObNQ"
Received: from localhost.localdomain (unknown [194.230.155.117])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8519E22DA9;
 Thu,  6 Aug 2020 18:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596738197;
 bh=FHA57+AhyuwFu169uBnI07bF7rlOue//dBxLIpuhG/A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rs2aObNQJlMWa6LY3B2iZMvRGGVQzv+LIW8Q3ctxhJwbIKpYxW8YTZiIi/TmOEbMv
 XVq8gvLS3NSvtcKuryMfVNyLvpf1QeUiW6aDppOAiigzQwabRPeTWoDJWESmkdcnzP
 pUyTm3JhvQa4kVYoiGsedS7Or576pd5nhRtdZSEI=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 25/41] ASoC: samsung: neo1973: turn into platform driver
Date: Thu,  6 Aug 2020 20:20:42 +0200
Message-Id: <20200806182059.2431-25-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200806181932.2253-1-krzk@kernel.org>
References: <20200806181932.2253-1-krzk@kernel.org>
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Sangbeom Kim <sbkim73@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel@lists.infradead.org
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

From: Arnd Bergmann <arnd@arndb.de>

Avoid machine specific headers by using a gpio lookup table
combined with a platform_driver for this board.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/mach-s3c24xx/mach-gta02.c | 17 ++++++
 sound/soc/samsung/neo1973_wm8753.c | 85 +++++++++---------------------
 2 files changed, 43 insertions(+), 59 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-gta02.c b/arch/arm/mach-s3c24xx/mach-gta02.c
index 346a158f9960..46a80fae7056 100644
--- a/arch/arm/mach-s3c24xx/mach-gta02.c
+++ b/arch/arm/mach-s3c24xx/mach-gta02.c
@@ -15,6 +15,7 @@
 #include <linux/delay.h>
 #include <linux/timer.h>
 #include <linux/init.h>
+#include <linux/gpio/machine.h>
 #include <linux/gpio.h>
 #include <linux/gpio_keys.h>
 #include <linux/workqueue.h>
@@ -472,6 +473,20 @@ static struct platform_device gta02_buttons_device = {
 	},
 };
 
+static struct gpiod_lookup_table gta02_audio_gpio_table = {
+	.dev_id = "neo1973-audio",
+	.table = {
+		GPIO_LOOKUP("GPIOJ", 2, "amp-shut", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOJ", 1, "hp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct platform_device gta02_audio = {
+	.name = "neo1973-audio",
+	.id = -1,
+};
+
 static void __init gta02_map_io(void)
 {
 	s3c24xx_init_io(gta02_iodesc, ARRAY_SIZE(gta02_iodesc));
@@ -496,6 +511,7 @@ static struct platform_device *gta02_devices[] __initdata = {
 	&gta02_buttons_device,
 	&s3c_device_adc,
 	&s3c_device_ts,
+	&gta02_audio,
 };
 
 static void gta02_poweroff(void)
@@ -522,6 +538,7 @@ static void __init gta02_machine_init(void)
 
 	i2c_register_board_info(0, gta02_i2c_devs, ARRAY_SIZE(gta02_i2c_devs));
 
+	gpiod_add_lookup_table(&gta02_audio_gpio_table);
 	platform_add_devices(gta02_devices, ARRAY_SIZE(gta02_devices));
 	pm_power_off = gta02_poweroff;
 
diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
index 54317e0f68f8..9266070e0181 100644
--- a/sound/soc/samsung/neo1973_wm8753.c
+++ b/sound/soc/samsung/neo1973_wm8753.c
@@ -11,14 +11,11 @@
 
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/soc.h>
 
-#include <mach/gpio-samsung.h>
-#include <asm/mach-types.h>
 #include "regs-iis.h"
-
 #include "../codecs/wm8753.h"
 #include "s3c24xx-i2s.h"
 
@@ -166,6 +163,7 @@ static struct snd_soc_ops neo1973_voice_ops = {
 	.hw_free = neo1973_voice_hw_free,
 };
 
+static struct gpio_desc *gpiod_hp_in, *gpiod_amp_shut;
 static int gta02_speaker_enabled;
 
 static int lm4853_set_spk(struct snd_kcontrol *kcontrol,
@@ -173,7 +171,7 @@ static int lm4853_set_spk(struct snd_kcontrol *kcontrol,
 {
 	gta02_speaker_enabled = ucontrol->value.integer.value[0];
 
-	gpio_set_value(S3C2410_GPJ(2), !gta02_speaker_enabled);
+	gpiod_set_value(gpiod_hp_in, !gta02_speaker_enabled);
 
 	return 0;
 }
@@ -188,7 +186,7 @@ static int lm4853_get_spk(struct snd_kcontrol *kcontrol,
 static int lm4853_event(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *k, int event)
 {
-	gpio_set_value(S3C2410_GPJ(1), SND_SOC_DAPM_EVENT_OFF(event));
+	gpiod_set_value(gpiod_amp_shut, SND_SOC_DAPM_EVENT_OFF(event));
 
 	return 0;
 }
@@ -308,13 +306,8 @@ static struct snd_soc_codec_conf neo1973_codec_conf[] = {
 	},
 };
 
-static const struct gpio neo1973_gta02_gpios[] = {
-	{ S3C2410_GPJ(2), GPIOF_OUT_INIT_HIGH, "GTA02_HP_IN" },
-	{ S3C2410_GPJ(1), GPIOF_OUT_INIT_HIGH, "GTA02_AMP_SHUT" },
-};
-
 static struct snd_soc_card neo1973 = {
-	.name = "neo1973",
+	.name = "neo1973gta02",
 	.owner = THIS_MODULE,
 	.dai_link = neo1973_dai,
 	.num_links = ARRAY_SIZE(neo1973_dai),
@@ -332,62 +325,36 @@ static struct snd_soc_card neo1973 = {
 	.fully_routed = true,
 };
 
-static struct platform_device *neo1973_snd_device;
-
-static int __init neo1973_init(void)
+static int neo1973_probe(struct platform_device *pdev)
 {
-	int ret;
-
-	if (!machine_is_neo1973_gta02())
-		return -ENODEV;
+	struct device *dev = &pdev->dev;
 
-	if (machine_is_neo1973_gta02()) {
-		neo1973.name = "neo1973gta02";
-		neo1973.num_aux_devs = 1;
-
-		ret = gpio_request_array(neo1973_gta02_gpios,
-				ARRAY_SIZE(neo1973_gta02_gpios));
-		if (ret)
-			return ret;
+	gpiod_hp_in = devm_gpiod_get(dev, "hp", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_hp_in)) {
+		dev_err(dev, "missing gpio %s\n", "hp");
+		return PTR_ERR(gpiod_hp_in);
 	}
-
-	neo1973_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!neo1973_snd_device) {
-		ret = -ENOMEM;
-		goto err_gpio_free;
+	gpiod_amp_shut = devm_gpiod_get(dev, "amp-shut", GPIOD_OUT_HIGH);
+	if (IS_ERR(gpiod_amp_shut)) {
+		dev_err(dev, "missing gpio %s\n", "amp-shut");
+		return PTR_ERR(gpiod_amp_shut);
 	}
 
-	platform_set_drvdata(neo1973_snd_device, &neo1973);
-	ret = platform_device_add(neo1973_snd_device);
-
-	if (ret)
-		goto err_put_device;
-
-	return 0;
-
-err_put_device:
-	platform_device_put(neo1973_snd_device);
-err_gpio_free:
-	if (machine_is_neo1973_gta02()) {
-		gpio_free_array(neo1973_gta02_gpios,
-				ARRAY_SIZE(neo1973_gta02_gpios));
-	}
-	return ret;
+	neo1973.dev = dev;
+	return devm_snd_soc_register_card(dev, &neo1973);
 }
-module_init(neo1973_init);
-
-static void __exit neo1973_exit(void)
-{
-	platform_device_unregister(neo1973_snd_device);
 
-	if (machine_is_neo1973_gta02()) {
-		gpio_free_array(neo1973_gta02_gpios,
-				ARRAY_SIZE(neo1973_gta02_gpios));
-	}
-}
-module_exit(neo1973_exit);
+struct platform_driver neo1973_audio = {
+	.driver = {
+		.name = "neo1973-audio",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = neo1973_probe,
+};
+module_platform_driver(neo1973_audio);
 
 /* Module information */
 MODULE_AUTHOR("Graeme Gregory, graeme@openmoko.org, www.openmoko.org");
 MODULE_DESCRIPTION("ALSA SoC WM8753 Neo1973 and Frerunner");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:neo1973-audio");
-- 
2.17.1

