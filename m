Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A73185B65E5
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 04:59:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 75D191684;
	Tue, 13 Sep 2022 04:58:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 75D191684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663037950;
	bh=XJzL7GVUW891XaW4I6X8U6A97/7MKSISmjm6aNfAIwI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DFSw/po8RyXggERRp7gUJEZRQSNl4n6c4JQQTxv9l7PYG8jLJMvSZDhoFj2s/YDfg
	 1w2qjQ2CaHGOWKJMFkj/1ArQ7fha2WeaQcOiLCwpU/KYDaR6F2dncEdGIphDlSZI7k
	 wBG0Gk4Sc+UM+KBC1X0JFnmfVREb1sNhU0a2c074=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D5D63F80535;
	Tue, 13 Sep 2022 04:57:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F381CF80533; Tue, 13 Sep 2022 04:57:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id 823EAF80224
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 04:57:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 823EAF80224
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 28D2uiC63017630,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36504.realtek.com.tw[172.21.6.27])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 28D2uiC63017630
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Tue, 13 Sep 2022 10:56:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36504.realtek.com.tw (172.21.6.27) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Sep 2022 10:57:04 +0800
Received: from localhost.localdomain (172.22.102.99) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Sep 2022 10:57:04 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/3] ASoC: rt5682s: Reduce coupling of I2S1 setting
Date: Tue, 13 Sep 2022 10:56:57 +0800
Message-ID: <20220913025658.5005-2-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220913025658.5005-1-derek.fang@realtek.com>
References: <20220913025658.5005-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.102.99]
X-ClientProxiedBy: RTEXH36504.realtek.com.tw (172.21.6.27) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 09/13/2022 02:34:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzkvMTIgpFWkyCAxMTozMzowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36504.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 shumingf@realtek.com, flove@realtek.com
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

From: Derek Fang <derek.fang@realtek.com>

Some parts of rt5682s CCF function are implemented
by 'I2S1' dapm widget.
The coupling risk exists, so this patch fixes it.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 104 +++++++++++++++++++++++--------------
 1 file changed, 66 insertions(+), 38 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index c5c55d146ddf..325d227a2b37 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1229,41 +1229,58 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int set_i2s_clk(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *kcontrol, int event)
