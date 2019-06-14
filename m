Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4893F46859
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 21:51:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C46AD188B;
	Fri, 14 Jun 2019 21:50:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C46AD188B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560541893;
	bh=KTa8qKQNTbxkQX4RK8TKMZOKNXZfPHdD6EzF7LGgYhQ=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n1Doxcam/RmCxQRKWOhOZBMrs3XSxjPeaXjHPq5V4VPVCceKq7Ycg2/fa+kbUalby
	 5azJykC2qReYdV/gXzHU3gmKR+3qO+QDClSbPWks5Y6AGKnhZx8OP/7BdImxGBFm0P
	 Ev0lu6+YUUMqMT2/swcpTehOwoPMtpPDjRwyWfDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F15F896FA;
	Fri, 14 Jun 2019 21:49:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD744F896E3; Fri, 14 Jun 2019 21:49:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 636B8F896E0
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 21:49:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 636B8F896E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="VoQICBqU"
Received: by mail-io1-xd44.google.com with SMTP id i10so8228818iol.13
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MaIZMt5yxWM5sQE6WNzCNSiNAgVByKuy80p0JaL7TBk=;
 b=VoQICBqULb/R5HagGxuWPrQC1hUG3UiOK8UKV0Jlr3tiUzgxAIznwLvOId7GA3qwby
 UCTnpOQw7XWiVERAigg+64axRRNSBzwxsPpYDPdkS8cGXoGW8tbu1CzN349fJBJguVsn
 vZNhTDXABOdNXz0VqMXJ7i+Rze9RdKa/EXCnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MaIZMt5yxWM5sQE6WNzCNSiNAgVByKuy80p0JaL7TBk=;
 b=t1Sy3BzPUB5mluJ9OqpmuFg/BVWufGTZ95pumImsb1sF3/4+6RZaZWDKo6UH14Nl1q
 C0MRA1mH//6wWTwg6ycd0xuH+bY2HZzVM8Mp1g9XbIoW0ueTzSMc6lqMKm7o/40EJVft
 f1LSI4kpIHxyAwOznCxeUUk89XRN/15emXJs6y6Daqt0gQ48tTh2dI1ye2Lgp0BpYZ3/
 4twn5ZAuBdkNBh2/k1yEMlJX+REBhIVKamsgRj+8Lyi175b83D2j690+LC9F+OcYxqlH
 kLCvfp8EdPGDMP2Xr2e1YIKhs17ZwsplpHRRxPoETuyGfZ284fguGtwU/L4T5y11A3r3
 v3cA==
X-Gm-Message-State: APjAAAUNTMYHraDPg0vBW/mol+8YN5hE1ZIkN7iUzQp4wp4u/qXZcmXi
 dqNp0tFbvAx2BUrPzqUDo0itFQ==
X-Google-Smtp-Source: APXvYqwj6DP531MRg2XghkwQ208a7HyBP+mfYWnQayCTVXZWCCoRtWvGGDiUbpjQHvCzTnVpgrWIXQ==
X-Received: by 2002:a5d:8506:: with SMTP id q6mr1977682ion.41.1560541743081;
 Fri, 14 Jun 2019 12:49:03 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id t133sm5976689iof.21.2019.06.14.12.49.02
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 12:49:02 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 13:48:52 -0600
Message-Id: <20190614194854.208436-3-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614194854.208436-1-fletcherw@chromium.org>
References: <20190614194854.208436-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>
Subject: [alsa-devel] [PATCH v7 2/4] ASoC: rt5677: move jack-detect init to
	i2c probe
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

This patch moves the code to select the gpios for jack detection
from rt5677_probe to rt5677_init_irq (called from rt5677_i2c_probe).

It also sets some registers to fix bugs related to jack detection, and
adds some constants and comments to make it easier to understand what
certain register settings are controlling.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Fletcher Woodruff <fletcherw@chromium.org>
---
 sound/soc/codecs/rt5677.c | 60 ++++++++++++++++++++++-----------------
 sound/soc/codecs/rt5677.h |  6 ++++
 2 files changed, 40 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index fe000f30b9ad5f..87a92ba0d040b7 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -4716,37 +4716,13 @@ static int rt5677_probe(struct snd_soc_component *component)
 
 	snd_soc_component_force_bias_level(component, SND_SOC_BIAS_OFF);
 
