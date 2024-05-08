Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AFCB8BFDC6
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:54:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5E05F54;
	Wed,  8 May 2024 14:54:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5E05F54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172875;
	bh=tvVeHRzJ1CkifWQbFGlvF0EVZIoz7vxKkkPUGFuk7jM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=evxggQJKxPbpReSQK7PooN0G/ywNJbm29TqPzEO2WTrbfszMwI2YcbI2+C53zrszv
	 TsJ0G8GOi4nw1C05/yGXlYCmXrmmGF7mo3bN39dBJZZhHT5ITvjGzSqLYh5EIyaf7O
	 mX3YBUrv81GnFrIfkBbXgWzIYsf65jsAsGuagT0Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F2D4F806EC; Wed,  8 May 2024 14:51:59 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6853AF8071F;
	Wed,  8 May 2024 14:51:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75590F80570; Wed,  8 May 2024 13:01:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3F93F804F2
	for <alsa-devel@alsa-project.org>; Wed,  8 May 2024 13:01:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3F93F804F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TsZED3Um
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59ae3efbb3so438300166b.1
        for <alsa-devel@alsa-project.org>;
 Wed, 08 May 2024 04:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715166083; x=1715770883;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=poVyIDrS2b/ZXWDdTK9RH0R8g9cefahYbIBUWzC1UWE=;
        b=TsZED3UmylVpAeAm29lVSibPKDPOi/ShtY5TxoXiXMOPVamnMCfNVkp2zt7/EzH4y/
         cTI3n6w2f7n480s64ghWCAOXTB385nNXYPsd/BuMsKn77W14fWMcuahJKWkrXpYntBqJ
         jLBiaqt/4ogcay50jMiwbaG3lZADlG94k5USBjO8U4Q7PjrX+84YkEsfFf0cOjZAKSE0
         x9GwDsYRAnQipDgCqh6yMeGxkAZV46Mx1lYcz/oqjwjUIJ6mwU+WFSAQRNEpmnLoWljs
         WakF2u9s08nKgPGK7P5gWNY0Vq7YaFx7DFTagqPBq1mJ08JocBROYok7i1uASS8SCPMm
         1Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715166083; x=1715770883;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=poVyIDrS2b/ZXWDdTK9RH0R8g9cefahYbIBUWzC1UWE=;
        b=BfsOxeVpNnQZJRLq7VmdKYkDOi+dnf1b/IvyNiLCSqM9z8YEvLWjvgeL0xXl6LrQY8
         lY67vohcETMM+SMZmliGgsAsJLZyW2Hst0xC1LGX3cxnXFUxpuh7HBlv2ftLOF+NiFzj
         GSEH9m78onrgF02DIiLVz7gbPPw2+bysYaHAT7vS3ASHFDNGQLjkvzv+HqYvGAT6epSp
         uRdjnh2NQNtKx44kWIlfXsK+Zi319JgivSAHbPixo/gxTUcbUrzO7e7NNN8EFbGcooUO
         YbPzbn1/fSRixgRKLjj8e/zXs/JmzQQNYCeILmKo2ceYHKiVyh/ZEqw0RBBDzHhVVXqT
         H2mA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5PbT85wdpVZ/EMqfvG5OqAuDqX6b3cVdmbngzu6j/bg2LHiSZZ7uAXf6sZ714/YgWl6jI+hrQh72QTGf/VO/9RBVLRKLy1099sCE=
X-Gm-Message-State: AOJu0YwzAp7EGM3eTVqSFh8oaeLRR/EJjqRUG/ErMM7q6sS77KH88Zg1
	71hgVFrYL2Iym9g/OvoVZAfCHb+GFmstXQwTffaQscoiFPqWvhEq
X-Google-Smtp-Source: 
 AGHT+IErlStSHhT96t/fwnFEZHJuSLP/+wFJhG8ZdY2sMgKbw/O8rSpOa93NRwjSXZruRQb51QZNkA==
