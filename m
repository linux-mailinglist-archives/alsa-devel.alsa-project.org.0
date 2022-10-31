Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961C613F14
	for <lists+alsa-devel@lfdr.de>; Mon, 31 Oct 2022 21:39:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE5D1666;
	Mon, 31 Oct 2022 21:38:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE5D1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667248754;
	bh=DGQPVO1YfTFNH+1iT2+Jg/UbLmbdBE/wwWeHbVOm8XA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=horcvZ/RBEkxLv1zJEOvhANWZGiJnENkb7qwWs8fYoDd0GztbFLQndqRwzBif/HsP
	 OtUinBCR4mAtbm5adFWG19N+DtwS8Uq3fBsLKqiYUcu4vm2yXtKKGWlrD2npn30Wwg
	 j8DHTHE4YrXPg+j8hMnlu7/rZagiDtjg7XbWvp9k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55399F80163;
	Mon, 31 Oct 2022 21:38:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CA2BF8015B; Mon, 31 Oct 2022 21:38:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B2507F800E1
 for <alsa-devel@alsa-project.org>; Mon, 31 Oct 2022 21:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B2507F800E1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=berginkonsult.se header.i=@berginkonsult.se
 header.b="cw2wtB63"; 
 dkim=permerror (0-bit key) header.d=berginkonsult.se
 header.i=@berginkonsult.se header.b="UUbWdtHD"
Received: from mailrelay2.pub.mailoutpod2-cph3.one.com
 (mailrelay2.pub.mailoutpod2-cph3.one.com [104.37.34.7])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id ee76cdc0-595b-11ed-824f-d0431ea8bb10;
 Mon, 31 Oct 2022 20:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=rsa1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=LZgWzj1DV2YwhApqlnR9pyjFzmdX/olcHYd6kth181k=;
 b=cw2wtB63eQ+YbjTSWFVI8qwuoAoCJohU00hA1XaMa2wXrQu3zg25SPFjm4GGlsXrMLgBNpGqd330d
 dHtflKrhHaNMLn+JSoQbAxSGT4Tohjem9mssfmPp/NDhfJE0f2Yke5qYXTsViEkfSHn13tmeO/HhLW
 5QcZ1VOCZ1ZrgRj8+OCvhmN0moTXy4dc/aK3UuO8/Xuwoj9bvn4DEbAkYRA9exkjo5ddjsxjSrZsJn
 Z1bjpztiRvE3rNZPk74c+hYESJkZQ4ayGCQzwZ7BLMCWOCeD52ZeOOB3qrAyAUS2VIL416ddxgE4D8
 pfaVe3GtG/AD1nURqI/QKRMY5Q86h1A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=ed1;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
 from; bh=LZgWzj1DV2YwhApqlnR9pyjFzmdX/olcHYd6kth181k=;
 b=UUbWdtHD61jjgMwJMFUmB3eL3k7QZloqeKzvNRGODN8Lc60htWCV6rB42a0H1XAKOJuNFgaggEZQm
 98DANqXDQ==
X-HalOne-ID: ec594405-595b-11ed-a68e-335755252108
Received: from pbergin-7420.. (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147]) by mailrelay2 (Halon) with ESMTPSA
 id ec594405-595b-11ed-a68e-335755252108;
 Mon, 31 Oct 2022 20:38:09 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 broonie@kernel.org, ckeepax@opensource.cirrus.com
Subject: [PATCH v3] ASoC: cs42xx8-i2c.c: add module device table for of
Date: Mon, 31 Oct 2022 21:37:23 +0100
Message-Id: <20221031203723.168177-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Peter Bergin <peter@berginkonsult.se>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
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

When trying to connect the device with the driver through
device-tree it is not working. The of_device_id is defined in
cs42xx8.c but is not correctly included in cs42xx8-i2c.c.

Move of_device_id table to cs42xx8-i2c.c. Get cs42xx8_driver_data
in cs42xx8_i2c_probe() and pass as argument to cs42xx8_probe(). Move
error check if no driver data found to cs42xx8_i2c_probe().

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
v3: Revert new funtionality in _probe and not changing behavior.
    Move back data structs to common module to be able to use
    for other interfaces later.

v2: reworked and removed duplication of cs42xx8_of_match

 sound/soc/codecs/cs42xx8-i2c.c | 28 +++++++++++++++++++++++++---
 sound/soc/codecs/cs42xx8.c     | 22 +++-------------------
 sound/soc/codecs/cs42xx8.h     |  3 +--
 3 files changed, 29 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index bd80e9fc907f..052ffb7dcfc6 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -12,15 +12,30 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
 
 #include "cs42xx8.h"
 
