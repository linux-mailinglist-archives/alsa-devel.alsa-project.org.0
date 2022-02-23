Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 885694C1004
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Feb 2022 11:16:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 219B31706;
	Wed, 23 Feb 2022 11:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 219B31706
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645611388;
	bh=bvaXNd14O6uI9dM0U+1/dlgeUGvK29J8FyRtkfxMVT4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tAbqvSxGiPcnrMmGC01mWpClAbhn71TcWH6evK03Q7ZIZp8jZxJM3sR+i/FjymFNq
	 YWKgYmWJfpJZctEQmOeKgbu0pquCJXouPXGqiRB2c8G+ZTi/QmqoHXUMlJzZYQB9jS
	 6oav0iFmkPwWZsCbkreWCKHU0B5t4zR/Dyx+gZ1c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6D191F80237;
	Wed, 23 Feb 2022 11:15:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B2AFF80237; Wed, 23 Feb 2022 11:15:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6BCC3F800F5
 for <alsa-devel@alsa-project.org>; Wed, 23 Feb 2022 11:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6BCC3F800F5
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 21NAF0290009118,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
 by rtits2.realtek.com.tw (8.15.2/2.71/5.88) with ESMTPS id 21NAF0290009118
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 23 Feb 2022 18:15:00 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 23 Feb 2022 18:15:00 +0800
Received: from localhost.localdomain (172.22.233.98) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Wed, 23 Feb 2022 18:15:00 +0800
From: <derek.fang@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5682s: Fix the wrong jack type detected
Date: Wed, 23 Feb 2022 18:14:50 +0800
Message-ID: <20220223101450.4577-1-derek.fang@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [172.22.233.98]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: trusted connection
X-KSE-Antiphishing-Info: Clean
X-KSE-Antiphishing-ScanningType: Deterministic
X-KSE-Antiphishing-Method: None
X-KSE-Antiphishing-Bases: 02/23/2022 09:45:00
X-KSE-AttachmentFiltering-Interceptor-Info: no applicable attachment filtering
 rules found
X-KSE-Antivirus-Interceptor-Info: scan successful
X-KSE-Antivirus-Info: =?big5?B?Q2xlYW4sIGJhc2VzOiAyMDIyLzIvMjMgpFekyCAwODoxMDowMA==?=
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

Some powers were changed during the jack insert detection and clk's
enable/disable in CCF.
If in parallel, the influence has a chance to detect the wrong jack
type.

We refer to the below commit of the variant codec (rt5682) to fix
this issue.
  ASoC: rt5682: Fix deadlock on resume

1. Remove rt5682s_headset_detect in rt5682s_jd_check_handler and
   use jack_detect_work instead of.
2. Use dapm mutex used in CCF to protect most of jack_detect_work.

Signed-off-by: Derek Fang <derek.fang@realtek.com>
---
 sound/soc/codecs/rt5682s.c | 26 +++++++++-----------------
 sound/soc/codecs/rt5682s.h |  1 -
 2 files changed, 9 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index efa1016831dd..849fcd7132a8 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -822,6 +822,7 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 {
 	struct rt5682s_priv *rt5682s =
 		container_of(work, struct rt5682s_priv, jack_detect_work.work);
+	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
 	while (!rt5682s->component)
@@ -830,7 +831,9 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 	while (!rt5682s->component->card->instantiated)
 		usleep_range(10000, 15000);
 
-	mutex_lock(&rt5682s->jdet_mutex);
+	dapm = snd_soc_component_get_dapm(rt5682s->component);
+
+	snd_soc_dapm_mutex_lock(dapm);
 	mutex_lock(&rt5682s->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL)
@@ -887,6 +890,9 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		rt5682s->irq_work_delay_time = 50;
 	}
 
+	mutex_unlock(&rt5682s->calibrate_mutex);
+	snd_soc_dapm_mutex_unlock(dapm);
+
 	snd_soc_jack_report(rt5682s->hs_jack, rt5682s->jack_type,
 		SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
 		SND_JACK_BTN_2 | SND_JACK_BTN_3);
