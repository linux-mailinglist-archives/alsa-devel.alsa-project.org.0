Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5F7DC94B
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Oct 2019 17:47:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A51D41666;
	Fri, 18 Oct 2019 17:46:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A51D41666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571413656;
	bh=qj8izpsQopXDdBshTYcGMASCMCkOuSFx4g8+AApDL4w=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N/tywqa+RwWbZE/gnaOwfn9XdwKLVIc71E6jhqL86kTt0FqY9isGLVtMxFbuPKDjq
	 ith7VOKvgENo7maASdOHfn5FPUgzQLXfHHT2dCFlQ2IVu+2qNAMmzzG0jb9U6NziSE
	 6KUiaQQkVYXulRVN7eNXlWibLYhBUybnPkaI0dx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA8E7F805F5;
	Fri, 18 Oct 2019 17:42:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EB74F80636; Fri, 18 Oct 2019 17:42:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=PRX_BODY_13, RCVD_IN_MSPIKE_H2,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8379F80377
 for <alsa-devel@alsa-project.org>; Fri, 18 Oct 2019 17:42:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8379F80377
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1N4i7l-1hwI681tGp-011kPC; Fri, 18 Oct 2019 17:42:27 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Date: Fri, 18 Oct 2019 17:41:37 +0200
Message-Id: <20191018154201.1276638-22-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191018154052.1276506-1-arnd@arndb.de>
References: <20191018154052.1276506-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CBcymaRS0Tk88pjlgZFlVH3qNWbEbuDVF8a1b0EpQ/ufN479pdc
 WxFmWIlqotX3JQXT1UAKIf1sTu64lmAPRbAdvtGuVVyNIp/b1FBfzpc38avAXbnmvVWSxB+
 THaBpbtDkyxI+IuDBkaedReH04nEZoxLa1P0P3R2h3lrYJAy5YIQRScepXWmBKeD8hEG96c
 9hNT8Ux7/BXibSUbTSM2w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:taDEs8Sqbxw=:6tf02R9ujNhRlrPOWMgX5M
 4NJrSoZ4kukKw3v6dsAkqsUHJZ3EYRhppr/joEDDcltHnCT6Wu1jNP20Z1x6yB+EYP6Cp901O
 /4SF2XBUSU7OJWlzDhCFb5HvOlWDV4K/++Uk3RGsofv5mB7fehtDmdYceMvyKQ7iXtnryjSg5
 BcmgGsVjA5HvBzm7HI8+l2EWmC8ZjzeZCvm7gJcqGZsyEnYMTdWpbiflwdIC/WMWdcWXaYYOg
 wCthjJBoHnyaRcKNGHSPdXnHrD1LeUz/QXKaut4BDRnHe1qb8qOCukK+kCvYfuBY7fmU95Tjm
 fcOzXx4M5OGj+JeVyjHkz3EENRP8s0Qtgj3J5gWhO1WN4slu387pjRreP5hz9L4eNXnOqisH4
 5fk9jdOEnoFiw//R7isRZ6Xy4cTTH6m6hZJoofa7SBfUx2QG2awqU2q6OpOAEUqXtjfObf3GL
 chBXSFBb918kuH8ucKrWhVOVeJwQcPubIC5WXHgBZKUotyhYejQVVah76vFWVoY5K71BeUzgA
 MHzLSjtj4rm6z9aLykxp54+pu2pAyEiFkBGwqp8OPN5q0vmuD1iXogaOeYP3yUr+GV+ckRHn3
 mDvFLEU5OQsLksZ/FJA08pacmcmeICKeetZfJ6QFYmBHZVBrd+4JQNiGKUHs9jPbP6PRZOsrX
 tWHoabJj4Fa0cKwimfwZKxePXyPUaknxGYCFQN9V141zOvNApDmUEKyxqVGlYW5gGDzKzS6s6
 rHpXtRc/SCJ07eyBNJ8Y71YNvS4+lBYz9vnkS0Fp1PpgQI3Rgi3R4fc1TVm0dYPgaOhdmOEaP
 h4PVUuJBtOh+8AfWczbBT9zD+imhrJceTz3Rsf9rFgchfYvrEPS0u6BQFS/STC/iegBeGM9zg
 2+2fHfghINeIdxqAA6iA==
