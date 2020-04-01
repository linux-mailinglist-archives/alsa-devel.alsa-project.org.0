Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 330C819A74D
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Apr 2020 10:28:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C23351677;
	Wed,  1 Apr 2020 10:27:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C23351677
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585729703;
	bh=FRTnfY0zP/fH4B/ESlcCQwtNd6lK1QKYf7xRNBV3xs8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vt5cwxIb42D7c1L+6y51FgV/AOiFtvN1tMdjhIv5kCMxOgFPlmg9tTz4XL6ZFosX0
	 ogzZoAUqGdBRQeTHik0X1mBMMcsKqzaeQy1N6sW/KMNNAvpeHBuneJlkQen+7KAKfq
	 /C7zYZ/WzBfE+T2tLAToltA2R30xsrNfMXusuibE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0B27F80110;
	Wed,  1 Apr 2020 10:26:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBE55F8014B; Wed,  1 Apr 2020 10:26:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14F02F80110
 for <alsa-devel@alsa-project.org>; Wed,  1 Apr 2020 10:26:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14F02F80110
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7E093B1E66502C2BA533;
 Wed,  1 Apr 2020 16:25:56 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Wed, 1 Apr 2020
 16:25:47 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <oder_chiou@realtek.com>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
 <perex@perex.cz>, <tiwai@suse.com>, <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH -next] ASoC: rt5682: Fix build error without CONFIG_I2C
Date: Wed, 1 Apr 2020 16:25:40 +0800
Message-ID: <20200401082540.21876-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.173.223.234]
X-CFilter-Loop: Reflected
Cc: alsa-devel@alsa-project.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
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

If I2C is n but SoundWire is m, building fails:

sound/soc/codecs/rt5682.c:3716:1: warning: data definition has no type or storage class
 module_i2c_driver(rt5682_i2c_driver);
 ^~~~~~~~~~~~~~~~~
sound/soc/codecs/rt5682.c:3716:1: error: type defaults to ‘int’ in declaration of ‘module_i2c_driver’ [-Werror=implicit-int]
sound/soc/codecs/rt5682.c:3716:1: warning: parameter names (without types) in function declaration

Guard this use #ifdef CONFIG_I2C.

Fixes: 5549ea647997 ("ASoC: rt5682: fix unmet dependencies")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 sound/soc/codecs/rt5682.c | 110 +++++++++++++++++++-------------------
 1 file changed, 56 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index c9268a230daa..ff3efad874a4 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -33,12 +33,6 @@
 #include "rt5682.h"
 #include "rt5682-sdw.h"
 
-static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
-	"AVDD",
-	"MICVDD",
-	"VBAT",
-};
-
 static const struct rt5682_platform_data i2s_default_platform_data = {
 	.dmic1_data_pin = RT5682_DMIC1_DATA_GPIO2,
 	.dmic1_clk_pin = RT5682_DMIC1_CLK_GPIO3,
@@ -984,25 +978,6 @@ static irqreturn_t rt5682_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void rt5682_jd_check_handler(struct work_struct *work)
-{
-	struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
-		jd_check_work.work);
-
-	if (snd_soc_component_read32(rt5682->component, RT5682_AJD1_CTRL)
-		& RT5682_JDH_RS_MASK) {
-		/* jack out */
-		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
-
-		snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
-				SND_JACK_HEADSET |
-				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-				SND_JACK_BTN_2 | SND_JACK_BTN_3);
-	} else {
-		schedule_delayed_work(&rt5682->jd_check_work, 500);
-	}
-}
-
 static int rt5682_set_jack_detect(struct snd_soc_component *component,
 	struct snd_soc_jack *hs_jack, void *data)
 {
@@ -3230,35 +3205,6 @@ static const struct i2c_device_id rt5682_i2c_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, rt5682_i2c_id);
 
