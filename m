Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DEB3AAF24
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 10:54:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4E9F016E7;
	Thu, 17 Jun 2021 10:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4E9F016E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623920069;
	bh=wpiUlIhIPjRAkxrI3DlHDqRPyMqLB8TuXwrTBuTuZ0o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uZ5FfL3qyVLnWZNls5tRSV1b6tCjD9cpopee/aXxjyVcrX/Y8dGT51DqwZDj07ORi
	 d+/zzIE4X2aaKDgWSMS3Vlm+miE/9/35VxZiDGxOutMwlhW3FmeiAS1uTQbjn1Gk8A
	 zmQ8poAbIyH0WucFIj7U7rSjXwU9lp0f3mBBAFH0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5F287F8028B;
	Thu, 17 Jun 2021 10:52:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BD98F804BC; Thu, 17 Jun 2021 10:52:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DF544F8025E
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 10:52:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DF544F8025E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de
 header.b="JuXzL/8V"
Received: from localhost (dslb-084-062-104-230.084.062.pools.vodafone-ip.de
 [84.62.104.230])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: ch@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 2FD3980488;
 Thu, 17 Jun 2021 10:52:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1623919964;
 bh=vC+2dzjgp/JxAjdCV0NbI2OvRkd+qLzEHvMIz/YJSvg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JuXzL/8Vx0sFPPmI50+yYILg74j+d8QYUN6Ncd/K6ISsGVbgSCingNM+HLY5NUtFn
 YZuiUfQgbhGkXbe+dKLp+46Ig4TggRBXQEB3katuNgg88553zS2swFe+6TxrcFLsUJ
 Bp6XYBlQBhsooL4HyHtOEFLMdgaZT5GaGwqrsTmouHQ6jQJRcZKpi2/EJen0Ltu8lS
 ySbjZgnsdVhJ9qmN4mpiqhT+0RpdaGh7i+PECUer03CNeU+5/ykYl4B6ysBIvcfrre
 YU+BHNxVs5vbTueRQHs8Var8BOEEe2ell0M7naE+qrM3lKO1ZrdDqzoqXO1tiMEXcY
 pLqTRU0Q4Qpxw==
From: Claudius Heine <ch@denx.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, Marek Vasut <marex@denx.de>,
 Claudius Heine <ch@denx.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Sia Jee Heng <jee.heng.sia@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Michael Sit Wei Hong <michael.wei.hong.sit@intel.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Annaliese McDermond <nh6z@nh6z.net>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/3] ASoC: tlv320aic32x4: add type to device private data
 struct
Date: Thu, 17 Jun 2021 10:52:28 +0200
Message-Id: <20210617085230.1851503-2-ch@denx.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210617085230.1851503-1-ch@denx.de>
References: <20210617085230.1851503-1-ch@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

While this driver can already handle different device variants, the
variant information cannot be used in the driver code and therefor
cannot have different code paths depending on the device variant.

This change adds a `type` value into the `aic32x4_priv` structure, that
contains a device variant identifier, which was set when the driver was
bound to the device.

Signed-off-by: Claudius Heine <ch@denx.de>
---
 sound/soc/codecs/tlv320aic32x4-i2c.c | 20 ++++++++++++++++----
 sound/soc/codecs/tlv320aic32x4-spi.c | 23 +++++++++++++++++++----
 sound/soc/codecs/tlv320aic32x4.c     |  3 +++
 sound/soc/codecs/tlv320aic32x4.h     |  5 +++++
 4 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/tlv320aic32x4-i2c.c b/sound/soc/codecs/tlv320aic32x4-i2c.c
index 6d54cbf70a0b..247fb1e13674 100644
--- a/sound/soc/codecs/tlv320aic32x4-i2c.c
+++ b/sound/soc/codecs/tlv320aic32x4-i2c.c
@@ -16,6 +16,8 @@
 
 #include "tlv320aic32x4.h"
 
