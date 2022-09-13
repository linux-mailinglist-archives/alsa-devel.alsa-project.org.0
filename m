Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 674115B65E2
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Sep 2022 04:58:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E71CE1660;
	Tue, 13 Sep 2022 04:57:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E71CE1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663037908;
	bh=dqPwTWGBk307s06NF0BPRHn9M0ZCUjUagXP/fPKadPk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mrgGzNE/ia/IIFe8CdGpQdhQzbMaV3bOND7bqo6uC2L/1mc6iI7JU5GJJZmGWG75K
	 pTr0o/KiG5gvdrrjcKoxL9hsWdF35IxgpkhXVcB1UBhxjYBTrYDI61eU96febeILlH
	 44RUZc9Ef4CsRt2d8I9uiVkjrzFBez91S6U2hYWw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B3AF800FE;
	Tue, 13 Sep 2022 04:57:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5B10F800FE; Tue, 13 Sep 2022 04:57:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 by alsa1.perex.cz (Postfix) with ESMTP id A5A1FF800FE
 for <alsa-devel@alsa-project.org>; Tue, 13 Sep 2022 04:57:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5A1FF800FE
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 28D2uii07017628,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 28D2uii07017628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=FAIL);
 Tue, 13 Sep 2022 10:56:44 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 13 Sep 2022 10:57:04 +0800
Received: from localhost.localdomain (172.22.102.99) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Tue, 13 Sep 2022 10:57:03 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 1/3] ASoC: rt5682s: Reduce coupling of Micbias and Vref2
 settings
Date: Tue, 13 Sep 2022 10:56:56 +0800
Message-ID: <20220913025658.5005-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
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

Some parts of rt5682s CCF function are implemented by
'MICBIAS' and 'Vref2' dapm widgets.

There is a risk of causing not expected behavior if we
mix using dapm and CCF operations in machine specific code.
This patch reduces the coupling.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 54 ++++++++++++++++++--------------------
 sound/soc/codecs/rt5682s.h |  2 ++
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index eb47e7cd485a..c5c55d146ddf 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -739,6 +739,7 @@ static void rt5682s_disable_push_button_irq(struct snd_soc_component *component)
  */
 static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_insert)
 {
+	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 	unsigned int val, count;
 	int jack_type = 0;
 
@@ -805,12 +806,10 @@ static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_
 		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_1,
 			RT5682S_TRIG_JD_MASK, RT5682S_TRIG_JD_LOW);
 
-		if (!snd_soc_dapm_get_pin_status(&component->dapm, "MICBIAS"))
-			snd_soc_component_update_bits(component,
-				RT5682S_PWR_ANLG_1, RT5682S_PWR_MB, 0);
-		if (!snd_soc_dapm_get_pin_status(&component->dapm, "Vref2"))
+		if (!rt5682s->wclk_enabled) {
 			snd_soc_component_update_bits(component,
-				RT5682S_PWR_ANLG_1, RT5682S_PWR_VREF2, 0);
+				RT5682S_PWR_ANLG_1, RT5682S_PWR_VREF2 | RT5682S_PWR_MB, 0);
+		}
 
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_3,
 			RT5682S_PWR_CBJ, 0);
@@ -845,6 +844,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 
 	snd_soc_dapm_mutex_lock(dapm);
 	mutex_lock(&rt5682s->calibrate_mutex);
+	mutex_lock(&rt5682s->wclk_mutex);
 
 	val = snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL)
 		& RT5682S_JDH_RS_MASK;
@@ -900,6 +900,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		rt5682s->irq_work_delay_time = 50;
 	}
 
+	mutex_unlock(&rt5682s->wclk_mutex);
 	mutex_unlock(&rt5682s->calibrate_mutex);
 	snd_soc_dapm_mutex_unlock(dapm);
 
@@ -1218,13 +1219,9 @@ static int set_dmic_power(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
-		if (!rt5682s->jack_type) {
-			if (!snd_soc_dapm_get_pin_status(w->dapm, "MICBIAS"))
-				snd_soc_component_update_bits(component,
-					RT5682S_PWR_ANLG_1, RT5682S_PWR_MB, 0);
-			if (!snd_soc_dapm_get_pin_status(w->dapm, "Vref2"))
-				snd_soc_component_update_bits(component,
-					RT5682S_PWR_ANLG_1, RT5682S_PWR_VREF2, 0);
+		if (!rt5682s->jack_type && !rt5682s->wclk_enabled) {
+			snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
+				RT5682S_PWR_VREF2 | RT5682S_PWR_MB, 0);
 		}
 		break;
 	}
