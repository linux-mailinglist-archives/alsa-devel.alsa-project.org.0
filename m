Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A84CFA7D
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Mar 2022 11:23:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AA07916A2;
	Mon,  7 Mar 2022 11:22:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AA07916A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646648607;
	bh=rgOvrNvuKdPASHpd5zWRUAw9Q9ss2BsaFN+hw1/F25Y=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ecJ0ohEYN+V1biFJX2od8l8w7OwR3wCz3f3ualvk7oPl8yZf2Ai1022AApeMJoPq7
	 02N5JDx8hoIRSdA4Mz3WmyGQRbv19gN+Jnqs/AMjZhCnR6N+QRtc73MqiTqdzvIJz2
	 1Wo/PyPWW04IWnk+eYoKim76jAhqAU0l4SrwaWjs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15FCEF80159;
	Mon,  7 Mar 2022 11:22:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2EC5DF8013F; Mon,  7 Mar 2022 11:22:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9638FF800E9
 for <alsa-devel@alsa-project.org>; Mon,  7 Mar 2022 11:22:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9638FF800E9
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 227AM15Y0027421,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 227AM15Y0027421
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 7 Mar 2022 18:22:01 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 7 Mar 2022 18:22:01 +0800
Received: from localhost.localdomain (10.22.235.38) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Mon, 7 Mar 2022 18:22:00 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682s: Stabilize the combo jack detection
Date: Mon, 7 Mar 2022 18:21:54 +0800
Message-ID: <20220307102154.26065-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.22.235.38]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 03/07/2022 10:08:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzMvNyCkV6TIIDA5OjA3OjAw?=
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

Changes:
1. Revise rt5682s_sar_power_mode and rt5682s_headset_detect to be more
   rational.
2. Manually set to the jack-unplugging state via rt5682s_headset_detect
   during going to suspend. Close unnecessary powers and prepare for
   re-detecting the CBJ during resuming.
3. Simplize rt5682s_resume.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 47 +++++++++++++++++++++-----------------
 1 file changed, 26 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 92b8753f1267..1cba8ec7cedb 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -644,8 +644,7 @@ enum {
 	SAR_PWR_SAVING,
 };
 
-static void rt5682s_sar_power_mode(struct snd_soc_component *component,
-				int mode, int jd_step)
+static void rt5682s_sar_power_mode(struct snd_soc_component *component, int mode)
 {
 	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
@@ -675,16 +674,17 @@ static void rt5682s_sar_power_mode(struct snd_soc_component *component,
 		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_1,
 			RT5682S_MB1_PATH_MASK | RT5682S_MB2_PATH_MASK,
 			RT5682S_CTRL_MB1_FSM | RT5682S_CTRL_MB2_FSM);
-		if (!jd_step) {
-			snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
-				RT5682S_SAR_SEL_MB1_2_CTL_MASK, RT5682S_SAR_SEL_MB1_2_AUTO);
-			usleep_range(5000, 5500);
-			snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
-				RT5682S_SAR_BUTDET_MASK | RT5682S_SAR_BUTDET_POW_MASK,
-				RT5682S_SAR_BUTDET_EN | RT5682S_SAR_BUTDET_POW_NORM);
-		}
+		snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
+			RT5682S_SAR_SEL_MB1_2_CTL_MASK, RT5682S_SAR_SEL_MB1_2_AUTO);
+		usleep_range(5000, 5500);
+		snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
+			RT5682S_SAR_BUTDET_MASK | RT5682S_SAR_BUTDET_POW_MASK,
+			RT5682S_SAR_BUTDET_EN | RT5682S_SAR_BUTDET_POW_NORM);
 		break;
 	case SAR_PWR_OFF:
+		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_1,
+			RT5682S_MB1_PATH_MASK | RT5682S_MB2_PATH_MASK,
+			RT5682S_CTRL_MB1_FSM | RT5682S_CTRL_MB2_FSM);
 		snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
 			RT5682S_SAR_BUTDET_MASK | RT5682S_SAR_BUTDET_POW_MASK |
 			RT5682S_SAR_SEL_MB1_2_CTL_MASK, RT5682S_SAR_BUTDET_DIS |
@@ -702,6 +702,10 @@ static void rt5682s_enable_push_button_irq(struct snd_soc_component *component)
 {
 	snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_13,
 		RT5682S_SAR_SOUR_MASK, RT5682S_SAR_SOUR_BTN);
