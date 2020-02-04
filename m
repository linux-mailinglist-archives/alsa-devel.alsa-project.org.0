Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC7F1514B8
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 04:43:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90CB7168A;
	Tue,  4 Feb 2020 04:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90CB7168A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580787817;
	bh=yZs3LuGVXkRu3RJeiccSeeC8lfSd/OAAnieCww/2tEQ=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=kAG9oj5RhjEY3kwslfZia3/90I5ZLVO4aGxwmJf6PCCKcAtGR+KnQKVOhYZJKOJKe
	 RFMkf2O5BZf+NOK5SxM8xEq9UP+tFGOn6QwiHrrhjv/pIYJcVMHvnoIqY3WkcYq1ff
	 jv2Q4FhBG4pKSANbqd+viNhxos/0YGK4Z5A+cpCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEBCBF80051;
	Tue,  4 Feb 2020 04:41:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C684DF80162; Tue,  4 Feb 2020 04:41:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BF3DF80051
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 04:41:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2BF3DF80051
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="noKxKsEi"
Received: by mail-pg1-x543.google.com with SMTP id w21so3190436pgl.9
 for <alsa-devel@alsa-project.org>; Mon, 03 Feb 2020 19:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=1wmDFAPTkYAVmGiYdseoOV0PhssU/32kZAP1D1mGzWo=;
 b=noKxKsEi5hJ2cN/mBOCu3khdeeb7bbWj7tR9w6qPmD+eX8jqCpDkZyQY9nO5WpAeZA
 GzNWgpYijTZ0q7eBbDClz2SaJONmfVvs40Amgr75dA7c7xRfDL/NoCYojvslUcK3l+gV
 nur8NYEHNaC7kp2kCeYxQbi7G98N/2gM2sD9U4AxFQGYoqgJzhcZIPn39aRiRX1EavUk
 21Pzq6OyY9jQjvZC0/smnR24WtF0kPZk6kT74Roc4sx2zTN7i+JSsfHsCr+oXo2NidiA
 vcHoCfVrdx/DoGAOclpJlomGpakDmrVb0mgdFGU4txNrSgm8N9HZ0/qoG7xPODXUdGP+
 ydbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=1wmDFAPTkYAVmGiYdseoOV0PhssU/32kZAP1D1mGzWo=;
 b=dNO6lwlXA7WX8RkVtW0bHROJ/DHk2D2QuoebFftR9wiL5P2KRTVNRosLLbEA2gC2Wz
 p7YOcqXZK86texqqOtm+IyQ2d2m3OcOEnhBhLtl5WWIs7TbGUvrgroMvNm0VEEgIcd2O
 TnVzghewkcZ+Pn/MMmQrwNhNJfEPKrI0j6GCEOTrmF/lvavPJiMU2JyXGdbjpCXthB2+
 t8k/t3DszkT1b2lC/PPxC2WF0kImq5pQ+iho7H9UfbULqKsfqoVYNfosj7Q+SU4dKoLu
 pBHjNIBT8ObzjO1oZ7QPbT7XOc742sT28+jsgbmNSEGHzRRKPR5pNhFwwJBjZZZl0KSH
 zu9Q==
X-Gm-Message-State: APjAAAWnZm2WjrfzkuSpu2iAT4FXGMABgxig1Y8MaO0M9t4JRzMVs4rx
 KBnrN18ammJ93dMK6prQ2H4=
X-Google-Smtp-Source: APXvYqxg3TSdFJZZvoI2dsCVEsSxKOoClXMJvrr+oBpfUQsKLTXYgnyJiFnjM+W2BxkO+0zW38D7rA==
X-Received: by 2002:a63:e309:: with SMTP id f9mr29046059pgh.391.1580787703774; 
 Mon, 03 Feb 2020 19:41:43 -0800 (PST)
Received: from localhost.localdomain ([101.12.16.40])
 by smtp.gmail.com with ESMTPSA id 23sm11294194pfh.28.2020.02.03.19.41.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 03 Feb 2020 19:41:43 -0800 (PST)
From: Jeff Chang <richtek.jeff.chang@gmail.com>
To: lgirdwood@gmail.com
Date: Tue,  4 Feb 2020 11:41:37 +0800
Message-Id: <1580787697-3041-1-git-send-email-richtek.jeff.chang@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: alsa-devel@alsa-project.org, richtek.jeff.chang@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, jeff_chang@richtek.com,
 broonie@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: [alsa-devel] [PATCH] ASoC: MT6660 update to 1.0.8_G
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