-static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
-{
-
-	device_property_read_u32(dev, "realtek,dmic1-data-pin",
-		&rt5682->pdata.dmic1_data_pin);
-	device_property_read_u32(dev, "realtek,dmic1-clk-pin",
-		&rt5682->pdata.dmic1_clk_pin);
-	device_property_read_u32(dev, "realtek,jd-src",
-		&rt5682->pdata.jd_src);
-	device_property_read_u32(dev, "realtek,btndet-delay",
-		&rt5682->pdata.btndet_delay);
-	device_property_read_u32(dev, "realtek,dmic-clk-rate-hz",
-		&rt5682->pdata.dmic_clk_rate);
-	device_property_read_u32(dev, "realtek,dmic-delay-ms",
-		&rt5682->pdata.dmic_delay);
-
-	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
-		"realtek,ldo1-en-gpios", 0);
-
-	if (device_property_read_string_array(dev, "clock-output-names",
-					      rt5682->pdata.dai_clk_names,
-					      RT5682_DAI_NUM_CLKS) < 0)
-		dev_warn(dev, "Using default DAI clk names: %s, %s\n",
-			 rt5682->pdata.dai_clk_names[RT5682_DAI_WCLK_IDX],
-			 rt5682->pdata.dai_clk_names[RT5682_DAI_BCLK_IDX]);
-
-	return 0;
-}
-
 static void rt5682_calibrate(struct rt5682_priv *rt5682)
 {
 	int value, count;
@@ -3526,6 +3472,61 @@ int rt5682_io_init(struct device *dev, struct sdw_slave *slave)
 EXPORT_SYMBOL_GPL(rt5682_io_init);
 #endif
 
+#ifdef CONFIG_I2C
+static const char *rt5682_supply_names[RT5682_NUM_SUPPLIES] = {
+	"AVDD",
+	"MICVDD",
+	"VBAT",
+};
+
+static void rt5682_jd_check_handler(struct work_struct *work)
+{
+	struct rt5682_priv *rt5682 = container_of(work, struct rt5682_priv,
+		jd_check_work.work);
+
+	if (snd_soc_component_read32(rt5682->component, RT5682_AJD1_CTRL)
+		& RT5682_JDH_RS_MASK) {
+		/* jack out */
+		rt5682->jack_type = rt5682_headset_detect(rt5682->component, 0);
+
+		snd_soc_jack_report(rt5682->hs_jack, rt5682->jack_type,
+				SND_JACK_HEADSET |
+				SND_JACK_BTN_0 | SND_JACK_BTN_1 |
+				SND_JACK_BTN_2 | SND_JACK_BTN_3);
+	} else {
+		schedule_delayed_work(&rt5682->jd_check_work, 500);
+	}
+}
+
+static int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
+{
+
+	device_property_read_u32(dev, "realtek,dmic1-data-pin",
+		&rt5682->pdata.dmic1_data_pin);
+	device_property_read_u32(dev, "realtek,dmic1-clk-pin",
+		&rt5682->pdata.dmic1_clk_pin);
+	device_property_read_u32(dev, "realtek,jd-src",
+		&rt5682->pdata.jd_src);
+	device_property_read_u32(dev, "realtek,btndet-delay",
+		&rt5682->pdata.btndet_delay);
+	device_property_read_u32(dev, "realtek,dmic-clk-rate-hz",
+		&rt5682->pdata.dmic_clk_rate);
+	device_property_read_u32(dev, "realtek,dmic-delay-ms",
+		&rt5682->pdata.dmic_delay);
+
+	rt5682->pdata.ldo1_en = of_get_named_gpio(dev->of_node,
+		"realtek,ldo1-en-gpios", 0);
+
+	if (device_property_read_string_array(dev, "clock-output-names",
+					      rt5682->pdata.dai_clk_names,
+					      RT5682_DAI_NUM_CLKS) < 0)
+		dev_warn(dev, "Using default DAI clk names: %s, %s\n",
+			 rt5682->pdata.dai_clk_names[RT5682_DAI_WCLK_IDX],
+			 rt5682->pdata.dai_clk_names[RT5682_DAI_BCLK_IDX]);
+
+	return 0;
+}
+
 static int rt5682_i2c_probe(struct i2c_client *i2c,
 		    const struct i2c_device_id *id)
 {
@@ -3714,6 +3715,7 @@ static struct i2c_driver rt5682_i2c_driver = {
 	.id_table = rt5682_i2c_id,
 };
 module_i2c_driver(rt5682_i2c_driver);
+#endif
 
 MODULE_DESCRIPTION("ASoC RT5682 driver");
 MODULE_AUTHOR("Bard Liao <bardliao@realtek.com>");
-- 
2.17.1


