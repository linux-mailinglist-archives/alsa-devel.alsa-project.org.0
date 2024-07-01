Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8168591D891
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Jul 2024 09:07:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D59BE2368;
	Mon,  1 Jul 2024 09:07:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D59BE2368
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1719817635;
	bh=UjmSitKNlQ2nMJN5qYvwS/7oolUMY8paivqWw2tn+Vk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Mpatd3efOg3+Nn1zUEIgUXha5e+NNkPpgKBnyaNWydDUiSVfSpP6afa74W+Ts2/X3
	 KRl9gEvlfLICZ39V4hSX+tp0gDZhnrj5iEmnF+5sJha8cMVsgXiFoomZRbL8szdiHr
	 bF19J3l7ZxJ6PvzlBNjbZDqFkXbNpzCbVH81XFVY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C4B04F805E2; Mon,  1 Jul 2024 09:06:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 300FEF805C8;
	Mon,  1 Jul 2024 09:06:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D668CF8045D; Mon,  1 Jul 2024 09:02:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C248CF80238
	for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2024 09:02:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C248CF80238
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=EGpysZzF
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50cso25700881fa.2
        for <alsa-devel@alsa-project.org>;
 Mon, 01 Jul 2024 00:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719817359; x=1720422159;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E3/s/Nj4HWsI125zUFb7bumgBHzMcSwoiGKdlWH04Ns=;
        b=EGpysZzFROG0F+e0RCXM+jBvyzpSvOqnSaTJKtFikDfDJN+O+w/1nDIF/31H+0vQ8D
         DkP0XB3EkAQCxDYxkBaFtMp36fQwfXK+xnAXB+1PoSOECctFYxq3oxbj11Z8Cme6TevG
         YcR+NDeUzz70SBAJFjGNV9wErEb9PUJwsAzMjYUM6iNtZkcGoy0eFwRXf2zfS77nm61G
         PUWyqvABlhlXG+dZVij1RSq50gjR1P0M7DdTds1cur2oJOZZOhrXOWGyI224hjK59/TZ
         6WK/vbJGw8eDCsfhmr29JkaKZzjUd0WrpImFj09UUQjjgWWUASqtOfZbOma8J7t/fxJO
         WYfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719817359; x=1720422159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E3/s/Nj4HWsI125zUFb7bumgBHzMcSwoiGKdlWH04Ns=;
        b=N9ugOWXRXqkf/iVam3159SXUr3yLpgEECvjXe1SG6jglB/4DSGDJGABH/+HlArcW00
         KoNHXbf5naN7KI/vLd9D4lMlw5am1vHwxM0rzYQ278fLWST0gr6eoDOmUEScNoRg0xRt
         oPlszOpBEqQAnNq1+SeWjb+988eqD7Jzji28DnJLoBQ1c0ZpM4T85bTmlVixFuNWVLQZ
         LAMo98UfG0sVWVU5t6UtQ53hTKb15EUMho2OY9j0m9VC3FB1ObIvMNrJ8hc8mIzPuLIm
         O/vaYQVOn7H5axTO6rOC1llvCQZmJgxi9kgZYTMrjBkPd0YCUzvgRkuUVMsDud5zJ93m
         xiIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqolCcCvMF/On2bzo1OlhGkc4jLhzpec1342i8J5Q+cXu2Adr/ILtiWGYVYFiJ2hYlTtM70YaCCtZgGwsa5lDv/HK6g2OrLbaXhBc=
X-Gm-Message-State: AOJu0Yxn22Tq2a6ZVoU3UwxtTBW6e8XtbZT+TPCbpAbejZLvMeHKyDSr
	S0axyEkyUxVUvV011pQAL34adiN7cDcmuJAQ15LdpJ/oYUWLZIbNqJqpMr9LOoA=
X-Google-Smtp-Source: 
 AGHT+IHlLNCx+HzW4mye2WD6CgheWVhB4SQOz1Cwyrm10zDOUU5da2YKF7YBflsCQSH6asfQe2IxGA==
X-Received: by 2002:a2e:300e:0:b0:2ee:5d45:b191 with SMTP id
 38308e7fff4ca-2ee5e37de87mr31439981fa.8.1719817359222;
        Mon, 01 Jul 2024 00:02:39 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5861324f036sm4034383a12.34.2024.07.01.00.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 00:02:37 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 01 Jul 2024 09:02:13 +0200
Subject: [PATCH 2/4] ASoC: tas2781-i2c: Drop weird GPIO code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-asoc-tas-gpios-v1-2-d69ec5d79939@linaro.org>
References: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
In-Reply-To: <20240701-asoc-tas-gpios-v1-0-d69ec5d79939@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: VXWCIWY7HTZXCKULPPPULCDJHY44OSGQ
X-Message-ID-Hash: VXWCIWY7HTZXCKULPPPULCDJHY44OSGQ
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VXWCIWY7HTZXCKULPPPULCDJHY44OSGQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The tas2781-i2c driver gets an IRQ from either ACPI or device tree,
then proceeds to check if the IRQ has a corresponding GPIO and in
case it does enforce the GPIO as input and set a label on it.

This is abuse of the API:

- First we cannot guarantee that the numberspaces of the GPIOs and
  the IRQs are the same, i.e that an IRQ number corresponds to
  a GPIO number like that.

