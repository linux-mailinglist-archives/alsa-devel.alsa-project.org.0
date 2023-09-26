Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C48997AEDF2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 15:29:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0A17A9F6;
	Tue, 26 Sep 2023 15:28:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0A17A9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695734988;
	bh=+mW+ItO2ncTEv3r/3Ag6MY6WLi9b6nycGVL/4Q2gVPk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VhFpAM+o4aaQpAU0eNIFfBg7YrLr95ThUpADn92+A9Gdxc9HnTkFpPCzpNlpe6Q5y
	 mK+cVhUdino5Ltiy7nvuy+ioDoJYlrU6Y5cQFtTYNs0zRiao5BAiKzyTXycf0IboXz
	 AOptiY9HKoS2KGZLZnbJNvg+PDQtA86KCDnC7fzk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CAF8F80290; Tue, 26 Sep 2023 15:28:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B5EC3F80166;
	Tue, 26 Sep 2023 15:28:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 137FEF80552; Tue, 26 Sep 2023 15:26:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=unavailable autolearn_force=no
	version=3.4.6
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1A1F1F80290
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 15:25:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A1F1F80290
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jf6/6ZXD
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50335f6b48dso15018988e87.3
        for <alsa-devel@alsa-project.org>;
 Tue, 26 Sep 2023 06:25:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695734738; x=1696339538;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eSwx/b4rntThA+gqocWEhyhWPDC/t/D3gklrenCSnqA=;
        b=jf6/6ZXDBFEoyzQ56LVt9Kmq191BwlQOWj6mnNKbWyf0G3Yl/05VJvKCHb6xrAL8n8
         YThFuAbmAEgg+36BX5PTKymEbvw+CZxmv1Khe4KGrvas7Q413AHbs7sHgI24ImGpOWdI
         CqEEhwNHktl+CtLIU5BDyQbJn3VfUz9nAjCAvW9AQZpoXM4dKrL77f+/JB/lvYfCZd1Q
         5oXDw31HqdVXr5OOHzfmoX/TrupLbt94sTsBaQyOgNE4wRPxK2acbcn8OXVaFeYF6/ay
         veYfRLnIRsaZG0IDBOupGg5mW1L+oBjsdn/2ZFvwvkHtjhPJS1yzl+yXp1gvIPpOL4oX
         bgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695734738; x=1696339538;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eSwx/b4rntThA+gqocWEhyhWPDC/t/D3gklrenCSnqA=;
        b=f7SVN2Gu2TF6RpmztX7BDyO0LSfIRHRGygZett5z+N0jLWYuG2TwcbJF/+PwAOutZy
         iGo5uFWRItQgRvEZrE5eHtOuREBX6UfUHf5gHjPwH3oy579DeMVNWPD9amHgOyyz7u9w
         NeTK7GIt4wGRLcnTS9m0CLrUXT630wKiK9nI+N/bvU9ArhKH26gpXUowjz96oBdrPBTC
         PKQCpIctAQHg+HBfjvVg3qcJtR4YWz5sEWmSX5wQkQ1qDeiPqMr683mp6Wly3HU1TP7a
         6ZpqU4qUFAPkZgcN+oZ800iDb2T00oqIJ++8Yw6c0JyvX7mPYJoiBZt6FFzCCBdw01gf
         Bm1g==
X-Gm-Message-State: AOJu0YzeBxxqYwf2w4Prr37d6tHi+BS3CC2Kya+uGdpFX5UBzp24GDo7
	LLtx9B8ESAz5efwpTBWG9VtPgg==
X-Google-Smtp-Source: 
 AGHT+IHbc+35uDWrkEivnndc1O1s8dDLRqOAC93DpPEiyvRCo+RGrZSf7R/WlQvJuC7dgDELyQzkng==
X-Received: by 2002:a19:f508:0:b0:503:3781:ac32 with SMTP id
 j8-20020a19f508000000b005033781ac32mr8255259lfb.41.1695734738627;
        Tue, 26 Sep 2023 06:25:38 -0700 (PDT)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 eq25-20020a056512489900b0050307bf2bcdsm2221540lfb.247.2023.09.26.06.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 06:25:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 26 Sep 2023 15:25:32 +0200
Subject: [PATCH 4/5] ASoC: ti: Convert Pandora ASoC to GPIO descriptors
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-descriptors-asoc-ti-v1-4-60cf4f8adbc5@linaro.org>
References: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
In-Reply-To: <20230926-descriptors-asoc-ti-v1-0-60cf4f8adbc5@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.3
Message-ID-Hash: TOWMLI5LS3XDWN2VP3C2A3PB2QRHKO2U
X-Message-ID-Hash: TOWMLI5LS3XDWN2VP3C2A3PB2QRHKO2U
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TOWMLI5LS3XDWN2VP3C2A3PB2QRHKO2U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Pandora uses GPIO descriptors pretty much exclusively, but not
for ASoC, so let's fix it. Register the pins in a descriptor table
in the machine since the ASoC device is not using device tree.

Use static locals for the GPIO descriptors because I'm not able
to experient with better state storage on any real hardware. Others
using the Pandora can come afterwards and improve this.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm/mach-omap2/pdata-quirks.c | 10 ++++++
 sound/soc/ti/omap3pandora.c        | 63 ++++++++++++++------------------------
 2 files changed, 33 insertions(+), 40 deletions(-)

diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index c1c0121f478d..b947bacf23a3 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -275,9 +275,19 @@ static struct platform_device pandora_backlight = {
 	.id	= -1,
 };
 
