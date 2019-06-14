Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC764685B
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2019 21:52:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B729F1898;
	Fri, 14 Jun 2019 21:51:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B729F1898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1560541958;
	bh=wiAMJM6LOZvVzskVUmtqeGdtFLA92Q0UQRyWm5i17Zk=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WbfGvQrZENIeBgLyiQLCXEReGDe/09NQ9UW49pjhEapXP9hEZqMHLDzoafio3XKTN
	 lbjFPzhtmVmIRDwKeDXZDOca+b/r1Sr6sVOTX/8fp0PSfAQ6PeYzvQMb89GybHWU7A
	 epxPbc8hDRLNEaD2Zml16IkU7nKwgHZln8fHncAM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3F1F89738;
	Fri, 14 Jun 2019 21:49:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0FA33F89719; Fri, 14 Jun 2019 21:49:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 440CEF896FA
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 21:49:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 440CEF896FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Tc9kZZPg"
Received: by mail-io1-xd43.google.com with SMTP id e5so8387581iok.4
 for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2019 12:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IRv7HK9MDuCS79nTbOugG3YBL8/8pkDfcXyiktbGzRo=;
 b=Tc9kZZPgMmbGTf6tfttpLMHqjLzoTX/pB5C4rpfkXNBCK4+s9oTaC7g7pg0e4KMiSF
 s/9rZZfW0ttLS7PrSR5omnHmijxqphkK2ZUv5+tQ4m+yrCiVNM/gCgSBkz09rOrlZqOI
 rUG8yt8rqaMI1M9esezWE7sv8ME0ZOwrws28Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IRv7HK9MDuCS79nTbOugG3YBL8/8pkDfcXyiktbGzRo=;
 b=IkrcIrBpZgaCt51OXAcW83psKn/mrp9tagtC/0FEFkXIGHV45GU3aO1cFGmZa7nyE6
 xUJgmz4kUXyR4rx6UcooHjjHhhmPJPprf/oUBhzJur9JwWIJc/Lka7RDb98/ZrZ29T/v
 Uhpoi5W12edqD2/B5q4uKmZv0hlaNZFQVw04y6VD/ZVnaMLmXN+jzal4Ylqa7V9T0FJB
 eXIgHw19XOFG71smvu2gy7s6livFqkRC23svhEmyH3AIgrHhLR7D/ekOj6CJF5B4G5we
 ui2usoyzTq85NawWWG+A32xa0/XNOlDu43+hxNrBEYxisgw2aR4svBFEV7D/XBPga5NC
 itmg==
X-Gm-Message-State: APjAAAUIGKzHEOJ1oD2RENYpuaKlj1Ahnm0NHHCA/qUSEsRRzGMv7KA6
 /Sa7nYQSCIRQOg0ADdbBLY9ChQ==
X-Google-Smtp-Source: APXvYqxsT/WMjpMUmYyLW1WY56ZVmNU0m5LM/Z8qx2oC+RboEjyC/bafKTxIpHsu3sS1D8h+LWGI/A==
X-Received: by 2002:a02:69d7:: with SMTP id e206mr70772097jac.21.1560541745833; 
 Fri, 14 Jun 2019 12:49:05 -0700 (PDT)
Received: from localhost ([2620:15c:183:200:33ce:f5cf:f863:d3a6])
 by smtp.gmail.com with ESMTPSA id p10sm2762876iob.54.2019.06.14.12.49.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 12:49:05 -0700 (PDT)
From: Fletcher Woodruff <fletcherw@chromium.org>
To: linux-kernel@vger.kernel.org
Date: Fri, 14 Jun 2019 13:48:53 -0600
Message-Id: <20190614194854.208436-4-fletcherw@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190614194854.208436-1-fletcherw@chromium.org>
References: <20190614194854.208436-1-fletcherw@chromium.org>
MIME-Version: 1.0
Cc: Oder Chiou <oder_chiou@realtek.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ben Zhang <benzh@chromium.org>, Mark Brown <broonie@kernel.org>,
 Ross Zwisler <zwisler@chromium.org>,
 Curtis Malainey <cujomalainey@chromium.org>,
 Fletcher Woodruff <fletcherw@chromium.org>