+	snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
+		RT5682S_SAR_BUTDET_MASK | RT5682S_SAR_BUTDET_POW_MASK |
+		RT5682S_SAR_SEL_MB1_2_CTL_MASK, RT5682S_SAR_BUTDET_EN |
+		RT5682S_SAR_BUTDET_POW_NORM | RT5682S_SAR_SEL_MB1_2_AUTO);
 	snd_soc_component_write(component, RT5682S_IL_CMD_1, 0x0040);
 	snd_soc_component_update_bits(component, RT5682S_4BTN_IL_CMD_2,
 		RT5682S_4BTN_IL_MASK | RT5682S_4BTN_IL_RST_MASK,
@@ -718,6 +722,10 @@ static void rt5682s_disable_push_button_irq(struct snd_soc_component *component)
 		RT5682S_4BTN_IL_MASK, RT5682S_4BTN_IL_DIS);
 	snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_13,
 		RT5682S_SAR_SOUR_MASK, RT5682S_SAR_SOUR_TYPE);
+	snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
+		RT5682S_SAR_BUTDET_MASK | RT5682S_SAR_BUTDET_POW_MASK |
+		RT5682S_SAR_SEL_MB1_2_CTL_MASK, RT5682S_SAR_BUTDET_DIS |
+		RT5682S_SAR_BUTDET_POW_SAV | RT5682S_SAR_SEL_MB1_2_MANU);
 }
 
 /**
@@ -753,7 +761,8 @@ static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_
 			RT5682S_OSW_L_DIS | RT5682S_OSW_R_DIS);
 		snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_13,
 			RT5682S_SAR_SOUR_MASK, RT5682S_SAR_SOUR_TYPE);
-		rt5682s_sar_power_mode(component, SAR_PWR_NORMAL, 1);
+		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_3,
+			RT5682S_CBJ_IN_BUF_MASK, RT5682S_CBJ_IN_BUF_EN);
 		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_1,
 			RT5682S_TRIG_JD_MASK, RT5682S_TRIG_JD_LOW);
 		usleep_range(45000, 50000);
@@ -779,9 +788,8 @@ static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_
 				RT5682S_FAST_OFF_MASK, RT5682S_FAST_OFF_EN);
 			snd_soc_component_update_bits(component, RT5682S_SAR_IL_CMD_1,
 				RT5682S_SAR_SEL_MB1_2_MASK, val << RT5682S_SAR_SEL_MB1_2_SFT);
-			if (!snd_soc_dapm_get_pin_status(&component->dapm, "SAR"))
-				rt5682s_sar_power_mode(component, SAR_PWR_SAVING, 1);
 			rt5682s_enable_push_button_irq(component);
+			rt5682s_sar_power_mode(component, SAR_PWR_SAVING);
 			break;
 		default:
 			jack_type = SND_JACK_HEADPHONE;
@@ -792,7 +800,7 @@ static int rt5682s_headset_detect(struct snd_soc_component *component, int jack_
 			RT5682S_OSW_L_EN | RT5682S_OSW_R_EN);
 		usleep_range(35000, 40000);
 	} else {
-		rt5682s_sar_power_mode(component, SAR_PWR_OFF, 1);
+		rt5682s_sar_power_mode(component, SAR_PWR_OFF);
 		rt5682s_disable_push_button_irq(component);
 		snd_soc_component_update_bits(component, RT5682S_CBJ_CTRL_1,
 			RT5682S_TRIG_JD_MASK, RT5682S_TRIG_JD_LOW);
@@ -1398,10 +1406,10 @@ static int sar_power_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		rt5682s_sar_power_mode(component, SAR_PWR_NORMAL, 0);
+		rt5682s_sar_power_mode(component, SAR_PWR_NORMAL);
 		break;
 	case SND_SOC_DAPM_POST_PMD:
-		rt5682s_sar_power_mode(component, SAR_PWR_SAVING, 0);
+		rt5682s_sar_power_mode(component, SAR_PWR_SAVING);
 		break;
 	}
 
@@ -2830,9 +2838,8 @@ static int rt5682s_suspend(struct snd_soc_component *component)
 	cancel_delayed_work_sync(&rt5682s->jack_detect_work);
 	cancel_delayed_work_sync(&rt5682s->jd_check_work);
 
-	if (rt5682s->hs_jack && rt5682s->jack_type == SND_JACK_HEADSET)
-		snd_soc_component_update_bits(component, RT5682S_4BTN_IL_CMD_2,
-			RT5682S_4BTN_IL_MASK, RT5682S_4BTN_IL_DIS);
+	if (rt5682s->hs_jack)
+		rt5682s->jack_type = rt5682s_headset_detect(component, 0);
 
 	regcache_cache_only(rt5682s->regmap, true);
 	regcache_mark_dirty(rt5682s->regmap);
@@ -2848,8 +2855,6 @@ static int rt5682s_resume(struct snd_soc_component *component)
 	regcache_sync(rt5682s->regmap);
 
 	if (rt5682s->hs_jack) {
-		rt5682s->jack_type = 0;
-		rt5682s_sar_power_mode(component, SAR_PWR_NORMAL, 0);
 		mod_delayed_work(system_power_efficient_wq,
 			&rt5682s->jack_detect_work, msecs_to_jiffies(0));
 	}
-- 
2.17.1

