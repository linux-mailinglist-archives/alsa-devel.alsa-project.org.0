Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9697A44AB07
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Nov 2021 10:56:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C602E166A;
	Tue,  9 Nov 2021 10:56:08 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C602E166A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1636451818;
	bh=u3IFdci+MM4XdI6JUA59KSZvg80rZGuTJaUx25FwV+A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fRp/G91QaAamLQD1ZIMXQtBjnX1HOJniRK0YbJbr+t407XayRwopJLUNQl26Lggus
	 ZNY1P8oeEHBQJwqNhe53AkM/xhy+FFHJcgnfpQAjUASvl/HCsrHg1+3f8WXHOUo+HR
	 Kgp8EhAQ8vSKObBPmMOFNWqsvuVZIWJIe+v7EWK4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0D14F804E0;
	Tue,  9 Nov 2021 10:55:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33B7DF802D2; Tue,  9 Nov 2021 10:55:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 251C2F80224
 for <alsa-devel@alsa-project.org>; Tue,  9 Nov 2021 10:55:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 251C2F80224
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 1A99supC7017869,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36503.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 1A99supC7017869
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 9 Nov 2021 17:54:56 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36503.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 9 Nov 2021 17:54:55 +0800
Received: from localhost.localdomain (172.22.233.64) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Tue, 9 Nov 2021 04:54:55 -0500
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5682: Re-detect the combo jack after resuming
Date: Tue, 9 Nov 2021 17:54:50 +0800
Message-ID: <20211109095450.12950-2-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211109095450.12950-1-derek.fang@realtek.com>
References: <20211109095450.12950-1-derek.fang@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.233.64]
X-ClientProxiedBy: RTEXH36503.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2021 09:42:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIxLzExLzkgpFekyCAwNzoxNzowMA==?=
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-ServerInfo: RTEXH36503.realtek.com.tw, 9
X-KSE-Attachment-Filter-Triggered-Rules: Clean
X-KSE-Attachment-Filter-Triggered-Filters: Clean
X-KSE-BulkMessagesFiltering-Scan-Result: protection disabled
X-KSE-AntiSpam-Outbound-Interceptor-Info: scan successful
X-KSE-AntiSpam-Version: 5.9.20, Database issued on: 11/09/2021 09:38:58
X-KSE-AntiSpam-Status: KAS_STATUS_NOT_DETECTED
X-KSE-AntiSpam-Method: none
X-KSE-AntiSpam-Rate: 0
X-KSE-AntiSpam-Info: Lua profiles 167134 [Nov 09 2021]
X-KSE-AntiSpam-Info: Version: 5.9.20.0
X-KSE-AntiSpam-Info: Envelope from: derek.fang@realtek.com
X-KSE-AntiSpam-Info: LuaCore: 465 465 eb31509370142567679dd183ac984a0cb2ee3296
X-KSE-AntiSpam-Info: {Tracking_from_domain_doesnt_match_to}
X-KSE-AntiSpam-Info: 127.0.0.199:7.1.2;
 d41d8cd98f00b204e9800998ecf8427e.com:7.1.1; realtek.com:7.1.1
X-KSE-AntiSpam-Info: Rate: 0
X-KSE-AntiSpam-Info: Status: not_detected
X-KSE-AntiSpam-Info: Method: none
X-KSE-AntiSpam-Info: Auth:dkim=none
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Heuristic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 11/09/2021 09:42:00
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

Sometimes, end-users change the jack type under suspending,
so it needs to re-detect the combo jack type after resuming to
avoid any unexpected behaviors.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682-i2c.c |  1 +
 sound/soc/codecs/rt5682.c     | 23 ++++++++++++++++++++---
 sound/soc/codecs/rt5682.h     |  1 +
 3 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index a30e42932cf7..fdf7d4005760 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -198,6 +198,7 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 	}
 
 	mutex_init(&rt5682->calibrate_mutex);
+	mutex_init(&rt5682->jdet_mutex);
 	rt5682_calibrate(rt5682);
 
 	rt5682_apply_patch_list(rt5682, &i2c->dev);
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index a486ac268c33..04cb747c2b12 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -49,6 +49,7 @@ static const struct reg_sequence patch_list[] = {
 	{RT5682_CHARGE_PUMP_1, 0x0210},
 	{RT5682_HP_LOGIC_CTRL_2, 0x0007},
 	{RT5682_SAR_IL_CMD_2, 0xac00},
+	{RT5682_CBJ_CTRL_7, 0x0104},
 };
 
 void rt5682_apply_patch_list(struct rt5682_priv *rt5682, struct device *dev)
@@ -941,6 +942,10 @@ int rt5682_headset_detect(struct snd_soc_component *component, int jack_insert)
 		snd_soc_component_update_bits(component,
 			RT5682_HP_CHARGE_PUMP_1,
 			RT5682_OSW_L_MASK | RT5682_OSW_R_MASK, 0);
