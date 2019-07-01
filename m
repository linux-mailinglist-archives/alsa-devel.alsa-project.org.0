Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C16E5D636
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 20:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 332601694;
	Tue,  2 Jul 2019 20:36:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 332601694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562092644;
	bh=AdmNgDo10pQ3VqE7Gf/1E6G3dXNBwt3rhftg8gNroHY=;
	h=From:To:Date:In-Reply-To:References:In-Reply-To:References:Cc:
	 Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From;
	b=HWE0e4ztEiKy2SAPPR0DVqYhIZ3+9D+x08/8aMfF3rc5YRiQmF9cLsjHKnxkMuoIf
	 x/D0Ozin/kQQ7kUYSuiJRohR/c4BfkCpMvDomDg0Me4BzgDnhNawjoT1mb++rcsLF3
	 UY6ND/ZuloCTGt6TwUKn2wckvRUzYUao+j9KKKlk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6F4DF80133;
	Tue,  2 Jul 2019 20:32:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94B3EF89674; Mon,  1 Jul 2019 15:43:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EDF8DF89670
 for <alsa-devel@alsa-project.org>; Mon,  1 Jul 2019 15:43:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EDF8DF89670
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from pc-niv.weinmann.com (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 3C21B4D0ED;
 Mon,  1 Jul 2019 15:43:08 +0200 (CEST)
From: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andreas Dannenberg <dannenberg@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Kate Stewart <kstewart@linuxfoundation.org>
Date: Mon,  1 Jul 2019 15:42:51 +0200
Message-Id: <c79df50175d59265a37c5e7c8a0cfbf8119bcf78.1561988282.git.nikolaus.voss@loewensteinmedical.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
References: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
In-Reply-To: <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
References: <20190628143037.GH5379@sirena.org.uk>
 <cover.1561988282.git.nikolaus.voss@loewensteinmedical.de>
X-Mailman-Approved-At: Tue, 02 Jul 2019 20:32:20 +0200
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org, nv@vosn.de,
 linux-kernel@vger.kernel.org,
 Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Subject: [alsa-devel] [PATCH v2 1/2] ASoC: tas5720.c: cleanup variant
	management
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Replace enum tas572x_type with struct tas5720_variant which aggregates
variant specific stuff and can be directly referenced from an id table.

Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
---
 sound/soc/codecs/tas5720.c | 98 +++++++++++++-------------------------
 1 file changed, 33 insertions(+), 65 deletions(-)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 37fab8f22800..b2e897f094b4 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -28,9 +28,10 @@
 /* Define how often to check (and clear) the fault status register (in ms) */
 #define TAS5720_FAULT_CHECK_INTERVAL		200
 
-enum tas572x_type {
-	TAS5720,
-	TAS5722,
+struct tas5720_variant {
+	const int device_id;
+	const struct regmap_config *reg_config;
+	const struct snd_soc_component_driver *comp_drv;
 };
 
 static const char * const tas5720_supply_names[] = {
@@ -44,7 +45,7 @@ struct tas5720_data {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
 	struct i2c_client *tas5720_client;
-	enum tas572x_type devtype;
+	const struct tas5720_variant *variant;
 	struct regulator_bulk_data supplies[TAS5720_NUM_SUPPLIES];
 	struct delayed_work fault_check_work;
 	unsigned int last_fault;
@@ -179,17 +180,13 @@ static int tas5720_set_dai_tdm_slot(struct snd_soc_dai *dai,
 		goto error_snd_soc_component_update_bits;
 
 	/* Configure TDM slot width. This is only applicable to TAS5722. */
-	switch (tas5720->devtype) {
-	case TAS5722:
+	if (tas5720->variant->device_id == TAS5722_DEVICE_ID) {
 		ret = snd_soc_component_update_bits(component, TAS5722_DIGITAL_CTRL2_REG,
 						    TAS5722_TDM_SLOT_16B,
 						    slot_width == 16 ?
 						    TAS5722_TDM_SLOT_16B : 0);
 		if (ret < 0)
 			goto error_snd_soc_component_update_bits;
-		break;
-	default:
-		break;
 	}
 
 	return 0;
@@ -277,7 +274,7 @@ static void tas5720_fault_check_work(struct work_struct *work)
 static int tas5720_codec_probe(struct snd_soc_component *component)
 {
 	struct tas5720_data *tas5720 = snd_soc_component_get_drvdata(component);
-	unsigned int device_id, expected_device_id;
+	unsigned int device_id;
 	int ret;
 
 	tas5720->component = component;
@@ -301,21 +298,9 @@ static int tas5720_codec_probe(struct snd_soc_component *component)
 		goto probe_fail;
 	}
 
-	switch (tas5720->devtype) {
-	case TAS5720:
-		expected_device_id = TAS5720_DEVICE_ID;
-		break;
-	case TAS5722:
-		expected_device_id = TAS5722_DEVICE_ID;
-		break;
-	default:
-		dev_err(component->dev, "unexpected private driver data\n");
-		return -EINVAL;
-	}
-
-	if (device_id != expected_device_id)
+	if (device_id != tas5720->variant->device_id)
 		dev_warn(component->dev, "wrong device ID. expected: %u read: %u\n",
-			 expected_device_id, device_id);
+			 tas5720->variant->device_id, device_id);
 
 	/* Set device to mute */
 	ret = snd_soc_component_update_bits(component, TAS5720_DIGITAL_CTRL2_REG,
@@ -637,7 +622,6 @@ static int tas5720_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct tas5720_data *data;
-	const struct regmap_config *regmap_config;
 	int ret;
 	int i;
 
@@ -646,20 +630,10 @@ static int tas5720_probe(struct i2c_client *client,
 		return -ENOMEM;
 
 	data->tas5720_client = client;
-	data->devtype = id->driver_data;
 
-	switch (id->driver_data) {
-	case TAS5720:
-		regmap_config = &tas5720_regmap_config;
-		break;
-	case TAS5722:
-		regmap_config = &tas5722_regmap_config;
-		break;
-	default:
-		dev_err(dev, "unexpected private driver data\n");
-		return -EINVAL;
-	}
-	data->regmap = devm_regmap_init_i2c(client, regmap_config);
+	data->variant = (const struct tas5720_variant *)id->driver_data;
+
+	data->regmap = devm_regmap_init_i2c(client, data->variant->reg_config);
 	if (IS_ERR(data->regmap)) {
 		ret = PTR_ERR(data->regmap);
 		dev_err(dev, "failed to allocate register map: %d\n", ret);
@@ -678,42 +652,36 @@ static int tas5720_probe(struct i2c_client *client,
 
 	dev_set_drvdata(dev, data);
 
-	switch (id->driver_data) {
-	case TAS5720:
-		ret = devm_snd_soc_register_component(&client->dev,
-					&soc_component_dev_tas5720,
-					tas5720_dai,
-					ARRAY_SIZE(tas5720_dai));
-		break;
-	case TAS5722:
-		ret = devm_snd_soc_register_component(&client->dev,
-					&soc_component_dev_tas5722,
-					tas5720_dai,
-					ARRAY_SIZE(tas5720_dai));
-		break;
-	default:
-		dev_err(dev, "unexpected private driver data\n");
-		return -EINVAL;
-	}
-	if (ret < 0) {
-		dev_err(dev, "failed to register component: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	ret = devm_snd_soc_register_component(&client->dev,
+					      data->variant->comp_drv,
+					      tas5720_dai,
+					      ARRAY_SIZE(tas5720_dai));
+	return ret;
 }
 
+static const struct tas5720_variant tas5720 = {
+	.device_id = TAS5720_DEVICE_ID,
+	.reg_config = &tas5720_regmap_config,
+	.comp_drv = &soc_component_dev_tas5720,
+};
+
+static const struct tas5720_variant tas5722 = {
+	.device_id = TAS5722_DEVICE_ID,
+	.reg_config = &tas5722_regmap_config,
+	.comp_drv = &soc_component_dev_tas5722,
+};
+
 static const struct i2c_device_id tas5720_id[] = {
-	{ "tas5720", TAS5720 },
-	{ "tas5722", TAS5722 },
+	{ "tas5720", (kernel_ulong_t)&tas5720 },
+	{ "tas5722", (kernel_ulong_t)&tas5722 },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas5720_id);
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id tas5720_of_match[] = {
-	{ .compatible = "ti,tas5720", },
-	{ .compatible = "ti,tas5722", },
+	{ .compatible = "ti,tas5720", .data = &tas5720, },
+	{ .compatible = "ti,tas5722", .data = &tas5722, },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tas5720_of_match);
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
