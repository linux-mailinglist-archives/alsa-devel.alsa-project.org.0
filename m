Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39CD32A3
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Oct 2019 22:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53104167D;
	Thu, 10 Oct 2019 22:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53104167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1570740332;
	bh=2Mn2VrV30dQmYSdWG9zDsnJEqEpJ40opehF7ZjlrQE4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ms2OioZLuNa5lhtx6xmQGOmm2X9HmKXjBAYGvs/JmteD5ArWbb0EJuFQPp/hPqbPk
	 eZAmtQ5mNWHHnussWkNjhNR0QaVe2gMtmaJrPuIIERL23GxFaZY8eQMfiOrz4r6YXn
	 CozhE24Mn7jhcdllKxYSP1PCjMRaVUl1mZbJs7Qg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 942E1F8038F;
	Thu, 10 Oct 2019 22:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59D5AF8038F; Thu, 10 Oct 2019 22:43:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D671CF802BC
 for <alsa-devel@alsa-project.org>; Thu, 10 Oct 2019 22:43:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D671CF802BC
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MZAvp-1ieTO30iRt-00VBpT; Thu, 10 Oct 2019 22:43:02 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Sangbeom Kim <sbkim73@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Thu, 10 Oct 2019 22:30:01 +0200
Message-Id: <20191010203043.1241612-17-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191010203043.1241612-1-arnd@arndb.de>
References: <20191010202802.1132272-1-arnd@arndb.de>
 <20191010203043.1241612-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:lmK9wS9sc6nMQoBUUXcAPPuQgSQ3WrsOcrUXsclaGNLYeBYgj79
 5aHzgPRFU+EfSCkv/w11qKN7+Y8K/0guyK4AbiyvfzVoSum77d/2CHMU411Ibt3oiCw4uDV
 tr5vnswQPsH3wPeg5xBjK6DA33UwKnB41YHO47O+70JZ0MVQBhh2OO2KU+JTZvNcUdg3nQX
 aGjg0CD1N4zDhEoOfSuqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Yvd26aZbfwk=:tFDCEM6WoRw7PSv2HMlIkA
 UDyTbad1V5uW3cETaHlMreOiM37YfpqPFbnWifcy+Jm1D/JtP5L+rAMwnxrtPBPkQYdUdGehG
 Q90L4sHVWh/4NwFRsB3spxQu3ig3+yDwGn2X8uLrMPIa4Ki4oWoNYe2tFHDVTwssHG1Mz8OIt
 wHxJ7GZlTH2z4M+C9XT86IQ9h4tCFKbqCPmrt+/qsz8QGYrTmC5OUsAKyE/g8gwKyHTpdIPeo
 s0K3rbxVPM3Pb8dIcBDX+KacTaiDLb27df6M6mXHWHzeqJfVy6uuX/5DwBN9VYHaJxoTZ1+vp
 GXlSfAN7Fn6I+DWnPyYRq/P3UBKasLeG9yQ7mjRYF3U81zXECxizbkuOK8kSmls7pODeBWPmx
 PyhTKkuNn2izg+0UqD3HCjACW0QuyaRY3iSwtNfGJSBQyWT1KZNjNe8HnOcslgnCgVr0PZeAs
 gEbXIxPpJgeUGpA8jsE/BrPSv/HvWfm42rgfvRYjqY/rjLiT50Esl+ewU9sRCQGnA87hmTzR6
 TNOE74NfD7AnnMwz2jCz50hFeXKyciAVmQrouHyoLGiDOxNeWY1T4enXAsGma86NuVlAJZYtQ
 ioukCRHpu+57HJ9q2ymKlsxoIimkQUU2Fc3aLro/PzrlmUX5iJtIxDSUS/M1YoW73wQAMgEPB
 1RWvPMuABO4mJ4ZosHcopZj90hLaHlB+i0+ME5m2bD98h85eArL3qKXzyeeryWKlqOuSHpqG8
 kPF17ELCdtkl/e+vFIV6WVpmdkMIfgrcGYdvHIt3b1D5toVEZQLURB1WYEW8eXr+D5HvEwXam
 KojAvcHdq+C+FcToe0Ayf84WuA+sHRFp4uQjCkkQ9Znt98ktkvEpaO0QEnAvIR5W84z5jY80/
 iMCHQGfv/aP595ZU/naw==
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-samsung-soc@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH 17/36] ARM: s3c: h1940-audio: turn into
	platform driver
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

Avoid machine specific headers by using a gpio lookup table
combined with a platform_driver for this board.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/mach-h1940.c | 18 ++++++++
 sound/soc/samsung/h1940_uda1380.c  | 71 ++++++++++--------------------
 2 files changed, 41 insertions(+), 48 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/mach-h1940.c b/arch/arm/mach-s3c24xx/mach-h1940.c
index 74d6b68e91c7..922d53bacbdf 100644
--- a/arch/arm/mach-s3c24xx/mach-h1940.c
+++ b/arch/arm/mach-s3c24xx/mach-h1940.c
@@ -475,6 +475,22 @@ static struct gpiod_lookup_table h1940_mmc_gpio_table = {
 	},
 };
 