-	regmap_write(rt5677->regmap, RT5677_DIG_MISC, 0x0020);
+	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
+			~RT5677_IRQ_DEBOUNCE_SEL_MASK, 0x0020);
 	regmap_write(rt5677->regmap, RT5677_PWR_DSP2, 0x0c00);
 
 	for (i = 0; i < RT5677_GPIO_NUM; i++)
 		rt5677_gpio_config(rt5677, i, rt5677->pdata.gpio_config[i]);
 
-	if (rt5677->irq_data) {
-		regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1, 0x8000,
-			0x8000);
-		regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC, 0x0018,
-			0x0008);
-
-		if (rt5677->pdata.jd1_gpio)
-			regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
-				RT5677_SEL_GPIO_JD1_MASK,
-				rt5677->pdata.jd1_gpio <<
-				RT5677_SEL_GPIO_JD1_SFT);
-
-		if (rt5677->pdata.jd2_gpio)
-			regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
-				RT5677_SEL_GPIO_JD2_MASK,
-				rt5677->pdata.jd2_gpio <<
-				RT5677_SEL_GPIO_JD2_SFT);
-
-		if (rt5677->pdata.jd3_gpio)
-			regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1,
-				RT5677_SEL_GPIO_JD3_MASK,
-				rt5677->pdata.jd3_gpio <<
-				RT5677_SEL_GPIO_JD3_SFT);
-	}
-
 	mutex_init(&rt5677->dsp_cmd_lock);
 	mutex_init(&rt5677->dsp_pri_lock);
 
@@ -5096,6 +5072,7 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 {
 	int ret;
 	struct rt5677_priv *rt5677 = i2c_get_clientdata(i2c);
+	unsigned int jd_mask = 0, jd_val = 0;
 
 	if (!rt5677->pdata.jd1_gpio &&
 		!rt5677->pdata.jd2_gpio &&
@@ -5107,6 +5084,37 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 		return -EINVAL;
 	}
 
+	/*
+	 * Select RC as the debounce clock so that GPIO works even when
+	 * MCLK is gated which happens when there is no audio stream
+	 * (SND_SOC_BIAS_OFF).
+	 */
+	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
+			RT5677_IRQ_DEBOUNCE_SEL_MASK,
+			RT5677_IRQ_DEBOUNCE_SEL_RC);
+
+	/* Enable auto power on RC when GPIO states are changed */
+	regmap_update_bits(rt5677->regmap, RT5677_GEN_CTRL1, 0xff, 0xff);
+
+	/* Select and enable jack detection sources per platform data */
+	if (rt5677->pdata.jd1_gpio) {
+		jd_mask	|= RT5677_SEL_GPIO_JD1_MASK;
+		jd_val	|= rt5677->pdata.jd1_gpio << RT5677_SEL_GPIO_JD1_SFT;
+	}
+	if (rt5677->pdata.jd2_gpio) {
+		jd_mask	|= RT5677_SEL_GPIO_JD2_MASK;
+		jd_val	|= rt5677->pdata.jd2_gpio << RT5677_SEL_GPIO_JD2_SFT;
+	}
+	if (rt5677->pdata.jd3_gpio) {
+		jd_mask	|= RT5677_SEL_GPIO_JD3_MASK;
+		jd_val	|= rt5677->pdata.jd3_gpio << RT5677_SEL_GPIO_JD3_SFT;
+	}
+	regmap_update_bits(rt5677->regmap, RT5677_JD_CTRL1, jd_mask, jd_val);
+
+	/* Set GPIO1 pin to be IRQ output */
+	regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
+			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
+
 	ret = regmap_add_irq_chip(rt5677->regmap, i2c->irq,
 		IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT, 0,
 		&rt5677_irq_chip, &rt5677->irq_data);
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index 076e5161d8da30..c26edd387e340b 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1664,6 +1664,12 @@
 #define RT5677_GPIO6_P_NOR			(0x0 << 0)
 #define RT5677_GPIO6_P_INV			(0x1 << 0)
 
+/* General Control (0xfa) */
+#define RT5677_IRQ_DEBOUNCE_SEL_MASK		(0x3 << 3)
+#define RT5677_IRQ_DEBOUNCE_SEL_MCLK		(0x0 << 3)
+#define RT5677_IRQ_DEBOUNCE_SEL_RC		(0x1 << 3)
+#define RT5677_IRQ_DEBOUNCE_SEL_SLIM		(0x2 << 3)
+
 /* Virtual DSP Mixer Control (0xf7 0xf8 0xf9) */
 #define RT5677_DSP_IB_01_H			(0x1 << 15)
 #define RT5677_DSP_IB_01_H_SFT			15
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