Cc: alsa-devel@alsa-project.org, Arnd Bergmann <arnd@arndb.de>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 22/46] ARM: pxa: eseries: use gpio lookup for
	audio
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The three eseries machines have very similar drivers for audio, all
using the mach/eseries-gpio.h header for finding the gpio numbers.

Change these to use gpio descriptors to avoid the header file
dependency.

I convert the _OFF gpio numbers into GPIO_ACTIVE_LOW ones for
consistency here.

Cc: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-pxa/eseries.c | 32 ++++++++++++++++++++++++++++++++
 sound/soc/pxa/e740_wm9705.c | 35 ++++++++++++++++++-----------------
 sound/soc/pxa/e750_wm9705.c | 31 ++++++++++++++-----------------
 sound/soc/pxa/e800_wm9712.c | 31 ++++++++++++++-----------------
 4 files changed, 78 insertions(+), 51 deletions(-)

diff --git a/arch/arm/mach-pxa/eseries.c b/arch/arm/mach-pxa/eseries.c
index d8a87ff66675..8399ce405093 100644
--- a/arch/arm/mach-pxa/eseries.c
+++ b/arch/arm/mach-pxa/eseries.c
@@ -24,6 +24,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/usb/gpio_vbus.h>
 #include <linux/memblock.h>
+#include <linux/gpio/machine.h>
 
 #include <video/w100fb.h>
 
@@ -515,6 +516,16 @@ static struct platform_device e740_audio_device = {
 	.id		= -1,
 };
 
+static struct gpiod_lookup_table e740_audio_gpio_table = {
+	.dev_id = "e740-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E740_WM9705_nAVDD2, "Audio power",  GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E740_AMP_ON, "Output amp",  GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E740_MIC_ON, "Mic amp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 /* ----------------------------------------------------------------------- */
 
 static struct platform_device *e740_devices[] __initdata = {
@@ -534,6 +545,7 @@ static void __init e740_init(void)
 	clk_add_alias("CLK_CK48M", e740_t7l66xb_device.name,
 			"UDCCLK", &pxa25x_device_udc.dev),
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e740_audio_gpio_table);
 	platform_add_devices(ARRAY_AND_SIZE(e740_devices));
 	pxa_set_ac97_info(NULL);
 	pxa_set_ficp_info(&e7xx_ficp_platform_data);
@@ -710,6 +722,15 @@ static struct platform_device e750_tc6393xb_device = {
 	.resource      = eseries_tmio_resources,
 };
 
+static struct gpiod_lookup_table e750_audio_gpio_table = {
+	.dev_id = "e750-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E750_HP_AMP_OFF, "Output amp",  GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E750_SPK_AMP_OFF, "Mic amp", GPIO_ACTIVE_LOW),
+		{ },
+	},
+};
+
 static struct platform_device e750_audio_device = {
 	.name		= "e750-audio",
 	.id		= -1,
@@ -733,6 +754,7 @@ static void __init e750_init(void)
 	clk_add_alias("CLK_CK3P6MI", e750_tc6393xb_device.name,
 			"GPIO11_CLK", NULL),
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e750_audio_gpio_table);
 	platform_add_devices(ARRAY_AND_SIZE(e750_devices));
 	pxa_set_ac97_info(NULL);
 	pxa_set_ficp_info(&e7xx_ficp_platform_data);
@@ -926,6 +948,15 @@ static struct platform_device e800_tc6393xb_device = {
 	.resource      = eseries_tmio_resources,
 };
 
