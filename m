Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 239692E76ED
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 09:04:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93FCE1781;
	Wed, 30 Dec 2020 09:03:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93FCE1781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609315466;
	bh=o3pTPxUW/eCYbdmOuUOdL1/QgWU19hF0rmaFV+wT7a8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qXYkzJspfQyDrRhBQChbE0qibacJvrcLhS9aFlZoQy9H0I9Dh35VSl0E09i9cZBst
	 3KjJAaJBXIbUk0+VOrsMPUQiQT2N1cH1HCSJsAKJpH5XsPNTyvUHl3gP4q9RJWFkXN
	 1M/v6FeJLqEnymlkSPjQNzOAySMOc/DAP5iBpYXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1387EF80132;
	Wed, 30 Dec 2020 09:02:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A2F82F801F5; Wed, 30 Dec 2020 09:02:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2994F80162
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 09:02:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2994F80162
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 0BU82ewZ6001259,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 0BU82ewZ6001259
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 30 Dec 2020 16:02:40 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 30 Dec 2020 16:02:40 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH] ASoC: rt5645: Remove the redundant delay time
Date: Wed, 30 Dec 2020 16:02:35 +0800
Message-ID: <20201230080235.12698-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS01.realtek.com.tw (172.21.6.94) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: Oder Chiou <oder_chiou@realtek.com>, jack.yu@realtek.com,
 alsa-devel@alsa-project.org, judyhsiao@google.com, albertchen@realtek.com,
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

This patch removes the redundant delay time to speed up from the cold start
of headphone playback.

Signed-off-by: Oder Chiou <oder_chiou@realtek.com>
---
 sound/soc/codecs/rt5645.c | 33 ++++++++-------------------------
 1 file changed, 8 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 420003d062c7..1c9e61abda30 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -435,7 +435,6 @@ struct rt5645_priv {
 
 	int jack_type;
 	bool en_button_func;
-	bool hp_on;
 	int v_id;
 };
 
@@ -1645,6 +1644,7 @@ static void hp_amp_power(struct snd_soc_component *component, int on)
 {
 	static int hp_amp_power_count;
 	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
+	int i, val;
 
 	if (on) {
 		if (hp_amp_power_count <= 0) {
@@ -1655,7 +1655,13 @@ static void hp_amp_power(struct snd_soc_component *component, int on)
 				snd_soc_component_write(component, RT5645_DEPOP_M1, 0x000d);
 				regmap_write(rt5645->regmap, RT5645_PR_BASE +
 					RT5645_HP_DCC_INT1, 0x9f01);
-				msleep(20);
+				for (i = 0; i < 20; i++) {
+					usleep_range(1000, 1500);
+					regmap_read(rt5645->regmap, RT5645_PR_BASE +
+						RT5645_HP_DCC_INT1, &val);
+					if (!(val & 0x8000))
+						break;
+				}
 				snd_soc_component_update_bits(component, RT5645_DEPOP_M1,
 					RT5645_HP_CO_MASK, RT5645_HP_CO_EN);
 				regmap_write(rt5645->regmap, RT5645_PR_BASE +
@@ -1665,7 +1671,6 @@ static void hp_amp_power(struct snd_soc_component *component, int on)
 					RT5645_MAMP_INT_REG2, 0xfc00);
 				snd_soc_component_write(component, RT5645_DEPOP_M2, 0x1140);
 				msleep(90);
-				rt5645->hp_on = true;
 			} else {
 				/* depop parameters */
 				snd_soc_component_update_bits(component, RT5645_DEPOP_M2,
@@ -1885,27 +1890,6 @@ static int rt5645_bst2_event(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int rt5650_hp_event(struct snd_soc_dapm_widget *w,
-		struct snd_kcontrol *k, int  event)
-{
-	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
-	struct rt5645_priv *rt5645 = snd_soc_component_get_drvdata(component);
-
-	switch (event) {
-	case SND_SOC_DAPM_POST_PMU:
-		if (rt5645->hp_on) {
-			msleep(100);
-			rt5645->hp_on = false;
-		}
-		break;
-
-	default:
-		return 0;
-	}
-
-	return 0;
-}
-
 static int rt5645_set_micbias1_event(struct snd_soc_dapm_widget *w,
 		struct snd_kcontrol *k, int  event)
 {
@@ -2242,7 +2226,6 @@ static const struct snd_soc_dapm_widget rt5645_dapm_widgets[] = {
 	SND_SOC_DAPM_OUTPUT("PDM1R"),
 	SND_SOC_DAPM_OUTPUT("SPOL"),
 	SND_SOC_DAPM_OUTPUT("SPOR"),
-	SND_SOC_DAPM_POST("DAPM_POST", rt5650_hp_event),
 };
 
 static const struct snd_soc_dapm_widget rt5645_specific_dapm_widgets[] = {
-- 
2.29.0