+static const struct of_device_id aic32x4_of_id[];
+
 static int aic32x4_i2c_probe(struct i2c_client *i2c,
 			     const struct i2c_device_id *id)
 {
@@ -27,6 +29,16 @@ static int aic32x4_i2c_probe(struct i2c_client *i2c,
 	config.val_bits = 8;
 
 	regmap = devm_regmap_init_i2c(i2c, &config);
+
+	if (i2c->dev.of_node) {
+		const struct of_device_id *oid;
+
+		oid = of_match_node(aic32x4_of_id, i2c->dev.of_node);
+		dev_set_drvdata(&i2c->dev, (void *)oid->data);
+	} else if (id) {
+		dev_set_drvdata(&i2c->dev, (void *)id->driver_data);
+	}
+
 	return aic32x4_probe(&i2c->dev, regmap);
 }
 
@@ -36,15 +48,15 @@ static int aic32x4_i2c_remove(struct i2c_client *i2c)
 }
 
 static const struct i2c_device_id aic32x4_i2c_id[] = {
-	{ "tlv320aic32x4", 0 },
-	{ "tlv320aic32x6", 1 },
+	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
+	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(i2c, aic32x4_i2c_id);
 
 static const struct of_device_id aic32x4_of_id[] = {
-	{ .compatible = "ti,tlv320aic32x4", },
-	{ .compatible = "ti,tlv320aic32x6", },
+	{ .compatible = "ti,tlv320aic32x4", .data = (void *)AIC32X4_TYPE_AIC32X4 },
+	{ .compatible = "ti,tlv320aic32x6", .data = (void *)AIC32X4_TYPE_AIC32X6 },
 	{ /* senitel */ }
 };
 MODULE_DEVICE_TABLE(of, aic32x4_of_id);
diff --git a/sound/soc/codecs/tlv320aic32x4-spi.c b/sound/soc/codecs/tlv320aic32x4-spi.c
index a22e7700bfc8..e81c72958a82 100644
--- a/sound/soc/codecs/tlv320aic32x4-spi.c
+++ b/sound/soc/codecs/tlv320aic32x4-spi.c
@@ -16,6 +16,8 @@
 
 #include "tlv320aic32x4.h"
 
+static const struct of_device_id aic32x4_of_id[];
+
 static int aic32x4_spi_probe(struct spi_device *spi)
 {
 	struct regmap *regmap;
@@ -28,6 +30,19 @@ static int aic32x4_spi_probe(struct spi_device *spi)
 	config.read_flag_mask = 0x01;
 
 	regmap = devm_regmap_init_spi(spi, &config);
+
+	if (spi->dev.of_node) {
+		const struct of_device_id *oid;
+
+		oid = of_match_node(aic32x4_of_id, spi->dev.of_node);
+		dev_set_drvdata(&spi->dev, (void *)oid->data);
+	} else {
+		const struct spi_device_id *id_entry;
+
+		id_entry = spi_get_device_id(spi);
+		dev_set_drvdata(&spi->dev, (void *)id_entry->driver_data);
+	}
+
 	return aic32x4_probe(&spi->dev, regmap);
 }
 
@@ -37,15 +52,15 @@ static int aic32x4_spi_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id aic32x4_spi_id[] = {
-	{ "tlv320aic32x4", 0 },
-	{ "tlv320aic32x6", 1 },
+	{ "tlv320aic32x4", (kernel_ulong_t)AIC32X4_TYPE_AIC32X4 },
+	{ "tlv320aic32x6", (kernel_ulong_t)AIC32X4_TYPE_AIC32X6 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, aic32x4_spi_id);
 
 static const struct of_device_id aic32x4_of_id[] = {
-	{ .compatible = "ti,tlv320aic32x4", },
-	{ .compatible = "ti,tlv320aic32x6", },
+	{ .compatible = "ti,tlv320aic32x4", .data = (void *)AIC32X4_TYPE_AIC32X4 },
+	{ .compatible = "ti,tlv320aic32x6", .data = (void *)AIC32X4_TYPE_AIC32X6 },
 	{ /* senitel */ }
 };
 MODULE_DEVICE_TABLE(of, aic32x4_of_id);
diff --git a/sound/soc/codecs/tlv320aic32x4.c b/sound/soc/codecs/tlv320aic32x4.c
index b689f26fc4be..70a1574fb72a 100644
--- a/sound/soc/codecs/tlv320aic32x4.c
+++ b/sound/soc/codecs/tlv320aic32x4.c
@@ -48,6 +48,7 @@ struct aic32x4_priv {
 
 	struct aic32x4_setup_data *setup;
 	struct device *dev;
+	enum aic32x4_type type;
 };
 
 static int aic32x4_reset_adc(struct snd_soc_dapm_widget *w,
@@ -1198,6 +1199,8 @@ int aic32x4_probe(struct device *dev, struct regmap *regmap)
 		return -ENOMEM;
 
 	aic32x4->dev = dev;
+	aic32x4->type = (enum aic32x4_type)dev_get_drvdata(dev);
+
 	dev_set_drvdata(dev, aic32x4);
 
 	if (pdata) {
diff --git a/sound/soc/codecs/tlv320aic32x4.h b/sound/soc/codecs/tlv320aic32x4.h
index 7550122e9f8a..8a18dbec76a6 100644
--- a/sound/soc/codecs/tlv320aic32x4.h
+++ b/sound/soc/codecs/tlv320aic32x4.h
@@ -10,6 +10,11 @@
 struct device;
 struct regmap_config;
 
+enum aic32x4_type {
+	AIC32X4_TYPE_AIC32X4 = 0,
+	AIC32X4_TYPE_AIC32X6,
+};
+
 extern const struct regmap_config aic32x4_regmap_config;
 int aic32x4_probe(struct device *dev, struct regmap *regmap);
 int aic32x4_remove(struct device *dev);
-- 
2.32.0

