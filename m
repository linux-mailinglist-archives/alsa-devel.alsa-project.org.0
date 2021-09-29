Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF6B41BECF
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 07:45:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E18B91694;
	Wed, 29 Sep 2021 07:44:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E18B91694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632894338;
	bh=1eGr50Cu7h1l3Z7H3dCduCpL0Bc4thATJBEd3fGpCUQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=balSg+nJ0Xbj+71yznnnrVGYDi/yLNJk314h0CUp8kvNp+/6wZPxoHKjrL+3G8BFJ
	 ah1q+i/e75hOGyEqndTb8HoBi2vNky2uAjR05RfBe9eYee6XNSuQRz9d25eJLxZBy1
	 eZAI1bWub5sVsKO62rC5DFFmRPC10ommWpK+9MpA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B4DF80105;
	Wed, 29 Sep 2021 07:44:22 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFAC7F80227; Wed, 29 Sep 2021 07:44:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2B346F80113
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 07:44:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B346F80113
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 18T5hqtrF025663,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 18T5hqtrF025663
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Sep 2021 13:43:52 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Wed, 29 Sep 2021 13:43:51 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 29 Sep 2021 13:43:51 +0800
From: Jack Yu <jack.yu@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682: move clk related code to rt5682_i2c_probe
Date: Wed, 29 Sep 2021 13:43:44 +0800
Message-ID: <20210929054344.12112-1-jack.yu@realtek.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/29/2021 05:26:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzkvMjkgpFekyCAwMjowODowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: oder_chiou@realtek.com, Jack Yu <jack.yu@realtek.com>,
 alsa-devel@alsa-project.org, lars@metafoo.de, wenst@google.com,
 derek.fang@realtek.com, shumingf@realtek.com, flove@realtek.com
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

The DAI clock is only used in I2S mode, to make it clear
and to fix clock resource release issue, we move CCF clock
related code to rt5682_i2c_probe to fix clock
register/unregister issue.

Signed-off-by: Jack Yu <jack.yu@realtek.com>
---
 sound/soc/codecs/rt5682-i2c.c | 22 +++++++++++
 sound/soc/codecs/rt5682.c     | 70 +++++++++++++----------------------
 sound/soc/codecs/rt5682.h     |  3 ++
 3 files changed, 51 insertions(+), 44 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index b9d5d7a0975b..a30e42932cf7 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -139,6 +139,8 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 
 	i2c_set_clientdata(i2c, rt5682);
 
+	rt5682->i2c_dev = &i2c->dev;
+
 	rt5682->pdata = i2s_default_platform_data;
 
 	if (pdata)
@@ -276,6 +278,26 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 			dev_err(&i2c->dev, "Failed to reguest IRQ: %d\n", ret);
 	}
 
