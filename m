Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCCD907788
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76979DE5;
	Thu, 13 Jun 2024 17:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76979DE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293926;
	bh=s6HoX2bIiyeFHVO8H4gwhbEs3zH4TzKxdBruCqDrxxM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Olnd4+wBQH3NPaDT+LNfb+1i2wOy5ENV6lV4Mxv7RHVFoJya9l01NOni7qj6PFXxI
	 USV0Z9LDpZaJHToU6TC6v6PTL3EbEiQIB1aINSHcK8612Gg/CZy533afYwi9or+a3T
	 tsRxr/t+LpPJk9TBQ4nPdj1XVqxPLvIGkGCt9hys=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6723BF8061B; Thu, 13 Jun 2024 17:50:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E729DF80621;
	Thu, 13 Jun 2024 17:50:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13B09F804FF; Sat, 25 May 2024 15:31:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F0324F8003A
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0324F8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=TJb0nvOC
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6265d48ec3so194931866b.0
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643693; x=1717248493;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfSzPmCK68b0JNLz1J5pRMBlqdzsamJqc1HopdzeGIc=;
        b=TJb0nvOCrJKWR499vgjIUBYjH8teVMjZQG+q3xSQb77sZYTCVx2czEXRNpk4X2G9rr
         vDr7bTFGWE5iG6aRiIGK2uP21GIFXMvqHJ4O7c1mAWEyvVN/dQEitCr34tsWm6NspfRm
         9GOUKTSBqr4JWrP+8VM0qYSpMYtgffu2LEDiYP/W5ANurbwIEC9BgeXufbp8qjy4eUYC
         PcR5La8WHSRVCQGlL+kTrqTq3bm69Fohddd0LA2M3ifZlSrCcCnNbLiqLy4xhr8LKywI
         YjJ+SX8j+fMSHlBEIBfZ32cgcQ6PbQYADQB3sKSzr6TeZb0K72fZHaIpp0BHMaogUbWQ
         ku+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643693; x=1717248493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TfSzPmCK68b0JNLz1J5pRMBlqdzsamJqc1HopdzeGIc=;
        b=L0J1B8InLDkccXs9j4GXEVq/oG0Wm9Ca2iit2qw58hWCGcvX7CjimWQWrsutA8ihxO
         g+iMc6AdnWxCHY/DEYHQrya50Yomjlaq3K0cP7Xh4T27veazaYbzthIvHa0P0NcIV8PK
         SIRO7aUZmLnVk223Ya4cBsiePZgm3YfL/RxQUYOeXtzeTcnA8Mofu9Gf2PdYoXkPPp2K
         Il1WzyJd3x5FglCwxD4u0dUWoOKAHJoAnFPPYLHjoSAMvLKTUjL4jTKltoTNh3cJq4EN
         h8I/KGoRLXBIR/Ltes80qukC3xy0gLDH9hh17rxKuQoE+OsrckmemqoEGf5VzBPZCxHT
         ucUA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmIUrVKFb24cDYMiLLEevGuuAWqve/onD+PznrfAlDSFXFPQ75Z9ov7stEjMjtXyoYWQgQj0SAm6yzaVUAlV660hXi8nDXSP3VxcM=
X-Gm-Message-State: AOJu0YzY14gdXiSwwzOB/5179V5UAfEWczy9KyX0mZ9QLn9LAVNNOv1v
	Rb/Uu8KVx/krXF6QQdUSGTGiPhTcHDHpn6YXhJcbagC6FZCi8GUi
X-Google-Smtp-Source: 
 AGHT+IFTulOMAAWAFYVawyA9CX1rwCDs913hmmjoXg2cqQVwzwHIm+Ktr45CM5qcWPO00OeYHrq0RQ==
X-Received: by 2002:a17:907:170c:b0:a59:efd3:9d with SMTP id
 a640c23a62f3a-a628cd3826amr199259066b.58.1716643693213;
        Sat, 25 May 2024 06:28:13 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:12 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:09 +0200
Subject: [PATCH v4 5/9] ASoC: samsung: midas_wm1811: Add GPIO-based headset
 jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-5-f488e03bd8c7@gmail.com>
