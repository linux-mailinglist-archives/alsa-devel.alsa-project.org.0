Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDEC8BFD87
	for <lists+alsa-devel@lfdr.de>; Wed,  8 May 2024 14:45:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C863DE65;
	Wed,  8 May 2024 14:45:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C863DE65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715172335;
	bh=/bENfoqr33Deh+36b873gv6Z24nDakoAKeNHo3TJKok=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BMATg7jTNZJTmevhFu0HXBs/ZLyvTa3SulzSIX1yGqtPAaKKyM+N6TiInmM/wna/o
	 uO4s5hM3RxEDSI36mCW9cj7OIRJ/Zo3EKsYTwTqsO/K8z8uGzZ09/4cX+kvj7HGzWb
	 MzfGOB7H7x/p6mdUtzAmbrlpSiNz3/gUcnjpWmTw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2264F805B5; Wed,  8 May 2024 14:44:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 40699F805B2;
	Wed,  8 May 2024 14:44:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 760FCF8028D; Fri,  3 May 2024 20:55:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4EEEBF8025D
	for <alsa-devel@alsa-project.org>; Fri,  3 May 2024 20:55:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4EEEBF8025D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YDTUQkcg
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-51f72a29f13so1668734e87.3
        for <alsa-devel@alsa-project.org>;
 Fri, 03 May 2024 11:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714762524; x=1715367324;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaLJt3CrEL7LI/neNr6VMqZn//h/KqT1cG+3ONCcvbk=;
        b=YDTUQkcgWR4ZoSNC0WFc8p9r3iaLinNeWNUbaCxefl2Bj7ih8f/1Y3n2HEPxtkCu5x
         0EgvBfQ57pDOMJIaIyg9b/GvwEJZnl6VQH5JU6awXEiqc5W3/4qdz6kkjWrdDrS1m/K0
         9ByvvzjVWd5o51q+G7FNTLXflYmvutOo1Qo2XvnP6CFB7VhgMo8keAZO4fJv5hlbNL4H
         aOdbZ1zzJ92BmgKzk3C5vd8giKdoqwZlOJ1RCSJZKdagpzrGzL/cgokGX/GBr9lVxRsr
         a2aKtpT0lO/ngUbSXOsqhTSjqDQocS1al/m+x+wlvzC6T08O1yYUMgYGVLo0dsnAITZx
         929A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714762524; x=1715367324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaLJt3CrEL7LI/neNr6VMqZn//h/KqT1cG+3ONCcvbk=;
        b=ZzknQ8VbL5Q7YTYXn8liLB5/ufRonI5YT1zX6RCDdJ4giEbN66kb2l1jsZHNPg36k8
         FHEtTDs6cWTZrA+vizp39g5AP5h4+TeWAx4BlsQnL7IIIwN3owApb4tUSyPz4ReLsnlG
         XuLJuXMsaGYHCsXcMjAk5CHgOvldtrNgK6Z1jcRCQZx+RnW8SyssLJNKV7U3l/QANRbq
         BY6T4qg6wXowwusQxySqjFgDThtRJhmbOBWkeoq2cjnX+h4C5CtT6oK3JQKSJxH72eKm
         Yi8aL2KlAAK4cUtIfmM7Cl1+MPpLG6BSr2PpTAzgPd5dKnf9bhY7Pe/YS2CRJesCwKlh
         YUuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEzqnCrQWD1toszsKX/TjfLeuHGgialMTmbcn5t3r5hIkGT0txhKbteiOJpwEu75kwu5ByUx+MDV1Pvwx9NhvemXzZxyHVztjpMGc=
X-Gm-Message-State: AOJu0YzF5bH5CWKXcrdzPiPsGJyFHqEKitRVr2pS1JekqnvSuPbPQ2xz
	OggcJDBsEZN8A7jLngP+LPaP4e9NDSU6V/zjhhsQ+PbFAz3iDkn1
X-Google-Smtp-Source: 
 AGHT+IFiuOPhU9b+r8pW/xcxVPJuQACI/MSqzs6EaP7yMC8jhNXlFywNjSHA0WrTIrj2YXK11IW4Lg==
X-Received: by 2002:ac2:4945:0:b0:51b:6ed6:af3f with SMTP id
 o5-20020ac24945000000b0051b6ed6af3fmr2238853lfi.16.1714762523689;
        Fri, 03 May 2024 11:55:23 -0700 (PDT)
Received: from hex.my.domain (83.25.185.84.ipv4.supernova.orange.pl.
 [83.25.185.84])
        by smtp.gmail.com with ESMTPSA id
 l8-20020a170906078800b00a598d3ddf8dsm1104618ejc.28.2024.05.03.11.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 May 2024 11:55:23 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 03 May 2024 20:55:12 +0200