+#ifdef CONFIG_COMMON_CLK
+	/* Check if MCLK provided */
+	rt5682->mclk = devm_clk_get(&i2c->dev, "mclk");
+	if (IS_ERR(rt5682->mclk)) {
+		if (PTR_ERR(rt5682->mclk) != -ENOENT) {
+			ret = PTR_ERR(rt5682->mclk);
+			return ret;
+		}
+		rt5682->mclk = NULL;
+	}
+
+	/* Register CCF DAI clock control */
+	ret = rt5682_register_dai_clks(rt5682);
+	if (ret)
+		return ret;
+
+	/* Initial setup for CCF */
+	rt5682->lrck[RT5682_AIF1] = 48000;
+#endif
+
 	return devm_snd_soc_register_component(&i2c->dev,
 					       &rt5682_soc_component_dev,
 					       rt5682_dai, ARRAY_SIZE(rt5682_dai));
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 12113c2dcae2..914fe7debc05 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -2510,7 +2510,7 @@ static int rt5682_set_bias_level(struct snd_soc_component *component,
 static bool rt5682_clk_check(struct rt5682_priv *rt5682)
 {
 	if (!rt5682->master[RT5682_AIF1]) {
-		dev_dbg(rt5682->component->dev, "sysclk/dai not set correctly\n");
+		dev_dbg(rt5682->i2c_dev, "sysclk/dai not set correctly\n");
 		return false;
 	}
 	return true;
@@ -2521,13 +2521,15 @@ static int rt5682_wclk_prepare(struct clk_hw *hw)
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
-	struct snd_soc_dapm_context *dapm =
-			snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component;
+	struct snd_soc_dapm_context *dapm;
 
 	if (!rt5682_clk_check(rt5682))
 		return -EINVAL;
 
+	component = rt5682->component;
+	dapm = snd_soc_component_get_dapm(component);
+
 	snd_soc_dapm_mutex_lock(dapm);
 
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS");
@@ -2557,13 +2559,15 @@ static void rt5682_wclk_unprepare(struct clk_hw *hw)
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
-	struct snd_soc_dapm_context *dapm =
-			snd_soc_component_get_dapm(component);
+	struct snd_soc_component *component;
+	struct snd_soc_dapm_context *dapm;
 
 	if (!rt5682_clk_check(rt5682))
 		return;
 
+	component = rt5682->component;
+	dapm = snd_soc_component_get_dapm(component);
+
 	snd_soc_dapm_mutex_lock(dapm);
 
 	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS");
@@ -2587,7 +2591,6 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
 	const char * const clk_name = clk_hw_get_name(hw);
 
 	if (!rt5682_clk_check(rt5682))
@@ -2597,7 +2600,7 @@ static unsigned long rt5682_wclk_recalc_rate(struct clk_hw *hw,
 	 */
 	if (rt5682->lrck[RT5682_AIF1] != CLK_48 &&
 	    rt5682->lrck[RT5682_AIF1] != CLK_44) {
-		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
+		dev_warn(rt5682->i2c_dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
 		return 0;
 	}
@@ -2611,7 +2614,6 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
 	const char * const clk_name = clk_hw_get_name(hw);
 
 	if (!rt5682_clk_check(rt5682))
@@ -2621,7 +2623,7 @@ static long rt5682_wclk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * It will force to 48kHz if not both.
 	 */
 	if (rate != CLK_48 && rate != CLK_44) {
-		dev_warn(component->dev, "%s: clk %s only support %d or %d Hz output\n",
+		dev_warn(rt5682->i2c_dev, "%s: clk %s only support %d or %d Hz output\n",
 			__func__, clk_name, CLK_44, CLK_48);
 		rate = CLK_48;
 	}
@@ -2635,7 +2637,7 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_WCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
+	struct snd_soc_component *component;
 	struct clk_hw *parent_hw;
 	const char * const clk_name = clk_hw_get_name(hw);
 	int pre_div;
@@ -2644,6 +2646,8 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 	if (!rt5682_clk_check(rt5682))
 		return -EINVAL;
 
+	component = rt5682->component;
+
 	/*
 	 * Whether the wclk's parent clk (mclk) exists or not, please ensure
 	 * it is fixed or set to 48MHz before setting wclk rate. It's a
@@ -2653,12 +2657,12 @@ static int rt5682_wclk_set_rate(struct clk_hw *hw, unsigned long rate,
 	 */
 	parent_hw = clk_hw_get_parent(hw);
 	if (!parent_hw)
-		dev_warn(component->dev,
+		dev_warn(rt5682->i2c_dev,
 			"Parent mclk of wclk not acquired in driver. Please ensure mclk was provided as %d Hz.\n",
 			CLK_PLL2_FIN);
 
 	if (parent_rate != CLK_PLL2_FIN)
-		dev_warn(component->dev, "clk %s only support %d Hz input\n",
+		dev_warn(rt5682->i2c_dev, "clk %s only support %d Hz input\n",
 			clk_name, CLK_PLL2_FIN);
 
 	/*
@@ -2690,10 +2694,9 @@ static unsigned long rt5682_bclk_recalc_rate(struct clk_hw *hw,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
 	unsigned int bclks_per_wclk;
 
-	bclks_per_wclk = snd_soc_component_read(component, RT5682_TDM_TCON_CTRL);
+	regmap_read(rt5682->regmap, RT5682_TDM_TCON_CTRL, &bclks_per_wclk);
 
 	switch (bclks_per_wclk & RT5682_TDM_BCLK_MS1_MASK) {
 	case RT5682_TDM_BCLK_MS1_256:
@@ -2754,20 +2757,22 @@ static int rt5682_bclk_set_rate(struct clk_hw *hw, unsigned long rate,
 	struct rt5682_priv *rt5682 =
 		container_of(hw, struct rt5682_priv,
 			     dai_clks_hw[RT5682_DAI_BCLK_IDX]);
-	struct snd_soc_component *component = rt5682->component;
+	struct snd_soc_component *component;
 	struct snd_soc_dai *dai;
 	unsigned long factor;
 
 	if (!rt5682_clk_check(rt5682))
 		return -EINVAL;
 
+	component = rt5682->component;
+
 	factor = rt5682_bclk_get_factor(rate, parent_rate);
 
 	for_each_component_dais(component, dai)
 		if (dai->id == RT5682_AIF1)
 			break;
 	if (!dai) {
-		dev_err(component->dev, "dai %d not found in component\n",
+		dev_err(rt5682->i2c_dev, "dai %d not found in component\n",
 			RT5682_AIF1);
 		return -ENODEV;
 	}
@@ -2790,10 +2795,9 @@ static const struct clk_ops rt5682_dai_clk_ops[RT5682_DAI_NUM_CLKS] = {
 	},
 };
 
-static int rt5682_register_dai_clks(struct snd_soc_component *component)
+int rt5682_register_dai_clks(struct rt5682_priv *rt5682)
 {
-	struct device *dev = component->dev;
-	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+	struct device *dev = rt5682->i2c_dev;
 	struct rt5682_platform_data *pdata = &rt5682->pdata;
 	struct clk_hw *dai_clk_hw;
 	int i, ret;
@@ -2851,6 +2855,7 @@ static int rt5682_register_dai_clks(struct snd_soc_component *component)
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(rt5682_register_dai_clks);
 #endif /* CONFIG_COMMON_CLK */
 
 static int rt5682_probe(struct snd_soc_component *component)
@@ -2860,9 +2865,6 @@ static int rt5682_probe(struct snd_soc_component *component)
 	unsigned long time;
 	struct snd_soc_dapm_context *dapm = &component->dapm;
 
-#ifdef CONFIG_COMMON_CLK
-	int ret;
-#endif
 	rt5682->component = component;
 
 	if (rt5682->is_sdw) {
@@ -2874,26 +2876,6 @@ static int rt5682_probe(struct snd_soc_component *component)
 			dev_err(&slave->dev, "Initialization not complete, timed out\n");
 			return -ETIMEDOUT;
 		}
-	} else {
-#ifdef CONFIG_COMMON_CLK
-		/* Check if MCLK provided */
-		rt5682->mclk = devm_clk_get(component->dev, "mclk");
-		if (IS_ERR(rt5682->mclk)) {
-			if (PTR_ERR(rt5682->mclk) != -ENOENT) {
-				ret = PTR_ERR(rt5682->mclk);
-				return ret;
-			}
-			rt5682->mclk = NULL;
-		}
-
-		/* Register CCF DAI clock control */
-		ret = rt5682_register_dai_clks(component);
-		if (ret)
-			return ret;
-
-		/* Initial setup for CCF */
-		rt5682->lrck[RT5682_AIF1] = CLK_48;
-#endif
 	}
 
 	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index b59221048ebf..262512babc50 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1408,6 +1408,7 @@ enum {
 
 struct rt5682_priv {
 	struct snd_soc_component *component;
+	struct device *i2c_dev;
 	struct rt5682_platform_data pdata;
 	struct regmap *regmap;
 	struct regmap *sdw_regmap;
@@ -1462,6 +1463,8 @@ void rt5682_calibrate(struct rt5682_priv *rt5682);
 void rt5682_reset(struct rt5682_priv *rt5682);
 int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev);
 
+int rt5682_register_dai_clks(struct rt5682_priv *rt5682);
+
 #define RT5682_REG_NUM 318
 extern const struct reg_default rt5682_reg[RT5682_REG_NUM];
 
-- 
2.33.0

