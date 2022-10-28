Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9E8610BA1
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 09:52:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 336AF1DF8;
	Fri, 28 Oct 2022 09:51:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 336AF1DF8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666943544;
	bh=g2HOXlcq27dS+5p/kOiiT1CUlxfHDFPpGhG01ABLbaY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nZAPH1Pi9ehckib7qwpwKBQuckVY//wUN64q5aps4NLBu0ee9/2NpmdOzR6f09dsI
	 9VBtboiI/l7Hjh9daY9PXv3eeJ9eerm7iNrZ3rTfCyIhMwQ6m6YXnSXYEhJcvB1t/q
	 QexBa4ebCmCtc79orMEWUjKqAbKvnKJxpVS0vhFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90AEEF80095;
	Fri, 28 Oct 2022 09:51:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFF6F80095; Fri, 28 Oct 2022 09:51:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BB7B2F80095
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 09:51:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BB7B2F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=berginkonsult.se header.i=@berginkonsult.se
 header.b="b1rslmFI"; 
 dkim=permerror (0-bit key) header.d=berginkonsult.se
 header.i=@berginkonsult.se header.b="bxjeMmv9"
Received: from mailrelay2.pub.mailoutpod2-cph3.one.com
 (mailrelay2.pub.mailoutpod2-cph3.one.com [104.37.34.7])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPS
 id 5007214d-5695-11ed-a6d5-d0431ea8a283;
 Fri, 28 Oct 2022 07:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=JJ6RTURksiY/7wtii2ETOjZWEd74cAxGjOUvplYXsgw=;
 b=b1rslmFILNBtyqhDkzhUEO+JWuEHukVMm77cTKP+J2a1QvaOlMr6jGM0pRvWdkXEAgI/aBoHOb3vC
 1Ej5SaTMREFCRZAzeaH0VpBGfnblnsc//N29ZFN4Y6R0WW0YNf1M6PFLLWnbZ5RXJojtcX+KBckOtT
 BiTQ7tbb5yWXUNIsNIfS8TRH0qRVVZVopCZjZFNP9LV2t9DWkKMEEU8x5fbAQ/nliwxGxWZUQG1s75
 q0azxWCcyzDtzhaTr/SORgjAyK6WYCCS6FuTvhxu4p5HlP2uunl/6rQZaXEFUE7W5mENhyKRNjt9xd
 DsaqGSjQbi9/OVYZyamxGkya4FJIg/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=berginkonsult.se; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=JJ6RTURksiY/7wtii2ETOjZWEd74cAxGjOUvplYXsgw=;
 b=bxjeMmv9KkfHQ+q8/VzHWFSOT11QI2qNpyIzg1nR4ajqy0gqGLdcpZKn3DXAX2WeOvdplje1ciSDY
 Pi4Q/i4Dw==
X-HalOne-ID: 4d01e38b-5695-11ed-aa1c-335755252108
Received: from pbergin-7420.. (ua-213-113-159-147.bbcust.telenor.se
 [213.113.159.147]) by mailrelay2 (Halon) with ESMTPSA
 id 4d01e38b-5695-11ed-aa1c-335755252108;
 Fri, 28 Oct 2022 07:51:20 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: james.schulman@cirrus.com, david.rhodes@cirrus.com,
 tanureal@opensource.cirrus.com, rf@opensource.cirrus.com,
 broonie@kernel.org
Subject: [PATCH v2] ASoC: cs42xx8-i2c.c: add module device table for of
Date: Fri, 28 Oct 2022 09:50:44 +0200
Message-Id: <20221028075045.493191-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027115057.442925-1-peter@berginkonsult.se>
References: <20221027115057.442925-1-peter@berginkonsult.se>
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

Matching of device in cs42xx8_i2c_probe() is coded with inspiration
from tlv320aic32x4-i2c.c.

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
v2: reworked and removed duplication of cs42xx8_of_match

 sound/soc/codecs/cs42xx8-i2c.c | 49 +++++++++++++++++++++++++++++++---
 sound/soc/codecs/cs42xx8.c     | 33 +++--------------------
 sound/soc/codecs/cs42xx8.h     |  5 +---
 3 files changed, 50 insertions(+), 37 deletions(-)

diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index bd80e9fc907f..9f9e57398272 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -17,10 +17,32 @@
 
 #include "cs42xx8.h"
 
+static const struct i2c_device_id cs42xx8_i2c_id[];
+static const struct of_device_id cs42xx8_of_match[];
+
 static int cs42xx8_i2c_probe(struct i2c_client *i2c)
 {
-	int ret = cs42xx8_probe(&i2c->dev,
-			devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config));
+	int ret;
+	struct cs42xx8_driver_data *drvdata;
+
+	if (i2c->dev.of_node) {
+		const struct of_device_id *oid;
+
+		oid = of_match_node(cs42xx8_of_match, i2c->dev.of_node);
+		if (!oid)
+			goto err_not_found;
+		drvdata = (struct cs42xx8_driver_data *)oid->data;
+	} else {
+		const struct i2c_device_id *id;
+
+		id = i2c_match_id(cs42xx8_i2c_id, i2c);
+		if (!id)
+			goto err_not_found;
+		drvdata = (struct cs42xx8_driver_data *)id->driver_data;
+	}
+
+	ret = cs42xx8_probe(&i2c->dev,
+		devm_regmap_init_i2c(i2c, &cs42xx8_regmap_config), drvdata);
 	if (ret)
 		return ret;
 
@@ -28,6 +50,10 @@ static int cs42xx8_i2c_probe(struct i2c_client *i2c)
 	pm_request_idle(&i2c->dev);
 
 	return 0;
+
+err_not_found:
+	dev_err(&i2c->dev, "failed to find driver data\n");
+	return -EINVAL;
 }
 
 static void cs42xx8_i2c_remove(struct i2c_client *i2c)
@@ -35,7 +61,24 @@ static void cs42xx8_i2c_remove(struct i2c_client *i2c)
 	pm_runtime_disable(&i2c->dev);
 }
 
-static struct i2c_device_id cs42xx8_i2c_id[] = {
+static const struct cs42xx8_driver_data cs42448_data = {
+	.name = "cs42448",
+	.num_adcs = 3,
+};
+
+static const struct cs42xx8_driver_data cs42888_data = {
+	.name = "cs42888",
+	.num_adcs = 2,
+};
+
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
index d14eb2f6e1dd..957ae08bcf7c 100644
--- a/sound/soc/codecs/cs42xx8.c
+++ b/sound/soc/codecs/cs42xx8.c
@@ -499,29 +499,8 @@ static const struct snd_soc_component_driver cs42xx8_driver = {
 	.endianness		= 1,
 };
 
-const struct cs42xx8_driver_data cs42448_data = {
-	.name = "cs42448",
-	.num_adcs = 3,
-};
-EXPORT_SYMBOL_GPL(cs42448_data);
-
-const struct cs42xx8_driver_data cs42888_data = {
-	.name = "cs42888",
-	.num_adcs = 2,
-};
-EXPORT_SYMBOL_GPL(cs42888_data);
-
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
 
@@ -535,17 +514,11 @@ int cs42xx8_probe(struct device *dev, struct regmap *regmap)
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
index d36c61b6df74..938e21d92ac2 100644
--- a/sound/soc/codecs/cs42xx8.h
+++ b/sound/soc/codecs/cs42xx8.h
@@ -19,11 +19,8 @@ struct cs42xx8_driver_data {
 };
 
 extern const struct dev_pm_ops cs42xx8_pm;
-extern const struct cs42xx8_driver_data cs42448_data;
-extern const struct cs42xx8_driver_data cs42888_data;
 extern const struct regmap_config cs42xx8_regmap_config;
-extern const struct of_device_id cs42xx8_of_match[];
-int cs42xx8_probe(struct device *dev, struct regmap *regmap);
+int cs42xx8_probe(struct device *dev, struct regmap *regmap, struct cs42xx8_driver_data *drvdata);
 
 /* CS42888 register map */
 #define CS42XX8_CHIPID				0x01	/* Chip ID */
-- 
2.34.1

