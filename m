Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B351C907785
	for <lists+alsa-devel@lfdr.de>; Thu, 13 Jun 2024 17:51:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1ED87E68;
	Thu, 13 Jun 2024 17:51:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1ED87E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718293908;
	bh=2vAqa2DIEcQwtApC4VQYYpht9ERjbrcStYfppA44U0Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aRifObjz5waSeJL02yS3GIv/trsBQDm0QS/gbo0npU+DIrD9dK0NcUSq9DcFik+lG
	 VXNR17CwSHexlscLOp5wEfm54UbTvEmnZixZfpqctuKhKVtN0Kp5PpJmGF7ZjyKLIX
	 nKJiLUkiAynt6MukLyQXU0pToBGxPsjmvYhmSK9s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8291EF805F3; Thu, 13 Jun 2024 17:50:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45AF0F805F6;
	Thu, 13 Jun 2024 17:50:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 482FFF8051E; Sat, 25 May 2024 15:31:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AF48F8026A
	for <alsa-devel@alsa-project.org>; Sat, 25 May 2024 15:28:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AF48F8026A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DzwrP1su
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a6269885572so291990166b.1
        for <alsa-devel@alsa-project.org>;
 Sat, 25 May 2024 06:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716643691; x=1717248491;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cyhcJDHjI0opVSCgJiHt0Zs5JH59m1ORkw4OcBCxAuU=;
        b=DzwrP1suog22B6TU1WDjnFHN5dAjJ/BIO27eevc8EdXJ1RRyEFw78RHG6bDFitSKHv
         iz3Et9h810OngjdftiXEAQyuHZIg5qOLqakQB8vk7WCi7f4YtH8qQZjqZpfGojB441Iz
         0u+Nrmay/B4ZS+BqSEMmGYXfbxCTqZLr2ivjWJmlqhCn+iV96KjAe5Tjs5Jz7fIcPOIo
         2oNbgmzU+alKHX8yEfpgJIKUhOnaSxqPrGLbxZVUd2nhKuw+E+ES71GP665SkB1jpb+o
         fbhKE0MQ3WkMugIGr4Kc4Al+bSAb/eZyYSxxQUrtjth25uIR0XTeSHId+IPdTIXSbQHj
         tyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716643691; x=1717248491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cyhcJDHjI0opVSCgJiHt0Zs5JH59m1ORkw4OcBCxAuU=;
        b=VrYR65Q3R/pUcil4YKlA6HEQRZBhNaCz1AeT4Am5H6/OHYT/0lyA3lMxmdK0Y0+Wu3
         eq6jYxDaDXIW2LoeTUbdyQIEGjIRremX1g8g/CzizXYiXcgP0AyFZRCwKmXq9cpxF8h6
         VOmPsGT1JEklqwUrxOuGRRFpsvVJSwTy23y9q65+C6yrsB7Zl4X/whuvq5zmXplqZXaj
         Wz1s3O4rb2c67ED4RUbpJiEsOAVT0rha68srUGNyhxLMvI2cSjjK2cMzv7Ie6n2fgThq
         c6qCUJK6T0IzcUXGYMyf3zGWJS4kdT3n5y+YFmzkXOiV8JjJY8MAkacOu/1HuD0Sdu6M
         cwlw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVe7S9LaumDP0j7s/P/uA1W9XyP2djKfcvxZMleYdZIk5MGyiy1CQGGn+6poM7EL0R/ZOSAS3XMH1ZXrY4IGe4sUO4pMiepKBISHsA=
X-Gm-Message-State: AOJu0Yx69TtW/sXZlqRNR2REGQYkxDx9NjSoV+gUuU3pMdWDLujVuogG
	gMaJJJWpn1lrVXIQ/qCRW+/fUx4NCXBmfo3qnKILOqPLhbwdtQ6X
X-Google-Smtp-Source: 
 AGHT+IEPpi36yJB2n9ipEwdR4D1zjMs1IzS01+2Vzze66vzbl5+wC4+jiyDQmWyXGxZdTp2Ak5ZhWA==
X-Received: by 2002:a17:906:8443:b0:a61:7f85:e31c with SMTP id
 a640c23a62f3a-a6261f91a42mr367814466b.12.1716643690633;
        Sat, 25 May 2024 06:28:10 -0700 (PDT)
Received: from hex.my.domain (83.8.128.191.ipv4.supernova.orange.pl.
 [83.8.128.191])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cda46e1sm251842566b.196.2024.05.25.06.28.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 06:28:10 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Sat, 25 May 2024 15:28:07 +0200