+static const struct of_device_id cs42xx8_of_match[];
+
 static int cs42xx8_i2c_probe(struct i2c_client *i2c)
 {
-	int ret = cs42xx8_probe(&i2c->dev,
-			devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config));
+	int ret;
+	struct cs42xx8_driver_data *drvdata;
+	const struct of_device_id *of_id;
+
+	of_id = of_match_device(cs42xx8_of_match, &i2c->dev);
+	if (!of_id) {
+		dev_err(&i2c->dev, "failed to find driver data\n");
+		return -EINVAL;
+	}
+
+	drvdata = (struct cs42xx8_driver_data *)of_id->data;
+
+	ret = cs42xx8_probe(&i2c->dev,
+		devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config), drvdata);
 	if (ret)
 		return ret;
 
@@ -35,7 +50,14 @@ static void cs42xx8_i2c_remove(struct i2c_client *i2c)
 	pm_runtime_disable(&i2c->dev);
 }
 
-static struct i2c_device_id cs42xx8_i2c_id[] = {
+static const struct of_device_id cs42xx8_of_match[] = {
+	{ .compatible = "cirrus,cs42448", .data = &cs42448_data, },
+	{ .compatible = "cirrus,cs42888", .data = &cs42888_data, },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
+
+static const struct i2c_device_id cs42xx8_i2c_id[] = {
 	{"cs42448", (kernel_ulong_t)&cs42448_data},
 	{"cs42888", (kernel_ulong_t)&cs42888_data},
 	{}
diff --git a/sound/soc/codecs/cs42xx8.c b/sound/soc/codecs/cs42xx8.c
index d14eb2f6e1dd..4558ec38a7ac 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -13,7 +13,6 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
@@ -511,17 +510,8 @@ const struct cs42xx8_driver_data cs42888_data = {
 };
 EXPORT_SYMBOL_GPL(cs42888_data);
 
-const struct of_device_id cs42xx8_of_match[] = {
-	{ .compatible = "cirrus,cs42448", .data = &cs42448_data, },
-	{ .compatible = "cirrus,cs42888", .data = &cs42888_data, },
-	{ /* sentinel */ }
-};
-MODULE_DEVICE_TABLE(of, cs42xx8_of_match);
-EXPORT_SYMBOL_GPL(cs42xx8_of_match);
-
-int cs42xx8_probe(struct device *dev, struct regmap *regmap)
+int cs42xx8_probe(struct device *dev, struct regmap *regmap, struct cs42xx8_driver_data *drvdata)
 {
-	const struct of_device_id *of_id;
 	struct cs42xx8_priv *cs42xx8;
 	int ret, val, i;
 
@@ -535,17 +525,11 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap)
 	if (cs42xx8 == NULL)
 		return -ENOMEM;
 
-	cs42xx8->regmap = regmap;
 	dev_set_drvdata(dev, cs42xx8);
 
-	of_id = of_match_device(cs42xx8_of_match, dev);
-	if (of_id)
-		cs42xx8->drvdata = of_id->data;
+	cs42xx8->regmap = regmap;
 
-	if (!cs42xx8->drvdata) {
-		dev_err(dev, "failed to find driver data\n");
-		return -EINVAL;
-	}
+	cs42xx8->drvdata = drvdata;
 
 	cs42xx8->gpiod_reset = devm_gpiod_get_optional(dev, "reset",
 							GPIOD_OUT_HIGH);
diff --git a/sound/soc/codecs/cs42xx8.h b/sound/soc/codecs/cs42xx8.h
index d36c61b6df74..342389e8b1a8 100644
--- a/sound/soc/codecs/cs42xx8.h
+++ b/sound/soc/codecs/cs42xx8.h
@@ -22,8 +22,7 @@ extern const struct dev_pm_ops cs42xx8_pm;
 extern const struct cs42xx8_driver_data cs42448_data;
 extern const struct cs42xx8_driver_data cs42888_data;
 extern const struct regmap_config cs42xx8_regmap_config;
-extern const struct of_device_id cs42xx8_of_match[];
-int cs42xx8_probe(struct device *dev, struct regmap *regmap);
+int cs42xx8_probe(struct device *dev, struct regmap *regmap, struct cs42xx8_driver_data *drvdata);
 
 /* CS42888 register map */
 #define CS42XX8_CHIPID				0x01	/* Chip ID */
-- 
2.34.1