- Second, GPIO chips and IRQ chips should be treated as orthogonal
  APIs, the irqchip needs to ascertain that the backing GPIO line
  is set to input etc just using the irqchip.

- Third it is using the legacy <linux/gpio.h> API which should not
  be used in new code yet this was added just a year ago.

Delete the offending code.

If this creates problems the GPIO and irqchip maintainers can help
to fix the issues.

It *should* not create any problems, because the irq isn't
used anywhere in the driver, it's just obtained and then
left unused.

Fixes: ef3bcde75d06 ("ASoC: tas2781: Add tas2781 driver")
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/sound/tas2781.h           |  7 +------
 sound/pci/hda/tas2781_hda_i2c.c   |  2 +-
 sound/soc/codecs/tas2781-comlib.c |  3 ---
 sound/soc/codecs/tas2781-fmwlib.c |  1 -
 sound/soc/codecs/tas2781-i2c.c    | 24 +++---------------------
 5 files changed, 5 insertions(+), 32 deletions(-)

diff --git a/include/sound/tas2781.h b/include/sound/tas2781.h
index 99ca3e401fd1..6f6e3e2f652c 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -80,11 +80,6 @@ struct tasdevice {
 	bool is_loaderr;
 };
 
-struct tasdevice_irqinfo {
-	int irq_gpio;
-	int irq;
-};
-
 struct calidata {
 	unsigned char *data;
 	unsigned long total_sz;
@@ -92,7 +87,6 @@ struct calidata {
 
 struct tasdevice_priv {
 	struct tasdevice tasdevice[TASDEVICE_MAX_CHANNELS];
-	struct tasdevice_irqinfo irq_info;
 	struct tasdevice_rca rcabin;
 	struct calidata cali_data;
 	struct tasdevice_fw *fmw;
@@ -113,6 +107,7 @@ struct tasdevice_priv {
 	unsigned int chip_id;
 	unsigned int sysclk;
 
+	int irq;
 	int cur_prog;
 	int cur_conf;
 	int fw_state;
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 75f7674c66ee..c5ace7216ecb 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -818,7 +818,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	} else
 		return -ENODEV;
 
-	tas_hda->priv->irq_info.irq = clt->irq;
+	tas_hda->priv->irq = clt->irq;
 	ret = tas2781_read_acpi(tas_hda->priv, device_name);
 	if (ret)
 		return dev_err_probe(tas_hda->dev, ret,
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 3aa81514dad7..0444cf90c511 100644
--- a/sound/soc/codecs/tas2781-comlib.c
+++ b/sound/soc/codecs/tas2781-comlib.c
@@ -14,7 +14,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -406,8 +405,6 @@ EXPORT_SYMBOL_GPL(tasdevice_dsp_remove);
 
 void tasdevice_remove(struct tasdevice_priv *tas_priv)
 {
-	if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
-		gpio_free(tas_priv->irq_info.irq_gpio);
 	mutex_destroy(&tas_priv->codec_lock);
 }
 EXPORT_SYMBOL_GPL(tasdevice_remove);
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 265a8ca25cbb..d6afab542da7 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -13,7 +13,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9350972dfefe..1542915b83a2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -21,7 +21,6 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -605,7 +604,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 {
 	struct i2c_client *client = (struct i2c_client *)tas_priv->client;
 	unsigned int dev_addrs[TASDEVICE_MAX_CHANNELS];
-	int rc, i, ndev = 0;
+	int i, ndev = 0;
 
 	if (tas_priv->isacpi) {
 		ndev = device_property_read_u32_array(&client->dev,
@@ -620,7 +619,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 				"ti,audio-slots", dev_addrs, ndev);
 		}
 
-		tas_priv->irq_info.irq_gpio =
+		tas_priv->irq =
 			acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
 	} else {
 		struct device_node *np = tas_priv->dev->of_node;
@@ -648,7 +647,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 		ndev = 1;
 		dev_addrs[0] = client->addr;
 #endif
-		tas_priv->irq_info.irq_gpio = of_irq_get(np, 0);
+		tas_priv->irq = of_irq_get(np, 0);
 	}
 	tas_priv->ndev = ndev;
 	for (i = 0; i < ndev; i++)
@@ -661,23 +660,6 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 			__func__);
 
 	strcpy(tas_priv->dev_name, tasdevice_id[tas_priv->chip_id].name);
-
-	if (gpio_is_valid(tas_priv->irq_info.irq_gpio)) {
-		rc = gpio_request(tas_priv->irq_info.irq_gpio,
-				"AUDEV-IRQ");
-		if (!rc) {
-			gpio_direction_input(
-				tas_priv->irq_info.irq_gpio);
-
-			tas_priv->irq_info.irq =
-				gpio_to_irq(tas_priv->irq_info.irq_gpio);
-		} else
-			dev_err(tas_priv->dev, "%s: GPIO %d request error\n",
-				__func__, tas_priv->irq_info.irq_gpio);
-	} else
-		dev_err(tas_priv->dev,
-			"Looking up irq-gpio property failed %d\n",
-			tas_priv->irq_info.irq_gpio);
 }
 
 static int tasdevice_i2c_probe(struct i2c_client *i2c)

-- 
2.45.2