+static void rt5682s_set_i2s(struct rt5682s_priv *rt5682s, int id, int on)
 {
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
-	int pre_div, id;
-	unsigned int reg, mask, sft;
-
-	if (event != SND_SOC_DAPM_PRE_PMU)
-		return 0;
-
-	if (w->shift == RT5682S_PWR_I2S2_BIT) {
-		id = RT5682S_AIF2;
-		reg = RT5682S_I2S2_M_CLK_CTRL_1;
-		mask = RT5682S_I2S2_M_D_MASK;
-		sft = RT5682S_I2S2_M_D_SFT;
+	struct snd_soc_component *component = rt5682s->component;
+	int pre_div;
+	unsigned int p_reg, p_mask, p_sft;
+	unsigned int c_reg, c_mask, c_sft;
+
+	if (id == RT5682S_AIF1) {
+		c_reg = RT5682S_ADDA_CLK_1;
+		c_mask = RT5682S_I2S_M_D_MASK;
+		c_sft = RT5682S_I2S_M_D_SFT;
+		p_reg = RT5682S_PWR_DIG_1;
+		p_mask = RT5682S_PWR_I2S1;
+		p_sft = RT5682S_PWR_I2S1_BIT;
 	} else {
-		id = RT5682S_AIF1;
-		reg = RT5682S_ADDA_CLK_1;
-		mask = RT5682S_I2S_M_D_MASK;
-		sft = RT5682S_I2S_M_D_SFT;
+		c_reg = RT5682S_I2S2_M_CLK_CTRL_1;
+		c_mask = RT5682S_I2S2_M_D_MASK;
+		c_sft = RT5682S_I2S2_M_D_SFT;
+		p_reg = RT5682S_PWR_DIG_1;
+		p_mask = RT5682S_PWR_I2S2;
+		p_sft = RT5682S_PWR_I2S2_BIT;
 	}
 
-	if (!rt5682s->master[id])
-		return 0;
+	if (on && rt5682s->master[id]) {
+		pre_div = get_clk_info(rt5682s->sysclk, rt5682s->lrck[id]);
+		if (pre_div < 0) {
+			dev_err(component->dev, "get pre_div failed\n");
+			return;
+		}
 
-	pre_div = get_clk_info(rt5682s->sysclk, rt5682s->lrck[id]);
-	if (pre_div < 0) {
-		dev_err(component->dev, "get pre_div failed\n");
-		return -EINVAL;
+		dev_dbg(component->dev, "lrck is %dHz and pre_div is %d for iis %d master\n",
+			rt5682s->lrck[id], pre_div, id);
+		snd_soc_component_update_bits(component, c_reg, c_mask, pre_div << c_sft);
 	}
 
-	dev_dbg(component->dev, "lrck is %dHz and pre_div is %d for iis %d master\n",
-		rt5682s->lrck[id], pre_div, id);
-	snd_soc_component_update_bits(component, reg, mask, pre_div << sft);
+	snd_soc_component_update_bits(component, p_reg, p_mask, on << p_sft);
+}
+
+static int set_i2s_event(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+	int on = 0;
+
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		on = 1;
+
+	if (!strcmp(w->name, "I2S1") && !rt5682s->wclk_enabled)
+		rt5682s_set_i2s(rt5682s, RT5682S_AIF1, on);
+	else if (!strcmp(w->name, "I2S2"))
+		rt5682s_set_i2s(rt5682s, RT5682S_AIF2, on);
 
 	return 0;
 }
@@ -1715,10 +1732,10 @@ static const struct snd_soc_dapm_widget rt5682s_dapm_widgets[] = {
 	SND_SOC_DAPM_PGA("Stereo1 ADC MIX", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* Digital Interface */
-	SND_SOC_DAPM_SUPPLY("I2S1", RT5682S_PWR_DIG_1, RT5682S_PWR_I2S1_BIT,
-		0, set_i2s_clk, SND_SOC_DAPM_PRE_PMU),
-	SND_SOC_DAPM_SUPPLY("I2S2", RT5682S_PWR_DIG_1, RT5682S_PWR_I2S2_BIT,
-		0, set_i2s_clk, SND_SOC_DAPM_PRE_PMU),
+	SND_SOC_DAPM_SUPPLY("I2S1", SND_SOC_NOPM, 0, 0,
+		set_i2s_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY("I2S2", SND_SOC_NOPM, 0, 0,
+		set_i2s_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 	SND_SOC_DAPM_PGA("IF1 DAC1 L", SND_SOC_NOPM, 0, 0, NULL, 0),
 	SND_SOC_DAPM_PGA("IF1 DAC1 R", SND_SOC_NOPM, 0, 0, NULL, 0),
 
@@ -2426,12 +2443,15 @@ static int rt5682s_set_bias_level(struct snd_soc_component *component,
 			RT5682S_PWR_LDO, RT5682S_PWR_LDO);
 		break;
 	case SND_SOC_BIAS_STANDBY:
-		regmap_update_bits(rt5682s->regmap, RT5682S_PWR_DIG_1,
-			RT5682S_DIG_GATE_CTRL, RT5682S_DIG_GATE_CTRL);
+		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF)
+			regmap_update_bits(rt5682s->regmap, RT5682S_PWR_DIG_1,
+				RT5682S_DIG_GATE_CTRL, RT5682S_DIG_GATE_CTRL);
 		break;
 	case SND_SOC_BIAS_OFF:
-		regmap_update_bits(rt5682s->regmap, RT5682S_PWR_DIG_1,
-			RT5682S_DIG_GATE_CTRL | RT5682S_PWR_LDO, 0);
+		regmap_update_bits(rt5682s->regmap, RT5682S_PWR_DIG_1, RT5682S_PWR_LDO, 0);
+		if (!rt5682s->wclk_enabled)
+			regmap_update_bits(rt5682s->regmap, RT5682S_PWR_DIG_1,
+				RT5682S_DIG_GATE_CTRL, 0);
 		break;
 	case SND_SOC_BIAS_ON:
 		break;
@@ -2473,13 +2493,17 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_FV2, RT5682S_PWR_FV2);
 
+	/* Set and power on I2S1 */
+	snd_soc_component_update_bits(component, RT5682S_PWR_DIG_1,
+		RT5682S_DIG_GATE_CTRL, RT5682S_DIG_GATE_CTRL);
+	rt5682s_set_i2s(rt5682s, RT5682S_AIF1, 1);
+
 	rt5682s->wclk_enabled = 1;
 
 	mutex_unlock(&rt5682s->wclk_mutex);
 
 	snd_soc_dapm_mutex_lock(dapm);
 
-	snd_soc_dapm_force_enable_pin_unlocked(dapm, "I2S1");
 	/* Only need to power PLLB due to the rate set restriction */
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLLB");
 	snd_soc_dapm_sync_unlocked(dapm);
@@ -2505,13 +2529,17 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 			RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB, 0);
 
+	/* Power down I2S1 */
+	rt5682s_set_i2s(rt5682s, RT5682S_AIF1, 0);
+	snd_soc_component_update_bits(component, RT5682S_PWR_DIG_1,
+		RT5682S_DIG_GATE_CTRL, 0);
+
 	rt5682s->wclk_enabled = 0;
 
 	mutex_unlock(&rt5682s->wclk_mutex);
 
 	snd_soc_dapm_mutex_lock(dapm);
 
-	snd_soc_dapm_disable_pin_unlocked(dapm, "I2S1");
 	snd_soc_dapm_disable_pin_unlocked(dapm, "PLLB");
 	snd_soc_dapm_sync_unlocked(dapm);
 
-- 
2.17.1