X-Received: by 2002:a50:baa4:0:b0:572:325a:8515 with SMTP id
 4fb4d7f45d1cf-5731da69864mr2264617a12.36.1715166083131;
        Wed, 08 May 2024 04:01:23 -0700 (PDT)
Received: from hex.my.domain (83.8.126.253.ipv4.supernova.orange.pl.
 [83.8.126.253])
        by smtp.gmail.com with ESMTPSA id
 m6-20020a056402510600b005726b58a436sm7455793edd.30.2024.05.08.04.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 04:01:22 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Wed, 08 May 2024 12:58:52 +0200
Subject: [PATCH v2 4/7] ASoC: samsung: midas_wm1811: Add GPIO-based headset
 jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240508-midas-wm1811-gpio-jack-v2-4-b4d36cd02c6e@gmail.com>
References: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
In-Reply-To: <20240508-midas-wm1811-gpio-jack-v2-0-b4d36cd02c6e@gmail.com>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715166076; l=12054;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=tvVeHRzJ1CkifWQbFGlvF0EVZIoz7vxKkkPUGFuk7jM=;
 b=V677zzpo8A7us92yAktmq5gJ+zyaHEVr7Zft2eFcqj3mrO1MOtjS/95kPwIwYR4ypCfWpwUHC
 uhHCuobK+CsC+PXlwA4nqSae+/5+hzhAktw2rS+3V+8q2YEHSuPSw5P
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ZVVDP6JIJHQFCT5XC37EX4TMWIKUO4GB
X-Message-ID-Hash: ZVVDP6JIJHQFCT5XC37EX4TMWIKUO4GB
X-Mailman-Approved-At: Wed, 08 May 2024 12:51:38 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZVVDP6JIJHQFCT5XC37EX4TMWIKUO4GB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Samsung devices that use the midas_wm1811 driver use a GPIO-based
method for detecting whether the headset jack is plugged in, as well as
detecting which headset buttons are pressed. There are two GPIOs:
a "headset detect" GPIO responsible for detecting jack insertion, and
a "headset key" GPIO which triggers when a button on the headset is
pressed. The plug type and the button pressed are determined based
on information from an ADC channel. The headset mic is enabled by a
headset mic bias regulator.

Add support for the GPIO-based headset jack detection mechanism,
and make it configurable from the device tree.

This implementation borrows somewhat from the aries_wm8994.c driver,
though there are a few changes to make the code cleaner, and to add
support for DT-based configuration.

Notably, a dependency on IIO is introduced, to accommodate the ADC
reading requirement.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Added separate headset mic bias regulator
- Added samsung preset to threshold properties
- Replaced dev_err+return with return dev_err_probe where needed
---
 sound/soc/samsung/Kconfig        |   2 +-
 sound/soc/samsung/midas_wm1811.c | 286 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 277 insertions(+), 11 deletions(-)

diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
index 93c2b1b08d0a..4b1ea7b2c796 100644
--- a/sound/soc/samsung/Kconfig
+++ b/sound/soc/samsung/Kconfig
@@ -140,7 +140,7 @@ config SND_SOC_SAMSUNG_ARIES_WM8994
 
 config SND_SOC_SAMSUNG_MIDAS_WM1811
 	tristate "SoC I2S Audio support for Midas boards"
-	depends on SND_SOC_SAMSUNG
+	depends on SND_SOC_SAMSUNG && IIO
 	select SND_SAMSUNG_I2S
 	select SND_SOC_WM8994
 	help
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index ab0a4804b45e..ce94550ee32e 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -7,7 +7,9 @@
 
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
+#include <linux/iio/consumer.h>
 #include <linux/mfd/wm8994/registers.h>
+#include <linux/input-event-codes.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
@@ -32,6 +34,9 @@ struct midas_priv {
 	struct regulator *reg_headset_mic_bias;
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
+	struct gpio_desc *gpio_headset_detect;
+	struct gpio_desc *gpio_headset_key;
+	struct iio_channel *adc_headset_detect;
 	unsigned int fll1_rate;
 
 	struct snd_soc_jack headset_jack;
@@ -48,6 +53,131 @@ static struct snd_soc_jack_pin headset_jack_pins[] = {
 	},
 };
 