Subject: [PATCH 2/3] ASoC: samsung: midas_wm1811: Add GPIO-based headset
 jack detection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240503-midas-wm1811-gpio-jack-v1-2-e8cddbd67cbf@gmail.com>
References: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
In-Reply-To: <20240503-midas-wm1811-gpio-jack-v1-0-e8cddbd67cbf@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714762519; l=11162;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=/bENfoqr33Deh+36b873gv6Z24nDakoAKeNHo3TJKok=;
 b=USavtv/kIxxsiKYsTqgVjRjDeGfhckh1wgRCP0r2FNybgFhfNN8FGJuvou7Qm8ApR9HNuTTug
 uoSZsAhZnZzASvIYYa7VMrlpuH3OwOhNhXhGxmdCY4aSNryTU21Nejh
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: Z3TIW7MXK7HPIDRBNHSQZIQ4R3CXZGQN
X-Message-ID-Hash: Z3TIW7MXK7HPIDRBNHSQZIQ4R3CXZGQN
X-Mailman-Approved-At: Wed, 08 May 2024 12:44:50 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z3TIW7MXK7HPIDRBNHSQZIQ4R3CXZGQN/>
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
on information from an ADC channel.

Add support for the GPIO-based headset jack detection mechanism,
and make it configurable from the device tree.

This implementation borrows somewhat from the aries_wm8994.c driver,
though there are a few changes to make the code cleaner, and to add
support for DT-based configuration.

Notably, a dependency on IIO is introduced, to accommodate the ADC
reading requirement.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 sound/soc/samsung/Kconfig        |   2 +-
 sound/soc/samsung/midas_wm1811.c | 265 +++++++++++++++++++++++++++++++++++++--
 2 files changed, 256 insertions(+), 11 deletions(-)

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
index f31244156ff6..bbffb9301cbf 100644
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
@@ -31,6 +33,9 @@ struct midas_priv {
 	struct regulator *reg_submic_bias;
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
+	struct gpio_desc *gpio_headset_detect;
+	struct gpio_desc *gpio_headset_key;
+	struct iio_channel *adc_headset_detect;
 	unsigned int fll1_rate;
 
 	struct snd_soc_jack headset_jack;
@@ -47,6 +52,109 @@ static struct snd_soc_jack_pin headset_jack_pins[] = {
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
+
+	if (!gpiod_get_value_cansleep(priv->gpio_headset_detect))
+		return 0;
+
+	/* Temporarily enable micbias for ADC measurement */
+	ret = regulator_enable(priv->reg_mic_bias);
+	if (ret)
+		pr_err("%s: Failed to enable micbias: %d\n", __func__, ret);
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
+	/* Disable micbias if the jack is not a headset */
+	if ((jack_type & SND_JACK_HEADSET) != SND_JACK_HEADSET) {
+		ret = regulator_disable(priv->reg_mic_bias);
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
@@ -315,18 +423,67 @@ static int midas_late_probe(struct snd_soc_card *card)
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
 
@@ -433,6 +590,9 @@ static int midas_probe(struct platform_device *pdev)
 	struct snd_soc_card *card = &midas_card;
 	struct device *dev = &pdev->dev;
 	static struct snd_soc_dai_link *dai_link;
+	enum iio_chan_type channel_type;
+	u32 fourpole_threshold[2];
+	u32 button_threshold[3];
 	struct midas_priv *priv;
 	int ret, i;
 
@@ -468,6 +628,91 @@ static int midas_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->gpio_lineout_sel);
 	}
 
+	priv->gpio_headset_detect = devm_gpiod_get_optional(dev,
+				"headset-detect", GPIOD_IN);
+	if (IS_ERR(priv->gpio_headset_detect)) {
+		dev_err(dev, "Failed to get headset jack detect GPIO\n");
+		return PTR_ERR(priv->gpio_headset_detect);
+	}
+
+	if (priv->gpio_headset_detect) {
+		priv->adc_headset_detect = devm_iio_channel_get(dev,
+							"headset-detect");
+		if (IS_ERR(priv->adc_headset_detect)) {
+			dev_err(dev, "Failed to get ADC channel\n");
+			return PTR_ERR(priv->adc_headset_detect);
+		}
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
+		if (IS_ERR(priv->gpio_headset_key)) {
+			dev_err(dev, "Failed to get headset key gpio\n");
+			return PTR_ERR(priv->gpio_headset_key);
+		}
+
+		ret = of_property_read_u32_array(dev->of_node,
+				"headset-4pole-threshold-microvolt",
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
+				"headset-button-threshold-microvolt",
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