+		rt5682_enable_push_button_irq(component, false);
+		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
+			RT5682_TRIG_JD_MASK, RT5682_TRIG_JD_LOW);
+		usleep_range(55000, 60000);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
 			RT5682_TRIG_JD_MASK, RT5682_TRIG_JD_HIGH);
 
@@ -1093,6 +1098,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	while (!rt5682->component->card->instantiated)
 		usleep_range(10000, 15000);
 
+	mutex_lock(&rt5682->jdet_mutex);
 	mutex_lock(&rt5682->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5682->component, RT5682_AJD1_CTRL)
@@ -1166,6 +1172,7 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	}
 
 	mutex_unlock(&rt5682->calibrate_mutex);
+	mutex_unlock(&rt5682->jdet_mutex);
 }
 EXPORT_SYMBOL_GPL(rt5682_jack_detect_handler);
 
@@ -1515,6 +1522,7 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component =
 		snd_soc_dapm_to_component(w->dapm);
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1526,12 +1534,17 @@ static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 			RT5682_DEPOP_1, 0x60, 0x60);
 		snd_soc_component_update_bits(component,
 			RT5682_DAC_ADC_DIG_VOL1, 0x00c0, 0x0080);
+
+		mutex_lock(&rt5682->jdet_mutex);
+
 		snd_soc_component_update_bits(component, RT5682_HP_CTRL_2,
 			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN,
 			RT5682_HP_C2_DAC_L_EN | RT5682_HP_C2_DAC_R_EN);
 		usleep_range(5000, 10000);
 		snd_soc_component_update_bits(component, RT5682_CHARGE_PUMP_1,
 			RT5682_CP_SW_SIZE_MASK, RT5682_CP_SW_SIZE_L);
+
+		mutex_unlock(&rt5682->jdet_mutex);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
@@ -2943,7 +2956,7 @@ static int rt5682_suspend(struct snd_soc_component *component)
 
 	cancel_delayed_work_sync(&rt5682->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682->jd_check_work);
-	if (rt5682->hs_jack && rt5682->jack_type == SND_JACK_HEADSET) {
+	if (rt5682->hs_jack && (rt5682->jack_type & SND_JACK_HEADSET) == SND_JACK_HEADSET) {
 		val = snd_soc_component_read(component,
 				RT5682_CBJ_CTRL_2) & RT5682_JACK_TYPE_MASK;
 
@@ -2974,6 +2987,8 @@ static int rt5682_suspend(struct snd_soc_component *component)
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
 			RT5682_SAR_BUTT_DET_MASK | RT5682_SAR_BUTDET_MODE_MASK,
 			RT5682_SAR_BUTT_DET_EN | RT5682_SAR_BUTDET_POW_SAV);
+		snd_soc_component_update_bits(component, RT5682_HP_CHARGE_PUMP_1,
+			RT5682_OSW_L_MASK | RT5682_OSW_R_MASK, 0);
 	}
 
 	regcache_cache_only(rt5682->regmap, true);
@@ -2991,10 +3006,11 @@ static int rt5682_resume(struct snd_soc_component *component)
 	regcache_cache_only(rt5682->regmap, false);
 	regcache_sync(rt5682->regmap);
 
-	if (rt5682->hs_jack && rt5682->jack_type == SND_JACK_HEADSET) {
+	if (rt5682->hs_jack && (rt5682->jack_type & SND_JACK_HEADSET) == SND_JACK_HEADSET) {
 		snd_soc_component_update_bits(component, RT5682_SAR_IL_CMD_1,
 			RT5682_SAR_BUTDET_MODE_MASK | RT5682_SAR_SEL_MB1_MB2_MASK,
 			RT5682_SAR_BUTDET_POW_NORM | RT5682_SAR_SEL_MB1_MB2_AUTO);
+		usleep_range(5000, 6000);
 		snd_soc_component_update_bits(component, RT5682_CBJ_CTRL_1,
 			RT5682_MB1_PATH_MASK | RT5682_MB2_PATH_MASK,
 			RT5682_CTRL_MB1_FSM | RT5682_CTRL_MB2_FSM);
@@ -3002,8 +3018,9 @@ static int rt5682_resume(struct snd_soc_component *component)
 			RT5682_PWR_CBJ, RT5682_PWR_CBJ);
 	}
 
+	rt5682->jack_type = 0;
 	mod_delayed_work(system_power_efficient_wq,
-		&rt5682->jack_detect_work, msecs_to_jiffies(250));
+		&rt5682->jack_detect_work, msecs_to_jiffies(0));
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682.h b/sound/soc/codecs/rt5682.h
index d93829c35585..c917c76200ea 100644
--- a/sound/soc/codecs/rt5682.h
+++ b/sound/soc/codecs/rt5682.h
@@ -1463,6 +1463,7 @@ struct rt5682_priv {
 
 	int jack_type;
 	int irq_work_delay_time;
+	struct mutex jdet_mutex;
 };
 
 extern const char *rt5682_supply_names[RT5682_NUM_SUPPLIES];
-- 
2.17.1