+/*
+ * min_mv/max_mv values in this struct are set up based on DT values.
+ */
+static struct snd_soc_jack_zone headset_jack_zones[] = {
+	{ .jack_type = SND_JACK_HEADPHONE, },
+	{ .jack_type = SND_JACK_HEADSET, },
+	{ .jack_type = SND_JACK_HEADPHONE, },
+};
+
+/*
+ * This is used for manual detection in headset_key_check, we reuse the
+ * structure since it's convenient.
+ *
+ * min_mv/max_mv values in this struct are set up based on DT values.
+ */
+static struct snd_soc_jack_zone headset_key_zones[] = {
+	{ .jack_type = SND_JACK_BTN_0, },  /* Media */
+	{ .jack_type = SND_JACK_BTN_1, },  /* Volume Up */
+	{ .jack_type = SND_JACK_BTN_2, },  /* Volume Down */
+};
+
+static int headset_jack_check(void *data)
+{
+	struct midas_priv *priv = (struct midas_priv *) data;
+	int adc, jack_type, ret;
+	int bias_already_on = 0;
+
+	if (!gpiod_get_value_cansleep(priv->gpio_headset_detect))
+		return 0;
+
+	if (priv->reg_headset_mic_bias) {
+		/*
+		 * Get state of Headset Mic switch by checking the headset mic
+		 * bias regulator
+		 */
+		bias_already_on = \
+			regulator_is_enabled(priv->reg_headset_mic_bias);
+
+		/*
+		 * If it's not enabled yet, temporarily enable headset mic bias
+		 * for ADC measurement
+		 */
+		if (bias_already_on < 0)
+			pr_err("%s: Failed to get headset mic bias state: %d",
+			       __func__, ret);
+		else if (!bias_already_on) {
+			ret = regulator_enable(priv->reg_headset_mic_bias);
+			if (ret)
+				pr_err("%s: Failed to enable micbias: %d\n",
+				       __func__, ret);
+		}
+	}
+
+	/* Sleep for a small amount of time to get the value to stabilize */
+	msleep(20);
+
+	ret = iio_read_channel_processed(priv->adc_headset_detect, &adc);
+	if (ret) {
+		pr_err("%s: Failed to read ADC (%d), assuming headphones\n",
+		       __func__, ret);
+		return SND_JACK_HEADPHONE;
+	}
+	pr_debug("%s: ADC value is %d\n", __func__, adc);
+
+	jack_type = snd_soc_jack_get_type(&priv->headset_jack, adc);
+
+	/*
+	 * Revert the headset mic bias supply to its previous state
+	 * (i.e. if it was disabled before the check, disable it again)
+	 */
+	if (priv->reg_headset_mic_bias && bias_already_on == 0) {
+		ret = regulator_disable(priv->reg_headset_mic_bias);
+		if (ret)
+			pr_err("%s: Failed to disable micbias: %d\n",
+			       __func__, ret);
+	}
+
+	return jack_type;
+}
+
+static int headset_key_check(void *data)
+{
+	struct midas_priv *priv = (struct midas_priv *) data;
+	int adc, i, ret;
+
+	if (!gpiod_get_value_cansleep(priv->gpio_headset_key))
+		return 0;
+
+	/* Filter out keypresses when 4 pole jack not detected */
+	if (!(priv->headset_jack.status & SND_JACK_MICROPHONE))
+		return 0;
+
+	ret = iio_read_channel_processed(priv->adc_headset_detect, &adc);
+	if (ret) {
+		pr_err("%s: Failed to read ADC (%d), can't detect key type\n",
+		       __func__, ret);
+		return 0;
+	}
+	pr_debug("%s: ADC value is %d\n", __func__, adc);
+
+	for (i = 0; i < ARRAY_SIZE(headset_key_zones); i++) {
+		if (adc >= headset_key_zones[i].min_mv &&
+		    adc <= headset_key_zones[i].max_mv) {
+			return headset_key_zones[i].jack_type;
+		}
+	}
+
+	return 0;
+}
+
+static struct snd_soc_jack_gpio headset_gpio[] = {
+	{
+		.name = "Headset Jack",
+		.report = SND_JACK_HEADSET,
+		.debounce_time = 150,
+		.jack_status_check = headset_jack_check,
+	},
+	{
+		.name = "Headset Key",
+		.report = SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2,
+		.debounce_time = 30,
+		.jack_status_check = headset_key_check,
+	},
+};
+
 static int midas_start_fll1(struct snd_soc_pcm_runtime *rtd, unsigned int rate)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -335,18 +465,67 @@ static int midas_late_probe(struct snd_soc_card *card)
 		return ret;
 	}
 
