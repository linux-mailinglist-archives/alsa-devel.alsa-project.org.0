Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155419C623
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 17:41:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1EF781655;
	Thu,  2 Apr 2020 17:40:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1EF781655
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585842091;
	bh=MS6cDs/7dIfARMOlXsmp94lLA29CaWxq19rLLNbQBp0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CEZdj1TMdY5ZSnDDLdOaFWAj4erOQRfQcSNOShRdP7YIP5kMpxacevOuW53cmyQFQ
	 udXhwGyhc4+17J6UUFpdfpgzYajV2D/kCaM7iKS9QNRhWNp+tD4MAsRR9kjNhI9yfO
	 r/YVQIBvnYfcXAuxy4Z7zbqd9YV2avoqjD5AAHgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 378BFF802A0;
	Thu,  2 Apr 2020 17:37:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58F61F8014B; Wed,  1 Apr 2020 22:55:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D79D5F8010D
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 22:55:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D79D5F8010D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=izotope.com header.i=@izotope.com
 header.b="BQrRD6cM"
Received: by mail-qk1-x741.google.com with SMTP id q188so1605081qke.8
 for <alsa-devel@alsa-project.org>; Wed, 01 Apr 2020 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=izotope.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=g4kk6wwdY8yrihIPw6mOhLzUhNs3dsF0WNszM6fL+OE=;
 b=BQrRD6cMScOAE7orufyNWIAP8Aoz3NlnWbGUl0U3jbUYe05UY+WIdK55hedussU3FZ
 B9++uLspCP+usWvmQoGI8GWgXL7T7Hm/cnkUAyPN7g0wRWz4onaw2Nc11GhSvc+BSKcX
 HpXy0fUmRJhK3J8jklPmUzsjhzhNq+JjLhOOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g4kk6wwdY8yrihIPw6mOhLzUhNs3dsF0WNszM6fL+OE=;
 b=N5C+re5d6EW3MX+fOqeBR7BZ2BKAZe8mlJYkEOGKprCZoHIltdWnAij1kxb6laifXo
 CFQ3SVMtgU2DwD5TXSZQQu3RjtfSGd5q+lyTCFYuhHwSgXEVrBlBTRB0dW9v/V6EDW7f
 pVWbzS+GO6JfVJ8gTrX6jQB3VS2HCM/a8hBcIBfKIqj2EUMmy/gTzZeFLJUzCxE9qjKz
 2c42y2eRUkvB+CBFiql8fAUJM9d/Uc1AAFh+NGttpF9CfzdqBVakfWsid1nd2tAQgv+B
 bHpIVHSNtb7rEsGeAqDgquxzIwJPrrUbCtHSFvJwmB0XyvGUADeFURpHR6ibFpgDUXnU
 GsHA==
X-Gm-Message-State: AGi0PuZscvSs+COos2aFFiQ9b9EmZmUGNuTiIELTdtFENQ4nR/YAMcmI
 W3RiG5bvy9Q0GBzZXjMrZTXH4Q==
X-Google-Smtp-Source: APiQypLWPhzlA+PB0a2CXGRt1T1qFtY0r63L2T6hl8lIyR+BDFBhk6djKQYvV6iwp8k8XMNeHOwuSw==
X-Received: by 2002:a37:9ac6:: with SMTP id c189mr215593qke.214.1585774507223; 
 Wed, 01 Apr 2020 13:55:07 -0700 (PDT)
Received: from localhost.localdomain
 (pool-71-184-149-228.bstnma.fios.verizon.net. [71.184.149.228])
 by smtp.gmail.com with ESMTPSA id c12sm2330202qtb.49.2020.04.01.13.55.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 13:55:06 -0700 (PDT)
From: Mike Willard <mwillard@izotope.com>
To: mwillard@izotope.com
Subject: [PATCH] ASoC: cs4270: pull reset GPIO low then high
Date: Wed,  1 Apr 2020 20:54:54 +0000
Message-Id: <20200401205454.79792-1-mwillard@izotope.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 02 Apr 2020 17:37:21 +0200
Cc: Brian Austin <brian.austin@cirrus.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Paul Handrigan <Paul.Handrigan@cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Pull the RST line low then high when initializing the driver,
in order to force a reset of the chip.
Previously, the line was not pulled low, which could result in
the chip registers not resetting to their default values on boot.

Signed-off-by: Mike Willard <mwillard@izotope.com>
---
 sound/soc/codecs/cs4270.c | 40 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 5f25b9f872bd..8a02791e44ad 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -137,6 +137,9 @@ struct cs4270_private {
 
 	/* power domain regulators */
 	struct regulator_bulk_data supplies[ARRAY_SIZE(supply_names)];
+
+	/* reset gpio */
+	struct gpio_desc *reset_gpio;
 };
 
 static const struct snd_soc_dapm_widget cs4270_dapm_widgets[] = {
@@ -648,6 +651,22 @@ static const struct regmap_config cs4270_regmap = {
 	.volatile_reg =		cs4270_reg_is_volatile,
 };
 
+/**
+ * cs4270_i2c_remove - deinitialize the I2C interface of the CS4270
+ * @i2c_client: the I2C client object
+ *
+ * This function puts the chip into low power mode when the i2c device
+ * is removed.
+ */
+static int cs4270_i2c_remove(struct i2c_client *i2c_client)
+{
+	struct cs4270_private *cs4270 = i2c_get_clientdata(i2c_client);
+
+	gpiod_set_value_cansleep(cs4270->reset_gpio, 0);
+
+	return 0;
+}
+
 /**
  * cs4270_i2c_probe - initialize the I2C interface of the CS4270
  * @i2c_client: the I2C client object
@@ -660,7 +679,6 @@ static int cs4270_i2c_probe(struct i2c_client *i2c_client,
 	const struct i2c_device_id *id)
 {
 	struct cs4270_private *cs4270;
-	struct gpio_desc *reset_gpiod;
 	unsigned int val;
 	int ret, i;
 
@@ -679,10 +697,21 @@ static int cs4270_i2c_probe(struct i2c_client *i2c_client,
 	if (ret < 0)
 		return ret;
 
-	reset_gpiod = devm_gpiod_get_optional(&i2c_client->dev, "reset",
-					      GPIOD_OUT_HIGH);
-	if (PTR_ERR(reset_gpiod) == -EPROBE_DEFER)
-		return -EPROBE_DEFER;
+	/* reset the device */
+	cs4270->reset_gpio = devm_gpiod_get_optional(&i2c_client->dev, "reset",
+						     GPIOD_OUT_LOW);
+	if (IS_ERR(cs4270->reset_gpio)) {
+		dev_dbg(&i2c_client->dev, "Error getting CS4270 reset GPIO\n");
+		return PTR_ERR(cs4270->reset_gpio);
+	}
+
+	if (cs4270->reset_gpio) {
+		dev_dbg(&i2c_client->dev, "Found reset GPIO\n");
+		gpiod_set_value_cansleep(cs4270->reset_gpio, 1);
+	}
+
+	/* Sleep 500ns before i2c communications */
+	ndelay(500);
 
 	cs4270->regmap = devm_regmap_init_i2c(i2c_client, &cs4270_regmap);
 	if (IS_ERR(cs4270->regmap))
@@ -735,6 +764,7 @@ static struct i2c_driver cs4270_i2c_driver = {
 	},
 	.id_table = cs4270_id,
 	.probe = cs4270_i2c_probe,
+	.remove = cs4270_i2c_remove,
 };
 
 module_i2c_driver(cs4270_i2c_driver);
-- 
2.17.1