+static struct gpiod_lookup_table pandora_soc_audio_gpios = {
+	.dev_id = "soc-audio",
+	.table = {
+		GPIO_LOOKUP("gpio-112-127", 6, "dac", GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP("gpio-0-15", 14, "amp", GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static void __init omap3_pandora_legacy_init(void)
 {
 	platform_device_register(&pandora_backlight);
+	gpiod_add_lookup_table(&pandora_soc_audio_gpios);
 }
 #endif /* CONFIG_ARCH_OMAP3 */
 
diff --git a/sound/soc/ti/omap3pandora.c b/sound/soc/ti/omap3pandora.c
index a287e9747c2a..fa92ed97dfe3 100644
--- a/sound/soc/ti/omap3pandora.c
+++ b/sound/soc/ti/omap3pandora.c
@@ -7,7 +7,7 @@
 
 #include <linux/clk.h>
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 #include <linux/module.h>
@@ -21,12 +21,11 @@
 
 #include "omap-mcbsp.h"
 
-#define OMAP3_PANDORA_DAC_POWER_GPIO	118
-#define OMAP3_PANDORA_AMP_POWER_GPIO	14
-
 #define PREFIX "ASoC omap3pandora: "
 
 static struct regulator *omap3pandora_dac_reg;
+static struct gpio_desc *dac_power_gpio;
+static struct gpio_desc *amp_power_gpio;
 
 static int omap3pandora_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
@@ -78,9 +77,9 @@ static int omap3pandora_dac_event(struct snd_soc_dapm_widget *w,
 			return ret;
 		}
 		mdelay(1);
-		gpio_set_value(OMAP3_PANDORA_DAC_POWER_GPIO, 1);
+		gpiod_set_value(dac_power_gpio, 1);
 	} else {
-		gpio_set_value(OMAP3_PANDORA_DAC_POWER_GPIO, 0);
+		gpiod_set_value(dac_power_gpio, 0);
 		mdelay(1);
 		regulator_disable(omap3pandora_dac_reg);
 	}
@@ -92,9 +91,9 @@ static int omap3pandora_hp_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *k, int event)
 {
 	if (SND_SOC_DAPM_EVENT_ON(event))
-		gpio_set_value(OMAP3_PANDORA_AMP_POWER_GPIO, 1);
+		gpiod_set_value(amp_power_gpio, 1);
 	else
-		gpio_set_value(OMAP3_PANDORA_AMP_POWER_GPIO, 0);
+		gpiod_set_value(amp_power_gpio, 0);
 
 	return 0;
 }
@@ -229,35 +228,10 @@ static int __init omap3pandora_soc_init(void)
 
 	pr_info("OMAP3 Pandora SoC init\n");
 
-	ret = gpio_request(OMAP3_PANDORA_DAC_POWER_GPIO, "dac_power");
-	if (ret) {
-		pr_err(PREFIX "Failed to get DAC power GPIO\n");
-		return ret;
-	}
-
-	ret = gpio_direction_output(OMAP3_PANDORA_DAC_POWER_GPIO, 0);
-	if (ret) {
-		pr_err(PREFIX "Failed to set DAC power GPIO direction\n");
-		goto fail0;
-	}
-
-	ret = gpio_request(OMAP3_PANDORA_AMP_POWER_GPIO, "amp_power");
-	if (ret) {
-		pr_err(PREFIX "Failed to get amp power GPIO\n");
-		goto fail0;
-	}
-
-	ret = gpio_direction_output(OMAP3_PANDORA_AMP_POWER_GPIO, 0);
-	if (ret) {
-		pr_err(PREFIX "Failed to set amp power GPIO direction\n");
-		goto fail1;
-	}
-
 	omap3pandora_snd_device = platform_device_alloc("soc-audio", -1);
 	if (omap3pandora_snd_device == NULL) {
 		pr_err(PREFIX "Platform device allocation failed\n");
-		ret = -ENOMEM;
-		goto fail1;
+		return -ENOMEM;
 	}
 
 	platform_set_drvdata(omap3pandora_snd_device, &snd_soc_card_omap3pandora);
@@ -268,6 +242,20 @@ static int __init omap3pandora_soc_init(void)
 		goto fail2;
 	}
 
+	dac_power_gpio = devm_gpiod_get(&omap3pandora_snd_device->dev,
+					"dac", GPIOD_OUT_LOW);
+	if (IS_ERR(dac_power_gpio)) {
+		ret = PTR_ERR(dac_power_gpio);
+		goto fail3;
+	}
+
+	amp_power_gpio = devm_gpiod_get(&omap3pandora_snd_device->dev,
+					"amp", GPIOD_OUT_LOW);
+	if (IS_ERR(amp_power_gpio)) {
+		ret = PTR_ERR(amp_power_gpio);
+		goto fail3;
+	}
+
 	omap3pandora_dac_reg = regulator_get(&omap3pandora_snd_device->dev, "vcc");
 	if (IS_ERR(omap3pandora_dac_reg)) {
 		pr_err(PREFIX "Failed to get DAC regulator from %s: %ld\n",
@@ -283,10 +271,7 @@ static int __init omap3pandora_soc_init(void)
 	platform_device_del(omap3pandora_snd_device);
 fail2:
 	platform_device_put(omap3pandora_snd_device);
-fail1:
-	gpio_free(OMAP3_PANDORA_AMP_POWER_GPIO);
-fail0:
-	gpio_free(OMAP3_PANDORA_DAC_POWER_GPIO);
+
 	return ret;
 }
 module_init(omap3pandora_soc_init);
@@ -295,8 +280,6 @@ static void __exit omap3pandora_soc_exit(void)
 {
 	regulator_put(omap3pandora_dac_reg);
 	platform_device_unregister(omap3pandora_snd_device);
-	gpio_free(OMAP3_PANDORA_AMP_POWER_GPIO);
-	gpio_free(OMAP3_PANDORA_DAC_POWER_GPIO);
 }
 module_exit(omap3pandora_soc_exit);
 

-- 
2.34.1

