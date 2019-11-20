Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5496C103E43
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Nov 2019 16:25:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D57BE16DF;
	Wed, 20 Nov 2019 16:24:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D57BE16DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574263547;
	bh=i+kINn4i7yEzMjqrVQHHfYeK86ecRvWT+3difDoym/Q=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=boePvmw6M7aTIFKNP6fm/o4RY/mz1bWTYDsJd7rVKLU/Z4uGLTuIDbu+w/kZUYamC
	 wtzTHwoRONo36CoGo8c/Moe65max7Nr+K0/Q+0P/Gu/CQjgBKCOGAtb4/LFjPiAbPo
	 zBGc0xvGPw9vFxPGPhoWEImv4klG7eImOx9JKk54=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DE02F8014A;
	Wed, 20 Nov 2019 16:24:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6DBC2F80159; Wed, 20 Nov 2019 16:24:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS,
 UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9DF0DF800FF
 for <alsa-devel@alsa-project.org>; Wed, 20 Nov 2019 16:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9DF0DF800FF
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id BF9442910DD
Received: by earth.universe (Postfix, from userid 1000)
 id 254543C0C78; Wed, 20 Nov 2019 16:24:08 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Adam Thomson <Adam.Thomson.Opensource@diasemi.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Date: Wed, 20 Nov 2019 16:24:02 +0100
Message-Id: <20191120152406.2744-3-sebastian.reichel@collabora.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191120152406.2744-1-sebastian.reichel@collabora.com>
References: <20191120152406.2744-1-sebastian.reichel@collabora.com>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: [alsa-devel] [PATCHv2 2/6] ASoC: da7213: Add regulator support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This adds support for most regulators of da7212 for improved
power management. The only thing skipped was the speaker supply,
which has some undocumented dependencies. It's supposed to be
either always-enabled or always-disabled.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 .../devicetree/bindings/sound/da7213.txt      |  4 +
 sound/soc/codecs/da7213.c                     | 79 ++++++++++++++++++-
 sound/soc/codecs/da7213.h                     |  9 +++
 3 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/da7213.txt b/Documentation/devicetree/bindings/sound/da7213.txt
index 759bb04e0283..cc8200b7d748 100644
--- a/Documentation/devicetree/bindings/sound/da7213.txt
+++ b/Documentation/devicetree/bindings/sound/da7213.txt
@@ -21,6 +21,10 @@ Optional properties:
 - dlg,dmic-clkrate : DMIC clock frequency (Hz).
 	[<1500000>, <3000000>]
 
+ - VDDA-supply : Regulator phandle for Analogue power supply
+ - VDDMIC-supply : Regulator phandle for Mic Bias
+ - VDDIO-supply : Regulator phandle for I/O power supply
+
 ======
 
 Example:
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index aff306bb58df..0359249118d0 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -19,6 +19,7 @@
 #include <linux/module.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