-	ret = snd_soc_card_jack_new_pins(card, "Headset",
-					 SND_JACK_HEADSET | SND_JACK_MECHANICAL |
-					 SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 |
-					 SND_JACK_BTN_3 | SND_JACK_BTN_4 | SND_JACK_BTN_5,
-					 &priv->headset_jack,
-					 headset_jack_pins,
-					 ARRAY_SIZE(headset_jack_pins));
-	if (ret)
+	if (!priv->gpio_headset_detect) {
+		ret = snd_soc_card_jack_new_pins(card, "Headset",
+				 SND_JACK_HEADSET | SND_JACK_MECHANICAL |
+				 SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				 SND_JACK_BTN_2 | SND_JACK_BTN_3 |
+				 SND_JACK_BTN_4 | SND_JACK_BTN_5,
+				 &priv->headset_jack,
+				 headset_jack_pins,
+				 ARRAY_SIZE(headset_jack_pins));
+		if (ret)
+			return ret;
+
+		wm8958_mic_detect(aif1_dai->component, &priv->headset_jack,
+				  NULL, NULL, NULL, NULL);
+	} else {
+		/* Some devices (n8000, t310) use a GPIO to detect the jack. */
+		ret = snd_soc_card_jack_new_pins(card, "Headset",
+				SND_JACK_HEADSET | SND_JACK_BTN_0 |
+				SND_JACK_BTN_1 | SND_JACK_BTN_2,
+				&priv->headset_jack,
+				headset_jack_pins,
+				ARRAY_SIZE(headset_jack_pins));
+		if (ret) {
+			dev_err(card->dev,
+				"Failed to set up headset pins: %d\n", ret);
+			return ret;
+		}
+
+		ret = snd_soc_jack_add_zones(&priv->headset_jack,
+				ARRAY_SIZE(headset_jack_zones),
+				headset_jack_zones);
+		if (ret) {
+			dev_err(card->dev,
+				"Failed to set up headset zones: %d\n", ret);
+			return ret;
+		}
+
+		headset_gpio[0].data = priv;
+		headset_gpio[0].desc = priv->gpio_headset_detect;
+
+		headset_gpio[1].data = priv;
+		headset_gpio[1].desc = priv->gpio_headset_key;
+
+		snd_jack_set_key(priv->headset_jack.jack,
+				 SND_JACK_BTN_0, KEY_MEDIA);
+		snd_jack_set_key(priv->headset_jack.jack,
+				 SND_JACK_BTN_1, KEY_VOLUMEUP);
+		snd_jack_set_key(priv->headset_jack.jack,
+				 SND_JACK_BTN_2, KEY_VOLUMEDOWN);
+
+		ret = snd_soc_jack_add_gpios(&priv->headset_jack,
+				ARRAY_SIZE(headset_gpio),
+				headset_gpio);
+		if (ret)
+			dev_err(card->dev,
+				"Failed to set up headset jack GPIOs: %d\n",
+				ret);
+
 		return ret;
+	}
 
-	wm8958_mic_detect(aif1_dai->component, &priv->headset_jack,
-			  NULL, NULL, NULL, NULL);
 	return 0;
 }
 