Subject: [PATCH v4 3/9] ASoC: samsung: midas_wm1811: Use
 SND_SOC_DAPM_REGULATOR_SUPPLY for bias regulators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240525-midas-wm1811-gpio-jack-v4-3-f488e03bd8c7@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716643685; l=4146;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=2vAqa2DIEcQwtApC4VQYYpht9ERjbrcStYfppA44U0Y=;
 b=aPD49g9qEDnvFgYpa5MvgqUaV0Ias6Acg1pgU8JR9ggAbockzhyIz4uoEhAXWApuS8Qs+03bm
 7D7hw3nfGozDATDmsFZ8F3NJgXmuf/Xt38YOWi7jNvh2bMfPkTYpKDb
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=
X-MailFrom: aweber.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: 3ECRSPM3IDVKHIBHPWWCLORU4QCPJCCQ
X-Message-ID-Hash: 3ECRSPM3IDVKHIBHPWWCLORU4QCPJCCQ
X-Mailman-Approved-At: Thu, 13 Jun 2024 15:50:36 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3ECRSPM3IDVKHIBHPWWCLORU4QCPJCCQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Instead of using a custom function with the SND_SOC_DAPM_MIC widget,
split out the main mic/sub mic bias regulators into a separate widget
using SND_SOC_DAPM_REGULATOR_SUPPLY, and connect them via a routing.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v4:
- Added this commit
---
 sound/soc/samsung/midas_wm1811.c | 62 +++++++++-------------------------------
 1 file changed, 13 insertions(+), 49 deletions(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..20b274734487 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -10,7 +10,6 @@
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/regulator/consumer.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
@@ -27,8 +26,6 @@
 #define DEFAULT_FLL1_RATE 11289600U
 
 struct midas_priv {
-	struct regulator *reg_mic_bias;
-	struct regulator *reg_submic_bias;
 	struct gpio_desc *gpio_fm_sel;
 	struct gpio_desc *gpio_lineout_sel;
 	unsigned int fll1_rate;
@@ -169,38 +166,6 @@ static int midas_ext_spkmode(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
-static int midas_mic_bias(struct snd_soc_dapm_widget *w,
-			  struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_card *card = w->dapm->card;
-	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		return regulator_enable(priv->reg_mic_bias);
-	case SND_SOC_DAPM_POST_PMD:
-		return regulator_disable(priv->reg_mic_bias);
-	}
-
-	return 0;
-}
-
-static int midas_submic_bias(struct snd_soc_dapm_widget *w,
-			     struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_card *card = w->dapm->card;
-	struct midas_priv *priv = snd_soc_card_get_drvdata(card);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		return regulator_enable(priv->reg_submic_bias);
-	case SND_SOC_DAPM_POST_PMD:
-		return regulator_disable(priv->reg_submic_bias);
-	}
-
-	return 0;
-}
-
 static int midas_fm_set(struct snd_soc_dapm_widget *w,
 			struct snd_kcontrol *kcontrol, int event)
 {
@@ -272,8 +237,17 @@ static const struct snd_soc_dapm_widget midas_dapm_widgets[] = {
 
 	SND_SOC_DAPM_HP("Headphone", NULL),
 	SND_SOC_DAPM_MIC("Headset Mic", NULL),
-	SND_SOC_DAPM_MIC("Main Mic", midas_mic_bias),
-	SND_SOC_DAPM_MIC("Sub Mic", midas_submic_bias),
+	SND_SOC_DAPM_MIC("Main Mic", NULL),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("mic-bias", 0, 0),
+	SND_SOC_DAPM_MIC("Sub Mic", NULL),
+	SND_SOC_DAPM_REGULATOR_SUPPLY("submic-bias", 0, 0),
+};
+
+/* Default routing; supplemented by audio-routing DT property */
+static const struct snd_soc_dapm_route midas_dapm_routes[] = {
+	/* Bind microphones with their respective regulator supplies */
+	{"Main Mic", NULL, "mic-bias"},
+	{"Sub Mic", NULL, "submic-bias"},
 };
 
 static int midas_set_bias_level(struct snd_soc_card *card,
@@ -421,6 +395,8 @@ static struct snd_soc_card midas_card = {
 	.num_controls = ARRAY_SIZE(midas_controls),
 	.dapm_widgets = midas_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(midas_dapm_widgets),
+	.dapm_routes = midas_dapm_routes,
+	.num_dapm_routes = ARRAY_SIZE(midas_dapm_routes),
 
 	.set_bias_level = midas_set_bias_level,
 	.late_probe = midas_late_probe,
@@ -443,18 +419,6 @@ static int midas_probe(struct platform_device *pdev)
 	snd_soc_card_set_drvdata(card, priv);
 	card->dev = dev;
 
-	priv->reg_mic_bias = devm_regulator_get(dev, "mic-bias");
-	if (IS_ERR(priv->reg_mic_bias)) {
-		dev_err(dev, "Failed to get mic bias regulator\n");
-		return PTR_ERR(priv->reg_mic_bias);
-	}
-
-	priv->reg_submic_bias = devm_regulator_get(dev, "submic-bias");
-	if (IS_ERR(priv->reg_submic_bias)) {
-		dev_err(dev, "Failed to get submic bias regulator\n");
-		return PTR_ERR(priv->reg_submic_bias);
-	}
-
 	priv->gpio_fm_sel = devm_gpiod_get_optional(dev, "fm-sel", GPIOD_OUT_HIGH);
 	if (IS_ERR(priv->gpio_fm_sel)) {
 		dev_err(dev, "Failed to get FM selection GPIO\n");

-- 
2.45.1