+#include <linux/pm_runtime.h>
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
@@ -806,6 +807,11 @@ static int da7213_dai_event(struct snd_soc_dapm_widget *w,
  */
 
 static const struct snd_soc_dapm_widget da7213_dapm_widgets[] = {
+	/*
+	 * Power Supply
+	 */
+	SND_SOC_DAPM_REGULATOR_SUPPLY("VDDMIC", 0, 0),
+
 	/*
 	 * Input & Output
 	 */
@@ -932,6 +938,9 @@ static const struct snd_soc_dapm_route da7213_audio_map[] = {
 	/* Dest       Connecting Widget    source */
 
 	/* Input path */
+	{"Mic Bias 1", NULL, "VDDMIC"},
+	{"Mic Bias 2", NULL, "VDDMIC"},
+
 	{"MIC1", NULL, "Mic Bias 1"},
 	{"MIC2", NULL, "Mic Bias 2"},
 
@@ -1691,6 +1700,8 @@ static int da7213_probe(struct snd_soc_component *component)
 {
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
 
+	pm_runtime_get_sync(component->dev);
+
 	/* Default to using ALC auto offset calibration mode. */
 	snd_soc_component_update_bits(component, DA7213_ALC_CTRL1,
 			    DA7213_ALC_CALIB_MODE_MAN, 0);
@@ -1811,6 +1822,8 @@ static int da7213_probe(struct snd_soc_component *component)
 				    DA7213_DMIC_CLK_RATE_MASK, dmic_cfg);
 	}
 
+	pm_runtime_put_sync(component->dev);
+
 	/* Check if MCLK provided */
 	da7213->mclk = devm_clk_get(component->dev, "mclk");
 	if (IS_ERR(da7213->mclk)) {
@@ -1848,11 +1861,22 @@ static const struct regmap_config da7213_regmap_config = {
 	.cache_type = REGCACHE_RBTREE,
 };
 
+static void da7213_power_off(void *data)
+{
+	struct da7213_priv *da7213 = data;
+	regulator_bulk_disable(DA7213_NUM_SUPPLIES, da7213->supplies);
+}
+
+static const char *da7213_supply_names[DA7213_NUM_SUPPLIES] = {
+	[DA7213_SUPPLY_VDDA] = "VDDA",
+	[DA7213_SUPPLY_VDDIO] = "VDDIO",
+};
+
 static int da7213_i2c_probe(struct i2c_client *i2c,
 			    const struct i2c_device_id *id)
 {
 	struct da7213_priv *da7213;
-	int ret;
+	int i, ret;
 
 	da7213 = devm_kzalloc(&i2c->dev, sizeof(*da7213), GFP_KERNEL);
 	if (!da7213)
@@ -1860,6 +1884,25 @@ static int da7213_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, da7213);
 
+	/* Get required supplies */
+	for (i = 0; i < DA7213_NUM_SUPPLIES; ++i)
+		da7213->supplies[i].supply = da7213_supply_names[i];
+
+	ret = devm_regulator_bulk_get(&i2c->dev, DA7213_NUM_SUPPLIES,
+				      da7213->supplies);
+	if (ret) {
+		dev_err(&i2c->dev, "Failed to get supplies: %d\n", ret);
+		return ret;
+	}
+
+	ret = regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213->supplies);
+	if (ret < 0)
+		return ret;
+
+	ret = devm_add_action_or_reset(&i2c->dev, da7213_power_off, da7213);
+	if (ret < 0)
+		return ret;
+
 	da7213->regmap = devm_regmap_init_i2c(i2c, &da7213_regmap_config);
 	if (IS_ERR(da7213->regmap)) {
 		ret = PTR_ERR(da7213->regmap);
@@ -1867,6 +1910,11 @@ static int da7213_i2c_probe(struct i2c_client *i2c,
 		return ret;
 	}
 
+	pm_runtime_set_autosuspend_delay(&i2c->dev, 100);
+	pm_runtime_use_autosuspend(&i2c->dev);
+	pm_runtime_set_active(&i2c->dev);
+	pm_runtime_enable(&i2c->dev);
+
 	ret = devm_snd_soc_register_component(&i2c->dev,
 			&soc_component_dev_da7213, &da7213_dai, 1);
 	if (ret < 0) {
@@ -1876,6 +1924,34 @@ static int da7213_i2c_probe(struct i2c_client *i2c,
 	return ret;
 }
 
+static int __maybe_unused da7213_runtime_suspend(struct device *dev)
+{
+	struct da7213_priv *da7213 = dev_get_drvdata(dev);
+
+	regcache_cache_only(da7213->regmap, true);
+	regcache_mark_dirty(da7213->regmap);
+	regulator_bulk_disable(DA7213_NUM_SUPPLIES, da7213->supplies);
+
+	return 0;
+}
+
+static int __maybe_unused da7213_runtime_resume(struct device *dev)
+{
+	struct da7213_priv *da7213 = dev_get_drvdata(dev);
+	int ret;
+
+	ret = regulator_bulk_enable(DA7213_NUM_SUPPLIES, da7213->supplies);
+	if (ret < 0)
+		return ret;
+	regcache_cache_only(da7213->regmap, false);
+	regcache_sync(da7213->regmap);
+	return 0;
+}
+
+static const struct dev_pm_ops da7213_pm = {
+	SET_RUNTIME_PM_OPS(da7213_runtime_suspend, da7213_runtime_resume, NULL)
+};
+
 static const struct i2c_device_id da7213_i2c_id[] = {
 	{ "da7213", 0 },
 	{ }
@@ -1888,6 +1964,7 @@ static struct i2c_driver da7213_i2c_driver = {
 		.name = "da7213",
 		.of_match_table = of_match_ptr(da7213_of_match),
 		.acpi_match_table = ACPI_PTR(da7213_acpi_match),
+		.pm = &da7213_pm,
 	},
 	.probe		= da7213_i2c_probe,
 	.id_table	= da7213_i2c_id,
diff --git a/sound/soc/codecs/da7213.h b/sound/soc/codecs/da7213.h
index 3250a3821fcc..3890829dfb6e 100644
--- a/sound/soc/codecs/da7213.h
+++ b/sound/soc/codecs/da7213.h
@@ -12,6 +12,7 @@
 
 #include <linux/clk.h>
 #include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
 #include <sound/da7213.h>
 
 /*
@@ -521,9 +522,17 @@ enum da7213_sys_clk {
 	DA7213_SYSCLK_PLL_32KHZ
 };
 
+/* Regulators */
+enum da7213_supplies {
+	DA7213_SUPPLY_VDDA = 0,
+	DA7213_SUPPLY_VDDIO,
+	DA7213_NUM_SUPPLIES,
+};
+
 /* Codec private data */
 struct da7213_priv {
 	struct regmap *regmap;
+	struct regulator_bulk_data supplies[DA7213_NUM_SUPPLIES];
 	struct clk *mclk;
 	unsigned int mclk_rate;
 	int clk_src;
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