@@ -453,6 +632,9 @@ static int midas_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &midas_card;
 	struct device *dev = &pdev->dev;
 	static struct snd_soc_dai_link *dai_link;
+	enum iio_chan_type channel_type;
+	u32 fourpole_threshold[2];
+	u32 button_threshold[3];
 	struct midas_priv *priv;
 	int ret, i;
 
@@ -499,6 +681,90 @@ static int midas_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->gpio_lineout_sel);
 	}
 
+	priv->gpio_headset_detect = devm_gpiod_get_optional(dev,
+				"headset-detect", GPIOD_IN);
+	if (IS_ERR(priv->gpio_headset_detect))
+		return dev_err_probe(dev, PTR_ERR(priv->gpio_headset_detect),
+				     "Failed to get headset jack detect GPIO\n");
+
+	if (priv->gpio_headset_detect) {
+		priv->adc_headset_detect = devm_iio_channel_get(dev,
+							"headset-detect");
+		if (IS_ERR(priv->adc_headset_detect))
+			return dev_err_probe(dev,
+					     PTR_ERR(priv->adc_headset_detect),
+					     "Failed to get ADC channel\n");
+
+		ret = iio_get_channel_type(priv->adc_headset_detect,
+					   &channel_type);
+		if (ret) {
+			dev_err(dev, "Failed to get ADC channel type\n");
+			return ret;
+		}
+
+		if (channel_type != IIO_VOLTAGE) {
+			dev_err(dev, "ADC channel is not voltage\n");
+			return ret;
+		}
+
+		priv->gpio_headset_key = devm_gpiod_get(dev, "headset-key",
+							GPIOD_IN);
+		if (IS_ERR(priv->gpio_headset_key))
+			return dev_err_probe(dev,
+					     PTR_ERR(priv->gpio_headset_key),
+					     "Failed to get headset key GPIO\n");
+
+		ret = of_property_read_u32_array(dev->of_node,
+				"samsung,headset-4pole-threshold-microvolt",
+				fourpole_threshold,
+				ARRAY_SIZE(fourpole_threshold));
+		if (ret) {
+			dev_err(dev, "Failed to get 4-pole jack detection threshold\n");
+			return ret;
+		}
+
+		if (fourpole_threshold[0] > fourpole_threshold[1]) {
+			dev_err(dev, "Invalid 4-pole jack detection threshold value\n");
+			return -EINVAL;
+		}
+
+		headset_jack_zones[0].max_mv = (fourpole_threshold[0]);
+		headset_jack_zones[1].min_mv = (fourpole_threshold[0] + 1);
+
+		headset_jack_zones[1].max_mv = (fourpole_threshold[1]);
+		headset_jack_zones[2].min_mv = (fourpole_threshold[1] + 1);
+
+		ret = of_property_read_u32_array(dev->of_node,
+				"samsung,headset-button-threshold-microvolt",
+				button_threshold,
+				ARRAY_SIZE(button_threshold));
+		if (ret) {
+			dev_err(dev, "Failed to get headset button detection threshold\n");
+			return ret;
+		}
+
+		if (button_threshold[0] > button_threshold[1] ||
+		    button_threshold[1] > button_threshold[2]) {
+			dev_err(dev, "Invalid headset button detection threshold value\n");
+			return -EINVAL;
+		}
+
+		for (i = 0; i < 3; i++) {
+			if (i != 0 && button_threshold[i] <= 0) {
+				dev_err(dev, "Invalid headset button detection threshold value\n");
+				return -EINVAL;
+			}
+
+			headset_key_zones[i].min_mv = button_threshold[i];
+
+			if (i == 2)
+				headset_key_zones[i].max_mv = UINT_MAX;
+			else
+				headset_key_zones[i].max_mv = \
+						(button_threshold[i+1] - 1);
+		}
+	}
+
 	ret = snd_soc_of_parse_card_name(card, "model");
 	if (ret < 0) {
 		dev_err(dev, "Card name is not specified\n");

-- 
2.45.0

