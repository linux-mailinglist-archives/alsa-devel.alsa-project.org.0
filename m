Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5577394ABEF
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Aug 2024 17:10:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BEC3A14DD;
	Wed,  7 Aug 2024 17:10:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BEC3A14DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1723043432;
	bh=7UDfwJmrMLWgAadMr/nmIe/06eQrWV7hakK6EjfMO1k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GSKSvGbhclBRUhVm053fdPVHguWyPtAlHH/0EEbrWSnxMhBXYO1cO6W8FkxA71CfE
	 hTz1WYTtSqnZOd5Dxs9YcBZbv1hLZX0bIOtTRP3UHEpKj7HGi07hIVwo+J0TaqwDsW
	 72+1TUDXHs59npUJwIPzNsr7wn/fts/8mTbwhnlk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF432F805A1; Wed,  7 Aug 2024 17:10:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B13DF805AE;
	Wed,  7 Aug 2024 17:10:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A79AF8049C; Wed,  7 Aug 2024 17:06:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 70C5EF8023A
	for <alsa-devel@alsa-project.org>; Wed,  7 Aug 2024 17:02:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70C5EF8023A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tfbPWp2R
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5bb85e90ad5so1857986a12.3
        for <alsa-devel@alsa-project.org>;
 Wed, 07 Aug 2024 08:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723042959; x=1723647759;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GOZ9eu7KzFM6ThSYO7rTFdAab7Vy2Og8cSyaXW3jcO4=;
        b=tfbPWp2R1R3UDpPe66UMuk9Zk+n9iWyyKsg7AFi21QoULinqg4xcLPGHjnf7WW6a73
         +dF0Y1ANcdPn5uDKp/QkHSPHeTt6XCRCkJ4eN3vmDjWFhdU3gSl1xUd7jKci2BNfNYVl
         6usAEfb91N9VQ4EchgIQM6J8/xzPAiFZcoolDHWvCbyHVRW+pGYoYG3NaHlQbSB3zMN2
         KcW5OlcVzBzARQdKT27QGAQ4s9OOvdowjECpsSrqki7G1WGx9LEowPbxNV4pz0ObDela
         R26fQmkRIuMODUgpTZtjvQKVqib28yviELJJPs9DRdu9F47CQApM2o6s2Sronk3LX8h5
         n8NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723042959; x=1723647759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GOZ9eu7KzFM6ThSYO7rTFdAab7Vy2Og8cSyaXW3jcO4=;
        b=raG/C6jw9TdML5FY/tAAqt70u7KrPvV/2tmNbkt7T69bgodUVVdoVVp4jOpSmKI0uu
         iG+Y75HSJ69/wdm3bHxT2jb6JkuT9t3KAuHCquajO+ZQNusmSleMFaQwXzfkozXDZ4Fl
         MRJWYfkifqJsmbTGMCG5zl+PDxntSCHvLqYkWmmkWGnuK6EAkEn0ffbej4apEiedGIlM
         KKYF+WlHV4Ap+YY466yg8ws28Q0wVLpscFXQD5/l8jGnGZEe15YC1dMUnzgLHIBaVscI
         m3SlQS/yHuD/36i+qw7E0GdmsnHUEvPgwZwgchwallzAVJtgf8GQhROc0kavicMHScIG
         pBwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVosOjfq399l8acw4Y3QtWlZxzviZ5nwfyiuU0bUOkCZk0Dt0l/07R40NQVEkX40aSn4BfzYpIO9oituBe81rjgz4xAJj8Ta8hmC1Y=
X-Gm-Message-State: AOJu0YycWOaJXC8m8aE+IzEqpkWLRMZieaosM12GCdtkRpsP2vUGVeU9
	rupJ2XZCN0hXEeQzeNas2tbb0Dq/LWJymGB/gKqBtyU0gYNtfFydnRak94W5AXQ=
X-Google-Smtp-Source: 
 AGHT+IGzpq+YuuOIP2PFUJ3vNl0MEGcLj5O6pGV4HEUMI9rYt73RXdKBpR8FRW+FrH9d3cp16wWxwA==
X-Received: by 2002:a05:6402:60f:b0:5a3:a9f8:cf20 with SMTP id
 4fb4d7f45d1cf-5b7f58eb70dmr12836219a12.34.1723042958942;
        Wed, 07 Aug 2024 08:02:38 -0700 (PDT)
