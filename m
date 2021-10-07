Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CD7424F99
	for <lists+alsa-devel@lfdr.de>; Thu,  7 Oct 2021 10:57:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F4A6166D;
	Thu,  7 Oct 2021 10:56:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F4A6166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633597023;
	bh=v+geC71l21zT2kd7XAzIibn5bJjiSwU5uDxlgllQGFE=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PYOsCyexSw90AKI2La8Z4OICgFfC32B7lp5Qu5d9pNX4DiXig5uSiIxMKUAFOUfkJ
	 VNysAA4otOZu5IvHap0YOEV0NypDaRYB6iExsEfF+5QRf+Mg96MW+J6oM+MjDf4CrY
	 SseYKnWzhtRIQFzRvNqNoTWOBMSTMrKA0qFwwpUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15CAFF800FE;
	Thu,  7 Oct 2021 10:55:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B6A46F8027D; Thu,  7 Oct 2021 10:55:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C33C2F800F0
 for <alsa-devel@alsa-project.org>; Thu,  7 Oct 2021 10:55:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C33C2F800F0
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1978tRd75003376,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1978tRd75003376
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 7 Oct 2021 16:55:27 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.14; Thu, 7 Oct 2021 16:55:26 +0800
Received: from localhost.localdomain (172.22.233.10) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Thu, 7 Oct 2021 16:55:26 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682s: Fix hp pop produced immediately after resuming
Date: Thu, 7 Oct 2021 16:55:19 +0800
Message-ID: <20211007085519.12543-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.233.10]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/07/2021 08:43:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzEwLzcgpFekyCAwNjo0MzowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 10/07/2021 08:45:46
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 166567 [Oct 07 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 realtek.com:7.1.1; 127.0.0.199:7.1.2
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 10/07/2021 08:48:00
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, Derek Fang <derek.fang@realtek.com>,
 kevin_chen_ym@realtek.com, shumingf@realtek.com, flove@realtek.com
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

When the system plays a sound immediately after resuming from S3,
it could hear a little pop from headphones.
It is due to the HP was unmuted before the completion of
jack re-detection finished in parallel.

This patch adds a lock to make sure the HP unmute after jack detect handler,
and adds a few depop changes.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 27 ++++++++++++++++++++-------
 sound/soc/codecs/rt5682s.h |  6 ++++++
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 639a50fa95e2..9dd1796f3339 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -790,6 +790,7 @@ static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_
 		snd_soc_component_update_bits(component, RT5682S_HP_CHARGE_PUMP_2,
 			RT5682S_OSW_L_MASK | RT5682S_OSW_R_MASK,
 			RT5682S_OSW_L_EN | RT5682S_OSW_R_EN);
+		usleep_range(35000, 40000);
 	} else {
 		rt5682s_sar_power_mode(component, SAR_PWR_OFF, 1);
 		rt5682s_disable_push_button_irq(component);
@@ -829,6 +830,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 	while (!rt5682s->component->card->instantiated)
 		usleep_range(10000, 15000);
 
+	mutex_lock(&rt5682s->jdet_mutex);
 	mutex_lock(&rt5682s->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL)
@@ -896,6 +898,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		cancel_delayed_work_sync(&rt5682s->jd_check_work);
 
 	mutex_unlock(&rt5682s->calibrate_mutex);
+	mutex_unlock(&rt5682s->jdet_mutex);
 }
 
 static void rt5682s_jd_check_handler(struct work_struct *work)
@@ -1318,34 +1321,41 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
+	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
+	case SND_SOC_DAPM_POST_PMU:
 		snd_soc_component_update_bits(component, RT5682S_DEPOP_1,
 			RT5682S_OUT_HP_L_EN | RT5682S_OUT_HP_R_EN,
 			RT5682S_OUT_HP_L_EN | RT5682S_OUT_HP_R_EN);
+		usleep_range(15000, 20000);
 		snd_soc_component_update_bits(component, RT5682S_DEPOP_1,
 			RT5682S_LDO_PUMP_EN | RT5682S_PUMP_EN |
 			RT5682S_CAPLESS_L_EN | RT5682S_CAPLESS_R_EN,
 			RT5682S_LDO_PUMP_EN | RT5682S_PUMP_EN |
 			RT5682S_CAPLESS_L_EN | RT5682S_CAPLESS_R_EN);
-		break;
-
-	case SND_SOC_DAPM_POST_PMU:
-		usleep_range(30000, 35000);
 		snd_soc_component_write(component, RT5682S_BIAS_CUR_CTRL_11, 0x6666);
 		snd_soc_component_write(component, RT5682S_BIAS_CUR_CTRL_12, 0xa82a);