+static struct gpiod_lookup_table e800_audio_gpio_table = {
+	.dev_id = "e800-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E800_HP_AMP_OFF, "Output amp",  GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP("gpio-pxa",  GPIO_E800_SPK_AMP_ON, "Mic amp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
 static struct platform_device e800_audio_device = {
 	.name		= "e800-audio",
 	.id		= -1,
@@ -949,6 +980,7 @@ static void __init e800_init(void)
 	clk_add_alias("CLK_CK3P6MI", e800_tc6393xb_device.name,
 			"GPIO11_CLK", NULL),
 	eseries_get_tmio_gpios();
+	gpiod_add_lookup_table(&e800_audio_gpio_table);
 	platform_add_devices(ARRAY_AND_SIZE(e800_devices));
 	pxa_set_ac97_info(NULL);
 }
diff --git a/sound/soc/pxa/e740_wm9705.c b/sound/soc/pxa/e740_wm9705.c
index f922be7e0016..4e0e9b778d4c 100644
--- a/sound/soc/pxa/e740_wm9705.c
+++ b/sound/soc/pxa/e740_wm9705.c
@@ -7,17 +7,19 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/eseries-gpio.h>
 
 #include <asm/mach-types.h>
 
+static struct gpio_desc *gpiod_output_amp, *gpiod_input_amp;
+static struct gpio_desc *gpiod_audio_power;
+
 #define E740_AUDIO_OUT 1
 #define E740_AUDIO_IN  2
 
@@ -25,9 +27,9 @@ static int e740_audio_power;
 
 static void e740_sync_audio_power(int status)
 {
-	gpio_set_value(GPIO_E740_WM9705_nAVDD2, !status);
-	gpio_set_value(GPIO_E740_AMP_ON, (status & E740_AUDIO_OUT) ? 1 : 0);
-	gpio_set_value(GPIO_E740_MIC_ON, (status & E740_AUDIO_IN) ? 1 : 0);
+	gpiod_set_value(gpiod_audio_power, !status);
+	gpiod_set_value(gpiod_output_amp, (status & E740_AUDIO_OUT) ? 1 : 0);
+	gpiod_set_value(gpiod_input_amp, (status & E740_AUDIO_IN) ? 1 : 0);
 }
 
 static int e740_mic_amp_event(struct snd_soc_dapm_widget *w,
@@ -116,36 +118,35 @@ static struct snd_soc_card e740 = {
 	.fully_routed = true,
 };
 
-static struct gpio e740_audio_gpios[] = {
-	{ GPIO_E740_MIC_ON, GPIOF_OUT_INIT_LOW, "Mic amp" },
-	{ GPIO_E740_AMP_ON, GPIOF_OUT_INIT_LOW, "Output amp" },
-	{ GPIO_E740_WM9705_nAVDD2, GPIOF_OUT_INIT_HIGH, "Audio power" },
-};
-
 static int e740_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &e740;
 	int ret;
 
-	ret = gpio_request_array(e740_audio_gpios,
-				 ARRAY_SIZE(e740_audio_gpios));
+	gpiod_input_amp  = devm_gpiod_get(&pdev->dev, "Mic amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_input_amp);
+	if (ret)
+		return ret;
+	gpiod_output_amp  = devm_gpiod_get(&pdev->dev, "Output amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_output_amp);
+	if (ret)
+		return ret;
+	gpiod_audio_power = devm_gpiod_get(&pdev->dev, "Audio power", GPIOD_OUT_HIGH);
+	ret = PTR_ERR_OR_ZERO(gpiod_audio_power);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free_array(e740_audio_gpios, ARRAY_SIZE(e740_audio_gpios));
-	}
 	return ret;
 }
 
 static int e740_remove(struct platform_device *pdev)
 {
-	gpio_free_array(e740_audio_gpios, ARRAY_SIZE(e740_audio_gpios));
 	return 0;
 }
 
diff --git a/sound/soc/pxa/e750_wm9705.c b/sound/soc/pxa/e750_wm9705.c
index 308828cd736b..7a1e0d8bfd11 100644
--- a/sound/soc/pxa/e750_wm9705.c
+++ b/sound/soc/pxa/e750_wm9705.c
@@ -7,24 +7,25 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
 
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/eseries-gpio.h>
 
 #include <asm/mach-types.h>
 
+static struct gpio_desc *gpiod_spk_amp, *gpiod_hp_amp;
+
 static int e750_spk_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E750_SPK_AMP_OFF, 0);
+		gpiod_set_value(gpiod_spk_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E750_SPK_AMP_OFF, 1);
+		gpiod_set_value(gpiod_spk_amp, 0);
 
 	return 0;
 }
@@ -33,9 +34,9 @@ static int e750_hp_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E750_HP_AMP_OFF, 0);
+		gpiod_set_value(gpiod_hp_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E750_HP_AMP_OFF, 1);
+		gpiod_set_value(gpiod_hp_amp, 0);
 
 	return 0;
 }