From: Jeff Chang <jeff_chang@richtek.com>

1. add parsing register initial table via device tree.
2. add applying initial register value function at component driver.

Signed-off-by: Jeff Chang <jeff_chang@richtek.com>
---
 Documentation/devicetree/bindings/sound/mt6660.txt |  53 ++++++++++
 sound/soc/codecs/mt6660.c                          | 114 ++++++++++++++++++++-
 2 files changed, 164 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sound/mt6660.txt


Following Mr. Mark's Suggestion, I create another patch for applying our chip INIT SETTING.


diff --git a/Documentation/devicetree/bindings/sound/mt6660.txt b/Documentation/devicetree/bindings/sound/mt6660.txt
new file mode 100644
index 0000000..2a1736b
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt6660.txt
@@ -0,0 +1,53 @@
+MT6660 MediaTek Speaker Amplifier
+
+This device supports I2C mode only.
+
+Required properties:
+
+	- compatible : "mediatek,mt6660"
+	
+	- reg : The I2C slave address
+
+Optional properties:
+
+	- rt,init_setting_num : The initial register setting element number.
+
+	- rt,init_setting_addr : the addreses array for INIT Setting table.
+
+	- rt,init_setting_mask : the mask array for INIT Setting table.
+
+	- rt,init_setting_val : the value array for INIT Setting table.
+
+Example:
+
+	mt6660@34 {
+		status = "ok";
+		compatible = "mediatek,mt6660";
+		reg = <0x34>;
+		rt,init_setting_num = <26>;
+		rt,init_setting_addr =
+			<0x20 0x30 0x50 0xB1
+			 0xD3 0xE0 0x98 0xB9
+			 0xB7 0xB6 0x6B 0x07
+			 0xBB 0x69 0xBD 0x70
+			 0x7C 0x46 0x1A 0x1B
+			 0x51 0xA2 0x33 0x4C
+			 0x15 0x68>;
+		rt,init_setting_mask =
+			<0x80 0x01 0x1c 0x0c
+			 0x03 0x01 0x44 0xff
+			 0x7777 0x07 0xe0 0xff
+			 0xff 0xff 0xffff 0xff
+			 0xff 0xff 0xffffffff 0xffffffff
+			 0xff 0xff 0xffff 0xffff
+			 0x1800 0x1f>;
+		rt,init_setting_val =
+			<0x00 0x00 0x04 0x00
+			 0x03 0x00 0x04 0x82
+			 0x7273 0x03 0x20 0x70
+			 0x20 0x40 0x17f8 0x15
+			 0x00 0x1d 0x7fdb7ffe 0x7fdb7ffe
+			 0x58 0xce 0x7fff 0x0116
+			 0x0800 0x07>;
+	};
+
diff --git a/sound/soc/codecs/mt6660.c b/sound/soc/codecs/mt6660.c
index a36c416..5df2780 100644
--- a/sound/soc/codecs/mt6660.c
+++ b/sound/soc/codecs/mt6660.c
@@ -9,7 +9,6 @@
 #include <linux/i2c.h>
 #include <linux/pm_runtime.h>
 #include <linux/delay.h>
-#include <linux/debugfs.h>
 #include <sound/soc.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
@@ -225,14 +224,48 @@ static int _mt6660_chip_power_on(struct mt6660_chip *chip, int on_off)
 				 0x01, on_off ? 0x00 : 0x01);
 }
 
+static int mt6660_apply_plat_data(struct mt6660_chip *chip,
+		struct snd_soc_component *component)
+{
+	size_t i;
+	int num = chip->plat_data.init_setting_num;
+	int ret;
+
+	ret = _mt6660_chip_power_on(chip, 1);
+	if (ret < 0) {
+		dev_err(chip->dev, "%s power on failed\n", __func__);
+		return ret;
+	}
+
+	for (i = 0; i < num; i++) {
+		ret = snd_soc_component_update_bits(component,
+				chip->plat_data.init_setting_addr[i],
+				chip->plat_data.init_setting_mask[i],
+				chip->plat_data.init_setting_val[i]);
+		if (ret < 0)
+			return ret;
+	}
+	ret = _mt6660_chip_power_on(chip, 0);
+	if (ret < 0) {
+		dev_err(chip->dev, "%s power on failed\n", __func__);
+		return ret;
+	}
+	return 0;
+}
+
 static int mt6660_component_probe(struct snd_soc_component *component)
 {
 	struct mt6660_chip *chip = snd_soc_component_get_drvdata(component);
+	int ret;
 
 	dev_dbg(component->dev, "%s\n", __func__);
 	snd_soc_component_init_regmap(component, chip->regmap);
 
-	return 0;
+	ret = mt6660_apply_plat_data(chip, component);
+	if (ret < 0)
+		dev_err(chip->dev, "mt6660 apply plat data failed\n");
+
+	return ret;
 }
 
 static void mt6660_component_remove(struct snd_soc_component *component)
