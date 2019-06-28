Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6D15D62E
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Jul 2019 20:34:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 924C016A0;
	Tue,  2 Jul 2019 20:33:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 924C016A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1562092448;
	bh=vDnA4j9WXnoBN+Jw1dwhywo0D1tsmBaX8S7T57XOZnk=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=po8Nhp5EkPn2dWGs+zzFHtv/nw00XV7DvAnWmZH5uQ5AUOsH9h5BiRqsUpSoZkL5A
	 r3nC1stBC8rAGcv+IyK6IJDBAevAX7AtPp08o3gAcS7Ra9058630G9cEsSVzsMi/IQ
	 bD39hBfZlSLfTLPfPp8Edt7GX0brcEioKOM+us1k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AB361F800C7;
	Tue,  2 Jul 2019 20:32:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E33A1F896B9; Fri, 28 Jun 2019 14:34:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.steuer-voss.de (mail.steuer-voss.de [85.183.69.95])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10596F80058
 for <alsa-devel@alsa-project.org>; Fri, 28 Jun 2019 14:34:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10596F80058
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: from pc-niv.weinmann.com (localhost [127.0.0.1])
 by mail.steuer-voss.de (Postfix) with ESMTP id 7C1514D3ED;
 Fri, 28 Jun 2019 14:34:35 +0200 (CEST)
From: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andreas Dannenberg <dannenberg@ti.com>, "Andrew F. Davis" <afd@ti.com>,
 Kate Stewart <kstewart@linuxfoundation.org>
Date: Fri, 28 Jun 2019 14:34:16 +0200
Message-Id: <20190628123416.16298-1-nikolaus.voss@loewensteinmedical.de>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Tue, 02 Jul 2019 20:32:20 +0200
Cc: linux-acpi@vger.kernel.org, alsa-devel@alsa-project.org, nv@vosn.de,
 linux-kernel@vger.kernel.org,
 Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
Subject: [alsa-devel] [PATCH] sound/soc/codecs/tas5720.c: add ACPI support
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

Add support for ACPI enumeration for tas5720 and tas5722.
Use device_match API to unify access to driver data for DT and ACPI.
Aggregate variant stuff into its own struct and directly reference
it in variant data for i2c/of/acpi_device_id.

Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
---
 sound/soc/codecs/tas5720.c | 215 +++++++++++++++++--------------------
 1 file changed, 99 insertions(+), 116 deletions(-)

diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index 37fab8f22800..ea973764c745 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -7,6 +7,7 @@
  * Author: Andreas Dannenberg <dannenberg@ti.com>
  */
 
+#include <linux/acpi.h>
 #include <linux/module.h>
 #include <linux/errno.h>
 #include <linux/device.h>
@@ -28,9 +29,10 @@
 /* Define how often to check (and clear) the fault status register (in ms) */
 #define TAS5720_FAULT_CHECK_INTERVAL		200
 