+static struct gpiod_lookup_table h1940_audio_gpio_table = {
+	.dev_id = "h1940-audio",
+	.table = {
+		GPIO_LOOKUP("H1940_LATCH",
+			    H1940_LATCH_AUDIO_POWER - H1940_LATCH_GPIO(0),
+			    "speaker-power", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("GPIOG", 4, "hp", GPIO_ACTIVE_HIGH),
+		{ },
+	},
+};
+
+static struct platform_device h1940_audio = {
+	.name = "h1940-audio",
+	.id   = -1,
+};
+
 static struct pwm_lookup h1940_pwm_lookup[] = {
 	PWM_LOOKUP("samsung-pwm", 0, "pwm-backlight", NULL, 36296,
 		   PWM_POLARITY_NORMAL),
@@ -652,6 +668,7 @@ static struct platform_device *h1940_devices[] __initdata = {
 	&s3c_device_ts,
 	&power_supply,
 	&h1940_battery,
+	&h1940_audio,
 };
 
 static void __init h1940_map_io(void)
@@ -691,6 +708,7 @@ static void __init h1940_init(void)
 
 	s3c24xx_fb_set_platdata(&h1940_fb_info);
 	gpiod_add_lookup_table(&h1940_mmc_gpio_table);
+	gpiod_add_lookup_table(&h1940_audio_gpio_table);
 	s3c24xx_mci_set_platdata(&h1940_mmc_cfg);
  	s3c24xx_udc_set_platdata(&h1940_udc_cfg);
 	s3c24xx_ts_set_platdata(&h1940_ts_cfg);
diff --git a/sound/soc/samsung/h1940_uda1380.c b/sound/soc/samsung/h1940_uda1380.c
index a95c34e53a2b..5fc001b4effd 100644
--- a/sound/soc/samsung/h1940_uda1380.c
+++ b/sound/soc/samsung/h1940_uda1380.c
@@ -15,9 +15,6 @@
 #include <sound/jack.h>
 
 #include "regs-iis.h"
-#include <asm/mach-types.h>
-
-#include <mach/gpio-samsung.h>
 #include "s3c24xx-i2s.h"
 
 static const unsigned int rates[] = {
@@ -31,6 +28,8 @@ static const struct snd_pcm_hw_constraint_list hw_rates = {
 	.list = rates,
 };
 
+static struct gpio_desc *gpiod_speaker_power;
+
 static struct snd_soc_jack hp_jack;
 
 static struct snd_soc_jack_pin hp_jack_pins[] = {
@@ -47,7 +46,6 @@ static struct snd_soc_jack_pin hp_jack_pins[] = {
 
 static struct snd_soc_jack_gpio hp_jack_gpios[] = {
 	{
-		.gpio			= S3C2410_GPG(4),
 		.name			= "hp-gpio",
 		.report			= SND_JACK_HEADPHONE,
 		.invert			= 1,
@@ -123,9 +121,9 @@ static int h1940_spk_power(struct snd_soc_dapm_widget *w,
 				struct snd_kcontrol *kcontrol, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(S3C_GPIO_END + 9, 1);
+		gpiod_set_value(gpiod_speaker_power, 1);
 	else
-		gpio_set_value(S3C_GPIO_END + 9, 0);
+		gpiod_set_value(gpiod_speaker_power, 0);
 
 	return 0;
 }
@@ -151,8 +149,6 @@ static const struct snd_soc_dapm_route audio_map[] = {
 	{"VINM", NULL, "Mic Jack"},
 };
 
-static struct platform_device *s3c24xx_snd_device;
-
 static int h1940_uda1380_init(struct snd_soc_pcm_runtime *rtd)
 {
 	snd_soc_card_jack_new(rtd->card, "Headphone Jack", SND_JACK_HEADPHONE,
@@ -194,55 +190,34 @@ static struct snd_soc_card h1940_asoc = {
 	.num_dapm_routes = ARRAY_SIZE(audio_map),
 };
 
-static int __init h1940_init(void)
+static int h1940_probe(struct platform_device *pdev)
 {
-	int ret;
+	struct device *dev = &pdev->dev;
 
-	if (!machine_is_h1940())
-		return -ENODEV;
+	h1940_asoc.dev = dev;
+	hp_jack_gpios[0].gpiod_dev = dev;
+	gpiod_speaker_power = devm_gpiod_get(&pdev->dev, "speaker-power",
+					     GPIOD_OUT_LOW);
 
-	/* configure some gpios */
-	ret = gpio_request(S3C_GPIO_END + 9, "speaker-power");
-	if (ret)
-		goto err_out;
-
-	ret = gpio_direction_output(S3C_GPIO_END + 9, 0);
-	if (ret)
-		goto err_gpio;
-
-	s3c24xx_snd_device = platform_device_alloc("soc-audio", -1);
-	if (!s3c24xx_snd_device) {
-		ret = -ENOMEM;
-		goto err_gpio;
+	if (IS_ERR(gpiod_speaker_power)) {
+		dev_err(dev, "Could not get gpio\n");
+		return PTR_ERR(gpiod_speaker_power);
 	}
 
-	platform_set_drvdata(s3c24xx_snd_device, &h1940_asoc);
-	ret = platform_device_add(s3c24xx_snd_device);
-
-	if (ret)
-		goto err_plat;
-
-	return 0;
-
-err_plat:
-	platform_device_put(s3c24xx_snd_device);
-err_gpio:
-	gpio_free(S3C_GPIO_END + 9);
-
-err_out:
-	return ret;
-}
-
-static void __exit h1940_exit(void)
-{
-	platform_device_unregister(s3c24xx_snd_device);
-	gpio_free(S3C_GPIO_END + 9);
+	return devm_snd_soc_register_card(dev, &h1940_asoc);
 }
 
-module_init(h1940_init);
-module_exit(h1940_exit);
+static struct platform_driver h1940_audio_driver = {
+	.driver = {
+		.name = "h1940-audio",
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = h1940_probe,
+};
+module_platform_driver(h1940_audio_driver);
 
 /* Module information */
 MODULE_AUTHOR("Arnaud Patard, Vasily Khoruzhick");
 MODULE_DESCRIPTION("ALSA SoC H1940");
 MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:h1940-audio");
-- 
2.20.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