+
+		mutex_lock(&rt5682s->jdet_mutex);
+
 		snd_soc_component_update_bits(component, RT5682S_HP_CTRL_2,
 			RT5682S_HPO_L_PATH_MASK | RT5682S_HPO_R_PATH_MASK |
 			RT5682S_HPO_SEL_IP_EN_SW, RT5682S_HPO_L_PATH_EN |
 			RT5682S_HPO_R_PATH_EN | RT5682S_HPO_IP_EN_GATING);
-		snd_soc_component_write(component, RT5682S_HP_AMP_DET_CTL_1, 0x3050);
+		usleep_range(5000, 10000);
+		snd_soc_component_update_bits(component, RT5682S_HP_AMP_DET_CTL_1,
+			RT5682S_CP_SW_SIZE_MASK, RT5682S_CP_SW_SIZE_L | RT5682S_CP_SW_SIZE_S);
+
+		mutex_unlock(&rt5682s->jdet_mutex);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
 		snd_soc_component_update_bits(component, RT5682S_HP_CTRL_2,
 			RT5682S_HPO_L_PATH_MASK | RT5682S_HPO_R_PATH_MASK |
 			RT5682S_HPO_SEL_IP_EN_SW, 0);
+		snd_soc_component_update_bits(component, RT5682S_HP_AMP_DET_CTL_1,
+			RT5682S_CP_SW_SIZE_MASK, RT5682S_CP_SW_SIZE_M);
 		snd_soc_component_update_bits(component, RT5682S_DEPOP_1,
 			RT5682S_LDO_PUMP_EN | RT5682S_PUMP_EN |
 			RT5682S_CAPLESS_L_EN | RT5682S_CAPLESS_R_EN, 0);
@@ -1734,7 +1744,7 @@ static const struct snd_soc_dapm_widget rt5682s_dapm_widgets[] = {
 
 	/* HPO */
 	SND_SOC_DAPM_PGA_S("HP Amp", 1, SND_SOC_NOPM, 0, 0, rt5682s_hp_amp_event,
-		SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU),
+		SND_SOC_DAPM_POST_PMD | SND_SOC_DAPM_POST_PMU),
 
 	/* CLK DET */
 	SND_SOC_DAPM_SUPPLY("CLKDET SYS", RT5682S_CLK_DET,
@@ -3061,6 +3071,7 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c,
 
 	mutex_init(&rt5682s->calibrate_mutex);
 	mutex_init(&rt5682s->sar_mutex);
+	mutex_init(&rt5682s->jdet_mutex);
 	rt5682s_calibrate(rt5682s);
 
 	regmap_update_bits(rt5682s->regmap, RT5682S_MICBIAS_2,
@@ -3072,6 +3083,8 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c,
 		RT5682S_HP_SIG_SRC_MASK, RT5682S_HP_SIG_SRC_1BIT_CTL);
 	regmap_update_bits(rt5682s->regmap, RT5682S_HP_CHARGE_PUMP_2,
 		RT5682S_PM_HP_MASK, RT5682S_PM_HP_HV);
+	regmap_update_bits(rt5682s->regmap, RT5682S_HP_AMP_DET_CTL_1,
+		RT5682S_CP_SW_SIZE_MASK, RT5682S_CP_SW_SIZE_M);
 
 	/* DMIC data pin */
 	switch (rt5682s->pdata.dmic1_data_pin) {
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 59ba4ea3b062..1bf2ef7ce578 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1366,6 +1366,11 @@
 #define RT5682S_SAR_SOUR_BTN			(0x3f)
 #define RT5682S_SAR_SOUR_TYPE			(0x0)
 
+/* Headphone Amp Detection Control 1 (0x3b00) */
+#define RT5682S_CP_SW_SIZE_MASK			(0x7 << 4)
+#define RT5682S_CP_SW_SIZE_L			(0x4 << 4)
+#define RT5682S_CP_SW_SIZE_M			(0x2 << 4)
+#define RT5682S_CP_SW_SIZE_S			(0x1 << 4)
 
 #define RT5682S_STEREO_RATES SNDRV_PCM_RATE_8000_192000
 #define RT5682S_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE | \
@@ -1441,6 +1446,7 @@ struct rt5682s_priv {
 	struct delayed_work jd_check_work;
 	struct mutex calibrate_mutex;
 	struct mutex sar_mutex;
+	struct mutex jdet_mutex;
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[RT5682S_DAI_NUM_CLKS];
-- 
2.17.1

