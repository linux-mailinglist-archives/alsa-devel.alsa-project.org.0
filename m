Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AD55B65E3
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 04:58:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCAB116EA;
	Tue, 13 Sep 2022 04:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCAB116EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663037936;
	bh=uNdgpnRkHLZodXEMMx8q1twwb8ptvuVHdma9E4orAnk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vTQe9wwFt7637EahKFxQClKCPr6/F0pAX+mAiJ92EKOV4BHfL55EKiq5MLWBu7O84
	 ip9beE4QLor+YDzj5H8xxUe5B5jXg2fBdzoy821YcBq2tB6CKOJk6TbfZnsfXZcB0T
	 FMpoSW+ZNHEYkgPid9BvExRq59ykh3F0k5PC7rv0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CD7FF80528;
	Tue, 13 Sep 2022 04:57:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D06CEF8028B; Tue, 13 Sep 2022 04:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id B7F12F801EC
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 04:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7F12F801EC
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 28D2uiD83017637,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 28D2uiD83017637
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Tue, 13 Sep 2022 10:56:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 10:57:05 +0800
Received: from localhost.localdomain (172.22.102.99) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Sep 2022 10:57:04 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 3/3] ASoC: rt5682s: Reduce coupling of PLLB setting
Date: Tue, 13 Sep 2022 10:56:58 +0800
Message-ID: <20220913025658.5005-3-derek.fang@realtek.com>
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
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
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
by 'PLLB' dapm widget.
The coupling risk exists, so this patch fixes it.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 116 +++++++++++++++++++++++--------------
 1 file changed, 73 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 325d227a2b37..2831f2f61aba 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -1155,29 +1155,52 @@ static int set_dmic_clk(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int set_filter_clk(struct snd_soc_dapm_widget *w,
+
+static int rt5682s_set_pllb_power(struct rt5682s_priv *rt5682s, int on)
+{
+	struct snd_soc_component *component = rt5682s->component;
+
+	if (on) {
+		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_3,
+			RT5682S_PWR_LDO_PLLB | RT5682S_PWR_BIAS_PLLB | RT5682S_PWR_PLLB,
+			RT5682S_PWR_LDO_PLLB | RT5682S_PWR_BIAS_PLLB | RT5682S_PWR_PLLB);
+		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_3,
+			RT5682S_RSTB_PLLB, RT5682S_RSTB_PLLB);
+	} else {
+		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_3,
+			RT5682S_PWR_LDO_PLLB | RT5682S_PWR_BIAS_PLLB |
+			RT5682S_RSTB_PLLB | RT5682S_PWR_PLLB, 0);
+	}
+
+	return 0;
+}
+
+static int set_pllb_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
-	int ref, val, reg, idx;
-	static const int div_f[] = {1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48};
-	static const int div_o[] = {1, 2, 4, 6, 8, 12, 16, 24, 32, 48};
+	int on = 0;
 
-	val = snd_soc_component_read(component, RT5682S_GPIO_CTRL_1)
-			& RT5682S_GP4_PIN_MASK;
+	if (rt5682s->wclk_enabled)
+		return 0;
 
-	if (w->shift == RT5682S_PWR_ADC_S1F_BIT && val == RT5682S_GP4_PIN_ADCDAT2)
-		ref = 256 * rt5682s->lrck[RT5682S_AIF2];
-	else
-		ref = 256 * rt5682s->lrck[RT5682S_AIF1];
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		on = 1;
 
-	idx = rt5682s_div_sel(rt5682s, ref, div_f, ARRAY_SIZE(div_f));
+	rt5682s_set_pllb_power(rt5682s, on);
 