@@ -896,9 +902,6 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5682s->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5682s->jd_check_work);
-
-	mutex_unlock(&rt5682s->calibrate_mutex);
-	mutex_unlock(&rt5682s->jdet_mutex);
 }
 
 static void rt5682s_jd_check_handler(struct work_struct *work)
@@ -906,14 +909,9 @@ static void rt5682s_jd_check_handler(struct work_struct *work)
 	struct rt5682s_priv *rt5682s =
 		container_of(work, struct rt5682s_priv, jd_check_work.work);
 
-	if (snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL)
-		& RT5682S_JDH_RS_MASK) {
+	if (snd_soc_component_read(rt5682s->component, RT5682S_AJD1_CTRL) & RT5682S_JDH_RS_MASK) {
 		/* jack out */
-		rt5682s->jack_type = rt5682s_headset_detect(rt5682s->component, 0);
-
-		snd_soc_jack_report(rt5682s->hs_jack, rt5682s->jack_type,
-			SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 |
-			SND_JACK_BTN_2 | SND_JACK_BTN_3);
+		schedule_delayed_work(&rt5682s->jack_detect_work, 0);
 	} else {
 		schedule_delayed_work(&rt5682s->jd_check_work, 500);
 	}
@@ -1321,7 +1319,6 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct rt5682s_priv *rt5682s = snd_soc_component_get_drvdata(component);
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
@@ -1337,8 +1334,6 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		snd_soc_component_write(component, RT5682S_BIAS_CUR_CTRL_11, 0x6666);
 		snd_soc_component_write(component, RT5682S_BIAS_CUR_CTRL_12, 0xa82a);
 
-		mutex_lock(&rt5682s->jdet_mutex);
-
 		snd_soc_component_update_bits(component, RT5682S_HP_CTRL_2,
 			RT5682S_HPO_L_PATH_MASK | RT5682S_HPO_R_PATH_MASK |
 			RT5682S_HPO_SEL_IP_EN_SW, RT5682S_HPO_L_PATH_EN |
@@ -1346,8 +1341,6 @@ static int rt5682s_hp_amp_event(struct snd_soc_dapm_widget *w,
 		usleep_range(5000, 10000);
 		snd_soc_component_update_bits(component, RT5682S_HP_AMP_DET_CTL_1,
 			RT5682S_CP_SW_SIZE_MASK, RT5682S_CP_SW_SIZE_L | RT5682S_CP_SW_SIZE_S);
-
-		mutex_unlock(&rt5682s->jdet_mutex);
 		break;
 
 	case SND_SOC_DAPM_POST_PMD:
@@ -3101,7 +3094,6 @@ static int rt5682s_i2c_probe(struct i2c_client *i2c,
 
 	mutex_init(&rt5682s->calibrate_mutex);
 	mutex_init(&rt5682s->sar_mutex);
-	mutex_init(&rt5682s->jdet_mutex);
 	rt5682s_calibrate(rt5682s);
 
 	regmap_update_bits(rt5682s->regmap, RT5682S_MICBIAS_2,
diff --git a/sound/soc/codecs/rt5682s.h b/sound/soc/codecs/rt5682s.h
index 1bf2ef7ce578..397a2531b6f6 100644
--- a/sound/soc/codecs/rt5682s.h
+++ b/sound/soc/codecs/rt5682s.h
@@ -1446,7 +1446,6 @@ struct rt5682s_priv {
 	struct delayed_work jd_check_work;
 	struct mutex calibrate_mutex;
 	struct mutex sar_mutex;
-	struct mutex jdet_mutex;
 
 #ifdef CONFIG_COMMON_CLK
 	struct clk_hw dai_clks_hw[RT5682S_DAI_NUM_CLKS];
-- 
2.17.1

