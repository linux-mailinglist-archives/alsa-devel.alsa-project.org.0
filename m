Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC7E2FCD4A
	for <lists+alsa-devel@lfdr.de>; Wed, 20 Jan 2021 10:14:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 31112184B;
	Wed, 20 Jan 2021 10:13:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 31112184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611134055;
	bh=RckfIc2CTz/EXsU82GAMLqOwdJjJtZxMs1ligH4Y5UI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XUIRpZw6UCtU9eXspbUuD3TER2mXWwV2Nf51zn2SFsGyd7Sp1su+fKmd5gz/cfCQu
	 lquP+Hn4XFRQzP/Ky4Xs6nHCSnnogOv5ztmBtwpb+LUKFhldFtsf7SsnqYue6+HgQT
	 75eoMMu0nwf9xuqNFhSEfDK3MuFWAskjQhFjm0uE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 48A3FF8012C;
	Wed, 20 Jan 2021 10:12:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05C00F80227; Wed, 20 Jan 2021 10:12:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64D03F8012C
 for <alsa-devel@alsa-project.org>; Wed, 20 Jan 2021 10:12:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64D03F8012C
Authenticated-By: 
X-SpamFilter-By: ArmorX SpamTrap 5.73 with qID 10K9CLlU4006167,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (rtexmbs01.realtek.com.tw[172.21.6.94])
 by rtits2.realtek.com.tw (8.15.2/2.70/5.88) with ESMTPS id 10K9CLlU4006167
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 20 Jan 2021 17:12:21 +0800
Received: from localhost.localdomain (172.22.102.1) by
 RTEXMBS01.realtek.com.tw (172.21.6.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 20 Jan 2021 17:12:20 +0800
From: <shumingf@realtek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>
Subject: [PATCH 2/2] ASoC: rt5682: add device property to control LDO2 power
Date: Wed, 20 Jan 2021 17:12:18 +0800
Message-ID: <20210120091218.10837-1-shumingf@realtek.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.22.102.1]
X-ClientProxiedBy: RTEXMBS02.realtek.com.tw (172.21.6.95) To
 RTEXMBS01.realtek.com.tw (172.21.6.94)
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 lars@metafoo.de, albertchen@realtek.com, derek.fang@realtek.com,
 Shuming Fan <shumingf@realtek.com>, flove@realtek.com
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

From: Shuming Fan <shumingf@realtek.com>

The application circuit shall provide MICVDD power.
In default, the codec driver doesn't need to enable LDO2 power.
In case, the customers use VBAT for micbias, it should enable the device property "realtek,ldo2-pow-en".

Signed-off-by: Shuming Fan <shumingf@realtek.com>
---
 include/sound/rt5682.h    |  1 +
 sound/soc/codecs/rt5682.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/sound/rt5682.h b/include/sound/rt5682.h
index 3900a07e3935..4b4c61b48380 100644
--- a/include/sound/rt5682.h
+++ b/include/sound/rt5682.h
@@ -41,6 +41,7 @@ struct rt5682_platform_data {
 	unsigned int dmic_clk_rate;
 	unsigned int dmic_delay;
 	bool dmic_clk_driving_high;
+	bool ldo2_pow_en;
 
 	const char *dai_clk_names[RT5682_DAI_NUM_CLKS];
 };
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 42ad5bea86b5..68d29d71d6e4 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1343,6 +1343,19 @@ static int is_using_asrc(struct snd_soc_dapm_widget *w,
 	}
 }
 
+static int is_using_ldo2(struct snd_soc_dapm_widget *w,
+		struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_component *component =
+		snd_soc_dapm_to_component(w->dapm);
+	struct rt5682_priv *rt5682 = snd_soc_component_get_drvdata(component);
+
+	if (rt5682->pdata.ldo2_pow_en)
+		return 1;
+
+	return 0;
+}
+
 /* Digital Mixer */
 static const struct snd_kcontrol_new rt5682_sto1_adc_l_mix[] = {
 	SOC_DAPM_SINGLE("ADC1 Switch", RT5682_STO1_ADC_MIXER,
@@ -1854,7 +1867,7 @@ static const struct snd_soc_dapm_route rt5682_dapm_routes[] = {
 
 	{"CLKDET SYS", NULL, "CLKDET"},
 
-	{"IN1P", NULL, "LDO2"},
+	{"IN1P", NULL, "LDO2", is_using_ldo2},
 
 	{"BST1 CBJ", NULL, "IN1P"},
 
@@ -2999,6 +3012,9 @@ int rt5682_parse_dt(struct rt5682_priv *rt5682, struct device *dev)
 	rt5682->pdata.dmic_clk_driving_high = device_property_read_bool(dev,
 		"realtek,dmic-clk-driving-high");
 
+	rt5682->pdata.ldo2_pow_en = device_property_read_bool(dev,
+		"realtek,ldo2-pow-en");
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(rt5682_parse_dt);
-- 
2.29.0