@@ -100,35 +101,31 @@ static struct snd_soc_card e750 = {
 	.fully_routed = true,
 };
 
-static struct gpio e750_audio_gpios[] = {
-	{ GPIO_E750_HP_AMP_OFF, GPIOF_OUT_INIT_HIGH, "Headphone amp" },
-	{ GPIO_E750_SPK_AMP_OFF, GPIOF_OUT_INIT_HIGH, "Speaker amp" },
-};
-
 static int e750_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &e750;
 	int ret;
 
-	ret = gpio_request_array(e750_audio_gpios,
-				 ARRAY_SIZE(e750_audio_gpios));
+	gpiod_hp_amp  = devm_gpiod_get(&pdev->dev, "Headphone amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_hp_amp);
+	if (ret)
+		return ret;
+	gpiod_spk_amp  = devm_gpiod_get(&pdev->dev, "Speaker amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_spk_amp);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free_array(e750_audio_gpios, ARRAY_SIZE(e750_audio_gpios));
-	}
 	return ret;
 }
 
 static int e750_remove(struct platform_device *pdev)
 {
-	gpio_free_array(e750_audio_gpios, ARRAY_SIZE(e750_audio_gpios));
 	return 0;
 }
 
diff --git a/sound/soc/pxa/e800_wm9712.c b/sound/soc/pxa/e800_wm9712.c
index d74fcceef687..a39c494127cf 100644
--- a/sound/soc/pxa/e800_wm9712.c
+++ b/sound/soc/pxa/e800_wm9712.c
@@ -7,7 +7,7 @@
 
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
@@ -15,15 +15,16 @@
 
 #include <asm/mach-types.h>
 #include <linux/platform_data/asoc-pxa.h>
-#include <mach/eseries-gpio.h>
+
+static struct gpio_desc *gpiod_spk_amp, *gpiod_hp_amp;
 
 static int e800_spk_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E800_SPK_AMP_ON, 1);
+		gpiod_set_value(gpiod_spk_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E800_SPK_AMP_ON, 0);
+		gpiod_set_value(gpiod_spk_amp, 0);
 
 	return 0;
 }
@@ -32,9 +33,9 @@ static int e800_hp_amp_event(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (event & SND_SOC_DAPM_PRE_PMU)
-		gpio_set_value(GPIO_E800_HP_AMP_OFF, 0);
+		gpiod_set_value(gpiod_hp_amp, 1);
 	else if (event & SND_SOC_DAPM_POST_PMD)
-		gpio_set_value(GPIO_E800_HP_AMP_OFF, 1);
+		gpiod_set_value(gpiod_hp_amp, 0);
 
 	return 0;
 }
@@ -100,35 +101,31 @@ static struct snd_soc_card e800 = {
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
 };
 
-static struct gpio e800_audio_gpios[] = {
-	{ GPIO_E800_SPK_AMP_ON, GPIOF_OUT_INIT_HIGH, "Headphone amp" },
-	{ GPIO_E800_HP_AMP_OFF, GPIOF_OUT_INIT_HIGH, "Speaker amp" },
-};
-
 static int e800_probe(struct platform_device *pdev)
 {
 	struct snd_soc_card *card = &e800;
 	int ret;
 
-	ret = gpio_request_array(e800_audio_gpios,
-				 ARRAY_SIZE(e800_audio_gpios));
+	gpiod_hp_amp  = devm_gpiod_get(&pdev->dev, "Headphone amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_hp_amp);
+	if (ret)
+		return ret;
+	gpiod_spk_amp  = devm_gpiod_get(&pdev->dev, "Speaker amp", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(gpiod_spk_amp);
 	if (ret)
 		return ret;
 
 	card->dev = &pdev->dev;
 
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n",
 			ret);
-		gpio_free_array(e800_audio_gpios, ARRAY_SIZE(e800_audio_gpios));
-	}
 	return ret;
 }
 
 static int e800_remove(struct platform_device *pdev)
 {
-	gpio_free_array(e800_audio_gpios, ARRAY_SIZE(e800_audio_gpios));
 	return 0;
 }
 
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