References: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
In-Reply-To: <20240525-midas-wm1811-gpio-jack-v4-0-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=11849;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=s6HoX2bIiyeFHVO8H4gwhbEs3zH4TzKxdBruCqDrxxM=;
 b=zR0eYWuT/ZjNmLwhSpdGpDL+Qf5ZIm9sfaJ+OWv+1VFmeFS6SxTlvW8SFabYIV3KHjdVH9jF+
 pUJzZzuHu9oDpBEsXjSXMllbtpEGW7gnFGwPb3pD8yDxxTFScTCH0Sr
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: A27Y5LEGAU7V6QNWGXKUKMHYWUELMIE3
X-Message-ID-Hash: A27Y5LEGAU7V6QNWGXKUKMHYWUELMIE3
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:50:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A27Y5LEGAU7V6QNWGXKUKMHYWUELMIE3/>
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
Changes in v4:
- Adapted to regulators being changed to use SND_SOC_DAPM_REGULATOR_SUPPLY
Changes in v2:
- Added separate headset mic bias regulator
- Added samsung preset to threshold properties
- Replaced dev_err+return with return dev_err_probe where needed
---
 sound/soc/samsung/Kconfig        |   2 +-
 sound/soc/samsung/midas_wm1811.c | 272 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 263 insertions(+), 11 deletions(-)

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
index 96cec8e9de98..88fa9e5bc093 100644
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
 #include <sound/jack.h>
@@ -28,6 +30,9 @@
 struct midas_priv {
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
+	struct gpio_desc *gpio_headset_detect;
+	struct gpio_desc *gpio_headset_key;
+	struct iio_channel *adc_headset_detect;
 	unsigned int fll1_rate;
 
 	struct snd_soc_jack headset_jack;
@@ -44,6 +49,117 @@ static struct snd_soc_jack_pin headset_jack_pins[] = {
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
+	struct snd_soc_component *codec = data;
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(codec);
+	struct midas_priv *priv = snd_soc_card_get_drvdata(codec->card);
+	int adc, ret;
+	int jack_type = 0;
+
+	if (!gpiod_get_value_cansleep(priv->gpio_headset_detect))
+		return 0;
+
+	/* Enable headset mic bias regulator so that the ADC reading works */
+	ret = snd_soc_dapm_force_enable_pin(dapm, "headset-mic-bias");
+	if (ret < 0) {
+		pr_err("%s: Failed to enable headset mic bias regulator (%d), assuming headphones\n",
+		       __func__, ret);
+		return SND_JACK_HEADPHONE;
+	}
+	snd_soc_dapm_sync(dapm);
+
+	/* Sleep for a small amount of time to get the value to stabilize */
+	msleep(20);
+
+	ret = iio_read_channel_processed(priv->adc_headset_detect, &adc);
+	if (ret) {
+		pr_err("%s: Failed to read ADC (%d), assuming headphones\n",
+		       __func__, ret);
+		jack_type = SND_JACK_HEADPHONE;
+		goto out;
+	}
+	pr_debug("%s: ADC value is %d\n", __func__, adc);
+
+	jack_type = snd_soc_jack_get_type(&priv->headset_jack, adc);
+
+out:
+	ret = snd_soc_dapm_disable_pin(dapm, "headset-mic-bias");
+	if (ret < 0)
+		pr_err("%s: Failed to disable headset mic bias regulator (%d)\n",
+		       __func__, ret);
+	snd_soc_dapm_sync(dapm);
+
+	return jack_type;
+}
+
+static int headset_key_check(void *data)
+{
+	struct snd_soc_component *codec = data;
+	struct midas_priv *priv = snd_soc_card_get_drvdata(codec->card);
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
@@ -291,18 +407,67 @@ static int midas_late_probe(struct snd_soc_card *card)
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
+		headset_gpio[0].data = aif1_dai->component;
+		headset_gpio[0].desc = priv->gpio_headset_detect;
+
+		headset_gpio[1].data = aif1_dai->component;
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
 
@@ -411,6 +576,9 @@ static int midas_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &midas_card;
 	struct device *dev = &pdev->dev;
 	static struct snd_soc_dai_link *dai_link;
+	enum iio_chan_type channel_type;
+	u32 fourpole_threshold[2];
+	u32 button_threshold[3];
 	struct midas_priv *priv;
 	int ret, i;
 
@@ -434,6 +602,90 @@ static int midas_probe(struct platform_device *pdev)
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
2.45.1

