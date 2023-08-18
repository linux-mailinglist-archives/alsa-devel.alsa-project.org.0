Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7996A7803EC
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 04:45:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31B4F852;
	Fri, 18 Aug 2023 04:44:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31B4F852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692326725;
	bh=7vTAUt5qjmO6HvoUALb7D3Ppyxse0wbPPPZ4daCBUwg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=mfc06GxOujsc4cJm8dmh7PxMjgDliwhxUoDoEdtj0D5w1boINCEUTmOQN1ITBPwIr
	 +jPX0IIflv/pk40oaiAtra6ZeBWSVC+653petj6/vRaaQrX9fyCPDA/wWroCLMhCu0
	 N1ih6fzpjSrH0E/PeskUf+pW9HHvAUuF3VwiAGq4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 447A3F80549; Fri, 18 Aug 2023 04:44:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4CD8EF8016D;
	Fri, 18 Aug 2023 04:44:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD9CCF801EB; Fri, 18 Aug 2023 04:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	by alsa1.perex.cz (Postfix) with ESMTP id 44836F800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 04:38:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 44836F800D1
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.77 with qID 37I2cAjuD031193,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexh36505.realtek.com.tw[172.21.6.25])
	by rtits2.realtek.com.tw (8.15.2/2.81/5.90) with ESMTPS id 37I2cAjuD031193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Aug 2023 10:38:10 +0800
Received: from RTEXMBS01.realtek.com.tw (172.21.6.94) by
 RTEXH36505.realtek.com.tw (172.21.6.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.32; Fri, 18 Aug 2023 10:38:30 +0800
Received: from sw-server.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.7; Fri, 18 Aug 2023 10:38:30 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
CC: <alsa-devel@alsa-project.org>, <lars@metafoo.de>, <flove@realtek.com>,
        <oder_chiou@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Shuming Fan <shumingf@realtek.com>
Subject: [PATCH] ASoC: rt5645: improve the depop sequences of CBJ detection
Date: Fri, 18 Aug 2023 02:37:32 +0000
Message-ID: <20230818023732.2153170-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXH36505.realtek.com.tw (172.21.6.25) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
X-KSE-ServerInfo: RTEXMBS01.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-ServerInfo: RTEXH36505.realtek.com.tw, 9
X-KSE-AntiSpam-Interceptor-Info: fallback
X-KSE-Antivirus-Interceptor-Info: fallback
X-KSE-AntiSpam-Interceptor-Info: fallback
Message-ID-Hash: WNSVJSJPH3QCZBOEV5EEN7ZYDZ3Z5UNS
X-Message-ID-Hash: WNSVJSJPH3QCZBOEV5EEN7ZYDZ3Z5UNS
X-MailFrom: shumingf@realtek.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WNSVJSJPH3QCZBOEV5EEN7ZYDZ3Z5UNS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Shuming Fan <shumingf@realtek.com>

This patch will improve the depop function of CBJ detection before the headphone playback
when the system resumes.
We also want to complete the CBJ detection in the system-level resume function.
It could avoid triggering the detection at the playing state of headphones.

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 sound/soc/codecs/rt5645.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index e49aa28280e0..038d93e20883 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -80,6 +80,7 @@ static const struct reg_sequence init_list[] = {
 
 static const struct reg_sequence rt5650_init_list[] = {
 	{0xf6,	0x0100},
+	{RT5645_PWR_ANLG1, 0x02},
 };
 
 static const struct reg_default rt5645_reg[] = {
@@ -1696,6 +1697,9 @@ static void hp_amp_power(struct snd_soc_component *component, int on)
 				regmap_write(rt5645->regmap, RT5645_PR_BASE +
 					RT5645_MAMP_INT_REG2, 0xfc00);
 				snd_soc_component_write(component, RT5645_DEPOP_M2, 0x1140);
+				snd_soc_component_update_bits(component, RT5645_PWR_ANLG1,
+					RT5645_PWR_HP_L | RT5645_PWR_HP_R,
+					RT5645_PWR_HP_L | RT5645_PWR_HP_R);
 				msleep(90);
 			} else {
 				/* depop parameters */
@@ -1743,7 +1747,8 @@ static void hp_amp_power(struct snd_soc_component *component, int on)
 				snd_soc_component_write(component, RT5645_DEPOP_M2, 0x1140);
 				msleep(100);
 				snd_soc_component_write(component, RT5645_DEPOP_M1, 0x0001);
-
+				snd_soc_component_update_bits(component, RT5645_PWR_ANLG1,
+					RT5645_PWR_HP_L | RT5645_PWR_HP_R, 0);
 			} else {
 				snd_soc_component_update_bits(component, RT5645_DEPOP_M1,
 					RT5645_HP_SG_MASK |
@@ -3150,7 +3155,7 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 	unsigned int val;
 
 	if (jack_insert) {
-		regmap_write(rt5645->regmap, RT5645_CHARGE_PUMP, 0x0e06);
+		regmap_write(rt5645->regmap, RT5645_CHARGE_PUMP, 0x0206);
 
 		/* for jack type detect */
 		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
@@ -3195,6 +3200,8 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 		if (rt5645->pdata.level_trigger_irq)
 			regmap_update_bits(rt5645->regmap, RT5645_IRQ_CTRL2,
 				RT5645_JD_1_1_MASK, RT5645_JD_1_1_NOR);
+
+		regmap_write(rt5645->regmap, RT5645_CHARGE_PUMP, 0x0e06);
 	} else { /* jack out */
 		rt5645->jack_type = 0;
 
@@ -4003,13 +4010,13 @@ static int rt5645_i2c_probe(struct i2c_client *i2c)
 
 	regmap_write(rt5645->regmap, RT5645_AD_DA_MIXER, 0x8080);
 
-	ret = regmap_register_patch(rt5645->regmap, init_list,
+	ret = regmap_multi_reg_write(rt5645->regmap, init_list,
 				    ARRAY_SIZE(init_list));
 	if (ret != 0)
 		dev_warn(&i2c->dev, "Failed to apply regmap patch: %d\n", ret);
 
 	if (rt5645->codec_type == CODEC_TYPE_RT5650) {
-		ret = regmap_register_patch(rt5645->regmap, rt5650_init_list,
+		ret = regmap_multi_reg_write(rt5645->regmap, rt5650_init_list,
 				    ARRAY_SIZE(rt5650_init_list));
 		if (ret != 0)
 			dev_warn(&i2c->dev, "Apply rt5650 patch failed: %d\n",
@@ -4220,8 +4227,7 @@ static int __maybe_unused rt5645_sys_resume(struct device *dev)
 
 	if (rt5645->hp_jack) {
 		rt5645->jack_type = 0;
-		queue_delayed_work(system_power_efficient_wq,
-			&rt5645->jack_detect_work, msecs_to_jiffies(0));
+		rt5645_jack_detect_work(&rt5645->jack_detect_work.work);
 	}
 	return 0;
 }
-- 
2.34.1