@@ -386,6 +419,75 @@ static int _mt6660_read_chip_revision(struct mt6660_chip *chip)
 	return 0;
 }
 
+static int mt6660_parse_dt(struct mt6660_chip *chip, struct device *dev)
+{
+	struct device_node *np = dev->of_node;
+	u32 val;
+	size_t i;
+
+	if (!np) {
+		dev_err(dev, "no device node\n");
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(np, "rt,init_setting_num", &val)) {
+		dev_err(dev, "no init setting\n");
+		chip->plat_data.init_setting_num = 0;
+	} else {
+		chip->plat_data.init_setting_num = val;
+	}
+
+	if (chip->plat_data.init_setting_num) {
+		chip->plat_data.init_setting_addr =
+			devm_kzalloc(dev, sizeof(u32) *
+			chip->plat_data.init_setting_num, GFP_KERNEL);
+		if (!chip->plat_data.init_setting_addr) {
+			dev_err(dev, "%s addr memory alloc failed\n", __func__);
+			return -ENOMEM;
+		}
+		chip->plat_data.init_setting_mask =
+			devm_kzalloc(dev, sizeof(u32) *
+			chip->plat_data.init_setting_num, GFP_KERNEL);
+		if (!chip->plat_data.init_setting_mask) {
+			dev_err(dev, "%s mask memory alloc failed\n", __func__);
+			return -ENOMEM;
+		}
+		chip->plat_data.init_setting_val =
+			devm_kzalloc(dev, sizeof(u32) *
+			chip->plat_data.init_setting_num, GFP_KERNEL);
+		if (!chip->plat_data.init_setting_val) {
+			dev_err(dev, "%s val memory alloc failed\n", __func__);
+			return -ENOMEM;
+		}
+
+		if (of_property_read_u32_array(np, "rt,init_setting_addr",
+					chip->plat_data.init_setting_addr,
+					chip->plat_data.init_setting_num)) {
+			dev_err(dev, "no init setting addr\n");
+		}
+		if (of_property_read_u32_array(np, "rt,init_setting_mask",
+					chip->plat_data.init_setting_mask,
+					chip->plat_data.init_setting_num)) {
+			dev_err(dev, "no init setting mask\n");
+		}
+		if (of_property_read_u32_array(np, "rt,init_setting_val",
+					chip->plat_data.init_setting_val,
+					chip->plat_data.init_setting_num)) {
+			dev_err(dev, "no init setting val\n");
+		}
+	}
+
+	dev_dbg(dev, "%s, init stting table, num = %d\n", __func__,
+		chip->plat_data.init_setting_num);
+	for (i = 0; i < chip->plat_data.init_setting_num; i++) {
+		dev_dbg(dev, "0x%02x, 0x%08x, 0x%08x\n",
+				chip->plat_data.init_setting_addr[i],
+				chip->plat_data.init_setting_mask[i],
+				chip->plat_data.init_setting_val[i]);
+	}
+	return 0;
+}
+
 static int mt6660_i2c_probe(struct i2c_client *client,
 			    const struct i2c_device_id *id)
 {
@@ -401,6 +503,12 @@ static int mt6660_i2c_probe(struct i2c_client *client,
 	mutex_init(&chip->io_lock);
 	i2c_set_clientdata(client, chip);
 
+	ret = mt6660_parse_dt(chip, &client->dev);
+	if (ret < 0) {
+		dev_err(&client->dev, "parsing dts failed\n");
+		return ret;
+	}
+
 	chip->regmap = devm_regmap_init(&client->dev,
 		NULL, chip, &mt6660_regmap_config);
 	if (IS_ERR(chip->regmap)) {
@@ -506,4 +614,4 @@ module_i2c_driver(mt6660_i2c_driver);
 MODULE_AUTHOR("Jeff Chang <jeff_chang@richtek.com>");
 MODULE_DESCRIPTION("MT6660 SPKAMP Driver");
 MODULE_LICENSE("GPL");
-MODULE_VERSION("1.0.7_G");
+MODULE_VERSION("1.0.8_G");
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