@@ -1615,8 +1612,6 @@ static const struct snd_soc_dapm_widget rt5682s_dapm_widgets[] = {
 		RT5682S_PWR_LDO_MB2_BIT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY("LDO", RT5682S_PWR_ANLG_3,
 		RT5682S_PWR_LDO_BIT, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("Vref2", SND_SOC_NOPM, 0, 0, NULL, 0),
-	SND_SOC_DAPM_SUPPLY("MICBIAS", SND_SOC_NOPM, 0, 0, NULL, 0),
 
 	/* PLL Powers */
 	SND_SOC_DAPM_SUPPLY_S("PLLA_LDO", 0, RT5682S_PWR_ANLG_3,
@@ -2469,19 +2464,21 @@ static int rt5682s_wclk_prepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return -EINVAL;
 
-	snd_soc_dapm_mutex_lock(dapm);
-
-	snd_soc_dapm_force_enable_pin_unlocked(dapm, "MICBIAS");
-	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
-		RT5682S_PWR_MB, RT5682S_PWR_MB);
+	mutex_lock(&rt5682s->wclk_mutex);
 
-	snd_soc_dapm_force_enable_pin_unlocked(dapm, "Vref2");
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
-		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2, RT5682S_PWR_VREF2);
+		RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB,
+		RT5682S_PWR_VREF2 | RT5682S_PWR_MB);
 	usleep_range(15000, 20000);
 	snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 		RT5682S_PWR_FV2, RT5682S_PWR_FV2);
 
+	rt5682s->wclk_enabled = 1;
+
+	mutex_unlock(&rt5682s->wclk_mutex);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "I2S1");
 	/* Only need to power PLLB due to the rate set restriction */
 	snd_soc_dapm_force_enable_pin_unlocked(dapm, "PLLB");
@@ -2502,14 +2499,18 @@ static void rt5682s_wclk_unprepare(struct clk_hw *hw)
 	if (!rt5682s_clk_check(rt5682s))
 		return;
 
-	snd_soc_dapm_mutex_lock(dapm);
+	mutex_lock(&rt5682s->wclk_mutex);
 
-	snd_soc_dapm_disable_pin_unlocked(dapm, "MICBIAS");
-	snd_soc_dapm_disable_pin_unlocked(dapm, "Vref2");
 	if (!rt5682s->jack_type)
 		snd_soc_component_update_bits(component, RT5682S_PWR_ANLG_1,
 			RT5682S_PWR_VREF2 | RT5682S_PWR_FV2 | RT5682S_PWR_MB, 0);
 
+	rt5682s->wclk_enabled = 0;
+
+	mutex_unlock(&rt5682s->wclk_mutex);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
 	snd_soc_dapm_disable_pin_unlocked(dapm, "I2S1");
 	snd_soc_dapm_disable_pin_unlocked(dapm, "PLLB");
 	snd_soc_dapm_sync_unlocked(dapm);
@@ -2805,7 +2806,6 @@ static inline int rt5682s_dai_probe_clks(struct snd_soc_component *component)
 static int rt5682s_probe(struct snd_soc_component *component)
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
-	struct snd_soc_dapm_context *dapm = &component->dapm;
 	int ret;
 
 	rt5682s->component = component;
@@ -2814,9 +2814,6 @@ static int rt5682s_probe(struct snd_soc_component *component)
 	if (ret)
 		return ret;
 
-	snd_soc_dapm_disable_pin(dapm, "MICBIAS");
-	snd_soc_dapm_disable_pin(dapm, "Vref2");
-	snd_soc_dapm_sync(dapm);
 	return 0;
 }
 
@@ -3113,6 +3110,7 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c)
 
 	mutex_init(&rt5682s->calibrate_mutex);
 	mutex_init(&rt5682s->sar_mutex);
+	mutex_init(&rt5682s->wclk_mutex);
 	rt5682s_calibrate(rt5682s);
 
 	regmap_update_bits(rt5682s->regmap, RT5682S_MICBIAS_2,
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 7353831c73dd..824dc6543c18 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1450,6 +1450,7 @@ struct rt5682s_priv {
 	struct delayed_work jd_check_work;
 	struct mutex calibrate_mutex;
 	struct mutex sar_mutex;
+	struct mutex wclk_mutex;
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[RT5682S_DAI_NUM_CLKS];
@@ -1469,6 +1470,7 @@ struct rt5682s_priv {
 
 	int jack_type;
 	int irq_work_delay_time;
+	int wclk_enabled;
 };
 
 int rt5682s_sel_asrc_clk_src(struct snd_soc_component *component,
-- 
2.17.1