-	if (w->shift == RT5682S_PWR_ADC_S1F_BIT)
-		reg = RT5682S_PLL_TRACK_3;
-	else
-		reg = RT5682S_PLL_TRACK_2;
+	return 0;
+}
+
+static void rt5682s_set_filter_clk(struct rt5682s_priv *rt5682s, int reg, int ref)
+{
+	struct snd_soc_component *component = rt5682s->component;
+	int idx;
+	static const int div_f[] = {1, 2, 3, 4, 6, 8, 12, 16, 24, 32, 48};
+	static const int div_o[] = {1, 2, 4, 6, 8, 12, 16, 24, 32, 48};
+
+	idx = rt5682s_div_sel(rt5682s, ref, div_f, ARRAY_SIZE(div_f));
 
 	snd_soc_component_update_bits(component, reg,
 		RT5682S_FILTER_CLK_DIV_MASK, idx << RT5682S_FILTER_CLK_DIV_SFT);
@@ -1191,6 +1214,29 @@ static int set_filter_clk(struct snd_soc_dapm_widget *w,
 	snd_soc_component_update_bits(component, RT5682S_ADDA_CLK_1,
 		RT5682S_ADC_OSR_MASK | RT5682S_DAC_OSR_MASK,
 		(idx << RT5682S_ADC_OSR_SFT) | (idx << RT5682S_DAC_OSR_SFT));
+}
+
+static int set_filter_clk(struct snd_soc_dapm_widget *w,
+		struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
+	int ref, reg, val;
+
+	val = snd_soc_component_read(component, RT5682S_GPIO_CTRL_1)
+			& RT5682S_GP4_PIN_MASK;
+
+	if (w->shift == RT5682S_PWR_ADC_S1F_BIT && val == RT5682S_GP4_PIN_ADCDAT2)
+		ref = 256 * rt5682s->lrck[RT5682S_AIF2];
+	else
+		ref = 256 * rt5682s->lrck[RT5682S_AIF1];
+
+	if (w->shift == RT5682S_PWR_ADC_S1F_BIT)
+		reg = RT5682S_PLL_TRACK_3;
+	else
+		reg = RT5682S_PLL_TRACK_2;
+
+	rt5682s_set_filter_clk(rt5682s, reg, ref);
 
 	return 0;
 }
@@ -1633,20 +1679,14 @@ static const struct snd_soc_dapm_widget rt5682s_dapm_widgets[] = {
 	/* PLL Powers */
 	SND_SOC_DAPM_SUPPLY_S("PLLA_LDO", 0, RT5682S_PWR_ANLG_3,
 		RT5682S_PWR_LDO_PLLA_BIT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("PLLB_LDO", 0, RT5682S_PWR_ANLG_3,
-		RT5682S_PWR_LDO_PLLB_BIT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("PLLA_BIAS", 0, RT5682S_PWR_ANLG_3,
 		RT5682S_PWR_BIAS_PLLA_BIT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("PLLB_BIAS", 0, RT5682S_PWR_ANLG_3,
-		RT5682S_PWR_BIAS_PLLB_BIT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("PLLA", 0, RT5682S_PWR_ANLG_3,
 		RT5682S_PWR_PLLA_BIT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("PLLB", 0, RT5682S_PWR_ANLG_3,
-		RT5682S_PWR_PLLB_BIT, 0, set_filter_clk, SND_SOC_DAPM_PRE_PMU),
 	SND_SOC_DAPM_SUPPLY_S("PLLA_RST", 1, RT5682S_PWR_ANLG_3,
 		RT5682S_RSTB_PLLA_BIT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY_S("PLLB_RST", 1, RT5682S_PWR_ANLG_3,
-		RT5682S_RSTB_PLLB_BIT, 0, NULL, 0),
+	SND_SOC_DAPM_SUPPLY("PLLB", SND_SOC_NOPM, 0, 0,
+		set_pllb_event, SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
 
 	/* ASRC */
 	SND_SOC_DAPM_SUPPLY_S("DAC STO1 ASRC", 1, RT5682S_PLL_TRACK_1,
@@ -1813,9 +1853,6 @@ static const struct snd_soc_dapm_route rt5682s_dapm_routes[] = {
 	{"PLLA", NULL, "PLLA_LDO"},
 	{"PLLA", NULL, "PLLA_BIAS"},
 	{"PLLA", NULL, "PLLA_RST"},
-	{"PLLB", NULL, "PLLB_LDO"},
-	{"PLLB", NULL, "PLLB_BIAS"},
-	{"PLLB", NULL, "PLLB_RST"},
 
 	/*ASRC*/
 	{"ADC Stereo1 Filter", NULL, "ADC STO1 ASRC", is_using_asrc},
@@ -2479,7 +2516,7 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_WCLK_IDX]);
 	struct snd_soc_component *component = rt5682s->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	int ref, reg;
 
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
@@ -2498,18 +2535,16 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 		RT5682S_DIG_GATE_CTRL, RT5682S_DIG_GATE_CTRL);
 	rt5682s_set_i2s(rt5682s, RT5682S_AIF1, 1);
 
+	/* Only need to power on PLLB due to the rate set restriction */
+	reg = RT5682S_PLL_TRACK_2;
+	ref = 256 * rt5682s->lrck[RT5682S_AIF1];
+	rt5682s_set_filter_clk(rt5682s, reg, ref);
+	rt5682s_set_pllb_power(rt5682s, 1);
+
 	rt5682s->wclk_enabled = 1;
 
 	mutex_unlock(&rt5682s->wclk_mutex);
 
-	snd_soc_dapm_mutex_lock(dapm);
-
-	/* Only need to power PLLB due to the rate set restriction */
-	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLLB");
-	snd_soc_dapm_sync_unlocked(dapm);
-
-	snd_soc_dapm_mutex_unlock(dapm);
-
 	return 0;
 }
 
@@ -2518,7 +2553,6 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	struct rt5682s_priv *rt5682s =
 		container_of(hw, struct rt5682s_priv, dai_clks_hw[RT5682S_DAI_WCLK_IDX]);
 	struct snd_soc_component *component = rt5682s->component;
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
 
 	if (!rt5682s_clk_check(rt5682s))
 		return;
@@ -2534,16 +2568,12 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	snd_soc_component_update_bits(component, RT5682S_PWR_DIG_1,
 		RT5682S_DIG_GATE_CTRL, 0);
 
+	/* Power down PLLB */
+	rt5682s_set_pllb_power(rt5682s, 0);
+
 	rt5682s->wclk_enabled = 0;
 
 	mutex_unlock(&rt5682s->wclk_mutex);
-
-	snd_soc_dapm_mutex_lock(dapm);
-
-	snd_soc_dapm_disable_pin_unlocked(dapm, "PLLB");
-	snd_soc_dapm_sync_unlocked(dapm);
-
-	snd_soc_dapm_mutex_unlock(dapm);
 }
 
 static unsigned long rt5682s_wclk_recalc_rate(struct clk_hw *hw,
-- 
2.17.1

