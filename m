Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECAF100108
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Nov 2019 10:18:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 102BD168E;
	Mon, 18 Nov 2019 10:17:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 102BD168E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1574068714;
	bh=ysOe0bHiz5W6iYVKxaSDb9zbTI5TXJdgROAuMBQL+HA=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Qj5KjyhfxgK0ZIdj9t0IgZghVOCMqeQJNS67fvs9QLBbCWiaurByVL/nW/HR94+34
	 AiukLXP2iWw6H5d3T3+YXZZqRoJV6VdQNJLPIj7qbYhR3ZT2VJx9XVtoz2iU/RiwAO
	 GLPhReSSjCOLLs5xsHPKhs7uRUrAeJWT8YlRyttU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81861F8013D;
	Mon, 18 Nov 2019 10:16:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E298FF8013B; Mon, 18 Nov 2019 10:16:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8147FF800F1
 for <alsa-devel@alsa-project.org>; Mon, 18 Nov 2019 10:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8147FF800F1
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID xAI9GZ9S032265,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCAS11.realtek.com.tw[172.21.6.12])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id xAI9GZ9S032265
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Nov 2019 17:16:35 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTITCAS11.realtek.com.tw (172.21.6.12) with Microsoft SMTP Server id
 14.3.468.0; Mon, 18 Nov 2019 17:16:34 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Date: Mon, 18 Nov 2019 17:16:24 +0800
Message-ID: <20191118091624.18699-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-Originating-IP: [172.22.102.1]
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, alexlee@realtek.com, flove@realtek.com
Subject: [alsa-devel] [PATCH] ASoC: rt5682: fix the charge pump capacitor
	discharges
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

From: Shuming Fan <shumingf@realtek.com>

Due to switching the HV to LV mode while stopping playback,
the charge pump capacitor will be discharged to the source of the pump circuit.
Therefore, this patch removed the event control.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5682.c | 27 +++------------------------
 1 file changed, 3 insertions(+), 24 deletions(-)

diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 0d8e9866c01a..b1713fffa3eb 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1464,28 +1464,6 @@ static const struct snd_kcontrol_new hpor_switch =
 	SOC_DAPM_SINGLE_AUTODISABLE("Switch", RT5682_HP_CTRL_1,
 					RT5682_R_MUTE_SFT, 1, 1);
 
-static int rt5682_charge_pump_event(struct snd_soc_dapm_widget *w,
-	struct snd_kcontrol *kcontrol, int event)
-{
-	struct snd_soc_component *component =
-		snd_soc_dapm_to_component(w->dapm);
-
-	switch (event) {
-	case SND_SOC_DAPM_PRE_PMU:
-		snd_soc_component_update_bits(component,
-			RT5682_HP_CHARGE_PUMP_1, RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
-		break;
-	case SND_SOC_DAPM_POST_PMD:
-		snd_soc_component_update_bits(component,
-			RT5682_HP_CHARGE_PUMP_1, RT5682_PM_HP_MASK, RT5682_PM_HP_LV);
-		break;
-	default:
-		return 0;
-	}
-
-	return 0;
-}
-
 static int rt5682_hp_event(struct snd_soc_dapm_widget *w,
 	struct snd_kcontrol *kcontrol, int event)
 {
@@ -1769,8 +1747,7 @@ static const struct snd_soc_dapm_widget rt5682_dapm_widgets[] = {
 	SND_SOC_DAPM_SUPPLY("HP Amp R", RT5682_PWR_ANLG_1,
 		RT5682_PWR_HA_R_BIT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("Charge Pump", 1, RT5682_DEPOP_1,
-		RT5682_PUMP_EN_SFT, 0, rt5682_charge_pump_event,
-		SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+		RT5682_PUMP_EN_SFT, 0, NULL, 0),
 	SND_SOC_DAPM_SUPPLY_S("Capless", 2, RT5682_DEPOP_1,
 		RT5682_CAPLESS_EN_SFT, 0, NULL, 0),
 
@@ -2670,6 +2647,8 @@ static int rt5682_i2c_probe(struct i2c_client *i2c,
 			RT5682_HPA_CP_BIAS_CTRL_MASK, RT5682_HPA_CP_BIAS_3UA);
 	regmap_update_bits(rt5682->regmap, RT5682_CHARGE_PUMP_1,
 			RT5682_CP_CLK_HP_MASK, RT5682_CP_CLK_HP_300KHZ);
+	regmap_update_bits(rt5682->regmap, RT5682_HP_CHARGE_PUMP_1,
+			RT5682_PM_HP_MASK, RT5682_PM_HP_HV);
 
 	INIT_DELAYED_WORK(&rt5682->jack_detect_work,
 				rt5682_jack_detect_handler);
-- 
2.24.0

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