Subject: [alsa-devel] [PATCH v7 3/4] ASoC: rt5677: clear interrupts by
	polarity flip
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

From: Ben Zhang <benzh@chromium.org>

The rt5677 jack detection function has a requirement that the polarity
of an interrupt be flipped after it fires in order to clear the
interrupt.

This patch implements an irq_chip with irq_domain directly instead of
using regmap-irq, so that interrupt source line polarities can be
flipped in the irq handler.

The reason that this patch does not add this feature within regmap-irq
is that future patches will add hotword detection support to this irq
handler. Those patches will require adding additional logic that would
not make sense to have in regmap-irq.

Signed-off-by: Ben Zhang <benzh@chromium.org>
Signed-off-by: Fletcher Woodruff <fletcherw@chromium.org>
---
 sound/soc/codecs/rt5677.c | 170 ++++++++++++++++++++++++++++++--------
 sound/soc/codecs/rt5677.h |   7 +-
 2 files changed, 143 insertions(+), 34 deletions(-)

diff --git a/sound/soc/codecs/rt5677.c b/sound/soc/codecs/rt5677.c
index 87a92ba0d040b7..87466ee222ee59 100644
--- a/sound/soc/codecs/rt5677.c
+++ b/sound/soc/codecs/rt5677.c
@@ -23,6 +23,10 @@
 #include <linux/firmware.h>
 #include <linux/of_device.h>
 #include <linux/property.h>