Received: from lino.lan ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bb90be3a91sm2583047a12.65.2024.08.07.08.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 08:02:38 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 07 Aug 2024 17:02:32 +0200
Subject: [PATCH v2 1/3] ASoC: tas2781-i2c: Drop weird GPIO code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240807-asoc-tas-gpios-v2-1-bd0f2705d58b@linaro.org>
References: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
In-Reply-To: <20240807-asoc-tas-gpios-v2-0-bd0f2705d58b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shenghao Ding <13916275206@139.com>, alsa-devel@alsa-project.org,
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.0
Message-ID-Hash: K3KJFZUFAWDKNL3CGGR7KNYTX4FZPC5E
X-Message-ID-Hash: K3KJFZUFAWDKNL3CGGR7KNYTX4FZPC5E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/K3KJFZUFAWDKNL3CGGR7KNYTX4FZPC5E/>
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
index 18161d02a96f..dbda552398b5 100644
--- a/include/sound/tas2781.h
+++ b/include/sound/tas2781.h
@@ -81,11 +81,6 @@ struct tasdevice {
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
@@ -93,7 +88,6 @@ struct calidata {
 
 struct tasdevice_priv {
 	struct tasdevice tasdevice[TASDEVICE_MAX_CHANNELS];
-	struct tasdevice_irqinfo irq_info;
 	struct tasdevice_rca rcabin;
 	struct calidata cali_data;
 	struct tasdevice_fw *fmw;
@@ -115,6 +109,7 @@ struct tasdevice_priv {
 	unsigned int chip_id;
 	unsigned int sysclk;
 
+	int irq;
 	int cur_prog;
 	int cur_conf;
 	int fw_state;
diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 49bd7097d892..8a7fe48043d2 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -814,7 +814,7 @@ static int tas2781_hda_i2c_probe(struct i2c_client *clt)
 	} else
 		return -ENODEV;
 
-	tas_hda->priv->irq_info.irq = clt->irq;
+	tas_hda->priv->irq = clt->irq;
 	ret = tas2781_read_acpi(tas_hda->priv, device_name);
 	if (ret)
 		return dev_err_probe(tas_hda->dev, ret,
diff --git a/sound/soc/codecs/tas2781-comlib.c b/sound/soc/codecs/tas2781-comlib.c
index 1fbf4560f5cc..28d8b4d7b985 100644
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
@@ -411,8 +410,6 @@ EXPORT_SYMBOL_GPL(tasdevice_dsp_remove);
 
 void tasdevice_remove(struct tasdevice_priv *tas_priv)
 {
-	if (gpio_is_valid(tas_priv->irq_info.irq_gpio))
-		gpio_free(tas_priv->irq_info.irq_gpio);
 	mutex_destroy(&tas_priv->codec_lock);
 }
 EXPORT_SYMBOL_GPL(tasdevice_remove);
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index 8f9a3ae7153e..f3a7605f0710 100644
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
index e79d613745b4..fdf0840ac6c7 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -757,7 +756,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 {
 	struct i2c_client *client = (struct i2c_client *)tas_priv->client;
 	unsigned int dev_addrs[TASDEVICE_MAX_CHANNELS];
-	int rc, i, ndev = 0;
+	int i, ndev = 0;
 
 	if (tas_priv->isacpi) {
 		ndev = device_property_read_u32_array(&client->dev,
@@ -772,7 +771,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 				"ti,audio-slots", dev_addrs, ndev);
 		}
 
-		tas_priv->irq_info.irq_gpio =
+		tas_priv->irq =
 			acpi_dev_gpio_irq_get(ACPI_COMPANION(&client->dev), 0);
 	} else if (IS_ENABLED(CONFIG_OF)) {
 		struct device_node *np = tas_priv->dev->of_node;
@@ -784,7 +783,7 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
 			dev_addrs[ndev++] = addr;
 		}
 
-		tas_priv->irq_info.irq_gpio = of_irq_get(np, 0);
+		tas_priv->irq = of_irq_get(np, 0);
 	} else {
 		ndev = 1;
 		dev_addrs[0] = client->addr;
@@ -800,23 +799,6 @@ static void tasdevice_parse_dt(struct tasdevice_priv *tas_priv)
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