-enum tas572x_type {
-	TAS5720,
-	TAS5722,
+struct tas5720_variant {
+	const int device_id;
+	const struct regmap_config reg_config;
+	const struct snd_soc_component_driver comp_drv;
 };
 
 static const char * const tas5720_supply_names[] = {
@@ -44,7 +46,7 @@ struct tas5720_data {
 	struct snd_soc_component *component;
 	struct regmap *regmap;
 	struct i2c_client *tas5720_client;
-	enum tas572x_type devtype;
+	const struct tas5720_variant *variant;
 	struct regulator_bulk_data supplies[TAS5720_NUM_SUPPLIES];
 	struct delayed_work fault_check_work;
 	unsigned int last_fault;
@@ -179,17 +181,13 @@ static int tas5720_set_dai_tdm_slot(struct snd_soc_dai *dai,
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
@@ -277,7 +275,7 @@ static void tas5720_fault_check_work(struct work_struct *work)
 static int tas5720_codec_probe(struct snd_soc_component *component)
 {
 	struct tas5720_data *tas5720 = snd_soc_component_get_drvdata(component);
-	unsigned int device_id, expected_device_id;
+	unsigned int device_id;
 	int ret;
 
 	tas5720->component = component;
@@ -301,21 +299,9 @@ static int tas5720_codec_probe(struct snd_soc_component *component)
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
@@ -462,24 +448,6 @@ static bool tas5720_is_volatile_reg(struct device *dev, unsigned int reg)
 	}
 }
 
-static const struct regmap_config tas5720_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = TAS5720_MAX_REG,
-	.cache_type = REGCACHE_RBTREE,
-	.volatile_reg = tas5720_is_volatile_reg,
-};
-
-static const struct regmap_config tas5722_regmap_config = {
-	.reg_bits = 8,
-	.val_bits = 8,
-
-	.max_register = TAS5722_MAX_REG,
-	.cache_type = REGCACHE_RBTREE,
-	.volatile_reg = tas5720_is_volatile_reg,
-};
-
 /*
  * DAC analog gain. There are four discrete values to select from, ranging
  * from 19.2 dB to 26.3dB.
@@ -558,40 +526,6 @@ static const struct snd_soc_dapm_route tas5720_audio_map[] = {
 	{ "OUT", NULL, "DAC" },
 };
 
-static const struct snd_soc_component_driver soc_component_dev_tas5720 = {
-	.probe			= tas5720_codec_probe,
-	.remove			= tas5720_codec_remove,
-	.suspend		= tas5720_suspend,
-	.resume			= tas5720_resume,
-	.controls		= tas5720_snd_controls,
-	.num_controls		= ARRAY_SIZE(tas5720_snd_controls),
-	.dapm_widgets		= tas5720_dapm_widgets,
-	.num_dapm_widgets	= ARRAY_SIZE(tas5720_dapm_widgets),
-	.dapm_routes		= tas5720_audio_map,
-	.num_dapm_routes	= ARRAY_SIZE(tas5720_audio_map),
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
-static const struct snd_soc_component_driver soc_component_dev_tas5722 = {
-	.probe = tas5720_codec_probe,
-	.remove = tas5720_codec_remove,
-	.suspend = tas5720_suspend,
-	.resume = tas5720_resume,
-	.controls = tas5722_snd_controls,
-	.num_controls = ARRAY_SIZE(tas5722_snd_controls),
-	.dapm_widgets = tas5720_dapm_widgets,
-	.num_dapm_widgets = ARRAY_SIZE(tas5720_dapm_widgets),
-	.dapm_routes = tas5720_audio_map,
-	.num_dapm_routes = ARRAY_SIZE(tas5720_audio_map),
-	.idle_bias_on		= 1,
-	.use_pmdown_time	= 1,
-	.endianness		= 1,
-	.non_legacy_dai_naming	= 1,
-};
-
 /* PCM rates supported by the TAS5720 driver */
 #define TAS5720_RATES	(SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |\
 			 SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000)
@@ -637,29 +571,25 @@ static int tas5720_probe(struct i2c_client *client,
 {
 	struct device *dev = &client->dev;
 	struct tas5720_data *data;
-	const struct regmap_config *regmap_config;
+	const struct tas5720_variant *type;
 	int ret;
 	int i;
 
+	type = device_get_match_data(&client->dev);
+	if (!type && id)
+		type = (const struct tas5720_variant *)id->driver_data;
+
+	if (!type)
+		return -EINVAL;
+
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
 		return -ENOMEM;
 
 	data->tas5720_client = client;
-	data->devtype = id->driver_data;
+	data->variant = type;
 
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
+	data->regmap = devm_regmap_init_i2c(client, &type->reg_config);
 	if (IS_ERR(data->regmap)) {
 		ret = PTR_ERR(data->regmap);
 		dev_err(dev, "failed to allocate register map: %d\n", ret);
@@ -678,51 +608,104 @@ static int tas5720_probe(struct i2c_client *client,
 
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
+	ret = devm_snd_soc_register_component(&client->dev,
+					      &type->comp_drv,
+					      tas5720_dai,
+					      ARRAY_SIZE(tas5720_dai));
 
-	return 0;
+	if (ret < 0)
+		dev_err(dev, "failed to register component: %d\n", ret);
+
+	return ret;
 }
 
+static const struct tas5720_variant variant[] = {
+	{
+		.device_id = TAS5720_DEVICE_ID,
+		.reg_config = {
+			.reg_bits = 8,
+			.val_bits = 8,
+
+			.max_register = TAS5720_MAX_REG,
+			.cache_type = REGCACHE_RBTREE,
+			.volatile_reg = tas5720_is_volatile_reg,
+		},
+		.comp_drv = {
+			.probe = tas5720_codec_probe,
+			.remove = tas5720_codec_remove,
+			.suspend = tas5720_suspend,
+			.resume = tas5720_resume,
+			.controls = tas5720_snd_controls,
+			.num_controls = ARRAY_SIZE(tas5720_snd_controls),
+			.dapm_widgets = tas5720_dapm_widgets,
+			.num_dapm_widgets = ARRAY_SIZE(tas5720_dapm_widgets),
+			.dapm_routes = tas5720_audio_map,
+			.num_dapm_routes = ARRAY_SIZE(tas5720_audio_map),
+			.idle_bias_on = 1,
+			.use_pmdown_time = 1,
+			.endianness = 1,
+			.non_legacy_dai_naming = 1
+		},
+	},
+	{
+		.device_id = TAS5722_DEVICE_ID,
+		.reg_config = {
+			.reg_bits = 8,
+			.val_bits = 8,
+
+			.max_register = TAS5722_MAX_REG,
+			.cache_type = REGCACHE_RBTREE,
+			.volatile_reg = tas5720_is_volatile_reg,
+		},
+		.comp_drv = {
+			.probe = tas5720_codec_probe,
+			.remove = tas5720_codec_remove,
+			.suspend = tas5720_suspend,
+			.resume = tas5720_resume,
+			.controls = tas5722_snd_controls,
+			.num_controls = ARRAY_SIZE(tas5722_snd_controls),
+			.dapm_widgets = tas5720_dapm_widgets,
+			.num_dapm_widgets = ARRAY_SIZE(tas5720_dapm_widgets),
+			.dapm_routes = tas5720_audio_map,
+			.num_dapm_routes = ARRAY_SIZE(tas5720_audio_map),
+			.idle_bias_on = 1,
+			.use_pmdown_time = 1,
+			.endianness = 1,
+			.non_legacy_dai_naming = 1,
+		},
+	},
+};
+
 static const struct i2c_device_id tas5720_id[] = {
-	{ "tas5720", TAS5720 },
-	{ "tas5722", TAS5722 },
+	{ "tas5720", (kernel_ulong_t)&variant[0] },
+	{ "tas5722", (kernel_ulong_t)&variant[1] },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, tas5720_id);
 
 #if IS_ENABLED(CONFIG_OF)
 static const struct of_device_id tas5720_of_match[] = {
-	{ .compatible = "ti,tas5720", },
-	{ .compatible = "ti,tas5722", },
+	{ .compatible = "ti,tas5720", .data = &variant[0], },
+	{ .compatible = "ti,tas5722", .data = &variant[1], },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, tas5720_of_match);
 #endif
 
+#if IS_ENABLED(CONFIG_ACPI)
+static const struct acpi_device_id tas5720_acpi_match[] = {
+	{ "10TI5720", (kernel_ulong_t)&variant[0] },
+	{ "10TI5722", (kernel_ulong_t)&variant[1] },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, tas5720_acpi_match);
+#endif
+
 static struct i2c_driver tas5720_i2c_driver = {
 	.driver = {
 		.name = "tas5720",
 		.of_match_table = of_match_ptr(tas5720_of_match),
+		.acpi_match_table = ACPI_PTR(tas5720_acpi_match),
 	},
 	.probe = tas5720_probe,
 	.id_table = tas5720_id,
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