+#include <linux/irq.h>
+#include <linux/interrupt.h>
+#include <linux/irqdomain.h>
+#include <linux/workqueue.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -4620,7 +4624,6 @@ static void rt5677_gpio_config(struct rt5677_priv *rt5677, unsigned offset,
 static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
 {
 	struct rt5677_priv *rt5677 = gpiochip_get_data(chip);
-	struct regmap_irq_chip_data *data = rt5677->irq_data;
 	int irq;
 
 	if ((rt5677->pdata.jd1_gpio == 1 && offset == RT5677_GPIO1) ||
@@ -4646,7 +4649,7 @@ static int rt5677_to_irq(struct gpio_chip *chip, unsigned offset)
 		return -ENXIO;
 	}
 
-	return regmap_irq_get_virq(data, irq);
+	return irq_create_mapping(rt5677->domain, irq);
 }
 
 static const struct gpio_chip rt5677_template_chip = {
@@ -5042,30 +5045,130 @@ static void rt5677_read_device_properties(struct rt5677_priv *rt5677,
 		rt5677->pdata.jd3_gpio = val;
 }
 
-static struct regmap_irq rt5677_irqs[] = {
+struct rt5677_irq_desc {
+	unsigned int enable_mask;
+	unsigned int status_mask;
+	unsigned int polarity_mask;
+};
+
+static const struct rt5677_irq_desc rt5677_irq_descs[] = {
 	[RT5677_IRQ_JD1] = {
-		.reg_offset = 0,
-		.mask = RT5677_EN_IRQ_GPIO_JD1,
+		.enable_mask = RT5677_EN_IRQ_GPIO_JD1,
+		.status_mask = RT5677_STA_GPIO_JD1,
+		.polarity_mask = RT5677_INV_GPIO_JD1,
 	},
 	[RT5677_IRQ_JD2] = {
-		.reg_offset = 0,
-		.mask = RT5677_EN_IRQ_GPIO_JD2,
+		.enable_mask = RT5677_EN_IRQ_GPIO_JD2,
+		.status_mask = RT5677_STA_GPIO_JD2,
+		.polarity_mask = RT5677_INV_GPIO_JD2,
 	},
 	[RT5677_IRQ_JD3] = {
-		.reg_offset = 0,
-		.mask = RT5677_EN_IRQ_GPIO_JD3,
+		.enable_mask = RT5677_EN_IRQ_GPIO_JD3,
+		.status_mask = RT5677_STA_GPIO_JD3,
+		.polarity_mask = RT5677_INV_GPIO_JD3,
 	},
 };
 
-static struct regmap_irq_chip rt5677_irq_chip = {
-	.name = RT5677_DRV_NAME,
-	.irqs = rt5677_irqs,
-	.num_irqs = ARRAY_SIZE(rt5677_irqs),
+static irqreturn_t rt5677_irq(int unused, void *data)
+{
+	struct rt5677_priv *rt5677 = data;
+	int ret = 0, i, reg_irq, virq;
+	bool irq_fired = false;
+
+	mutex_lock(&rt5677->irq_lock);
+	/* Read interrupt status */
+	ret = regmap_read(rt5677->regmap, RT5677_IRQ_CTRL1, &reg_irq);
+	if (ret) {
+		pr_err("rt5677: failed reading IRQ status: %d\n", ret);
+		goto exit;
+	}
+
+	for (i = 0; i < RT5677_IRQ_NUM; i++) {
+		if (reg_irq & rt5677_irq_descs[i].status_mask) {
+			irq_fired = true;
+			virq = irq_find_mapping(rt5677->domain, i);
+			if (virq)
+				handle_nested_irq(virq);
+
+			/* Clear the interrupt by flipping the polarity of the
+			 * interrupt source line that fired
+			 */
+			reg_irq ^= rt5677_irq_descs[i].polarity_mask;
+		}
+	}
+
+	if (!irq_fired)
+		goto exit;
+
+	ret = regmap_write(rt5677->regmap, RT5677_IRQ_CTRL1, reg_irq);
+	if (ret) {
+		pr_err("rt5677: failed updating IRQ status: %d\n", ret);
+		goto exit;
+	}
+exit:
+	mutex_unlock(&rt5677->irq_lock);
+	if (irq_fired)
+		return IRQ_HANDLED;
+	else
+		return IRQ_NONE;
+}
 
-	.num_regs = 1,
-	.status_base = RT5677_IRQ_CTRL1,
-	.mask_base = RT5677_IRQ_CTRL1,
-	.mask_invert = 1,
+static void rt5677_irq_bus_lock(struct irq_data *data)
+{
+	struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
+
+	mutex_lock(&rt5677->irq_lock);
+}
+
+static void rt5677_irq_bus_sync_unlock(struct irq_data *data)
+{
+	struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
+
+	// Set the enable/disable bits for the jack detect IRQs.
+	regmap_update_bits(rt5677->regmap, RT5677_IRQ_CTRL1,
+			RT5677_EN_IRQ_GPIO_JD1 | RT5677_EN_IRQ_GPIO_JD2 |
+			RT5677_EN_IRQ_GPIO_JD3, rt5677->irq_en);
+	mutex_unlock(&rt5677->irq_lock);
+}
+
+static void rt5677_irq_enable(struct irq_data *data)
+{
+	struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
+
+	rt5677->irq_en |= rt5677_irq_descs[data->hwirq].enable_mask;
+}
+
+static void rt5677_irq_disable(struct irq_data *data)
+{
+	struct rt5677_priv *rt5677 = irq_data_get_irq_chip_data(data);
+
+	rt5677->irq_en &= ~rt5677_irq_descs[data->hwirq].enable_mask;
+}
+
+static struct irq_chip rt5677_irq_chip = {
+	.name			= "rt5677_irq_chip",
+	.irq_bus_lock		= rt5677_irq_bus_lock,
+	.irq_bus_sync_unlock	= rt5677_irq_bus_sync_unlock,
+	.irq_disable		= rt5677_irq_disable,
+	.irq_enable		= rt5677_irq_enable,
+};
+
+static int rt5677_irq_map(struct irq_domain *h, unsigned int virq,
+			  irq_hw_number_t hw)
+{
+	struct rt5677_priv *rt5677 = h->host_data;
+
+	irq_set_chip_data(virq, rt5677);
+	irq_set_chip(virq, &rt5677_irq_chip);
+	irq_set_nested_thread(virq, 1);
+	irq_set_noprobe(virq);
+	return 0;
+}
+
+
+static const struct irq_domain_ops rt5677_domain_ops = {
+	.map	= rt5677_irq_map,
+	.xlate	= irq_domain_xlate_twocell,
 };
 
 static int rt5677_init_irq(struct i2c_client *i2c)
@@ -5084,6 +5187,8 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 		return -EINVAL;
 	}
 
+	mutex_init(&rt5677->irq_lock);
+
 	/*
 	 * Select RC as the debounce clock so that GPIO works even when
 	 * MCLK is gated which happens when there is no audio stream
@@ -5092,7 +5197,6 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	regmap_update_bits(rt5677->regmap, RT5677_DIG_MISC,
 			RT5677_IRQ_DEBOUNCE_SEL_MASK,
 			RT5677_IRQ_DEBOUNCE_SEL_RC);
-
 	/* Enable auto power on RC when GPIO states are changed */
 	regmap_update_bits(rt5677->regmap, RT5677_GEN_CTRL1, 0xff, 0xff);
 
@@ -5115,26 +5219,25 @@ static int rt5677_init_irq(struct i2c_client *i2c)
 	regmap_update_bits(rt5677->regmap, RT5677_GPIO_CTRL1,
 			RT5677_GPIO1_PIN_MASK, RT5677_GPIO1_PIN_IRQ);
 
-	ret = regmap_add_irq_chip(rt5677->regmap, i2c->irq,
-		IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT, 0,
-		&rt5677_irq_chip, &rt5677->irq_data);
+	/* Ready to listen for interrupts */
+	rt5677->domain = irq_domain_add_linear(i2c->dev.of_node,
+			RT5677_IRQ_NUM, &rt5677_domain_ops, rt5677);
+	if (!rt5677->domain) {
+		dev_err(&i2c->dev, "Failed to create IRQ domain\n");
+		return -ENOMEM;
+	}
 
-	if (ret != 0) {
-		dev_err(&i2c->dev, "Failed to register IRQ chip: %d\n", ret);
+	ret = devm_request_threaded_irq(&i2c->dev, i2c->irq, NULL, rt5677_irq,
+			IRQF_TRIGGER_RISING | IRQF_ONESHOT,
+			"rt5677", rt5677);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to request IRQ: %d\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
 
-static void rt5677_free_irq(struct i2c_client *i2c)
-{
-	struct rt5677_priv *rt5677 = i2c_get_clientdata(i2c);
-
-	if (rt5677->irq_data)
-		regmap_del_irq_chip(i2c->irq, rt5677->irq_data);
-}
-
 static int rt5677_i2c_probe(struct i2c_client *i2c)
 {
 	struct rt5677_priv *rt5677;
@@ -5259,7 +5362,9 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 			RT5677_MICBIAS1_CTRL_VDD_3_3V);
 
 	rt5677_init_gpio(i2c);
-	rt5677_init_irq(i2c);
+	ret = rt5677_init_irq(i2c);
+	if (ret)
+		dev_err(&i2c->dev, "Failed to initialize irq: %d\n", ret);
 
 	return devm_snd_soc_register_component(&i2c->dev,
 				      &soc_component_dev_rt5677,
@@ -5268,7 +5373,6 @@ static int rt5677_i2c_probe(struct i2c_client *i2c)
 
 static int rt5677_i2c_remove(struct i2c_client *i2c)
 {
-	rt5677_free_irq(i2c);
 	rt5677_free_gpio(i2c);
 
 	return 0;
diff --git a/sound/soc/codecs/rt5677.h b/sound/soc/codecs/rt5677.h
index c26edd387e340b..d0ac26e562eb5f 100644
--- a/sound/soc/codecs/rt5677.h
+++ b/sound/soc/codecs/rt5677.h
@@ -1749,6 +1749,7 @@ enum {
 	RT5677_IRQ_JD1,
 	RT5677_IRQ_JD2,
 	RT5677_IRQ_JD3,
+	RT5677_IRQ_NUM,
 };
 
 enum rt5677_type {
@@ -1847,9 +1848,13 @@ struct rt5677_priv {
 	struct gpio_chip gpio_chip;
 #endif
 	bool dsp_vad_en;
-	struct regmap_irq_chip_data *irq_data;
 	bool is_dsp_mode;
 	bool is_vref_slow;
+
+	/* Interrupt handling */
+	struct irq_domain *domain;
+	struct mutex irq_lock;
+	unsigned int irq_en;
 };
 
 int rt5677_sel_asrc_clk_src(struct snd_soc_component *component,
-- 
2.22.0.410.gd8fdbe21b5-goog

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
